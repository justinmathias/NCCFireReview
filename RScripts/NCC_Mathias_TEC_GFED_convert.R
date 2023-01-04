#NCC_Mathias_TEC_GFED
#Created by Justin Mathias 1/4/23

# #Housekeeping: load packages, set themes, etc.
# library("easypackages")
# libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
#             "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "tidyverse", "patchwork"))
# theme_set(theme_article(base_size = 13)) #Set ggplot2 theme

#Load in data
tec <- read.xlsx("/Users/justinmathias/Desktop/Working NCC/TotalEcoC_longform_v3.xlsx")
#biomes <- readOGR("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp") #World biomes from: Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm

# Housekeeping, convert lat/lon, assign columns as numeric, extract values -------------------------------------------
##Create UniqueID and separate Lat/Lon----
tec <- tec %>%
  mutate(UniqueID = paste(RecordID, RecordSubID_old, sep = "_")) %>% #First create UniqueID to join later
  sep.coords(LatLon) %>% #First separate Latitude and Longitude
  mutate(Lat = as.numeric(Lat), #Make sure numeric
         Lon = as.numeric(Lon))


##Add in biomes----
TEC_biomes <- tec %>%
  drop_na(Lat, Lon)

#Create a new dataframe, coords, so we can extract data from AGB_converted
coords <- data.frame(TEC_biomes$Lon, TEC_biomes$Lat)
coords.sp <- SpatialPoints(coords) #Coords need to be LongLat
proj4string(coords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
TEC_biomes <- cbind(TEC_biomes, over(coords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(TEC_biomes)[names(TEC_biomes) == "over(coords.sp, biomes)$BIOME_NAME"] <- "Biome"
tec <- left_join(tec, TEC_biomes) #Join back together

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
tec$Biome_simple <- lookup.table[tec$Biome]

##Get all data into numeric format
TEC <- tec %>%
  mutate( #Convert all values to numeric, removing accompanying standard errors.
    LiveC_Binary_Measurements = as.numeric(LiveC_Binary_Measurements), #Assign as numeric
    SoilDepth_cm_StockData = as.numeric(SoilDepth_cm_StockData), #Assign as numeric
    LiveC_StockData = sep.data(., in_col = LiveC_StockData, return = "Value"), #Convert Stocks to numeric, return only value and remove associated std error
    DeadC_StockData = sep.data(., in_col = DeadC_StockData, return = "Value"),
    TotalSoilC_StockData = sep.data(., in_col = TotalSoilC_StockData, return = "Value"),
    MCB_StockData = sep.data(., in_col = MCB_StockData, return = "Value"),
    RootC_StockData = sep.data(., in_col = RootC_StockData, return = "Value"),
    TotalBelowgroundC_StockData = sep.data(., in_col = TotalBelowgroundC_StockData, return = "Value"),
    TotalAbovegroundC_StockData = sep.data(., in_col = TotalAbovegroundC_StockData, return = "Value"),
    TEC_StockData = sep.data(., in_col = TEC_StockData, return = "Value"),
    NPP_FluxData = sep.data(., in_col = NPP_FluxData, return = "Value"),
    ANPP_FluxData = sep.data(., in_col = ANPP_FluxData, return = "Value"),
    BNPP_FluxData = sep.data(., in_col = BNPP_FluxData, return = "Value"),
    GPP_FluxData = sep.data(., in_col = GPP_FluxData, return = "Value"),
    Sresp_FluxData = sep.data(., in_col = Sresp_FluxData, return = "Value"),
    Ra_FluxData = sep.data(., in_col = Ra_FluxData, return = "Value"),
    Rh_FluxData = sep.data(., in_col = Rh_FluxData, return = "Value"),
    Reco_FluxData = sep.data(., in_col = Reco_FluxData, return = "Value"),
    NEP_FluxData = sep.data(., in_col = NEP_FluxData, return = "Value"),
    NBP_FluxData = sep.data(., in_col = NBP_FluxData, return = "Value"),
    LiveC_EmissionsData = sep.data(., in_col = LiveC_EmissionsData, return = "Value"),
    DeadC_EmissionsData = sep.data(., in_col = DeadC_EmissionsData, return = "Value"),
    TotalAboveC_EmissionsData = sep.data(., in_col = TotalAboveC_EmissionsData, return = "Value"),
    TotalBelowC_EmissionsData = sep.data(., in_col = TotalBelowC_EmissionsData, return = "Value"),
    PyrogenicC_EmissionsData = sep.data(., in_col = PyrogenicC_EmissionsData, return = "Value"),
    TotEmissions_EmissionsData = sep.data(., in_col = TotEmissions_EmissionsData, return = "Value"),
  )

#Identify stocks unique units and define which to include on area basis----
##LiveC----
unique(TEC$LiveC_units_StockData)
LiveCarea <- c(
  "MgC_per_hectare",
  "gC_per_m2",
  "g_per_m2",
  "metric_ton_per_hectare"
)
LiveCareaTmp <- TEC %>%
  filter(LiveC_units_StockData %in% LiveCarea) %>%
  mutate(
    LiveC_StockData_MgC_ha = unlist(pmap(list(LiveC_StockData, LiveC_units_StockData, "Mg / hectare"), convertTreeC)), #Use LiveC units
  )

##DeadC----
unique(TEC$DeadC_units_StockData)
DeadCarea <- c(
  "MgC_per_hectare",
  "gC_per_m2",
  "kgC_per_m2",
  "g_per_m2"
)
DeadCareaTmp <- TEC %>%
  filter(DeadC_units_StockData %in% DeadCarea) %>%
  mutate(
    DeadC_StockData_MgC_ha = unlist(pmap(list(DeadC_StockData, DeadC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
  )

##SoilC----
#Soil C values will be scaled by depth to 0-5 cm
unique(TEC$SoilC_units_StockData)
SoilCarea <- c(
  "MgC_per_hectare",
  "gC_per_m2",
  "kgC_per_m2"
)
TotalSoilCareaTmp <- TEC %>%
  filter(SoilC_units_StockData %in% SoilCarea) %>%
  mutate(
    TotalSoilC_StockData_MgC_ha = unlist(pmap(list(TotalSoilC_StockData, SoilC_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
    TotalSoilC_StockData_MgC_ha_scaled = scale.depth(TotalSoilC_StockData_MgC_ha, SoilDepth_cm_StockData), #Scale based on proportion of C at depth
  )
SoilCmass <- c(
  "gC_per_kg",
  "percent",
  "g_per_kg"
)
TotalSoilCmassTmp <- TEC %>%
  filter(SoilC_units_StockData %in% SoilCmass) %>%
  mutate(
    TotalSoilC_StockData_percent = 100*unlist(pmap(list(TotalSoilC_StockData, SoilC_units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )



##Microbial biomass----
unique(TEC$MCB_units_StockData)
MCBmass <- c(
  "mgC_per_kg"
)
MCBmassTmp <- TEC %>%
  filter(MCB_units_StockData %in% MCBmass) %>%
  mutate(
    MCB_StockData_percent = 100*unlist(pmap(list(MCB_StockData, MCB_units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )

##RootC----
unique(TEC$Roots_units_StockData)
RootCarea <- c(
  "MgC_per_hectare",
  "g_per_m2"
)
RootCareaTmp <- TEC %>%
  filter(Roots_units_StockData %in% RootCarea) %>%
  mutate(
    RootC_StockData_MgC_ha = unlist(pmap(list(RootC_StockData, Roots_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
  )

##Total belowground C----
unique(TEC$TotalBG_units_StockData)
TotalBGarea <- c(
  "gC_per_m2",
  "MgC_per_hectare" ,
  "g_per_m2"
)
TotalBGareaTmp <- TEC %>%
  filter(TotalBG_units_StockData %in% TotalBGarea) %>%
  mutate(
    TotalBelowgroundC_StockData_MgC_ha = unlist(pmap(list(TotalBelowgroundC_StockData, TotalBG_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
  )
TotalBGmass <- c(
  "gC_per_kg"
)
TotalBGmassTmp <- TEC %>%
  filter(TotalBG_units_StockData %in% TotalBGmass) %>%
  mutate(
    TotalBelowgroundC_StockData_percent = 100*unlist(pmap(list(TotalBelowgroundC_StockData, TotalBG_units_StockData, "g / g"), convertTreeC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )

##Total aboveground C----
unique(TEC$TotalAG_units_StockData)
TotalAGarea <- c(
  "gC_per_m2",
  "MgC_per_hectare",
  "g_per_m2",
  "metric_ton_per_hectare"
)
TotalAGareaTmp <- TEC %>%
  filter(TotalAG_units_StockData %in% TotalAGarea) %>%
  mutate(
    TotalAbovegroundC_StockData_MgC_ha = unlist(pmap(list(TotalAbovegroundC_StockData, TotalAG_units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
  )
TotalAGmass <- c(
  "gC_per_kg"
)
TotalAGmassTmp <- TEC %>%
  filter(TotalAG_units_StockData %in% TotalAGmass) %>%
  mutate(
    TotalAbovegroundC_StockData_percent = 100*unlist(pmap(list(TotalAbovegroundC_StockData, TotalAG_units_StockData, "g / g"), convertTreeC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )


##TEC----
unique(TEC$TEC_Units_StockData)
TECarea <- c(
  "MgC_per_hectare",
  "gC_per_m2"
)
TECareaTmp <- TEC %>%
  filter(TEC_Units_StockData %in% TECarea) %>%
  mutate(
    TEC_StockData_MgC_ha = unlist(pmap(list(TEC_StockData, TEC_Units_StockData, "Mg / hectare"), convertTreeC)), #Use DeadC units
  )

##NPP----
unique(TEC$NPP_units_FluxData)
NPParea <- c(
  "gC_per_m2_per_year"
)
NPPCareaTmp <- TEC %>%
  filter(NPP_units_FluxData %in% NPParea) %>%
  mutate(
    NPP_FluxData_g_m2 = unlist(pmap(list(NPP_FluxData, NPP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    NPP_FluxData_g_m2_unit = unlist(pmap(list(NPP_units_FluxData), extractDuration))
  )


##ANPP----
unique(TEC$NPP_units_FluxData)
ANPParea <- c(
  "gC_per_m2_per_year"
)
ANPPCareaTmp <- TEC %>%
  filter(NPP_units_FluxData %in% ANPParea) %>%
  mutate(
    ANPP_FluxData_g_m2 = unlist(pmap(list(ANPP_FluxData, NPP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    ANPP_FluxData_g_m2_unit = unlist(pmap(list(NPP_units_FluxData), extractDuration))
  )

##BNPP----
unique(TEC$NPP_units_FluxData)
BNPParea <- c(
  "gC_per_m2_per_year"
)
BNPPCareaTmp <- TEC %>%
  filter(NPP_units_FluxData %in% BNPParea) %>%
  mutate(
    BNPP_FluxData_g_m2 = unlist(pmap(list(BNPP_FluxData, NPP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    BNPP_FluxData_g_m2_unit = unlist(pmap(list(NPP_units_FluxData), extractDuration))
  )


##GPP----
unique(TEC$GPP_units_FluxData)
GPParea <- c(
  "MgC_per_hectare_per_yr",
  "metric_tonC_per_hectare_per_yr",
  "gC_per_m2_per_mon",
  "gC_per_m2_per_yr",
  "mgCO2_per_m2_per_sec",
  "molC_per_m2_per_yr"
)
GPPCareaTmp <- TEC %>%
  filter(GPP_units_FluxData %in% GPParea) %>%
  mutate(
    GPP_FluxData_g_m2 = unlist(pmap(list(GPP_FluxData, GPP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    GPP_FluxData_g_m2_unit = unlist(pmap(list(GPP_units_FluxData), extractDuration))
  )


##Sresp----
unique(TEC$Resp_units_FluxData)
Resparea <- c(
  "MgC_per_hectare_per_yr",
  "umolCO2_per_m2_per_sec",
  "metric_tonC_per_hectare_per_yr",
  "gC_per_m2_per_yr",
  "gCO2_per_m2_per_hr",
  "mgCO2_per_m2_per_sec",
  "gC_per_m2_per_day",
  "umolCO2_per_m2_per_yr"
)
SrespCareaTmp <- TEC %>%
  filter(Resp_units_FluxData %in% Resparea) %>%
  mutate(
    Sresp_FluxData_g_m2 = unlist(pmap(list(Sresp_FluxData, Resp_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    Sresp_FluxData_g_m2_unit = unlist(pmap(list(Resp_units_FluxData), extractDuration))
  )
##Ra----
RaareaTmp <- TEC %>%
  filter(Resp_units_FluxData %in% Resparea) %>%
  mutate(
    Ra_FluxData_g_m2 = unlist(pmap(list(Ra_FluxData, Resp_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    Ra_FluxData_g_m2_unit = unlist(pmap(list(Resp_units_FluxData), extractDuration))
  )
##Rh----
RhareaTmp <- TEC %>%
  filter(Resp_units_FluxData %in% Resparea) %>%
  mutate(
    Rh_FluxData_g_m2 = unlist(pmap(list(Rh_FluxData, Resp_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    Rh_FluxData_g_m2_unit = unlist(pmap(list(Resp_units_FluxData), extractDuration))
  )
##Reco----
RecoareaTmp <- TEC %>%
  filter(Resp_units_FluxData %in% Resparea) %>%
  mutate(
    Reco_FluxData_g_m2 = unlist(pmap(list(Reco_FluxData, Resp_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    Reco_FluxData_g_m2_unit = unlist(pmap(list(Resp_units_FluxData), extractDuration))
  )

##NEP----
unique(TEC$NEP_units_FluxData)
NEParea <- c(
  "gC_per_m2_per_day",
  "MgC_per_hectare_per_yr",
  "gC_per_m2_per_yr",
  "mgCO2_per_m2_per_sec",
  "metric_tonC_per_hectare_per_yr",
  "MgC_per_km2_per_yr",
  "mgC_per_m2_per_hr",
  "gCO2_per_m2_per_hr",
  "umolCO2_per_m2_per_sec",
  "gC_per_m2_per_sec"
  )
NEPareaTmp <- TEC %>%
  filter(NEP_units_FluxData %in% NEParea) %>%
  mutate(
    NEP_FluxData_g_m2 = unlist(pmap(list(NEP_FluxData, NEP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    NEP_FluxData_g_m2_unit = unlist(pmap(list(NEP_units_FluxData), extractDuration))
  )

##NBP----
NBPareaTmp <- TEC %>%
  filter(NEP_units_FluxData %in% NEParea) %>%
  mutate(
    NBP_FluxData_g_m2 = unlist(pmap(list(NBP_FluxData, NEP_units_FluxData, "g / m2"), convertTreeCflux)), #Use NPP units
    NBP_FluxData_g_m2_unit = unlist(pmap(list(NEP_units_FluxData), extractDuration))
  )

##LiveC emissions----
unique(TEC$EmissionsUnits_EmissionsData)
Emissionsarea <- c(
  "MgC_per_hectare",
  "kgC_per_m2",
  "metric_tonC_per_hectare",
  "gC_per_m2"
)
LiveCemissionsTmp <- TEC %>%
  filter(EmissionsUnits_EmissionsData %in% Emissionsarea) %>%
  mutate(
    LiveC_EmissionsData_g_m2 = unlist(pmap(list(LiveC_EmissionsData, EmissionsUnits_EmissionsData, "g / m2"), convertTreeC)), #Use NPP units
  )
##DeadC emissions----
DeadCemissionsTmp <- TEC %>%
  filter(EmissionsUnits_EmissionsData %in% Emissionsarea) %>%
  mutate(
    DeadC_EmissionsData_g_m2 = unlist(pmap(list(DeadC_EmissionsData, EmissionsUnits_EmissionsData, "g / m2"), convertTreeC)), #Use NPP units
  )
##Total aboveground C emissions----
TotalAboveCemissionsTmp <- TEC %>%
  filter(EmissionsUnits_EmissionsData %in% Emissionsarea) %>%
  mutate(
    TotalAboveC_EmissionsData_g_m2 = unlist(pmap(list(TotalAboveC_EmissionsData, EmissionsUnits_EmissionsData, "g / m2"), convertTreeC)), #Use NPP units
  )
##Total belowground C emissions----
TotalBelowCemissionsTmp <- TEC %>%
  filter(EmissionsUnits_EmissionsData %in% Emissionsarea) %>%
  mutate(
    TotalBelowC_EmissionsData_g_m2 = unlist(pmap(list(TotalBelowC_EmissionsData, EmissionsUnits_EmissionsData, "g / m2"), convertTreeC)), #Use NPP units
  )
##PyrogenicC emissions----
PyrogenicCemissionsTmp <- TEC %>%
  filter(EmissionsUnits_EmissionsData %in% Emissionsarea) %>%
  mutate(
    PyrogenicC_EmissionsData_g_m2 = unlist(pmap(list(PyrogenicC_EmissionsData, EmissionsUnits_EmissionsData, "g / m2"), convertTreeC)), #Use NPP units
  )
##TotEmissions_EmissionsData----
TotemissionsTmp <- TEC %>%
  filter(EmissionsUnits_EmissionsData %in% Emissionsarea) %>%
  mutate(
    TotEmissions_EmissionsData_g_m2 = unlist(pmap(list(TotEmissions_EmissionsData, EmissionsUnits_EmissionsData, "g / m2"), convertTreeC)), #Use NPP units
  )

TEC_converted_final <- list(TEC,
                            LiveCareaTmp,
                            DeadCareaTmp,
                            TotalSoilCareaTmp,
                            TotalSoilCmassTmp,
                            MCBmassTmp,
                            RootCareaTmp,
                            TotalBGareaTmp,
                            TotalBGmassTmp,
                            TotalAGareaTmp,
                            TotalAGmassTmp,
                            TECareaTmp,
                            NPPCareaTmp,
                            ANPPCareaTmp,
                            BNPPCareaTmp,
                            GPPCareaTmp,
                            SrespCareaTmp,
                            RaareaTmp,
                            RhareaTmp,
                            RecoareaTmp,
                            NEPareaTmp,
                            NBPareaTmp,
                            LiveCemissionsTmp,
                            DeadCemissionsTmp,
                            TotalAboveCemissionsTmp,
                            TotalBelowCemissionsTmp,
                            PyrogenicCemissionsTmp,
                            TotemissionsTmp) %>%
  reduce(left_join)

setwd("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/Converted files")
write.csv(TEC_converted_final, "TECConverted_GFED.csv")





