#NCC_Mathias_Belowground
#Created by justin mathias 11/28/22

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "tidyverse", "patchwork"))
theme_set(theme_article(base_size = 13)) #Set ggplot2 theme

#Read files, starting with row three on belowground sheet, where actual column headers are ------------------------------------------------------
#Run this chunk of code to get biomes. We need to do it this way because we don't have a lat/lon for every case
{belowground <- read.xlsx("/Users/justinmathias/Desktop/Working NCC/belowground_longform_v3.xlsx")

##Read in biomes shapefile----
# biomes <- readOGR("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp") #World biomes from: Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm

##Append biome to each observation given lat/lon
belowground <- belowground %>%
  mutate(UniqueID = paste(RecordID, RecordSubID_new, sep = "_")) #First create UniqueID to join later

Belowground <- belowground %>%
  drop_na(LatLon) %>% sep.coords(LatLon) #Separate Latitude and Longitude

#Create a new dataframe, coords, so we can extract data from belowground
coords <- data.frame(Belowground$Lon, Belowground$Lat)
coords.sp <- SpatialPoints(coords) #Coords need to be LongLat
proj4string(coords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
Belowground <- cbind(Belowground, over(coords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(Belowground)[names(Belowground) == "over(coords.sp, biomes)$BIOME_NAME"] <- "Biome"

belowground <- left_join(belowground, Belowground)

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

belowground$Biome_simple <- lookup.table[belowground$Biome]
}


#Working with soil C data for scaling by depth ------------------------------------------------------
##Fetch and wrangle soil C data from soilgrids.org----
# soils <- belowground %>% mutate(UniqueID = paste(RecordID, RecordSubID, sep = "_")) %>%  #Create UniqueID for records
#   drop_na(LatLon) %>% #Drop NA values
#   sep.coords(LatLon) %>% #Create columns for Lat and Lon
#   group_by(UniqueID) %>% #Group by UniqueID to remove duplicate rows
#   filter(row_number() == 1) #Remove duplicate ID rows
#
# soilsFetched <-  try(fetchSoilGrids(data.frame(id = soils$UniqueID, #Download soils data for each lat/lon
#                                                lat = soils$Lat,
#                                                lon = soils$Lon), progress = TRUE))
# soilsData <- soilsFetched@horizons #Extract soils data from SoilProfileCollection
#
# #Wrangle soils data into format appropriate to scale C with depth
# soilsFinal <- soilsData %>% mutate(soilOrgC_MgC_per_ha = calc_soilC(bdodmean, socmean, hzdept, hzdepb), #Calculate C content for each soil layer by area
#                                    soilOrgC_MgC_per_ha_per_cmdepth = soilOrgC_MgC_per_ha/(hzdepb - hzdept)) %>%  #Standardize by depth profile
#   group_by(id) %>% #Group by ID to create sums within groups.
#   mutate(TotalC = sum(soilOrgC_MgC_per_ha), #Get sum of soilOrgC for proportion
#          TotalC_depth = sum(soilOrgC_MgC_per_ha_per_cmdepth)) %>% #Get sum of soilOrgC for proportion
#   ungroup() %>%
#   select(label, id, hzdept, soilOrgC_MgC_per_ha, soilOrgC_MgC_per_ha_per_cmdepth, TotalC, TotalC_depth) %>% #Select only columns of interest
#   mutate(PropC_depth = soilOrgC_MgC_per_ha_per_cmdepth/TotalC_depth) #Calculate proportion of C in each depth layer

#Import soil C data retrieved from soilgrids.org
soilsFinal <- read.xlsx("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/soilsFinal.xlsx")

##Create dataframe containing UniqueIDs and Lat/Lon to retrieve biome information----
soilsLocations <- belowground %>%
  mutate(UniqueID = paste(RecordID, RecordSubID_old, sep = "_")) %>% #OVERWRITE UNIQUEID HERE FOR SOILS CARBON
  dplyr::select(UniqueID, Lat, Lon, Biome_simple)

#Join dataframes to get locations for soilC
soilsCarbon <- left_join(soilsFinal, soilsLocations)

##Fit three parameter asymptotic regression model to soilC data----
#Create a lookup table to replace depth labels with values
depth.lookup <- c("0-5" = 2.5,
                  "5-15" = 10,
                  "15-30" = 22.5,
                  "30-60" = 45,
                  "60-100" = 80,
                  "100-200" = 150)
soilsCarbon$LabelDepth <- depth.lookup[soilsCarbon$label]

soilDat <- soilsCarbon %>% group_by(LabelDepth) %>%
  summarise(PropC_depth = mean(PropC_depth, na.rm = T)) %>%
  mutate(PropC_depth_cumu = cumsum(PropC_depth))

soilCmod <- drm(PropC_depth_cumu ~ LabelDepth, data = soilDat, fct = AR.3())
summary(soilCmod)

##Figure for soilC by depth----
inset <- soilsCarbon %>%
  ggplot(aes(x = LabelDepth, y = PropC_depth)) +
  geom_point(alpha = 0.05) +
  stat_smooth(method = "gam", formula = y ~ s(x, k = 6), linewidth = 0.7) +
  coord_flip() +
  xlim(c(150,0)) +
  theme(legend.position = "none",
        axis.text = element_text(color = "black", size = 8),
        axis.title = element_text(size = 9)) +
  xlab("Soil Depth (cm)") +
  ylab("Non-Cumulative")

#Create new data for smoother line
main <- soilDat %>% #Rename figure later
  ggplot(aes(x = LabelDepth, y = PropC_depth_cumu)) +
  geom_point(size = 2) +
  geom_line(aes(y = predict(soilCmod)), color = "forestgreen", size = 0.8) +
  theme(legend.position = "none",
        axis.text = element_text(color = "black")) +
  xlab("Soil Depth (cm)") +
  ylab("Cumulative Proportion \n of Soil Carbon") +
  coord_flip() +
  xlim(c(150,0))
main + inset_element(inset, 0.025, 0.025, 0.625, 0.675)
ggsave("SoilPlot.jpg", units = c("in"), width = 3.9, height = 3.25, dpi = 300)


#Begin analysis----
#Get all data into numeric format----
blg <- belowground %>%
  mutate(
    SoilC1_Depth_cm_StockData = as.numeric(SoilC1_Depth_cm_StockData), #Assign soil depths as numeric
    SoilC2_Depth_cm_StockData = as.numeric(SoilC2_Depth_cm_StockData),
    SoilC3_Depth_cm_StockData = as.numeric(SoilC3_Depth_cm_StockData),
    SoilC1_StockData = sep.data(., in_col = SoilC1_StockData, return = "Value"), #Convert Stocks to numeric, return only value and remove associated std error
    SoilC2_StockData = sep.data(., in_col = SoilC2_StockData, return = "Value"),
    SoilC3_StockData = sep.data(., in_col = SoilC3_StockData, return = "Value"),
    O_lyrC_StockData = sep.data(., in_col = O_lyrC_StockData, return = "Value"),
    PyC_StockData = sep.data(., in_col = PyC_StockData, return = "Value"),
    LitterDuffC_StockData = sep.data(., in_col = LitterDuffC_StockData, return = "Value"),
    RootC_StockData = sep.data(., in_col = RootC_StockData, return = "Value"),
    MBC_StockData = sep.data(., in_col = MBC_StockData, return = "Value"),
    BD_gcm3_StockData = sep.data(., in_col = BD_gcm3_StockData, return = "Value"),
    Rs_FluxData = sep.data(., in_col = Rs_FluxData, return = "Value"),
    Rh_FluxData = sep.data(., in_col = Rh_FluxData, return = "Value"),
    Ra_FluxData = sep.data(., in_col = Ra_FluxData, return = "Value"),
    CH4_FluxData = sep.data(., in_col = CH4_FluxData, return = "Value"),
    MRT_active_FluxData = sep.data(., in_col = MRT_active_FluxData, return = "Value"),
    MRT_passive_FluxData = sep.data(., in_col = MRT_passive_FluxData, return = "Value"),
    MRT_total_FluxData = sep.data(., in_col = MRT_total_FluxData, return = "Value"),
    PeatAccumulationRate_FluxData = sep.data(., in_col = PeatAccumulationRate_FluxData, return = "Value"),
    BurnDepth_cm_Emissions = sep.data(., in_col = BurnDepth_cm_Emissions, return = "Value"),
    Soil_Emissions = sep.data(., in_col = Soil_Emissions, return = "Value"),
    Litter_Emissions = sep.data(., in_col = Litter_Emissions, return = "Value"),
    Roots_Emissions = sep.data(., in_col = Roots_Emissions, return = "Value"),
    TotalBelowground_Emissions = sep.data(., in_col = TotalBelowground_Emissions, return = "Value"),
  )


##Begin standardization of units----
#SoilC on area
unique(blg$SoilC_Units_StockData)
soilCarea <-
  c( #For these, only include mass soil per area basis
    "kgC_per_m2",
    "gC_per_m2",
    "mgC_per_cm2",
    "gC_per_cm2",
    "MgC_per_hectare",
    "kgC_per_hectare",
    "mgC_per_hectare",
    "Mg_per_hectare",
    "molC_per_m2"
    )

soilCareaTmp <- blg %>%
  filter(SoilC_Units_StockData %in% soilCarea) %>%
  mutate(
    SoilC1_StockData_Mg_ha = unlist(pmap(list(SoilC1_StockData, SoilC_Units_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
    SoilC1_StockData_Mg_ha_scaled = scale.depth(SoilC1_StockData_Mg_ha, SoilC1_Depth_cm_StockData), #Scale based on proportion of C at depth
    SoilC2_StockData_Mg_ha = unlist(pmap(list(SoilC2_StockData, SoilC_Units_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
    SoilC3_StockData_Mg_ha = unlist(pmap(list(SoilC3_StockData, SoilC_Units_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
  )

#SoilC on mass
unique(blg$SoilC_Units_StockData)
soilCmass <- c(
  "percent",
  "gC_per_kg",
  "mgC_per_g",
  "g_per_g",
  "g_per_kg",
  "mgC_per_kg",
  "gC_per_g",
  "mg_per_g"
)
soilCmassTmp <- blg %>%
  filter(SoilC_Units_StockData %in% soilCmass) %>%
  mutate(
    SoilC1_StockData_percent = 100*unlist(pmap(list(SoilC1_StockData, SoilC_Units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
    SoilC2_StockData_percent = 100*unlist(pmap(list(SoilC2_StockData, SoilC_Units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
    SoilC3_StockData_percent = 100*unlist(pmap(list(SoilC3_StockData, SoilC_Units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )


#O layer C area
unique(blg$O_lyr_Units_StockData)
O_lyrarea <- c(
  "gC_per_cm2",
  "kgC_per_m2",
  "mgC_per_hectare",
  "MgC_per_hectare",
  "kg_per_m2",
  "molC_per_m2"
)
O_lyrareaTmp <- blg %>%
  filter(O_lyr_Units_StockData %in% O_lyrarea) %>%
  mutate(
    O_lyrC_StockData_Mg_ha = unlist(pmap(list(O_lyrC_StockData, O_lyr_Units_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
  )
#O layer C mass
unique(blg$O_lyr_Units_StockData)
O_lyrmass <- c(
  "percent",
  "gC_per_kg"
)
O_lyrmassTmp <- blg %>%
  filter(O_lyr_Units_StockData %in% O_lyrmass) %>%
  mutate(
    O_lyrC_StockData_percent = 100*unlist(pmap(list(O_lyrC_StockData, O_lyr_Units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )


#Pyrogenic C
#Don't worry about PyC for now
unique(blg$PyC_Units_StockData)



#LitterDuff C area
unique(blg$LitterDuff_Units_StockData)
LitterDuffarea <- c(
  "gC_per_m2",
  "kg_per_m2",
  "MgC_per_hectare",
  "g_per_m2",
  "kg_per_hectare",
  "kgC_per_m2",
  "molC_per_m2"
)
LitterDuffareaTmp <- blg %>%
  filter(LitterDuff_Units_StockData %in% LitterDuffarea) %>%
  mutate(
    LitterDuffC_StockData_Mg_ha = unlist(pmap(list(LitterDuffC_StockData, LitterDuff_Units_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
  )

LitterDuffmass <- c(
  "percent",
  "g_per_kg",
  "gC_per_kg"
)
LitterDuffmassTmp <- blg %>%
  filter(LitterDuff_Units_StockData %in% LitterDuffmass) %>%
  mutate(
    LitterDuffC_StockData_percent = 100*unlist(pmap(list(LitterDuffC_StockData, LitterDuff_Units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )



#Root C
unique(blg$RootC_Units_StockData)
RootCarea <- c(
  "g_per_m2",
  "gC_per_m2",
  "MgC_per_hectare",
  "Mg_per_hectare",
  "kg_per_m2",
  "metric_ton_per_hectare",
  "metric_tonC_per_hectare",
  "molC_per_m2"
)
RootCareaTmp <- blg %>%
  filter(RootC_Units_StockData %in% RootCarea) %>%
  mutate(
    RootC_StockData_Mg_ha = unlist(pmap(list(RootC_StockData, RootC_Units_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
  )

#No rootC on mass basis




#Microbial biomass C stocks
unique(blg$MBC_Units_StockData)
MBCarea <- c(
  "gC_per_m2"
)
MBCareaTmp <- blg %>%
  filter(MBC_Units_StockData %in% MBCarea) %>%
  mutate(
    MBC_StockData_Mg_ha = unlist(pmap(list(MBC_StockData, MBC_Units_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
  )

MBCmass <- c(
  "mgC_per_kg",
  "mgC_per_g",
  "ugC_per_g",
  "gC_per_kg",
  "mg_per_kg"
)
MBCmassTmp <- blg %>%
  filter(MBC_Units_StockData %in% MBCmass) %>%
  mutate(
    MBC_StockData_percent = 100*unlist(pmap(list(MBC_StockData, MBC_Units_StockData, "g / g"), convertSoilC)), #Convert to percent C, pmap is the purrr equivalent to mapply in base R
  )






###Tidy data to create UniqueID and remove NA values----
soilCarea <- belowground %>% filter(SoilC_Units_StockData %in% soilCareainclude) #Filter belowground tab to only include soilC on area basis
soilCarea <- soilCarea %>%
  mutate(
    UniqueID = paste0(RecordID, "_", RecordSubID_new), #Create UniqueID based off of RecordID and RecordSubID

  ) %>%
  drop_na(SoilC1_Depth_cm_StockData) #Remove NA values

###Scale given soil C stocks to 0-5cm depth
SoilCarea <- soilCarea %>% #Work with soil C on area basis
  drop_na( #Drop rows where NA exists (i.e. no data) for the following columns
    SoilC1_Depth_cm_StockData
  ) %>%
  mutate( #Extract value from all records.
    SoilC1_Control_StockData = sep.data(., in_col = SoilC1_Control_StockData, return = "Value"), #Use custom function to return numeric values
    SoilC1_Burned1_StockData = sep.data(., in_col = SoilC1_Burned1_StockData, return = "Value"), #Use custom function to return numeric values
  ) %>%
  mutate( #Convert soilC stocks to MgC_per_ha
    SoilC1_Control_StockData_MgC_ha = unlist(pmap(list(SoilC1_Control_StockData, SoilC_Units_Control_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
    SoilC1_Burned1_StockData_MgC_ha = unlist(pmap(list(SoilC1_Burned1_StockData, SoilC_Units_Control_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
    SoilC1_Control_StockData_MgC_ha_scaled = scale.depth(SoilC1_Control_StockData_MgC_ha, SoilC1_Depth_cm_StockData), #Scale based on proportion of C at depth
    SoilC1_Burned1_StockData_MgC_ha_scaled = scale.depth(SoilC1_Burned1_StockData_MgC_ha, SoilC1_Depth_cm_StockData), #Scale based on proportion of C at depth
    SoilC1_Delta_MgC_ha_scaled = (SoilC1_Burned1_StockData_MgC_ha_scaled - SoilC1_Control_StockData_MgC_ha_scaled)
  )

###Quick simple stats
#soilStat1 <-
SoilCarea %>%
  dplyr::select(Biome,
                     SoilC1_Control_StockData_MgC_ha_scaled,
                     SoilC1_Burned1_StockData_MgC_ha_scaled) %>%
  pivot_longer(names_to = "Case", values_to = "SoilC_Mg_ha", -Biome) %>%
  ggplot(aes(x = Biome, y = SoilC_Mg_ha, color = Case)) +
  geom_jitter(alpha = 0.5) +
  geom_boxplot(alpha = 0)+
  coord_flip() +
  theme(legend.position = "bottom")

SoilCarea %>%
  dplyr::select(Biome,
                SoilC1_Control_StockData_MgC_ha_scaled,
                SoilC1_Burned1_StockData_MgC_ha_scaled) %>%
  mutate(SoilCDelta = (SoilC1_Burned1_StockData_MgC_ha_scaled-SoilC1_Control_StockData_MgC_ha_scaled)) %>%
  ggplot(aes(x = Biome, y = SoilCDelta)) +
  geom_jitter(alpha = 0.5) +
  geom_boxplot(alpha = 0) +
  coord_flip() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  theme(legend.position = "none")

SoilCarea %>%
  dplyr::select(Biome,
                SoilC1_Control_StockData_MgC_ha_scaled,
                SoilC1_Burned1_StockData_MgC_ha_scaled) %>%
  mutate(SoilCDelta = (SoilC1_Burned1_StockData_MgC_ha_scaled-SoilC1_Control_StockData_MgC_ha_scaled)) %>%
  ggplot(aes(x = SoilCDelta)) +
  geom_density() +
  geom_vline(xintercept = 0, linetype = "dashed")

x <- SoilCarea %>%
  dplyr::select(SoilC1_Control_StockData_MgC_ha_scaled,
                SoilC1_Burned1_StockData_MgC_ha_scaled) %>%
  mutate(SoilCDelta = (SoilC1_Burned1_StockData_MgC_ha_scaled-SoilC1_Control_StockData_MgC_ha_scaled)) %>%
  dplyr::select(SoilCDelta)

t.test(x) #Is mean soilCDelta significantly different from 0? Yes




summary(aov(SoilC_Mg_ha ~ Case, data = soilStat1))


  ggplot(aes(y = SoilC1_Delta2)) +
  geom_density() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  coord_flip()

##Workup soilC on mass basis----
soilCmassinclude <-
  c( #For these, only include mass soil per mass basis
    "gC_per_kg",
    "gC_per_g",
    "mgC_per_g",
    "mgC_per_kg",
    "mgC_per_g",
    "g_per_kg",
    "g_per_g",
    "mg_per_g"
  )

  soilCmassinclude <- c(
    "percent",
    "gC_per_kg",
    "gC_per_g",
    "g_per_kg",
    "mgC_per_g",
    "g_per_g",
    "mgC_per_g",
    "mg_per_g",
    "mgC_per_kg"
  )

soilCmass <- belowground %>% filter(SoilC_Units_Control_StockData %in% soilCmassinclude)
soilCmass <-soilCmass %>%
  mutate(
    UniqueID = paste0(RecordID, "_", RecordSubID),
    SoilC1_Depth_cm_Control_StockData = as.numeric(SoilC1_Depth_cm_Control_StockData)
  ) %>%
  drop_na(SoilC1_Depth_cm_Control_StockData)

#SoilCmass <-
soilCmass %>% #Work with soil C on area basis
  drop_na( #Drop rows where NA exists (i.e. no data)
    SoilC1_Depth_cm_Control_StockData,
    SoilC1_Control_StockData,
    SoilC1_Burned1_StockData
  ) %>%
  mutate( #Extract value from all records. Records generally given
    SoilC1_Control_StockData = sep.data(., in_col = SoilC1_Control_StockData), #Use custom function to return numeric values
    SoilC1_Burned1_StockData = sep.data(., in_col = SoilC1_Burned1_StockData), #Use custom function to return numeric values
  ) %>%
  dplyr::select(
    UniqueID,
    SoilC_Units_Control_StockData,
    SoilC1_Depth_cm_Control_StockData,
    SoilC1_Control_StockData,
    SoilC1_Burned1_StockData
  ) %>%
  # filter(UniqueID != "1530_1", UniqueID != "837_1") %>%
  mutate( #Convert soilC stocks to g_per_g
    SoilC1_Control_StockData_g_per_g = unlist(pmap(list(SoilC1_Control_StockData, SoilC_Units_Control_StockData, "g / g"), convertSoilC)), #Convert to g per g, pmap is the purrr equivalent to mapply in base R
    SoilC1_Burned1_StockData_g_per_g = unlist(pmap(list(SoilC1_Burned1_StockData, SoilC_Units_Control_StockData, "g / g"), convertSoilC)), #Convert to g per g, pmap is the purrr equivalent to mapply in base R
    SoilC1_Control_scaled = scale.depth(SoilC1_Control_StockData_g_per_g, SoilC1_Depth_cm_Control_StockData),
    SoilC1_Burned_scaled = scale.depth(SoilC1_Burned1_StockData_g_per_g, SoilC1_Depth_cm_Control_StockData),
    SoilC1_percentChange = percentchange(SoilC1_Burned_scaled, SoilC1_Control_scaled)
  ) #%>%
ggplot(aes(y = SoilC1_percentChange)) +
  geom_density() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  coord_flip()



belowground %>% filter(SoilC_Units_Control_StockData == "percent") %>% dplyr::select(SoilC1_Control_StockData)


convertSoilC(5, "gC_per_kg", "g / g")


