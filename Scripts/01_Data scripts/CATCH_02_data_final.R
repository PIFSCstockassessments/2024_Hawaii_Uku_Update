require(data.table); require(MASS); require(tidyverse); require(ggplot2); require(this.path)

root_dir <- here(..=2)

# Select species by code (e.g. 20 == uku)
Species.code <- 20

# Select if MRIP data is to be adjusted for the cell phone to mail survey years
Cell.correction <- T


#--- Create final catch table for a specific species, for use in assessment models-------------------------------
C <- readRDS(file=file.path(root_dir,"Outputs/CATCH_processed.rds"))

# Partition invalid areas to known mhi areas based on proportion of species/year in mhi area compared to nwhi area
aggr          <- C[SPECIES==Species.code,list(LBS=sum(LBS)),by=list(FYEAR,AREA_D,GEAR_B)]
aggr          <- dcast(aggr, FYEAR+GEAR_B~AREA_D,value.var="LBS",fill=0)
aggr$PROP_MHI <- aggr$MHI/(aggr$MHI+aggr$NWHI)
aggr$Inv_MHI  <- aggr$Invalid*aggr$PROP_MHI

D         <- C %>% filter(SPECIES==Species.code) %>% filter(AREA_D=="MHI")
D         <- D[,list(LBS=sum(LBS)),by=list(FYEAR,GEAR_B)] 
D         <- D[order(FYEAR,GEAR_B)]
D$LBS_COM <- D$LBS+aggr$Inv_MHI
D$LBS     <- NULL
D         <- dcast(D, FYEAR~GEAR_B,value.var="LBS_COM",fill=0)%>% as.data.table()
D$COM_TOT <- D$COM_DEEP_HANDLINE+D$COM_INSHORE_HANDLINE+D$COM_RARE+D$COM_TROLLING 

# Add MRIP recreational catch data
M          <- data.table( read.csv(file.path(root_dir,"Data\\mrip_GREEN_JOBFISH_catch_series.csv"),skip=28, stringsAsFactors = F) )
M          <- dplyr::select(M,YEAR="Year",MODE="Fishing.Mode",NUM_MRIP=Total.Harvest..A.B1.)
M          <- M[MODE!="PARTY/CHARTER BOAT"]
M$NUM_MRIP <- as.numeric(M$NUM_MRIP)

# A correction factor for year 2003-2010 is necessary due to an error (Ma 2013, IR-13_006.pdf)
M[YEAR<=2010]$NUM_MRIP <- M[YEAR<=2010]$NUM_MRIP/1.22 

# Mail effort survey started officially in 2018, 2017 data can be transformed to mail-survey equivalent by applying correction factors
if(Cell.correction==F){
M[YEAR==2017&MODE=="SHORE"]$NUM_MRIP               <- M[YEAR==2017&MODE=="SHORE"]$NUM_MRIP*2.89
M[YEAR==2017&MODE=="PRIVATE/RENTAL BOAT"]$NUM_MRIP <- M[YEAR==2017&MODE=="PRIVATE/RENTAL BOAT"]$NUM_MRIP*2.33
}

# Alternatively, we can correct all pre-2018 years, using a linear factor between 1999(1) and 2017(2.33 or 2.89) 
if(Cell.correction==T){
M[YEAR<=2017&MODE=="SHORE"]$NUM_MRIP              <- M[YEAR<=2017&MODE=="SHORE"]$NUM_MRIP*
                                                      ((2.89-1)/(2017-1999)*
                                                      (M[YEAR<=2017&MODE=="SHORE"]$YEAR-1999)+1)

M[YEAR<=2017&MODE=="PRIVATE/RENTAL BOAT"]$NUM_MRIP <- M[YEAR<=2017&MODE=="PRIVATE/RENTAL BOAT"]$NUM_MRIP*
                                                      ((2.33-1)/(2017-1999)*
                                                      (M[YEAR<=2017&MODE=="PRIVATE/RENTAL BOAT"]$YEAR-1999)+1)
}  

M$LBS_MRIP <- M$NUM_MRIP*(3.04*2.20462)    # Calculate catch in lbs by multiplying number caught by the mean kg weight of an uku from HMFRS 2003-2023 data (n=244). Remove two outliers (25lb and 18lb)
M          <- data.table( dcast(M,YEAR~MODE,value.var="LBS_MRIP",fill=0) )

S      <- data.table( read.csv(file.path(root_dir,"Data\\ProportionSampleSizeV2.csv"),skip=1) ) # Proportion of MRIP catch sold by year for "boat" mode ("shore" mode list zero sold catch)
S      <- dplyr::select(S,YEAR=year,PROP_SOLD=Annual.proportion.of.sold.uku..by.numbers.)

M         <- merge(M,S,by="YEAR")
M$LBS_REC <- M$`PRIVATE/RENTAL BOAT`*(1-M$PROP_SOLD) # Remove the proportion of the boat-based catch that was sold based on yearly prop. sold (more variable)
M$LBS_REC <- M$LBS_REC+M$SHORE
M         <- dplyr::select(M,YEAR,LBS_REC)

# Recent trends in recreational catch
ggplot(data=M,aes(x=YEAR,y=LBS_REC*0.453592/1000))+geom_point()+
                ylab("Recreational catch (metric tons)")+ggtitle("HMFRS recreational uku catch")+
                geom_smooth(method="lm")+theme_bw()
ggsave(last_plot(),filename=file.path(root_dir,"Outputs/Graphs/Catch/FIG_REC.tiff"),dpi=300,units="cm",width=13,height=6)

# Calculate the proportion of yearly human pop. in Hawaii
P       <- data.table( read.csv("Data\\HIPOP.csv") )    
P$PROP  <- P$HIPOP/mean(P[DATE>=2003&DATE<=2017]$HIPOP) #based on reference years 2003 to 2017
P$PROP2 <- P$HIPOP/P[DATE==2003]$HIPOP                  #based on reference year 2003
P$PROP3 <- P$HIPOP/mean(P[DATE>=2003&DATE<=2007]$HIPOP) #based on reference year 2003 to 2007 (5 years)

# Rec method: Use pop proportion <2003 and use actual raw rec. catch data for >=2003
M.2003_2007   <- mean(M[YEAR<=2007]$LBS_REC)
M.OLD         <- data.table(YEAR=seq(from=1948,to=2002,by=1),PROP3=P[DATE<=2002]$PROP3,LBS_REC=0)
M.OLD$LBS_REC <- M.OLD$PROP3*M.2003_2007 
M.OLD         <- select(M.OLD,-PROP3)
M             <- rbind(M,M.OLD)
M             <- M[order(YEAR)]

M$MTONS_REC_M3       <- M$LBS_REC*0.453592/1000
M$MTONS_REC_M3.LOGSD <- 0.4 # Based on MRIP provided number, where SHORE CV=77% and BOAT CV=29% (SHORE is 23% of catch vs 77% for BOAT)

plot(M$YEAR,M$MTONS_REC_M3)

# Merge with commercial data
M <- select(M,-LBS_REC,-YEAR)
D <- cbind(D,M)

# convert lbs to metric tons for commercial data
D$COM_DEEP_HANDLINE    <- D$COM_DEEP_HANDLINE*0.453592/1000
D$COM_INSHORE_HANDLINE <- D$COM_INSHORE_HANDLINE*0.453592/1000
D$COM_TROLLING         <- D$COM_TROLLING*0.453592/1000
D$COM_RARE             <- D$COM_RARE*0.453592/1000


D <- dplyr::select(D,FYEAR,COM_DEEP_HANDLINE,COM_INSHORE_HANDLINE,COM_TROLLING,COM_RARE,MTONS_REC_M3,MTONS_REC_M3.LOGSD)

if(Cell.correction==F) file.name <- "Final_CATCH_NoCellCorr.csv"
if(Cell.correction==T) file.name <- "Final_CATCH_CellCorr.csv"

write.csv(D,file.path(root_dir,"Outputs","SS3 inputs",file.name),row.names=F)





