library(FishLife)

vignette("tutorial","FishLife")

#devtools::install_github("james-thorson/FishLife")
Predict = Plot_taxa( Search_species(Genus="Aprion",Species="virescens")$match_taxonomy, mfrow=c(2,2) )

Predict[[1]]$Mean_pred


Predict[[1]]$Cov_pred


