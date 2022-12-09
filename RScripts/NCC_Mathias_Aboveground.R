#NCC_Mathias_Aboveground
#Created by justin mathias 11/30/22

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "tidyverse", "patchwork"))
theme_set(theme_article(base_size = 13)) #Set ggplot2 theme

#Load in data
agb <- read.xlsx("/Users/justinmathias/Desktop/Working NCC/aboveground_longform_v3.xlsx")

# Start cleaning of spreadsheet -------------------------------------------
##Create UniqueID and separate Lat/Lon----
agb <- agb %>%
  mutate(UniqueID = paste(RecordID, RecordSubID_old, sep = "_")) %>% #First create UniqueID to join later
  sep.coords(LatLon) %>% #First separate Latitude and Longitude
  mutate(Lat = as.numeric(Lat), #Make sure numeric
         Lon = as.numeric(Lon))

##Get all data into numeric format
AGB <- agb %>%
  mutate(
    LiveWoodC_StockData = sep.data(., in_col = LiveWoodC_StockData, return = "Value"),
    FoliageC_StockData = sep.data(., in_col = FoliageC_StockData, return = "Value"),
    TotalLive_StockData = sep.data(., in_col = TotalLive_StockData, return = "Value"),
    PyC_StockData = sep.data(., in_col = PyC_StockData, return = "Value"),
    CWDC_StockData = sep.data(., in_col = CWDC_StockData, return = "Value"),
    FWDC_StockData = sep.data(., in_col = FWDC_StockData, return = "Value"),
    LitterC_StockData = sep.data(., in_col = LitterC_StockData, return = "Value"),
    TotalDead_StockData = sep.data(., in_col = TotalDead_StockData, return = "Value"),
    TotalAboveground_StockData = sep.data(., in_col = TotalAboveground_StockData, return = "Value"),
    TEC_StockData = sep.data(., in_col = TEC_StockData, return = "Value"),
  )

#Units in area basis
unique(agb$LiveC_units_StockData)

#Define which units to include
LiveCarea <- c("Mg_per_hectare", "MgC_per_hectare", "gC_per_m2", "g_per_m2", "kg_per_hectare", "kgC_per_m2",
                 "kgC_per_hectare", "kg_per_m2", "molC_per_m2" )

agb %>% filter(LiveC_units_StockData %in% LiveCarea)


##Clean up units
agb %>%
  mutate()



