##read in agepro datafile and change projected catch line
require(reshape2); require(ggplot2); require(tidyverse); require(parallel); require(this.path)
require(foreach);  require(doParallel); require(data.table);require(ggpubr); require(writexl)

## ===========Manual Inputs===================
     modelname <- "Uku2024Update"
##============================================

root_dir  <- here(..=2)
model_dir <- file.path(root_dir,"Outputs","Agepro",modelname) 

# Copy AGEPRO40.exe to the model dir
file.copy(file.path(root_dir,"Data","AGEPRO40.exe"),file.path(model_dir))

#read in data file
Input <- read.delim(file.path(model_dir,paste0(modelname,".inp")), fill=FALSE, stringsAsFactors = FALSE, header=FALSE)

##initial harvest scenario (based on 2014-2023 average catch)
DSH    <- 0.25
ISH    <- 0.05
Troll  <- 0.04
Others <- 0.06
Rec    <- 0.60

CatchBeforeProjection <- 111 # This is the 2021-2023 3-year average catch that is assume to happen in 2024 (since projections start in 2025)
StartMaxCatch         <- 265 # This is the first catch scenario that will be implemented, from which we will decrease the catches iteratively
StopMinCatch          <- 130 # This is the last catch scenario, the smallest one
Decrease              <- 5   # Amount of catch reduction between each successive scenario
NProj                 <- floor( (StartMaxCatch-StopMinCatch)/Decrease )

HarvLoc <- which(str_detect(Input$V1, "HARVEST")) + 2

HarvestScenarioDSH    <- as.numeric(unlist(strsplit(Input[HarvLoc,],split="  "))) 
NYears                <- length(HarvestScenarioDSH)
HarvestScenarioDSH    <- c(CatchBeforeProjection,rep(StartMaxCatch,(NYears-1)))*DSH

HarvestScenarioISH    <- as.numeric(unlist(strsplit(Input[HarvLoc+1,],split="  "))) 
HarvestScenarioISH    <- c(CatchBeforeProjection,rep(StartMaxCatch,(NYears-1)))*ISH

HarvestScenarioTroll  <- as.numeric(unlist(strsplit(Input[HarvLoc+2,],split="  "))) 
HarvestScenarioTroll  <- c(CatchBeforeProjection,rep(StartMaxCatch,(NYears-1)))*Troll

HarvestScenarioOthers <- as.numeric(unlist(strsplit(Input[HarvLoc+3,],split="  "))) 
HarvestScenarioOthers <- c(CatchBeforeProjection,rep(StartMaxCatch,(NYears-1)))*Others

HarvestScenarioRec    <- as.numeric(unlist(strsplit(Input[HarvLoc+4,],split="  "))) 
HarvestScenarioRec    <- c(CatchBeforeProjection,rep(StartMaxCatch,(NYears-1)))*Rec

InitialQuota <- StartMaxCatch
FileName     <- list(NA)
for (i in 1:NProj){
  
  InitialQuota      <- InitialQuota-Decrease
  HarvestScenarioDSH[2:length(HarvestScenarioDSH)] <- InitialQuota*DSH
  NewHarvest        <- paste(HarvestScenarioDSH[1:length(HarvestScenarioDSH)],sep="",collapse="  ")
  Input[HarvLoc,1]  <- NewHarvest
  
  HarvestScenarioISH[2:length(HarvestScenarioISH)] <- InitialQuota*ISH
  NewHarvest         <- paste(HarvestScenarioISH[1:length(HarvestScenarioISH)],sep="",collapse="  ")
  Input[HarvLoc+1,1] <- NewHarvest
  
  HarvestScenarioTroll[2:length(HarvestScenarioTroll)] <- InitialQuota*Troll
  NewHarvest         <- paste(HarvestScenarioTroll[1:length(HarvestScenarioTroll)],sep="",collapse="  ")
  Input[HarvLoc+2,1] <- NewHarvest
  
  HarvestScenarioOthers[2:length(HarvestScenarioOthers)] <- InitialQuota*Others
  NewHarvest         <- paste(HarvestScenarioOthers[1:length(HarvestScenarioOthers)],sep="",collapse="  ")
  Input[HarvLoc+3,1] <- NewHarvest
  
  HarvestScenarioRec[2:length(HarvestScenarioRec)] <- InitialQuota*Rec
  NewHarvest         <- paste(HarvestScenarioRec[1:length(HarvestScenarioRec)],sep="",collapse="  ")
  Input[HarvLoc+4,1] <- NewHarvest
  
  FileName[[i]]     <- paste0("UkuProjection",i,".INP")
  
  write.table(Input,file.path(model_dir,FileName[[i]]), quote=FALSE,row.names = FALSE, col.names=FALSE) 
}

# Run AgePro in parallel
setwd(model_dir)
numCores <- detectCores()
cl       <- makeCluster(numCores-2)
parLapply(cl,FileName,function(x) {
    system("cmd.exe", input = paste0("AGEPRO40.exe ",x))
})
stopCluster(cl)
setwd(root_dir)

# Plot results
PlotDataList <- list()
for (i in 1:NProj) {
  
  # Load the output file for the 
  file.name      <- file.path(model_dir,paste0("UkuProjection",i,".out"))
  Output         <- read.delim(file.name, fill=FALSE, stringsAsFactors = FALSE, header=FALSE)
  
  # Find data types location in output file
  ProjYearLoc    <- which(str_detect(Output$V1, "Requested Percentile Report")) + 2
  CatchLoc       <- which(str_detect(Output$V1, "Requested Percentile Report")) + 7
  FMortLoc       <- which(str_detect(Output$V1, "Requested Percentile Report")) + 9
  FProbLoc       <- which(str_detect(Output$V1, "Probability Total Fishing Mortality Exceeds Threshold")) + 2
  SSBLoc         <- which(str_detect(Output$V1, "Requested Percentile Report")) + 4
  SSBProbLoc     <- which(str_detect(Output$V1, "Probability Spawning Stock Biomass Exceeds Threshold")) + 2
  
  # Extract the data from Output file
  ProjYear <- scan(quiet=T,text=Output$V1[ProjYearLoc], what="") %>% as.data.table() %>% rename(Year=1) %>% mutate(Year=as.numeric(Year))
  Catch    <- scan(quiet=T,text=Output$V1[CatchLoc], what="") %>% as.data.table() %>% rename(Catch=1) %>% slice(4:n()) %>% mutate(Catch=as.numeric(Catch)*1000) %>% slice(4)
  FMort    <- scan(quiet=T,text=Output$V1[FMortLoc], what="") %>% as.data.table() %>% rename(FMort=1) %>% slice(2:n()) %>% mutate(FMort= as.numeric(FMort))  
  FProb    <- Output %>% slice(FProbLoc:(FProbLoc+nrow(ProjYear)-1)) %>% separate(col=V1,sep="\\s",convert=T, extra = "merge",into=c("Year","FProb")) %>% as.data.table()
  SSB      <- scan(quiet=T,text=Output$V1[SSBLoc], what="") %>% as.data.table() %>% rename(SSB=1) %>% slice(4:n()) %>% mutate(SSB= as.numeric(SSB))  
  SSBProb  <- Output %>% slice(SSBProbLoc:(SSBProbLoc+nrow(ProjYear)-1)) %>% separate(col=V1,sep="\\s",convert=T, extra = "merge",into=c("Year","SSBProb")) %>% as.data.table()

  PlotDataTemp <- cbind(ProjYear,Catch,FMort,FProb[,2],SSB,SSBProb[,2])
  PlotDataList <- append(PlotDataList,list(PlotDataTemp))
}

PlotData <- rbindlist(PlotDataList) %>% mutate(SSB=SSB/2*1000) # Convert SSB back to female-only (and switch to mt from 1000 x mt)

# Save point to avoid re-running Agepro, if necessary
saveRDS(PlotData,file.path(model_dir,"00_PlotData.rds"))
PlotData <- readRDS(file.path(model_dir,"00_PlotData.rds"))

###Plots
ggplot(data=PlotData[Year>2024])+
    geom_line(aes(x=Catch,y=FMort,linetype=as.factor(Year)),)+
    theme_bw() +
    theme(legend.title=element_blank())+
    xlab("Catch (mt)")+
    ylab("Fishing Mortality")
ggsave(last_plot(),file=file.path(model_dir,"01_FishingMortalityProjections.png"),height=4,width=4,units="in",dpi=200)

ggplot(data=PlotData[Year>2024],aes(x=Catch,y=FProb,linetype=as.factor(Year)))+
    geom_line()+
    theme_bw() +
    theme(legend.title=element_blank())+
    xlab("Catch (mt)")+
    ylab("Probability of F>FMSY")
ggsave(last_plot(),file=file.path(model_dir,"02_FProbabilityProjections.png"),height=4,width=4,units="in",dpi=200)


A<-ggplot(data=PlotData,aes(x=Year,y=FMort,color=as.factor(Catch)))+geom_line()+geom_hline(yintercept=0.14,color="black",linetype="dashed")+
   guides(color = guide_legend(ncol = 1,title="Catch (mt)"))+theme_bw()+labs(y=expression("F "(yr^-1)))+theme(axis.title.x=element_blank())
B<-ggplot(data=PlotData,aes(x=Year,y=FProb,color=as.factor(Catch)))+geom_line()+theme_bw()+labs(y="Prob. F > Fmsy")
C<-ggplot(data=PlotData,aes(x=Year,y=SSB,color=as.factor(Catch)))+geom_line()+theme_bw()+
   geom_hline(yintercept=293,color="black",linetype="dashed")+labs(y="SSB (mt)")+theme(axis.title.x=element_blank())
D<-ggplot(data=PlotData,aes(x=Year,y=SSBProb,color=as.factor(Catch)))+geom_line()+theme_bw()+labs(y=expression("Prob. SSB" < SSB[msst]))+
   ylim(c(0,1))

ggarrange(A,C,B, D, ncol=2, nrow=2,labels=c("A","B","C","D"),common.legend=T,legend="right")
ggsave(last_plot(),file=file.path(model_dir,"05_ProjectionByYear.png"),height=7,width=7,units="in",dpi=200)

ggplot(data=PlotData[Year>2024])+
    geom_line(aes(x=Catch,y=(SSB),linetype=as.factor(Year)))+
    theme_bw() +
    theme(legend.title=element_blank())+
    xlab("Catch (mt)")+
    ylab("Spawning Stock Biomass (mt)")
ggsave(last_plot(),file=file.path(model_dir,"03_SSBProjections.png"),height=4,width=4,units="in",dpi=200)

ggplot(data=PlotData[Year>2024])+
    geom_line(aes(x=Catch,y=1-SSBProb,linetype=as.factor(Year)))+
    theme_bw() +
    theme(legend.title=element_blank())+
    xlab("Catch (mt)")+
    ylab("Probability of SSB<SSBMSST")+
    scale_y_continuous(limits=c(0,1))
ggsave(last_plot(),file=file.path(model_dir,"04_SSBProbabilityProjections.png"),height=4,width=4,units="in",dpi=200)

##===================================Tables=================================================
minProb <- 0.1
maxProb <- 0.5

# Catch risk table 
G <- PlotData %>% filter(FProb>=minProb&FProb<=maxProb)

  Preds.x <- expand.grid(FProb=seq(minProb,maxProb,by=0.01),Year=as.factor(seq(min(G$Year),max(G$Year))))
  G$Year  <- factor(G$Year)
  model   <- glm(data=G,Catch~Year*poly(FProb,3))
  Preds   <- predict(model,newdata=Preds.x)
  Preds   <- cbind(Preds.x,Preds)
  
  # Check the GLM model fit and range of data
  G$Year <- as.character(G$Year)
  ggplot()+geom_line(data=Preds,aes(x=Preds,y=FProb,col=as.character(Year)))+geom_point(data=G,aes(x=Catch,y=FProb,col=as.character(Year)),shape=2,size=2)+
    theme_bw()+labs(x="Catch",y="Prob. overfishing") + guides(col=guide_legend(title="Year"))
  ggsave(last_plot(),file=file.path(model_dir,"06_Proj_CheckModelFit.png"),height=8, width=15,units="cm")
  
  # Create Prob. overfishing bins
  G$FProb     <- round(G$FProb,2)
  
  H <- merge(Preds,G,by.x=c("Year","FProb"),by.y=c("Year","FProb"),all.x=T)
  H <- select(H,Year=Year,FProb,Catch,Preds)
  H$Year <- as.numeric(as.character(H$Year))
  
  # Fill in the catch advice using the model predictions
  H <- H %>% mutate(Catch=Preds) %>% select(-Preds) %>%  filter(Year>=2024) %>% 
    group_by(Year,FProb) %>% summarize(Catch=round(mean(Catch),1)) %>% 
    mutate(Catch=format(Catch,nsmall=1),FProb=format(FProb,nsmall=1)) %>% 
    spread(Year,Catch) %>% arrange(desc(FProb))
  
  write_xlsx(H,file.path(model_dir,"00_Proj_Table.xlsx"))









