### Running R0 Profile:
## 1. Make a folder called R0_Prof
## 2. Inside put the complete model into a folder called orig.
## 3. in the control file set the phase for the R0 parameter to -1
## 4. in the starter file make sure the option to use the par file is 1
## 5. update the working directories in run_R0_parallel.R and plot_r0_profile.r
## 6. at the end of this file, ensure the location of plot_r0_profile.r is correct
## 7. in the R0_Prof folder, make a folder call 00_mle, put the files from orig into 00_mle




rm(list=ls()); library('foreach');library('doSNOW');library(this.path)

root_dir<-this.path::here(..=2)
basewd <- getwd()
#setwd("C:\\Users\\Marc.Nadon\\Documents\\Work docs\\01_Projects\\002_Uku assessment\\0_R_Uku\\SS3\\100_Profiles\\R0_Prof")
setwd(file.path(root_dir,"01_SS final/100_Profiles/R0_Prof"))

parm.min <- 3.7
parm.max <- 5.0
parm.step <- 0.1
parmstr.parfile <- '# SR_parm\\[1]:' # Note that you need to add double backslash for escape character for grep
parfile <- 'ss.par'
ssdir.orig <- 'orig'

numcpus <- 12
runss.str <- 'ss_opt_win.exe -nohess -nox' # Uncomment for Windows
origwd <- getwd()

parm.vec <- seq(parm.min, parm.max, parm.step)
#parm.vec <- c(3.5,3.6,3.7,3.75,3.80,3.85,3.90,3.95,4,4.05,4.1,4.14,4.20,4.3,4.4,4.5)
numdir <- length(parm.vec)

for (ii in 1:numdir) {
	dir.name <- paste(sprintf('%02d',ii),sprintf('%.2f',parm.vec[ii]),sep='_')
  system(paste('xcopy ', ssdir.orig, ' ', dir.name, '\\* ', '/E', sep='')) # Uncomment for Windows
	
	parfile.infile <- paste(dir.name,'/',parfile, sep='')
	conn <- file(parfile.infile, open='r')
	parfile.intxt <- readLines(conn)
	close(conn)
	parfile.outtxt <- parfile.intxt
	wantedline <- grep(parmstr.parfile,parfile.intxt)
	parfile.outtxt[wantedline+1] <-  parm.vec[ii]
	conn <- file(parfile.infile, open='w')
	writeLines(parfile.outtxt, conn)
	close(conn)	
}

 cl<-makeCluster(numcpus) # Uncomment for Windows
 registerDoSNOW(cl) # Uncomment for Windows

foreach(ii=1:numdir) %dopar% {
	dir.name <- paste(sprintf('%02d',ii),sprintf('%.2f',parm.vec[ii]),sep='_')
	setwd(paste(origwd,'/',dir.name,sep=''))
	print(paste(origwd,'/',dir.name,sep=''))
	system(runss.str)
	setwd(origwd)
}
	
stopCluster(cl) # Uncomment for Windows
setwd(origwd) 
#source('C:\\Users\\Marc.Nadon\\Documents\\Work docs\\01_Projects\\002_Uku assessment\\0_R_Uku\\Scripts\\Processing\\plot_r0_profile.r')
source(file.path(root_dir,"Scripts","02_SS scripts","plot_r0_profile.r"))

setwd(basewd)
