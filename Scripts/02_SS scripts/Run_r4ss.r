# Run r4ss
#library(devtools)
#install_github("r4ss/r4ss", ref="development")

library(r4ss); library(this.path)
root_dir <- here(..=2 )

replist <- SS_output(dir = "01_SS final/01_Base", verbose=TRUE, printstats=TRUE)
replist <- SS_output(dir = file.path(root_dir,"01_SS final","09_CellCorrected"), verbose=TRUE, printstats=TRUE)

#SS_plots(replist, datplot=TRUE,pdf=TRUE,png=FALSE,  uncertainty=TRUE,pwidth=9, pheight=9, rows=2, cols=2, text=TRUE)
SS_plots(replist,uncertainty=TRUE,png=TRUE)





#===========Run profile on R0======================================
R0.range    <- seq(3.8,5,by=0.1)
dir_profile <- file.path(root_dir,"01_SS final","00_Test")

# run profile in parallel
ncores <- parallelly::availableCores(omit = 1)
future::plan(future::multisession, workers = ncores)
prof.table <- profile(
  dir = dir_profile,
  oldctlfile = "control.ss",
  newctlfile = "control_modified.ss",
  string = "SR_LN(R0)", # subset of parameter label
  profilevec = R0.range, exe="ss_opt_win",
  usepar=F,parstring = "# SR_parm[1]:",
  extras="-nohess -nox")
future::plan(future::sequential)

# read the output files (with names like Report1.sso, Report2.sso, etc.)
profilemodels <- SSgetoutput(dirvec = dir_profile, keyvec = 1:length(R0.range))

# Add model with the profile parameter estimated
MLEmodel               <- SS_output(dir_profile, verbose = FALSE, printstats = FALSE)
profilemodels[["MLE"]] <- MLEmodel
profilesummary         <- SSsummarize(profilemodels)

# plot profile using summary created above
results <- SSplotProfile(profilesummary, # summary object
                         profile.string = "R0", # substring of profile parameter
                         profile.label = "Stock-recruit steepness (h)") 


