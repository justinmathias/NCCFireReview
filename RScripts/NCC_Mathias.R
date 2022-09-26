#####################Created on 9/26/2022 by Justin Mathias#####################
##This script will serve as a central hub for commonly utilized functions for ##
##the NCC Fire Review.

#First, load all packages
library("easypackages")
libraries(c("tidyverse", "googlesheets4", "openxlsx"))

#Read files
savedrecs <- read.xlsx("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/LitSearch_Revised_Final_DataExtration_V1.xlsx", sheet = "savedrecs")
include <- read.xlsx("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/LitSearch_Revised_Final_DataExtration_V1.xlsx", sheet = "Include")
belowground <- read.xlsx("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/LitSearch_Revised_Final_DataExtration_V1.xlsx", sheet = "Belowground")

#Check out belowground structure
belowground %>% head()
