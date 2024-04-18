require(sf); require(rnaturalearth);  require(rnaturalearthdata); require(ggplot2); require(RColorBrewer); require(data.table); require(reshape2); require(dplyr)

# Load processed catch data
C1 <- readRDS("Outputs/CATCH_processed.rds")

# Obtain alternative spatial reclassification scheme
#RC <- C1[!duplicated(C1[,2:4]),]
#RC <- select(RC, AREA,AREA_A,AREA_B)

C1 <- C1[SPECIES==20,list(NUM_KEPT=sum(NUM),LBS_KEPT=sum(LBS)),by=list(YEAR=FYEAR,AREA,AREA_A,AREA_B)]
C1 <- C1[AREA_B!="NWHI"]

# Merge AREA into larger components by summing and re-asigning the summed catch to smaller AREAs
SUBTOT <- C1[,list(LBS_KEPT2=sum(LBS_KEPT)),by=list(YEAR,AREA_A)]
C1     <- merge(C1,SUBTOT,by=c("YEAR","AREA_A"))

# Load shapefile
coast         <- ne_coastline(scale="medium",returnclass="sf") 
grids         <- st_read("DATA/Grids/DAR_Reporting_grids_all.shp")
grids$AREA_ID <- as.character(grids$AREA_ID)
grids$AREA_A  <- NULL

# Select time period and average the catches by period
#C1$YEAR <- as.numeric(C1$YEAR) - as.numeric(C1$YEAR) %% 5
#C1      <- C1[,list(CATCH=mean(CATCH)),by=list(YEAR,AREA_FK)]

# Fill all missing reporting grids with zeroes
#C1 <- dcast(C1,YEAR~AREA_FK,value.var="CATCH",fill=0)
#C1 <- melt(C1,id.vars="YEAR",variable.name="AREA_FK",value.name="CATCH")
#C1 <- data.table(C1)


# Calculate percentage of total catch by year
TOT_CATCH   <- C1[,list(TOTAL=sum(LBS_KEPT)),by=list(YEAR)]
C1          <- merge(C1,TOT_CATCH,by="YEAR")
C1$PERCENT  <- C1$LBS_KEPT2/C1$TOTAL*100 

# Merge grids with new reclassification scheme
#grids <- merge(grids,RC,by.x="AREA_ID",by.y="AREA") 

# Merge catch data with grids
C1    <- merge(grids,C1,by.x="AREA_ID",by.y="AREA",allow.cartesian = T)
#C1    <- merge(grids,C1,by.x="AREA_ID", by.y="AREA_FK",allow.cartesian = T)

# Keep zeroes or remove them?
#C1 <- C1[C1$CATCH!=0,]

# Figures
aTheme <- theme(axis.text=element_text(size=5),
                legend.text=element_text(size=5),
                legend.title=element_text(size=7)
                )

aList <- list()
YearList <- unique(C1$YEAR)
YearList <- sort(YearList)
for(i in 1:length(YearList)){

  aPlot <- ggplot()+geom_sf(data=coast,lwd=1)+geom_sf(data=C1[C1$YEAR==YearList[i],],aes_string(fill=C1[C1$YEAR==YearList[i],]$PERCENT),lwd=0.1)+
    coord_sf(xlim=c(-161,-154),ylim=c(18,23))+
    #coord_sf(xlim=c(-154,-179),ylim=c(18,29))+
    scale_fill_gradientn(limits=c(0,40),colors=brewer.pal(11,"RdYlGn"))+ggtitle(YearList[i])+aTheme
    
  aList[[i]] <- aPlot
  mypath <- paste("Outputs/Graphs/Spatial/Spatial", YearList[i], "_CATCH.tiff",sep="")
  ggsave(mypath,plot=aPlot,units="cm",height=5.5,width=8.5, pointsize=10, dpi=300, compression="lzw")
  
}

# Specifc graphs for Penguin Bank
plot(C1[C1$AREA_FK_B=="Penguin",]$YEAR,C1[C1$AREA_FK_B=="Penguin",]$PERCENT)
plot(C1[C1$AREA_FK_B=="Penguin",]$YEAR,C1[C1$AREA_FK_B=="Penguin",]$LBS_KEPT)


