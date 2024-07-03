library(r4ss);library(ggplot2);library(reshape2);library(scales);library(RColorBrewer);library(gridExtra);library(tidyverse);library(png); library(grid);library(gridExtra)
library(ggsci);library(data.table);library(stringr); library(this.path)

root_dir <- here(..=2)

source(file.path(root_dir,"Scripts","02_SS scripts","Scenarios_KobePlot.R"))

model_1 <- SS_output(file.path(root_dir,"01_SS final","01_Base"),covar=TRUE)
model_2 <- SS_output(file.path(root_dir,"01_SS final","08a_NotCellCorrected"),covar=TRUE)
model_3 <- SS_output(file.path(root_dir,"01_SS final","99_Base_2019"),covar=TRUE)

plotsensitivity<-function(Summary, ModelLabels, NModels, PlotDir ){
  
  #Summary <-SSsummarize(list(base_case,model_1,model_2, model_22))
  #ModelLabels<-c("Base","M=0.09","M=0.11","Lorenzen M")
  #Directory<-paste0(base.dir,"\\Plots\\01_NatM")
  #dir.create(Directory)
  #NModels<-length(ModelLabels)
  
  
  ModelLabels<-paste0(letters[seq(from=1,to=length(ModelLabels))],") ",ModelLabels)
  
  
  aTheme <- theme(panel.border = element_rect(color="black",fill=NA,size=1),
                  panel.background = element_blank(), strip.background = element_blank(),
                  legend.title=element_blank(),legend.key=element_blank(),
                  legend.position="none")
  
  
  SummaryBio<-Summary$SpawnBio
  names(SummaryBio)<-c(ModelLabels,"Label","Yr")
  SSBMSY<-Summary$quants[which(Summary$quants$Label=="SSB_MSY"),]
  SSBMSST<-0.9*SSBMSY[,1:NModels]
  SummaryBratio<-as.data.frame(matrix(NA,ncol=NModels, nrow=nrow(SummaryBio)))
  for(i in 1:NModels){
    for (j in 1:nrow(SummaryBio)){
      SummaryBratio[j,i]<-SummaryBio[j,i]/SSBMSST[i]
    }}
  SSBMSST<-melt(SSBMSST)
  SummaryBratio[,c(NModels+1,NModels+2)]<-SummaryBio[,c(NModels+1,NModels+2)]
  SummaryBio<-melt(SummaryBio,id.vars=c("Label","Yr"))
  SummaryBio<-subset(SummaryBio,Yr>=1948)
  names(SummaryBratio)<-c(ModelLabels,"Label","Yr")
  SummaryBratio<-melt(SummaryBratio,id.vars=c("Label","Yr"))
  SummaryBratio<-subset(SummaryBratio,Yr>=1948)
  SpawnBioUpper<-Summary$SpawnBioUpper
  SpawnBioUpper<-melt(SpawnBioUpper, id.vars=c("Yr", "Label") )
  names(SpawnBioUpper)[3:4]<-c("Model","Upper")
  SpawnBioLower<-Summary$SpawnBioLower 
  SpawnBioLower<-melt(SpawnBioLower, id.vars=c("Yr", "Label") )
  names(SpawnBioLower)[3:4]<-c("Model","Lower")
  SpawnBioUncertainty<-merge(SpawnBioUpper,SpawnBioLower,by=c("Yr","Label","Model"))  
  
  Model.names          <- data.frame(Model= unique(SpawnBioUncertainty$Model) ) 
  Model.names$variable <- ModelLabels
  
  SpawnBioUncertainty <- SpawnBioUncertainty[-c(1:6),]
  SpawnBioUncertainty <- merge(SpawnBioUncertainty,Model.names,by="Model")
  colnames(SSBMSST)   <- c("Model","value")
  SSBMSST             <- merge(SSBMSST,Model.names,by="Model")
  
  SummaryBio          <- data.table(SummaryBio)
  SpawnBioUncertainty <- data.table(SpawnBioUncertainty)
  
  shapes <- c(16,17,18,4,3)
  
  if(ModelLabels[2]=="b) Start in 1970"){  
    SummaryBio          <- SummaryBio[!(variable=="b) Start in 1970"&Yr<1970)]  
    SpawnBioUncertainty <- SpawnBioUncertainty[!(variable=="b) Start in 1970"&Yr<1970)]
  }
  
  thinned <- c(seq(from=1,to=nrow(SummaryBio),by=10))
  a<-ggplot(data=SummaryBio,aes(x=Yr,color=variable,shape=variable))+
    geom_ribbon(aes(ymin=Lower,ymax=Upper),color=NA,data=SpawnBioUncertainty,fill="gray",alpha=0.2)+
    geom_line(aes(y=value),size=1.5) +
    geom_point(aes(y=value),data=SummaryBio[thinned,], size=4)+
    xlab("Year") + ylab("Spawning biomass (mt)") +
    geom_hline(aes(yintercept=value,color=variable),data=SSBMSST,size=1.5)+
    scale_shape_manual(values=shapes)+
    scale_color_jco()+
    theme_bw(base_size=20)+aTheme+theme(legend.position="none")
  a
  
  FishingMort<-Summary$Fvalue
  names(FishingMort)<-c(ModelLabels,"Label","Yr")
  FishingMort<-melt(FishingMort,id.vars=c("Label","Yr"))
  FishingMort<-subset(FishingMort,Yr>=1948)
  FMSY<-Summary$quants[which(Summary$quants$Label=="Fstd_MSY"),1:NModels]
  FMSY<-melt(FMSY)
  FUpper<-Summary$FvalueUpper
  FUpper<-melt(FUpper, id.vars=c("Yr", "Label") )
  names(FUpper)[3:4]<-c("Model","FUpper")
  FLower<-Summary$FvalueLower 
  FLower<-melt(FLower, id.vars=c("Yr", "Label") )
  names(FLower)[3:4]<-c("Model","FLower")
  Funcertainty<-merge(FUpper,FLower,by=c("Yr","Label","Model"))  
  
  Model.names          <- data.frame(Model=as.character( unique(Funcertainty$Model) ) )
  Model.names$variable <- ModelLabels
  
  Funcertainty <- merge(Funcertainty,Model.names,by="Model")
  colnames(FMSY)   <- c("Model","value")
  FMSY             <- merge(FMSY,Model.names,by="Model")
  
  FishingMort  <- data.table(FishingMort)
  Funcertainty <- data.table(Funcertainty)
  
  if(ModelLabels[2]=="b) Start in 1970"){  
    FishingMort  <- FishingMort[!(variable=="b) Start in 1970"&Yr<1970)]  
    Funcertainty <- Funcertainty[!(variable=="b) Start in 1970"&Yr<1970)]
  }
  
  
  thinned <- c(seq(from=1,to=nrow(FishingMort),by=10))
  b<-ggplot(data=FishingMort,aes(x=Yr,color=variable,shape=variable))+
    geom_ribbon(aes(ymin=FLower,ymax=FUpper),color=NA,data=Funcertainty,fill="gray",alpha=0.2)+
    geom_line(aes(y=value),size=1.5) +
    geom_point(aes(y=value),data=FishingMort[thinned,], size=4)+
    xlab("Year") + ylab("Fishing mortality") +
    geom_hline(aes(yintercept=value,color=variable),data=FMSY,size=1.5)+
    scale_color_jco()+
    scale_shape_manual(values=shapes)+
    theme_bw(base_size=20)+aTheme+theme(legend.position="none")
  b
  
  
  
  Recruits<-Summary$recruits
  names(Recruits)<-c(ModelLabels,"Label","Yr")
  Recruits<-melt(Recruits,id.vars=c("Label","Yr"))
  Recruits<-subset(Recruits,Yr>=1948)
  
  Recruits <- data.table(Recruits)
  Recruits <- Recruits[!(variable=="b) Start in 1970"&Yr<1970)]
  
  thinned <- c(seq(from=1,to=nrow(Recruits),by=10))
  c<-ggplot(data=Recruits,aes(x=Yr,y=value,color=variable,shape=variable)) +
    geom_line(size=1.5) +
    geom_point(data=Recruits[thinned,],size=4)+
    xlab("Year") + ylab("Age-0 recruits (1000s of fish)") +
    scale_linetype_manual(values=c(1:NModels),labels=c(ModelLabels))+
    scale_color_jco()+
    scale_shape_manual(values=shapes)+
    theme_bw(base_size=20)+aTheme
  c
  
  d<-Get_KobeScenarios(Model.List=Summary,Label.Vect=ModelLabels,plotdir=Directory,NModels)+theme(legend.position="right")
  d
  
  png(paste0(PlotDir,"\\Sensitivity.png"),height=10,width=16,units="in",res=200)
  grid.arrange(a,c,b,d, nrow=2)
  dev.off()
  
  
} ## End of plot sensitivity function


Comp_sens   <-SSsummarize(list(model_1,model_2,model_3))
ModelLabels <-c("Base","HMRFS Not Corrected","2020 Benchmark")
Directory   <-file.path(root_dir,"01_SS final","Comparisons","03_FullComparison")

dir.create(Directory)
NModels <- length(ModelLabels)
plotsensitivity(Comp_sens,ModelLabels,NModels,Directory)

