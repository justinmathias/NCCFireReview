#####################Created on 9/26/2022 by Justin Mathias#####################
##This script will document

#First, load all packages
library("easypackages")
libraries(c("tidyverse", "googlesheets4", "openxlsx", "measurements"))

#Read files, starting with row three, where actual
belowground <- read.xlsx("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/LitSearch_Revised_Final_DataExtration_V1.xlsx",
                         sheet = "Belowground",
                         startRow = 3)

