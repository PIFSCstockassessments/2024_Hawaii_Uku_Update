require(data.table); require(MASS); require(dplyr); require(ggplot2)

#Species.code <- 20

D    <- readRDS(file="Outputs/CATCH_processed.rds")
C    <- D
C$ID <- paste0(C$DATE,"_",C$FISHER)
C    <- C[GEAR_A=="DEEP_HANDLINE"]

C[NUM_GEAR>4]$NUM_GEAR    <- 999
C$NUM_GEAR                <- as.character(C$NUM_GEAR)
C[NUM_GEAR==999]$NUM_GEAR <- ">4 gears"

NGEAR <- C[,list(N=.N),by=list(FYEAR,NUM_GEAR,ID)]
NGEAR <- NGEAR[,list(N=.N),by=list(FYEAR,NUM_GEAR)]

NTRIP.YEAR <- NGEAR[,list(N.TOT=sum(N)),by=list(FYEAR)]
NGEAR <- merge(NGEAR,NTRIP.YEAR)

NGEAR$PROP.TOT <- NGEAR$N/NGEAR$N.TOT


ggplot(data=NGEAR[FYEAR>=2000])+geom_line(aes(x=FYEAR,y=PROP.TOT,group=NUM_GEAR,color=NUM_GEAR))
ggsave("NumGear_reporting.jpeg",last_plot(),width=16,height=8,units="cm")



C        <- C[FYEAR>=2003&AREA_C=="Penguin"]
C$TRIPID <- paste0(C$ID,"_",C$HOURS)

C           <- C[HOURS>0,list(LBS=sum(LBS)),by=list(FYEAR,NUM_GEAR,TRIPID,HOURS)]
C$LBS_HOURS <- C$LBS/C$HOURS 
C           <- C[,list(LBS_HOURS=mean(LBS_HOURS)),by=list(FYEAR,NUM_GEAR)]

ggplot(data=C[NUM_GEAR!=">4 gears"],aes(x=FYEAR,y=LBS_HOURS,group=NUM_GEAR))+geom_point(aes(color=NUM_GEAR))+geom_smooth(method="loess",aes(color=NUM_GEAR))
ggsave("NumGear_CPUE.jpeg",last_plot(),width=16,height=8,units="cm")


C   <- C[,list(LBS_HOURS=mean(LBS_HOURS)),by=list(NUM_GEAR)]
ggplot(data=C[NUM_GEAR!=">4 gears"])+geom_point(aes(x=NUM_GEAR,y=LBS_HOURS))
ggsave("NumGear_CPUE_all.jpeg",last_plot(),width=8,height=8,units="cm")
