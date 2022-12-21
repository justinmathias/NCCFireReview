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
    LiveWoodC_StockData = sep.data(., in_col = LiveWoodC_StockData, return = "Value"), #Convert Stocks to numeric, return only value and remove associated std error
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

#Identify stocks unique units and define which to include on area basis
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
LiveCareaTmp <- AGB %>%
  filter(LiveC_units_StockData %in% LiveCarea) %>%
  mutate(
    LiveWoodC_StockData_MgC_ha = unlist(pmap(list(LiveWoodC_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
    FoliageC_StockData_MgC_ha = unlist(pmap(list(FoliageC_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
    TotalLive_StockData_MgC_ha = unlist(pmap(list(TotalLive_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
    TotalAboveground_StockData_MgC_ha = unlist(pmap(list(TotalAboveground_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
  )

PyCareaTmp <- AGB %>%
  filter(PyC_units_StockData %in% PyCarea) %>%
  mutate(PyC_StockData_MgC_ha = unlist(pmap(list(PyC_StockData, PyC_units_StockData, "Mg / hectare"), convertTreeC)), #Use PyC units
  )

DeadCareaTmp <- AGB %>%
  filter(DeadC_units_StockData %in% DeadCarea) %>%
  mutate(
    CWDC_StockData_MgC_ha = unlist(pmap(list(CWDC_StockData, DeadC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
    FWDC_StockData_MgC_ha = unlist(pmap(list(FWDC_StockData, DeadC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
    TotalDead_StockData_MgC_ha = unlist(pmap(list(TotalDead_StockData, DeadC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
  )

LitterCareaTmp <- AGB %>%
  filter(LitterC_units_StockData %in% LitterCarea) %>%
  mutate(
    LitterC_StockData_MgC_ha = unlist(pmap(list(LitterC_StockData, LitterC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LitterC units
  )

TECareaTmp <- AGB %>%
  filter(TEC_units_StockData %in% TECarea) %>%
  mutate(
    TEC_StockData_MgC_ha = unlist(pmap(list(TEC_StockData, TEC_units_StockData, "Mg / hectare"), convertTreeC)), #Use TEC units
  )



# Mass basis calculations -------------------------------------------------
#Identify unique units and define which to include on mass basis
unique(AGB$LiveC_units_StockData)
LiveCmass <- c("gC_per_kg", "percent")

unique(AGB$LitterC_units_StockData)
LitterCmass <- c("percent")

#LiveC and LitterC have percent. Don't forget to merge them

#Create new dataframe subsets for conversions to join back later
#There's definitely a better way to do this, but this will work for now  ¯\_(ツ)_/¯
LiveCmassTmp <- AGB %>%
  filter(LiveC_units_StockData %in% LiveCmass) %>%
  mutate(
    LiveWoodC_StockData_percent = 100*unlist(pmap(list(LiveWoodC_StockData, LiveC_units_StockData, "g / g"), convertTreeC)), #Use LiveC units
    FoliageC_StockData_percent = 100*unlist(pmap(list(FoliageC_StockData, LiveC_units_StockData, "g / g"), convertTreeC)), #Use LiveC units
    TotalLive_StockData_percent = 100*unlist(pmap(list(TotalLive_StockData, LiveC_units_StockData, "g / g"), convertTreeC)), #Use LiveC units
    TotalAboveground_StockData_percent = 100*unlist(pmap(list(TotalAboveground_StockData, LiveC_units_StockData, "g / g"), convertTreeC)), #Use LiveC units
  )

LitterCmassTmp <- AGB %>%
  filter(LitterC_units_StockData %in% LitterCmass) %>%
  mutate(
    LitterC_StockData_percent = 100*unlist(pmap(list(LitterC_StockData, LitterC_units_StockData, "g / g"), convertTreeC)) #Use LitterC units
  )

#Combine it all!
AGB_converted <- list(AGB, LiveCareaTmp, PyCareaTmp, DeadCareaTmp, LitterCareaTmp, TECareaTmp, LiveCmassTmp, LitterCmassTmp) %>% reduce(left_join)


# Now add biomes ----------------------------------------------------------
##Read in biomes shapefile
biomes <- readOGR("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp") #World biomes from: Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm

AGB_converted <- AGB_converted %>%
  mutate(UniqueID = paste(RecordID, RecordSubID_new, sep = "_")) #First create UniqueID to join later

AGB_Converted <- AGB_converted %>%
  drop_na(Lat, Lon)


#Create a new dataframe, coords, so we can extract data from AGB_converted
coords <- data.frame(AGB_Converted$Lon, AGB_Converted$Lat)
coords.sp <- SpatialPoints(coords) #Coords need to be LongLat
proj4string(coords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
AGB_Converted <- cbind(AGB_Converted, over(coords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(AGB_Converted)[names(AGB_Converted) == "over(coords.sp, biomes)$BIOME_NAME"] <- "Biome"

#Merge back together
AGB_converted <- left_join(AGB_converted, AGB_Converted)

#Create lookuptable
lookup.table <- c("Tropical & Subtropical Moist Broadleaf Forests" = "TropicalForest",
"Tropical & Subtropical Dry Broadleaf Forests" = "TropicalForest",
"Tropical & Subtropical Coniferous Forests" = "TropicalForest",
'Temperate Broadleaf & Mixed Forests' = "TemperateForest",
"Temperate Conifer Forests" = "TemperateForest",
"Boreal Forests/Taiga" = "AlpineBorealForest",
"Tropical & Subtropical Grasslands, Savannas & Shrublands" = "TropicalGrassland",
"Temperate Grasslands, Savannas & Shrublands" = "TemperateGrassland",
"Flooded Grasslands & Savannas" = "FloodedGrassland",
"Montane Grasslands & Shrublands" = "AlpineBorealForest",
"Tundra" = "AlpineBorealForest",
"Mediterranean Forests, Woodlands & Scrub" = "Mediterranean",
"Deserts & Xeric Shrublands" = "Desert")

AGB_converted$Biome_simple <- lookup.table[AGB_converted$Biome]



# #Standardize fluxes -----------------------------------------------------

#Identify fluxes unique units and define which to include on area basis
unique(AGB_converted$ANPP_units_FluxData)
ANPPCarea <- c("MgC_per_hectare_per_yr", "g_per_m2_per_yr","Mg_per_hectare_per_yr","gC_per_m2_per_yr")

unique(AGB_converted$GPP_units_FluxData)
GPPCarea <- c("gC_per_m2_per_yr", "gC_per_m2_per_day",  "gC_per_m2_per_mon", "umolCO2_per_m2_per_sec")

unique(AGB_converted$NPP_units_FluxData)
NPPCarea <- c("gC_per_m2_per_yr", "Mg_per_hectare_per_yr")

unique(AGB_converted$NEP_units_FluxData)
NEPCarea <- c("umolCO2_per_m2_per_sec", "gC_per_m2_per_yr", "gC_per_m2_per_day", "molC_per_m2_per_yr")

unique(AGB_converted$Reco_units_FluxData)
RecoCarea <- c("umolCO2_per_m2_per_sec", "gC_per_m2_per_day", "gC_per_m2_per_yr")

unique(AGB_converted$Photosynthesis_units_FluxData)
PhotosynthesisCarea <- c("umolCO2_per_m2_per_sec")

#Create new dataframe subsets for conversions to join back later
#There's definitely a better way to do this, but this will work for now  ¯\_(ツ)_/¯
ANPPCareaTmp <- AGB_converted %>%
  filter(ANPP_units_FluxData %in% ANPPCarea) %>%
  mutate(
    ANPP_FluxData_g_m2 = unlist(pmap(list(ANPP_FluxData, ANPP_units_FluxData, "g / m2"), convertTreeCflux)), #Use ANPP units
    ANPP_FluxData_g_m2_unit = unlist(pmap(list(ANPP_units_FluxData), extractDuration))
  )

GPPCareaTmp <- AGB_converted %>%
  filter(GPP_units_FluxData %in% GPPCarea) %>%
  mutate(
    GPP_FluxData_g_m2 = unlist(pmap(list(GPP_FluxData, GPP_units_FluxData, "g / m2"), convertTreeCflux)), #Use GPP units
    GPP_FluxData_g_m2_unit = unlist(pmap(list(GPP_units_FluxData), extractDuration))
  )

NPPCareaTmp <- AGB_converted %>%
  filter(NPP_units_FluxData %in% NPPCarea) %>%
  mutate(
    NPP_FluxData_g_m2 = unlist(pmap(list(NPP_FluxData, NPP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    NPP_FluxData_g_m2_unit = unlist(pmap(list(NPP_units_FluxData), extractDuration))
  )

NEPCareaTmp <- AGB_converted %>%
  filter(NEP_units_FluxData %in% NEPCarea) %>%
  mutate(
    NEP_FluxData_g_m2 = unlist(pmap(list(NEP_FluxData, NEP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NEP units
    NEP_FluxData_g_m2_unit = unlist(pmap(list(NEP_units_FluxData), extractDuration))
  )

RecoCareaTmp <- AGB_converted %>%
  filter(Reco_units_FluxData %in% RecoCarea) %>%
  mutate(
    Reco_FluxData_g_m2 = unlist(pmap(list(Reco_FluxData, Reco_units_FluxData, "g / m2"), convertTreeCflux)), #Use Reco units
    Reco_FluxData_g_m2_unit = unlist(pmap(list(Reco_units_FluxData), extractDuration))
  )

PhotosynthesisCareaTmp <- AGB_converted %>%
  filter(Photosynthesis_units_FluxData %in% PhotosynthesisCarea) %>%
  mutate(
    Photosynthesis_FluxData_g_m2 = unlist(pmap(list(Photosynthesis_num_FluxData, Photosynthesis_units_FluxData, "g / m2"), convertTreeCflux)), #Use Photosynthesis units
    Photosynthesis_FluxData_g_m2_unit = unlist(pmap(list(Photosynthesis_units_FluxData), extractDuration))
  )


AGB_converted_final <- list(AGB_converted, ANPPCareaTmp, GPPCareaTmp, NPPCareaTmp, NEPCareaTmp, RecoCareaTmp, PhotosynthesisCareaTmp) %>% reduce(left_join)


setwd("/Users/justinmathias/Desktop/Working NCC")
write.xlsx(AGB_converted_final, "AbovegroundConverted.xlsx")









