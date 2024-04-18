require(data.table); require(ggplot2); require(mgcv): require(dplyr); require(RColorBrewer); require(emmeans); require(forcats); require(boot)

C <- readRDS("Outputs/CPUE_DEEP_HANDLINE_StepC.rds")

C$FYEAR <- as.character(C$FYEAR)
C$PRES  <- 0
C[UKUCPUE>0]$PRES  <- 1

# Arrange datasets for CPUE standardization
O <- C[DATE<"2002-10-01"]
R <- C[DATE>="2002-10-01"]

O <- select(O,TRIP,FYEAR,MONTH,CUM_EXP,FISHER,LAT,LONG,AREA,AREA_B,AREA_C,PC1,PC2,PC3,PC4,UKUCPUE,PRES)                 # Old data
R <- select(R,TRIP,FYEAR,MONTH,CUM_EXP,FISHER,LAT,LONG,SPEED,XDIR,YDIR,AREA,AREA_B,AREA_C,PC1,PC2,PC3,PC4,UKUCPUE,PRES) # Recent data

# Data filters
range(O$UKUCPUE); range(R$UKUCPUE)
hist(log(O[UKUCPUE<10000]$UKUCPUE))

O <- O[UKUCPUE<100000]
R <- R[UKUCPUE<100000]

#O <- O[UKUCPUE<100000&AREA=="331"]
#R <- R[UKUCPUE<100000&AREA=="331"]

# Reduce number of individual fisher IDs
FISHERS   <- O[,list(UKUCPUE=mean(UKUCPUE)),by=list(FISHER)]
FISHERS   <- FISHERS[order(-UKUCPUE)]
FISHERS$FISHER.TYPE              <- "Highliner"
FISHERS[UKUCPUE<200]$FISHER.TYPE <- "Lowliner"
FISHERS   <- select(FISHERS,FISHER,FISHER.TYPE)
O         <- merge(O,FISHERS,by="FISHER")
O[FISHER.TYPE=="Lowliner"]$FISHER  <- O[FISHER.TYPE=="Lowliner"]$FISHER.TYPE
O         <- select(O,-FISHER.TYPE)

# Set up factors correctly
O$FISHER  <- as.factor(O$FISHER)
O$FYEAR   <- fct_reorder(O$FYEAR,as.numeric(O$FYEAR),min)
O$MONTH   <- as.character(O$MONTH)
O$MONTH   <- fct_reorder(O$MONTH,as.numeric(O$MONTH),min)
O$AREA_B  <- fct_reorder(O$AREA_B,O$LONG,min)
O$AREA_C  <- fct_reorder(O$AREA_C,O$LONG,min)

# Nominal CPUE
NOMI       <- O[UKUCPUE>0,list(UKUCPUE=mean(UKUCPUE)),by=list(FYEAR)]
NOMI$PERC  <- NOMI$UKUCPUE/mean(NOMI$UKUCPUE)*100
NOMI$MODEL <- "Nominal"
NOMI       <- select(NOMI,-UKUCPUE)
NOMI$FYEAR <- as.numeric(as.character((NOMI$FYEAR)))

#model3 <- gam(data=R,PRES~FYEAR+AREA_C+s(MONTH,bs="cc")+s(PC1,PC2),family=binomial("logit"), method="REML")
# Run standardization analyses - old data - This step can take a while.
P.Models      <- list()
P.Models[[1]] <- bam(data=O[UKUCPUE>0],log(UKUCPUE)~FYEAR, method="REML")
P.Models[[2]] <- bam(data=O[UKUCPUE>0],log(UKUCPUE)~FYEAR+AREA_C, method="REML")
P.Models[[3]] <- bam(data=O[UKUCPUE>0],log(UKUCPUE)~FYEAR+AREA_C+MONTH, method="REML")
P.Models[[4]] <- bam(data=O[UKUCPUE>0],log(UKUCPUE)~FYEAR+AREA_C+MONTH+s(PC1)+s(PC2), method="REML")
P.Models[[5]] <- bam(data=O[UKUCPUE>0],log(UKUCPUE)~FYEAR+AREA_C+MONTH+s(PC1,PC2), method="REML")
P.Models[[6]] <- bam(data=O[UKUCPUE>0],log(UKUCPUE)~FYEAR+AREA_C+MONTH+s(PC1)+s(PC2)+s(PC3)+s(PC4), method="REML")
P.Models[[7]] <- bam(data=O[UKUCPUE>0],log(UKUCPUE)~FYEAR+AREA_C+MONTH+s(FISHER,bs="re")+s(PC1)+s(PC2)+s(PC3)+s(PC4), method="REML")

B.Models      <- list()
B.Models[[1]] <- bam(data=O,PRES~FYEAR,family=binomial(link="logit"), method="REML")
B.Models[[2]] <- bam(data=O,PRES~FYEAR+AREA_C,family=binomial(link="logit"), method="REML")
B.Models[[3]] <- bam(data=O,PRES~FYEAR+AREA_C+MONTH,family=binomial(link="logit"), method="REML")
B.Models[[4]] <- bam(data=O,PRES~FYEAR+AREA_C+MONTH+s(FISHER,bs="re"),family=binomial(link="logit"), method="REML")


aB.Model <- B.Models[[4]]

Results <- list()
for(i in 1:length(P.Models)){
   
   aP.Model <- P.Models[[i]]
   
   # Create Walter's large table and run predictions
   WLT <- data.table(  table(O$FYEAR,O$MONTH,O$AREA_C)  )
   setnames(WLT,c("FYEAR","MONTH","AREA_C","N"))

   # Add median for continuous variables
   WLT$PC1    <- median(O$PC1)
   WLT$PC2    <- median(O$PC2)
   WLT$PC3    <- median(O$PC3)
   WLT$PC4    <- median(O$PC4)
   WLT$FISHER <- "Lowliner"  
   
   # Predict expected values for all level combinations
   POSCPUE     <- predict.bam(aP.Model,newdata=WLT)
   WLT         <- cbind(WLT,POSCPUE)
   WLT$POSCPUE <- exp(WLT$POSCPUE)
   
   # Predict expected probabilities
   PROBCPUE     <- predict.bam(aB.Model,newdata=WLT)
   WLT          <- cbind(WLT,PROBCPUE)
   WLT$PROBCPUE <- inv.logit(WLT$PROBCPUE)
   
   # Put back together
   WLT$SDCPUE <- WLT$POSCPUE*WLT$PROBCPUE
   
   # Give AREAS proportional geographical weights
   RW  <- data.table(AREA_C=c("Kauai","Oahu","Penguin","MauiNui","Hawaii"),WEIGHT=c(0.08,0.11,0.20,0.38,0.23))
   WLT <- merge(WLT,RW,by="AREA_C")

   WLT1 <- WLT[,list(SDCPUE=sum(SDCPUE*WEIGHT)),by=list(FYEAR,MONTH)] # Sum abundance in all region, by regional weight
   WLT1 <- WLT1[,list(SDCPUE=mean(SDCPUE)),by=list(FYEAR)] # Average all 12 months per year

   WLT1$FYEAR <- as.numeric(WLT1$FYEAR)

   WLT1$PERC  <- WLT1$SDCPUE/mean(WLT1$SDCPUE)*100
   WLT1       <- select(WLT1,-SDCPUE)
   WLT1$MODEL <- paste0("Model",i)
   
   Results[[i]] <- WLT1
   
}

Final   <- rbindlist(Results)
Final   <- rbind(Final,NOMI)

ggplot(data=Final,aes(x=FYEAR,group=MODEL))+geom_smooth(aes(y=PERC,color=MODEL),se=F,span=0.3)+
   scale_color_brewer(palette = "Set2")+theme_bw()

#ggplot(data=D,aes(x=FYEAR))+geom_point(aes(y=PERC),color="blue",size=1)+geom_point(aes(y=PERC1),color="red",size=1)+
#  geom_smooth(aes(y=PERC),span=0.3,col="blue")+geom_smooth(aes(y=PERC1),span=0.3,col="red")+theme_bw()


# Test Emmeans vs. FYEAR effect vs Predict

Emmeans1    <- emmeans(P.Models[[4]],specs=c("FYEAR"))
Model4      <- summary(Emmeans1,type="response")[,1:2]
Model4$FYEAR<- as.numeric(as.character(Model4$FYEAR))
Model4$PERC <- Model4$response/mean(Model4$response)*100 

Predict1       <- predict.gam(P.Models[[4]])
Predict2       <- data.table(  cbind(O[UKUCPUE>0],exp(Predict1))  )
setnames(Predict2,"V2","PRED")
Predict3       <- Predict2[,list(PRED=mean(PRED)),by=list(FYEAR)]
Predict3$PERC  <- Predict3$PRED/mean(Predict3$PRED)*100
Predict3$FYEAR <- as.numeric(as.character(Predict3$FYEAR))

ggplot()+geom_line(data=Model4,aes(x=FYEAR,y=PERC))+geom_point(data=Results[[4]],aes(x=FYEAR,y=PERC),col="red")+
   geom_line(data=Final[MODEL=="Nominal"],aes(x=FYEAR,y=PERC),col="blue")+
   geom_line(data=Predict3,aes(x=FYEAR,y=PERC),col="darkgreen")




