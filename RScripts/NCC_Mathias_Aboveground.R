#NCC_Mathias_Aboveground
#Created by justin mathias 11/30/22

# Notes -------------------------------------------------------------------
#Record 597 kgPyC converted to kgC


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
  mutate( #Convert all values to numeric, removing accompanying standard errors.
    LiveWoodC_StockData = sep.data(., in_col = LiveWoodC_StockData, return = "Value"), #Convert Stocks to numeric
    FoliageC_StockData = sep.data(., in_col = FoliageC_StockData, return = "Value"),
    TotalLive_StockData = sep.data(., in_col = TotalLive_StockData, return = "Value"),
    PyC_StockData = sep.data(., in_col = PyC_StockData, return = "Value"),
    CWDC_StockData = sep.data(., in_col = CWDC_StockData, return = "Value"),
    FWDC_StockData = sep.data(., in_col = FWDC_StockData, return = "Value"),
    LitterC_StockData = sep.data(., in_col = LitterC_StockData, return = "Value"),
    TotalDead_StockData = sep.data(., in_col = TotalDead_StockData, return = "Value"),
    TotalAboveground_StockData = sep.data(., in_col = TotalAboveground_StockData, return = "Value"),
    TEC_StockData = sep.data(., in_col = TEC_StockData, return = "Value"),
    ANPP_FluxData = sep.data(., in_col = ANPP_FluxData, return = "Value"), #Convert Fluxes to numeric
    GPP_FluxData = sep.data(., in_col = GPP_FluxData, return = "Value"),
    Ra_FluxData = sep.data(., in_col = Ra_FluxData, return = "Value"),
    NPP_FluxData = sep.data(., in_col = NPP_FluxData, return = "Value"),
    NEP_FluxData = sep.data(., in_col = NEP_FluxData, return = "Value"),
    Reco_FluxData = sep.data(., in_col = Reco_FluxData, return = "Value"),
    Photosynthesis_num_FluxData = sep.data(., in_col = Photosynthesis_num_FluxData, return = "Value"),
    LiveC_Emissions = sep.data(., in_col = LiveC_Emissions, return = "Value"), #Convert emissions to numeric
    DeadC_Emissions = sep.data(., in_col = DeadC_Emissions, return = "Value"),
    ForestFloor_Emissions = sep.data(., in_col = ForestFloor_Emissions, return = "Value"),
    LeafLitter_Emissions = sep.data(., in_col = LeafLitter_Emissions, return = "Value"),
    TotalAbovegroundC_Emissions = sep.data(., in_col = TotalAbovegroundC_Emissions, return = "Value"),
  )

#Identify unique units and define which to include on area basis
unique(AGB$LiveC_units_StockData)
LiveCarea <- c("Mg_per_hectare", "MgC_per_hectare", "gC_per_m2", "g_per_m2", "kg_per_hectare",
               "kgC_per_m2", "kgC_per_hectare", "kg_per_m2", "molC_per_m2")

unique(AGB$PyC_units_StockData)
PyCarea <- c("MgC_per_hectare", "g_per_m2", "Mg_per_hectare", "metric_ton_per_hectare", "kgC_per_hectare")

unique(AGB$DeadC_units_StockData)
DeadCarea <- c("Mg_per_hectare", "MgC_per_hectare", "kg_per_hectare", "g_per_m2", "gC_per_m2", "kgC_per_m2", "kg_per_m2")

unique(AGB$LitterC_units_StockData)
LitterCarea <- c("g_per_m2", "gC_per_m2", "MgC_per_hectare", "kgC_per_hectare", "kg_per_m2")

unique(AGB$TEC_units_StockData)
TECarea <- c("MgC_per_hectare", "kgC_per_m2", "Mg_per_hectare", "molC_per_m2")

#Create new dataframe subsets for conversions to join back later
#There's definitely a better way to do this, but this will work for now  ¯\_(ツ)_/¯
LiveCtmp <- AGB %>%
  filter(LiveC_units_StockData %in% LiveCarea) %>%
  mutate(
    LiveWoodC_StockData_MgC_ha = unlist(pmap(list(LiveWoodC_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
    FoliageC_StockData_MgC_ha = unlist(pmap(list(FoliageC_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
    TotalLive_StockData_MgC_ha = unlist(pmap(list(TotalLive_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
    TotalAboveground_StockData_MgC_ha = unlist(pmap(list(TotalAboveground_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
  )

PyCtmp <- AGB %>%
  filter(PyC_units_StockData %in% PyCarea) %>%
  mutate(PyC_StockData_MgC_ha = unlist(pmap(list(PyC_StockData, PyC_units_StockData, "Mg / hectare"), convertTreeC)), #Use PyC units
  )


DeadCtmp <- AGB %>%
  filter(DeadC_units_StockData %in% DeadCarea) %>%
  mutate(
    CWDC_StockData_MgC_ha = unlist(pmap(list(CWDC_StockData, DeadC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
    FWDC_StockData_MgC_ha = unlist(pmap(list(FWDC_StockData, DeadC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
    TotalDead_StockData_MgC_ha = unlist(pmap(list(TotalDead_StockData, DeadC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
  )

LitterCtmp <- AGB %>%
  filter(LitterC_units_StockData %in% LitterCarea) %>%
  mutate(
    LitterC_StockData_MgC_ha = unlist(pmap(list(LitterC_StockData, LitterC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LitterC units
  )

TECtmp <- AGB %>%
  filter(TEC_units_StockData %in% TECarea) %>%
  mutate(
    TEC_StockData_MgC_ha = unlist(pmap(list(TEC_StockData, TEC_units_StockData, "Mg / hectare"), convertTreeC)), #Use TEC units
  )

#Combine it all!
AGB_converted <- list(AGB, LiveCtmp, PyCtmp, DeadCtmp, LitterCtmp, TECtmp) %>% reduce(left_join)

#setwd("/Users/justinmathias/Desktop/Working NCC")
write.xlsx(AGB_converted, "AbovegroundConverted.xlsx")









