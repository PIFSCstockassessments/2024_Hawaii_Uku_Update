#rm(list=ls())

library(r4ss)
library(colorRamps)
library(viridis)
library(this.path)

root_dir <- this.path::here(..=2)

setwd(file.path(root_dir,"01_SS final","100_Profiles","R0_Prof"))

### Functions ####

##################

showplot_yn <- F
pdf_yn <- T
png_yn <- T
csv_yn <- T
mainfolder <- './'
pdf.filename <- paste('r0profile',format(Sys.time(), "%Y%m%d_%H%M.pdf"),sep='_')
png.filename <- paste('r0profile',format(Sys.time(), "%Y%m%d_%H%M"),sep='_')
csv.filename <- paste('r0profile',format(Sys.time(), "%Y%m%d_%H%M.csv"),sep='_')

#mainlike_components <- c('TOTAL','Survey','Length_comp','Age_comp','SizeFreq','Recruitment')
mainlike_components <- c('TOTAL','Catch','Survey','SizeFreq','Recruitment')
#fleetlike_components <- c('Surv_like','Length_like','SizeFreq_like:_1','SizeFreq_like:_2','SizeFreq_like:_3','Age_like')
#fleetlike_components_labels <- c('survey likelihood','2 cm bin likelihood', '7 cm bin likelihood','2 cm bin - Age-0 likelihood', '7 cm bin - Age-0 likelihood','Cond-Age-at-len likelihood')
fleetlike_components <- c('Surv_like','SizeFreq_like:_1','Catch_like')
fleetlike_components_labels <- c('index likelihood','SizeFreq likelihood','Catch likelihood')
ssdirpattern <- '^[0-9]{2}'
profile.string <- 'R0'
profile.label <- expression(log(italic(R)[0]))

setwd(mainfolder)
dirvec <- dir(pattern=ssdirpattern)
SSreps <- SSgetoutput(dirvec=dirvec,getcovar=F,forecast=FALSE)
summaryoutput <- SSsummarize(SSreps[c(1,3:15)])
lbf  <- summaryoutput$likelihoods_by_fleet
FleetNames <- summaryoutput$FleetNames[[1]]


sizefreqlike_component <- (grep('Survey',fleetlike_components))
if (length(sizefreqlike_component) > 0) {
	for (ii in 1:length(sizefreqlike_component)) {
		sizefreqlike_label <- fleetlike_components[sizefreqlike_component[ii]]
		sizefreqlambda_label <-  sub('like','lambda',sizefreqlike_label)
		
		sizefreqlambda <- summaryoutput$likelihoods_by_fleet[summaryoutput$likelihoods_by_fleet$Label == sizefreqlambda_label, 4:ncol(summaryoutput$likelihoods_by_fleet)]
		sizefreqlike <- summaryoutput$likelihoods_by_fleet[summaryoutput$likelihoods_by_fleet$Label == sizefreqlike_label, 4:ncol(summaryoutput$likelihoods_by_fleet)] * sizefreqlambda 
		summaryoutput$likelihoods_by_fleet[summaryoutput$likelihoods_by_fleet$Label == sizefreqlike_label, names(summaryoutput$likelihoods_by_fleet)=='ALL'] <- rowSums(sizefreqlike, na.rm=T)
	}
}		
		
plotstuff <- function(){
	SSplotProfile(summaryoutput,plot=T,print=F,profile.string='R0',profile.label=expression(log(italic(R)[0])),components=mainlike_components,component.labels=mainlike_components,col=c('black',viridis(length(mainlike_components)-1)),legendloc='top')
	for (ii in 1:length(fleetlike_components)) { 
		minlike_byfleet <- apply(as.matrix(lbf[(which(lbf$Label %in% fleetlike_components[ii])), colnames(lbf) %in% FleetNames]),2,min)
		maxlike_byfleet <- apply(as.matrix(lbf[(which(lbf$Label %in% fleetlike_components[ii])), colnames(lbf) %in% FleetNames]),2,max)
		difflike_byfleet <- maxlike_byfleet - minlike_byfleet 
		lambdas_byfleet <- colMeans(as.matrix(lbf[(which(lbf$Label %in% fleetlike_components[ii]))-1, colnames(lbf) %in% FleetNames]))
		wantedFleets <-  which(lambdas_byfleet > 0)
		ymax <- 1.3*max(difflike_byfleet[wantedFleets])
		PinerPlot(summaryoutput,plot=T,print=F,profile.string='R0',component=fleetlike_components[ii],fleets=wantedFleets,col=c('black',viridis(length(wantedFleets))),main=paste('Changes in',fleetlike_components_labels[ii],'by fleet'),ymax=ymax,legendloc='top', minfraction = 0.001)
	}
}

printstuff <- function() {
	like.table <- list()
	like.table[[1]] <- SSplotProfile(summaryoutput,plot=F,print=F,profile.string='R0',components=mainlike_components,component.labels=mainlike_components)
	for (ii in 1:length(fleetlike_components)) { 
		like.table[[ii+1]] <- PinerPlot(summaryoutput,plot=F,print=F,profile.string='R0',component=fleetlike_components[ii])
	}
	return(like.table)
}

if (showplot_yn) plotstuff()

if (pdf_yn) {
	pdf(file=pdf.filename)
	plotstuff()
	dev.off()
}

if (png_yn) {
	png(file=paste(png.filename,'_%d.png',sep=''))
	plotstuff()
	dev.off()
}
if (csv_yn) {
	out <- printstuff()
	write.table(out, file=csv.filename, sep=',', row.names=F)
} 



