require(ggplot2); require(this.path); require(r4ss); require(tidyverse)

root_dir <- this.path::here(..=2)
model.dir <- file.path(root_dir,"01_SS final","01_Base")

#INP <- read.delim(file.path(root_dir,"01_SS final","01_Base","Report.SSO"))

REP <- SS_output(file.path(root_dir,"01_SS final","01_Base"))
QTS <- REP$derived_quants

SSB      <- QTS %>% filter(between(Label,"SSB_1948","SSB_2023")) %>% mutate(Year=as.numeric(str_sub(Label,(str_length(Label)-3)),str_length(Label))) %>%
                    select(Year,SSB=Value,SD=StdDev)
SSB_VIRG <- QTS %>% filter(Label=="SSB_Virgin") %>% select(Value) %>% as.numeric()

REC      <- QTS %>% filter(between(Label,"Recr_1948","Recr_2023")) %>% mutate(Year=as.numeric(str_sub(Label,(str_length(Label)-3)),str_length(Label))) %>%
                    select(Year,REC=Value,SD=StdDev)
REC_VIRG <- QTS %>% filter(Label=="Recr_Virgin") %>% select(Value) %>% as.numeric()


REC <- REC %>% select(Year, REC)
SSB <- SSB %>% select(Year,SSB)

DAT      <- merge(SSB,REC,by="Year")

alpha <- 96.1
beta  <- 93.2

SR_plot <- ggplot(data=DAT)+scale_x_continuous(limits=c(0,SSB_VIRG+20),expand=c(0,0))+scale_y_continuous(limits=c(0,200),expand=c(0,0))+
  stat_function(fun=function(x) alpha*x/(beta+x),xlim=c(0,SSB_VIRG))+
  geom_point(aes(x=SSB,y=REC,col=Year),size=2)+geom_point(aes(x=SSB_VIRG,y=REC_VIRG),size=4,col="red",shape=18)+
  scale_color_gradientn(colors=rainbow(4))+theme_bw()+xlab("Spawning biomass (SSB; metric tons)")+ylab("Recruitment (1000 recruits)")

ggsave(filename=file.path(model.dir,"SR relation.png"),plot=SR_plot,width=18,height=10,units="cm",dpi=300)


