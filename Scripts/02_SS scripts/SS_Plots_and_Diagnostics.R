library(r4ss);library(ggplot2);library(reshape2);library(scales);library(RColorBrewer);library(gridExtra);library(tidyverse)
require(this.path)

root_dir  <- this.path::here(..=2)
model.dir <- file.path(root_dir,"01_SS final","01_Base" )

base.model <- SS_output(model.dir)

## For the annual time series of F/Fmsy, Biomass, Recruitment, and SSB:
SummBio    <- base.model$timeseries[,c("Yr","Seas","Bio_all","Bio_smry","SpawnBio","Recruit_0")]
SumBioAll  <- subset(SummBio,Seas==1)[,c("Yr","Bio_all")]
SumBiosmry <- subset(SummBio,Seas==1)[,c("Yr","Bio_smry")]

##these have to be updated based upon the corresponding values in the base model (already  done for Uku)
SumRecruit  <- base.model$derived_quants %>% filter(between(Label,"Recr_1948","Recr_2023")) %>% 
               mutate(Year=as.numeric(str_sub(Label,(str_length(Label)-3)),str_length(Label))) %>%  select(Year,Value,StdDev)
SumBioSpawn <- base.model$derived_quants %>% filter(between(Label,"SSB_1948","SSB_2023")) %>%
               mutate(Year=as.numeric(str_sub(Label,(str_length(Label)-3)),str_length(Label))) %>% select(Year,Value,StdDev)
Fseries     <- base.model$derived_quants %>% filter(between(Label,"F_1948","F_2023")) %>%
               mutate(Year=as.numeric(str_sub(Label,(str_length(Label)-3)),str_length(Label))) %>% select(Year,Value,StdDev)
SSBRatio    <- SumBioSpawn$Value/base.model$derived_quants[1,2]

#Fishing Mortality
ggplot()+
  geom_point(aes(x=Year,y=Value), data=Fseries,size=4)+
  geom_errorbar(aes(x=Year,ymin=Value-1.96*StdDev,ymax=Value+1.96*StdDev),data=Fseries,linewidth=1.5)+
  geom_line(aes(x=Year,y=Value),data=Fseries,linewidth=1)+
  geom_hline(yintercept=0.137,color="green",linetype = 2, linewidth=1.5)+
  ylab("Fishing Mortality (Ages 5-30)") +
  theme(axis.text.x=element_text(size=18,face="bold"), axis.title.x=element_text(size=24,face="bold"),
        axis.text.y=element_text(size=18,face="bold"),axis.title.y=element_text(size=24,face="bold"),
        panel.border = element_rect(color="black",fill=NA,linewidth=2),
        panel.background = element_blank())+
  geom_text(aes(x = 2021,y=0.18,label=as.character(expression(F[MSY]))),parse=TRUE, size=8) +
  scale_x_continuous(breaks=seq(1948,2023,5))

ggsave(last_plot(),file=file.path(model.dir,"01_F_Series.png"),height=8,width=16,units="in",dpi=300)

##Recruitment
## recruitment should end in 2023 as it is the last year estimated in the model. the final year of the model (2023) is based upon the S/R curve and NOT the data

SumRecruit$LB <-SumRecruit$Value-1.96*SumRecruit$StdDev
SumRecruit$LB <-ifelse(SumRecruit$LB<0,0,SumRecruit$LB)
SumRecruit    <-SumRecruit[-nrow(SumRecruit),]

ggplot()+
  geom_point(aes(x=Year,y=Value), data=SumRecruit,size=4)+
  geom_errorbar(aes(x=Year,ymin=LB,ymax=Value+1.96*StdDev),data=SumRecruit,linewidth=1.5)+
  geom_line(aes(x=Year,y=Value),data=SumRecruit,linewidth=1)+
  ylab("Recruitment (thousands of age-0 recruits)") +
  theme(axis.text.x=element_text(size=18,face="bold"), axis.title.x=element_text(size=24,face="bold"),
        axis.text.y=element_text(size=18,face="bold"),axis.title.y=element_text(size=24,face="bold"),
        panel.border = element_rect(color="black",fill=NA,size=2),
        panel.background = element_blank())+scale_x_continuous(breaks=seq(1945,2023,5))

ggsave(last_plot(),file=file.path(model.dir,"02_Recruitment.png"),height=8,width=16,units="in",dpi=300)

#SSB
ggplot()+
  geom_point(aes(x=Year,y=Value), data=SumBioSpawn,size=4)+
  geom_errorbar(aes(x=Year,ymin=Value-1.96*StdDev,ymax=Value+1.96*StdDev),data=SumBioSpawn,linewidth=1.5)+
  geom_line(aes(x=Year,y=Value),data=SumBioSpawn,linewidth=1)+
  geom_hline(yintercept=0.9*base.model$derived_quants[which(base.model$derived_quants[,1]=="SSB_MSY"),2],color="green",linetype = 2, linewidth=1.5)+
  ylab("Female Spawning Biomass (mt)") +
  theme(axis.text.x=element_text(size=24,face="bold"), axis.title.x=element_text(size=30,face="bold"),
        axis.text.y=element_text(size=24,face="bold"),axis.title.y=element_text(size=30,face="bold"),
        panel.border = element_rect(color="black",fill=NA,size=2),
        panel.background = element_blank())+
  geom_text(aes(x = 2015,y=base.model$derived_quants[which(base.model$derived_quants[,1]=="SSB_MSY"),2]+10,label=as.character(expression(SSB[MSST]))),parse=TRUE, size=10) +
  scale_x_continuous(breaks=seq(1945,2023,5))

ggsave(last_plot(),file=file.path(model.dir,"03_Biomass_SSB.png"),height=8,width=18,units="in",dpi=300)

## Summary Biomass
ggplot()+
  geom_point(aes(x=Yr,y=Bio_smry), data=SumBiosmry,size=4)+
  geom_line(aes(x=Yr,y=Bio_smry), data=SumBiosmry[-1,],linewidth=1)+
  ylab("Biomass (mt, ages 1+)") +
  xlab("Year")+
  theme(axis.text.x=element_text(size=24,face="bold"), axis.title.x=element_text(size=30,face="bold"),
        axis.text.y=element_text(size=24,face="bold"),axis.title.y=element_text(size=30,face="bold"),
        panel.border = element_rect(color="black",fill=NA,size=2),
        panel.background = element_blank())+
  scale_x_continuous(breaks=seq(1948,2023,5)) +
  scale_y_continuous(limits = c(0,3000),label = comma)

ggsave(last_plot(),file=file.path(model.dir,"04_Biomass_smry.png"),height=8,width=18,units="in",dpi=300)

##CPUE Plots
CPUE    <- base.model$cpue[,c("Fleet","Fleet_name","Yr","Seas","Obs","Exp","SE")]
CPUE$SE <- ifelse(CPUE$Fleet==10,CPUE$SE,CPUE$SE+0.1)
CPUE$LL <- ifelse(CPUE$Obs-1.96*CPUE$SE>=0,CPUE$Obs-1.96*CPUE$SE,0)

ggplot()+
  geom_point(aes(x=Yr,y=Obs),data=CPUE) +
  geom_errorbar(aes(x=Yr,ymin=LL,ymax=Obs+1.96*SE),data=CPUE,width=0) +
  geom_line(aes(x=Yr,y=Exp),data=CPUE) +
  facet_wrap(~Fleet_name, ncol=1, scales="free_y") +
  theme_bw() +
  theme(panel.border = element_rect(color="black",fill=NA,size=1),
        panel.background = element_blank(), strip.background = element_blank(),
        strip.text = element_text(size=16),
        axis.text.x=element_text(size=20,face="bold"), axis.title.x=element_text(size=30,face="bold"),
        axis.text.y=element_text(size=24,face="bold"),axis.title.y=element_text(size=30,face="bold")) +
        xlab("Year") + ylab("CPUE") +
        scale_x_continuous(breaks=seq(1948,2023,5))

ggsave(last_plot(),file=file.path(model.dir,"05_CPUE_index.png"),height=16,width=12,units="in",dpi=300)

##For the catch summary figure (by year and fleet)
## This one looks better than the one from r4ss
## Unnecessary for Uku, useful for international fisheries
 Catch <- base.model$catch[,c("Fleet","Fleet_Name","Yr","Seas","Obs")] %>% filter(Fleet!=2&Fleet!=7)

 colourCount = length(unique(Catch$Fleet_Name))
 getPalette =colorRampPalette(brewer.pal(11, "Spectral"))
 Fill<-getPalette(colourCount)
 ggplot()+
     geom_bar(aes(x=Yr,y=Obs,fill=Fleet_Name),data=Catch,stat="identity",color="black") +
     scale_fill_manual(values = Fill, name="")+
     xlab("Year") +
     ylab("Catch (mt)") +
     theme_bw() 

ggsave(last_plot(),file=file.path(model.dir,"06_Catch.png"),height=4,width=8,units="in",dpi=300)

CatchLabels<-c("Deep Sea Handline","Inshore Handline",  "Commercial Other", "Trolling","Recreational")
names(CatchLabels)<-c("Com_DSH_Old", "Com_ISH", "Com_Other", "Com_Trol", "Rec")

ggplot()+
  geom_line(aes(x=Yr,y=Obs,colour=Fleet_Name),data=subset(Catch,Yr>1948),stat="identity") +
  xlab("Year") +
  ylab("Catch (mt)") +
  theme_bw(base_size=22) +
  facet_wrap(~Fleet_Name,scales="free_y",ncol=2,labeller = labeller(Fleet_Name=CatchLabels) ) +
  theme(legend.position="none", strip.background = element_blank())

ggsave(last_plot(),file=file.path(model.dir,"07_CatchByFleet2.png"),height=12,width=10,units="in",dpi=300)


### Fishing mortality by fleet
FbyFleet<-base.model$catch[,c("Fleet_Name","Yr","F")] %>% filter(Fleet_Name!="Com_DSH_Recent"&Fleet_Name!="Divers")

ggplot()+
  geom_line(aes(x=Yr,y=F,color=Fleet_Name),data=subset(FbyFleet,Yr>=1948),stat="identity") +
  scale_color_manual(values = c(Fill[c(1,2,4,5)],"black"), name="")+
  xlab("Year") +
  ylab("Fishing mortality") +
  theme_bw(base_size = 22) +
  facet_wrap(~Fleet_Name,scales="free_y",ncol=2,labeller = labeller(Fleet_Name=CatchLabels)  ) +
  theme(legend.position="none", strip.background = element_blank())

ggsave(last_plot(),file=file.path(model.dir,"08_FByFleet2.png"),height=12,width=10,units="in",dpi=300)




