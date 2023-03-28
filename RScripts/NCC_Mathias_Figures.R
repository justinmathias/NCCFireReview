#Created by Justin Mathias 12/27/22
#NCC Review Figures

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "tidyverse", "patchwork", "sf", "terra"))
theme_set(theme_article(base_size = 13)) #Set ggplot2 theme

#Load in data----
ag <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/AbovegroundConvertedGFED.csv")
bg <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/BelowgroundConvertedGFED.csv")
tec <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/TECConverted_GFED.csv")

#Extract only columns of interest here for each datasheet
ag.locations <- ag %>% dplyr::select(Lat, Lon, GFEDVegCover) %>% drop_na(Lat,Lon) %>% #Select Lat/Lon and drop na values
  group_by(Lat,Lon) %>% filter(row_number() == 1) %>% #Keep only one record per unique location
  mutate(Datasheet = "Aboveground")
bg.locations <- bg %>% dplyr::select(Lat, Lon, GFEDVegCover) %>% drop_na(Lat,Lon) %>% #Select Lat/Lon and drop na values
  group_by(Lat,Lon) %>% filter(row_number() == 1) %>% #Keep only one record per unique location
  mutate(Datasheet = "Belowground")
tec.locations <- tec %>% dplyr::select(Lat, Lon, GFEDVegCover) %>% drop_na(Lat,Lon) %>% #Select Lat/Lon and drop na values
  group_by(Lat,Lon) %>% filter(row_number() == 1) %>% #Keep only one record per unique location
  mutate(Datasheet = "TEC")

#Combine dataframes
map <- rbind(ag.locations, bg.locations, tec.locations)
map_reduced <- map %>% group_by(Lat,Lon,Datasheet) %>% filter(row_number() == 1)

#Create map----
map %>%
  ggplot() + #Plot
  borders("world", colour = "gray40", fill = "gray99") +
  coord_map(projection = "mollweide") +
  geom_point(aes(x = Lon, y = Lat, color = Datasheet), size = 1.5) +
  scale_size_continuous(range = c(1, 8), breaks = c(5, 10, 15)) +
  ylim(c(-65,95)) +
  xlim(c(-195,195)) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_color_npg() +
  theme(legend.position = "none") +
  facet_wrap(~Datasheet, nrow = 3, ncol = 1)



# Carbon stocks -----------------------------------------------------------
job({ #Run all of this as a job in the background
  #First, extract data for each biome using Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm
  biomes <- vect("/Users/justinmathias/Library/CloudStorage/Dropbox/Dual Isotope/Data/Shapefiles/Ecoregions2017/Ecoregions2017.shp") #Load biomes shapefile

  biome.names.old <- unique(biomes$BIOME_NAME) #Identify old biomes to reclassify

  lookup.table <- c("Tundra" = "AlpineBorealForest", #Store these old values in a lookup table with new values assigned.
                    "Tropical & Subtropical Moist Broadleaf Forests" = "TropicalForest",
                    "Mediterranean Forests, Woodlands & Scrub" = "Mediterranean",
                    "Deserts & Xeric Shrublands" = "Desert",
                    "Temperate Grasslands, Savannas & Shrublands" = "TemperateGrassland",
                    "Boreal Forests/Taiga" = "AlpineBorealForest",
                    "Temperate Conifer Forests" = "TemperateForest",
                    "Temperate Broadleaf & Mixed Forests" = "TemperateForest",
                    "Montane Grasslands & Shrublands" = "AlpineBorealForest",
                    "Mangroves" = "N/A",
                    "Flooded Grasslands & Savannas" = "FloodedGrassland",
                    "Tropical & Subtropical Grasslands, Savannas & Shrublands" = "TropicalGrassland",
                    "Tropical & Subtropical Dry Broadleaf Forests" = "TropicalForest",
                    "Tropical & Subtropical Coniferous Forests" = "TropicalForest",
                    "N/A" = "N/A")

  biomes$BIOME_RENAMED <- lookup.table[biomes$BIOME_NAME] #Create new column for renamed biomes, referencing original biomes

  #Determine above and belowground carbon in each biome----
  agb <- rast("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Global_Maps_C_Density_2010_1763/data/aboveground_biomass_carbon_2010.tif") #Load AGB and BGB data
  bgb <- rast("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Global_Maps_C_Density_2010_1763/data/belowground_biomass_carbon_2010.tif")

  AGB_MgC_ha <- agb*0.1 #Multiply by scale factor (see Spawn et al. 2020, Table 7)
  rm(agb) #Don't need agb anymore, remove as to not be confused
  cellarea_ha <- cellSize(AGB_MgC_ha, unit = "ha") #Calculate area of each grid cell in hectares
  AGB_PgC <- conv_unit(AGB_MgC_ha*cellarea_ha, from = "Mg", to = "Pg") #Calculate total C in Megagrams per grid cell, then convert to Petagrams

  BGB_MgC_ha <- bgb*0.1 #Multiply by scale factor (see Spawn et al. 2020, Table 7)
  rm(bgb) #Don't need bgb anymore, remove as to not be confused
  BGB_PgC <- conv_unit(BGB_MgC_ha*cellarea_ha, from = "Mg", to = "Pg") #Calculate total C in Megagrams per grid cell, then convert to Petagrams

  Biomes <- rasterize(biomes, AGB_PgC, "BIOME_RENAMED") #Rasterize biomes SpatVector to same resolution as AGB_PgC and BGB_PgC

  #Calculate sum of C for each biome in Pg
  AGB_PgC_Biomes <- zonal(AGB_PgC, Biomes, "sum", na.rm = TRUE)
  BGB_PgC_Biomes <- zonal(BGB_PgC, Biomes, "sum", na.rm = TRUE)
  #Calculate total area (i.e., sum) for each biome
  area_Biomes <- zonal(cellarea_ha, Biomes, "sum", na.rm = TRUE)
})

#Create dataframe of above- and belowground carbon
BiomeCarbon <- list(AGB_PgC_Biomes, BGB_PgC_Biomes, area_Biomes) %>% reduce(left_join, by = "BIOME_RENAMED") %>% #Join zonal summaries
  mutate(AGBtoBGB = aboveground_biomass_carbon_2010/belowground_biomass_carbon_2010) %>% #Create column for ratio of above- to belowground biomass
  rename(Biome = BIOME_RENAMED, AGB_PgC = aboveground_biomass_carbon_2010, BGB_PgC = belowground_biomass_carbon_2010, Area_ha = area) %>% #Rename columns for readability
  mutate(area_Sum = sum(Area_ha)) %>% #Calculate sum of total land area before removing mangroves, rock and ice
  filter(Biome != "N/A") %>% #Remove mangroves and rock and ice
  mutate(AGB_MgC_ha = (conv_unit(AGB_PgC, from = "Pg", to = "Mg")/Area_ha), #Convert back to Mg from Pg
         BGB_MgC_ha = (conv_unit(BGB_PgC, from = "Pg", to = "Mg")/Area_ha), #Convert back to Mg from Pg
         Total_PgC = AGB_PgC + BGB_PgC, #Calculate total C, sum of above and belowground
         Total_MgC_ha = (conv_unit(Total_PgC, from = "Pg", to = "Mg")/Area_ha), #Calculate total C per ha
         BGB_PgC_below = BGB_PgC*-1, #Create negative values for BGB for certain plots for data visualization
         BGB_MgC_ha_below = BGB_MgC_ha*-1,#Create negative values for BGB for certain plots for data visualization
         area_Percent2 = Area_ha/area_Sum*100) #Calculate percent land area of Earth covered


