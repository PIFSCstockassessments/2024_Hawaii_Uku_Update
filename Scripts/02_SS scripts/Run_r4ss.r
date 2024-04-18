# Run r4ss
#library(devtools)
#install_github("r4ss/r4ss", ref="development")


library(r4ss); library(this.path); root_dir <- here(..=2 )


replist <- SS_output(dir = "01_SS final/01_base", verbose=TRUE, printstats=TRUE)
replist <- SS_output(dir = file.path(root_dir,"01_SS final","08_Cleanedup_InitEquilOn - HighCV"), verbose=TRUE, printstats=TRUE)


#SS_plots(replist, datplot=TRUE,pdf=TRUE,png=FALSE,  uncertainty=TRUE,pwidth=9, pheight=9, rows=2, cols=2, text=TRUE)
SS_plots(replist,uncertainty=TRUE,png=TRUE)





