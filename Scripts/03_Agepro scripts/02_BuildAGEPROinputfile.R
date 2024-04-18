#' @param root_dir base directory
#' @param modelname Name of the model run
#' @param n_years Number of years to project
#' @param timeperiod can be "Year" or "Quarter" for quarters as years
#' @param my_rec_model Which recruitment model(s) to use for projections - see Agepro manual for definitions
#' @param seed seed for reproducing random number generator

## extracting inputs for AGEPRO input files
require(r4ss);require(plyr);require(tidyverse);require(this.path)
root_dir     <- here(..=2)

## ===========Manual Inputs===================
modelname       <- "UkuFirstTests"
timeperiod      <- "Year"
n_years         <- 8
n_sims          <- 200
RefPointSSB     <- 293*2 # Multiply SSBmsst by 2 since Agepro accounts for Male+Females together
RefPointF       <- 0.14 # Fmsy
##============================================

#============Recruitment model(s) - see Agepro manual and AGEPRO_Input.R for help defining rec_pars list==================
general_rec_pars <- list(RecFac=1000,SSBFac=1,MaxRecObs=100) # These are general parameters used for all models

rec_models       <- c(5,3,3)       # Vector of all recruitment models used
rec_model_probs  <- c(0.6,0.2,0.2) # Probability of each model being used in a given year (applies to all projection years)
rec_pars         <- list(list(ModelType=5,alpha=79.336,beta=153.85,var=0.1521), # Model 1 pars
                         list(ModelType=3,StartYr=1948,EndYr=2004),             # Model 2 pars
                         list(ModelType=3,StartYr=2005,EndYr=2022))             # Model 3 pars
                         
Recruitment      <- list(general_rec_pars=general_rec_pars, # Put all objects together
                         rec_models=rec_models,
                         rec_model_probs=rec_model_probs,
                         rec_pars=rec_pars)
n_rec_models     <- length(rec_models)
#=================================================

# Key folders
script.dir      <- file.path(root_dir,"Scripts","03_Agepro scripts") # where are your Rscripts
boot_file       <- file.path(root_dir,"Outputs","Agepro","UkuBootstraps.bsn") ## where is your bootstrap file path
basemodel_dir   <- file.path(root_dir,"01_SS final","01_base") # Where the model runs are stored

# Required functions
source(file.path(script.dir,"Agepro Functions","SS_to_Agepro.R"))
source(file.path(script.dir,"Agepro Functions","AGEPRO_Input.R"))

# Check the number of bootstrap runs in the boot file
n_boot     <- nrow(read.table(boot_file))

## use the modifies SS_output function to load all the report file lines needed
SSInput  <- SS_To_Agepro(model.dir=basemodel_dir, script.dir=script.dir, TimeStep=timeperiod)
maxage   <- SSInput$MaxAge
endyr    <- max(SSInput$FbyFleet$Yr)

## Adjust SSInput to the fleets you want to include: for this I am only choosing the fleets with unique selectivities, then for the fleets with the same selectivities, adding up the catch proportions for the new fleet:
UniqueFleets <- SSInput$Fishery_SelAtAge %>% filter(Yr == endyr) %>%
                 distinct(across(-c(Yr, Fleet)), .keep_all = TRUE) %>% select(Fleet) %>% pull()
Years        <- seq(min(SSInput$Fishery_SelAtAge$Yr),max(SSInput$Fishery_SelAtAge$Yr))
endyr        <- max(Years)
projstart    <- endyr+1

matching_indices <- list()
 for(j in 1:length(Years)) {
  matching_indices[[j]] <- list()
  for (i in 1:length(UniqueFleets)){

    # Select the target row (row 1 in this case)
    target_row <- SSInput$Fishery_SelAtAge[which(SSInput$Fishery_SelAtAge$Fleet==UniqueFleets[i]&SSInput$Fishery_SelAtAge$Yr==Years[j]), -2]

    # Find rows that match the target row
    matching_indices[[j]][[i]] <- which(apply(SSInput$Fishery_SelAtAge[,-2], 1, function(x) all(x %in% target_row)))
}}

# Display the indices of matching rows
#print(matching_indices)

YearAvg <- seq(endyr-2,endyr)  ## define which years you want to average you selectivity and catch at age over

SSInput$Fishery_SelAtAge <- SSInput$Fishery_SelAtAge %>%
                            filter(Fleet %in% UniqueFleets) %>%   ##filter out only the unique fleets
                            filter(Yr %in% YearAvg)  %>% ##save the year/years you want to average the Fishery selectivity over
                            group_by(Fleet) %>%  ## average each age by fleet
                            summarize(across(c(2:(maxage+1)),mean))

SSInput$Nfleets            <- length(UniqueFleets)
SSInput$Fishery_SelAtAgeCV <- SSInput$Fishery_SelAtAgeCV[UniqueFleets,]


SSInput$Catage <- SSInput$Catage %>% 
                    filter(Fleet %in% UniqueFleets) %>%   ##filter out only the unique fleets
                    filter(Yr %in% YearAvg) %>%  ##save the year/years you want to average the catch at age over
                    group_by(Fleet) %>%  ## average each age by fleet
                    summarize(across(c(2:(maxage+1)),mean))

SSInput$CatageCV <- SSInput$CatageCV[UniqueFleets,]
duplicated_rows  <- matching_indices[[1]]

## Summing the fleets' catch and Fs which share selectivities so that they can be used to proportion catch in projections
for (group in duplicated_rows){

  col_names <- paste0("sel(B):_",group)
  SSInput$CatchbyFleet[,paste0("sum_",paste(group,collapse="_"))] <- rowSums(SSInput$CatchbyFleet[,col_names,drop=FALSE],na.rm=TRUE)
  col_names2<-paste0("F:_",group)
  SSInput$FbyFleet[,paste0("sum_",paste(group,collapse="_"))] <- rowSums(SSInput$FbyFleet[,col_names2,drop=FALSE],na.rm=TRUE)
}
 
CatchbyFleet        <- SSInput$CatchbyFleet %>%
                       select(-starts_with("sel(B):_"))
names(CatchbyFleet) <- c("Yr",UniqueFleets) 
 
 ProportionCatch <- CatchbyFleet
 for( i in 1:length(Years)) {
   
   TempCatch                                    <- CatchbyFleet[i,-1]
   ProportionCatch[i,c(2:ncol(ProportionCatch))]<- TempCatch/sum(TempCatch) 
 }
 
 FbyFleet        <- SSInput$FbyFleet %>%
                    select(-starts_with("F:_"))
 names(FbyFleet) <- c("Yr",UniqueFleets) 

 ##From here you can average catch, average F, or average proportion of catch over the years you are interested in
 ## sticking with the three year average used above:
 
CatchbyFleet    <-  CatchbyFleet %>%
                    filter(Yr %in% YearAvg) %>%
                    summarize(across(c(2:ncol(CatchbyFleet)),\(x) mean(x,na.rm=TRUE)))
ProportionCatch <-  ProportionCatch %>%
                    filter(Yr %in% YearAvg) %>%
                    summarize(across(c(2:ncol(ProportionCatch)),\(x) mean(x,na.rm=TRUE)))
FbyFleet        <-  FbyFleet %>%
                    filter(Yr %in% YearAvg) %>%
                    summarize(across(c(2:ncol(FbyFleet)),\(x) mean(x,na.rm=TRUE)))

#========================================================================================
##========Harvest strategy to simulate===================================================
#========================================================================================

#  First column is the harvest specification, then one column for each fleet for each year. Landings (catch) = 1, F-Mult (F) = 0, Removals = ?

## Here is an example assuming constant catch over the number of years of the model,
## where catch is partitioned based upon the relative catch by fleet in the last year of the assessment,
## this is calculated in SSInput$CatchbyFleet.

TotalCatch     <- 150 # This number is just a place-holder, this will be inputed in the 03_RunProjections file
FleetRemovals  <- t(sapply(ProportionCatch, function(p) rep(p*TotalCatch,n_years)))
Harvest        <- list("Type"=c(rep(1,n_years)),"Harvest"=FleetRemovals)

print(Harvest[[2]])

##=====================Now write the input file=============================================
AGEPRO_INP(         output.dir = file.path(root_dir,"Outputs","Agepro",modelname),
                    boot_file = boot_file,
                    NBoot = n_boot,
                    SS_Out = SSInput,
                    ModelName=modelname,
                    ProjStart = projstart,
                    NYears = n_years,
                    MinAge = 1,
                    NSims = n_sims,
                    NRecr_models = n_rec_models,
                    Discards = 0,
                    set.seed = 123,
                    ScaleFactor = c(1000,1000,1000),  #population scaling factor, recruitment scaling factor, SSB scaling factor
                    UserSpecified = c(0,0,0,0,0,0,0),
                    TimeVary = c(0,0,0,0,0,0,0),
                    FemaleFrac=0.5,
                    Recruitment=Recruitment,
                    Harvest=Harvest,
                    doRebuild=FALSE,
                    RebuildTargetSSB = 300,
                    RebuildTargetYear = 2030,
                    PercentConfidence = 60,
                    LandingType = 1,
                    ThresholdReport = TRUE,
                    RefPointSSB = RefPointSSB,
                    RefPointJan1 = 0,
                    RefPointMidYr = 0,
                    RefPointF = RefPointF,
                    SetBounds = TRUE,
                    MaxWeight = 20,
                    MaxNatM = 1,
                    SumReport = 0,
                    AuxFiles = 0,
                    RExport = 0,
                    SetScale = TRUE,
                    PercentileReport = TRUE,
                    Percentile = 50)
