#' @param root_dir base directory
#' @param basemodel_dir where the base model SS files are located 
#' @param n_boot number of bootstrap models to run (>= 3)
#' @param seed seed for reproducing random number generators

 
require(r4ss); require(parallel); require(data.table); require(this.path); require(tidyverse)
root_dir <- here(..=2)

## ===========Manual Inputs===================
     n_boot        <- 100
     seed          <- 123
     basemodel_dir <- file.path(root_dir,"01_SS final","01_base")
##============================================
  
  # Key directories
  boot_dir      <- file.path(basemodel_dir,"Bootstraps")
  
  dir.create(boot_dir,showWarnings = F) # Directory where bootstrap will be run.

  message(paste0("Creating bootstrap data files in ", boot_dir))
   
   # Run model one time to generate the data bootstrap files
    file.copy(list.files(basemodel_dir, pattern = "ss.par|data.ss|control.ss|starter|forecast|.exe|.par", full.names = T),to = boot_dir)
    
    start              <- r4ss::SS_readstarter(file = file.path(boot_dir, "starter.ss"))
    start$N_bootstraps <- n_boot + 2
    r4ss::SS_writestarter(start, dir = boot_dir, overwrite = T)
    
    r4ss::run(dir = boot_dir, exe = "ss_opt_win", extras = "-nohess",  skipfinished = FALSE, show_in_console = F)
   
   # # Extract end year of model
    base.model <- r4ss::SS_output(boot_dir)
    drvquants  <- base.model$derived_quants %>% filter(str_detect(Label,"F_")) %>% select(Label)
    endyr      <- max( as.numeric( str_sub(drvquants$Label,str_length(drvquants$Label)-3,str_length(drvquants$Label)) ), na.rm=T )
    
    
   #create the bootstrap data file numbers (pad with leading 0s)
   bootn <- stringr::str_pad(seq(1, n_boot, by = 1), 3, pad = "0")
   
   # Set up each bootstrap run in its own folder, to help with running SS in parallel
   Lt <- vector("list",n_boot)
   for(i in 1:n_boot){
     
     aBootDir <- file.path(boot_dir,paste0("Boot",i))
     dir.create(aBootDir,showWarnings = F)
     
     # Copy original SS files
     file.copy(list.files(basemodel_dir, 
                          pattern = "ss.par|control.ss|starter|forecast|.exe|.par",
                          full.names = T),to = aBootDir)
     
     # Copy the bootstrapped data files
     file.copy(file.path(boot_dir,paste0("data_boot_", bootn[i], ".ss")),to=aBootDir)
     file.remove(file.path(boot_dir,paste0("data_boot_", bootn[i], ".ss")))
     
     # Change Starter file to point to Bootstrap data file
     starter <- SS_readstarter(file =  file.path(basemodel_dir, "starter.ss")) # read starter file
     starter[["datfile"]] <- paste0("data_boot_", bootn[i], ".ss")
     SS_writestarter(starter, dir = aBootDir, overwrite = TRUE)
     
     Lt[[i]] <- append(Lt[[i]], aBootDir)
   }
    
   # Run SS in parallel
   NumCores <- detectCores()
   cl       <- makeCluster(NumCores-2)
   parLapply(cl,Lt,function(x) {
      library(r4ss); r4ss::run(dir = x[[1]], exe = "ss_opt_win.exe", skipfinished = F)
   })
   stopCluster(cl)
   
   # copy output files (might be good to use "file.exists" command first to check if they exist
   for(i in 1:n_boot){
     aBootDir <-file.path(boot_dir,paste0("Boot",i)) 
     file.copy(file.path(aBootDir, "Report.sso"),     paste(boot_dir, "/Report_",     i, ".sso", sep = ""),overwrite=T)
     file.copy(file.path(aBootDir, "CompReport.sso"), paste(boot_dir, "/CompReport_", i, ".sso", sep = ""),overwrite=T)
     file.copy(file.path(aBootDir, "covar.sso"),      paste(boot_dir, "/covar_",      i, ".sso", sep = ""),overwrite=T)
     file.copy(file.path(aBootDir, "warning.sso"),    paste(boot_dir, "/warning_",    i, ".sso", sep = ""),overwrite=T)   
   }    
  
   AgeStr.List <- list()
   for(i in 1:n_boot){
     
     aBootDir    <- file.path(boot_dir,paste0("Boot",i))
     anOutput    <- SS_output(dir=aBootDir)
     anAgeStr    <- data.table(anOutput$natage)
     FinalAgeStr <- anAgeStr[Yr==endyr&anAgeStr$'Beg/Mid'=="B"] %>% select(-(Area:Era))
     AgeStr.List <- append(AgeStr.List,list(FinalAgeStr))
   }
   
   BootAgeStr <- rbindlist(AgeStr.List)
   
   write.table(BootAgeStr,file=file.path(root_dir,"Outputs","Agepro","UkuBootstraps.bsn"),row.names=F,col.names=F)
   

