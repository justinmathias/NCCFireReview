#Nature Climate Change review
#Created by Justin Mathias 9/26/2022

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "tidyverse", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard"))
theme_set(theme_clean(base_size = 13)) #Set ggplot2 theme

# Carbon density ----------------------------------------------------------
#First, extract data for each biome using Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm
biomes <- vect("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/Ecoregions2017/Ecoregions2017.shp")

#Determine above and belowground carbon in each biome----
agb <- rast("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/Global_Maps_C_Density_2010_1763/data/aboveground_biomass_carbon_2010.tif")
bgb <- rast("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/Global_Maps_C_Density_2010_1763/data/belowground_biomass_carbon_2010.tif")

AGB_MgC_ha <- agb*0.1 #Multiply by scale factor (see Spawn et al. 2020, Table 7)
rm(agb) #Don't need agb anymore
agb_area_ha <- cellSize(AGB_MgC_ha, unit = "ha") #Calculate area of each grid cell in hectares
AGB_PgC <- conv_unit(AGB_MgC_ha*agb_area_ha, from = "Mg", to = "Pg") #Calculate total C in Megagrams per grid cell, then convert to Petagrams

BGB_MgC_ha <- bgb*0.1 #Multiply by scale factor (see Spawn et al. 2020, Table 7)
rm(bgb) #Don't need bgb anymore
BGB_PgC <- conv_unit(BGB_MgC_ha*agb_area_ha, from = "Mg", to = "Pg") #Calculate total C in Megagrams per grid cell, then convert to Petagrams

#Rasterize biomes SpatVector to same resolution as AGB_MgC
Biomes <- rasterize(biomes, AGB_PgC, "BIOME_NAME")

#Calculate sum of C for each biome
AGB_MgC_Biomes <- zonal(AGB_PgC, Biomes, "sum", na.rm = TRUE)
BGB_MgC_Biomes <- zonal(BGB_PgC, Biomes, "sum", na.rm = TRUE)
#Calculate total area (i.e., sum) for each biome
area_Biomes <- zonal(agb_area_ha, Biomes, "sum", na.rm = TRUE)

#Create dataframe of above- and belowground carbon
BiomeCarbon <- list(AGB_MgC_Biomes, BGB_MgC_Biomes, area_Biomes) %>% reduce(left_join, by = "BIOME_NAME") %>% #Join zonal summaries
  mutate(AGBtoBGB = aboveground_biomass_carbon_2010/belowground_biomass_carbon_2010) %>% #Create column for ratio of above- to belowground biomass
  rename(Biome = BIOME_NAME, AGB_PgC = aboveground_biomass_carbon_2010, BGB_PgC = belowground_biomass_carbon_2010, Area_ha = area) %>% #Rename columns for readability
  filter(Biome != "N/A") %>% #Remove rock and ice
  mutate(AGB_MgC_ha = conv_unit(AGB_PgC/Area_ha, from = "Pg", to = "Mg"), #Convert back to Mg from Pg
         BGB_MgC_ha = conv_unit(BGB_PgC/Area_ha, from = "Pg", to = "Mg"), #Convert back to Mg from Pg
         Total_PgC = AGB_PgC + BGB_PgC, #Calculate total C (sum of above and belowground)
         Total_MgC_ha = conv_unit(Total_PgC/Area_ha, from = "Pg", to = "Mg"), #Calculate total C per ha
         BGB_PgC_below = BGB_PgC*-1, #Create negative values for BGB for certain plots for data visualization
         BGB_MgC_ha_below = BGB_MgC_ha*-1,#Create negative values for BGB for certain plots for data visualization
         area_Percent = Area_ha/13402114579*100) #Calculate percent area of Earth covered




# Literature review datasheet metadata extraction -------------------------
#Read files, starting with row three, where actual
belowground <- read.xlsx("/Users/justinmathias/Downloads/LitSearch_Revised_Final_DataExtration_V1.xlsx",
                         sheet = "Belowground",
                         startRow = 3)
colnames(belowground)
#Create unique columns for Latitude and Longitude
bmap <- belowground |>
  drop_na(LatLon) |> #Remove NA values only for LatLon column
  select(LatLon) |>
  group_by(LatLon) |> #Group by unique LatLon and only include one record per site
  filter(row_number() == 1) |>
  sep.coords(LatLon)

##Belowground map of study locations----
biomes <- readOGR("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp") #World biomes from: Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm

#Create a new dataframe, coords, so we can extract data from the CRU dataset for each year
coords <- data.frame(bmap$Lon, bmap$Lat)
coords.sp <- SpatialPoints(coords) #Coords need to be LongLat
proj4string(coords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
bmap <- cbind(bmap, over(coords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(bmap)[names(bmap) == "over(coords.sp, biomes)$BIOME_NAME"] <- "Biome"

####Map of bmap papers----
ggplot() + #Plot
  borders("world", colour = "gray40", fill = "gray99") +
  theme_article() +
  coord_fixed(1.2) +
  geom_point(aes(x = Lon, y = Lat, color = Biome),
             data = bmap,
             alpha = 0.65,
             size = 2) +
  scale_size_continuous(range = c(1, 8),
                        breaks = c(5, 10, 15)) +
  theme(legend.position = "bottom",
        legend.title = element_text(size = 11, family = "Arial"),
        legend.text = element_text(size = 11, family = "Arial"),
        legend.background=element_blank(),
        axis.title.x = element_text(color = "black", size = 17, family = "Arial"),
        axis.title.y = element_text(color = "black", size = 17, family = "Arial"),
        axis.text = element_text(color = "black", size = 16, family = "Arial"),
        panel.border = element_rect(colour = "black", fill=NA, size=.9),
        plot.tag = element_text(family = "Arial", size = 18, face = "bold")) +
  xlab("Longitude") +
  ylab("Latitude") +
  guides(color = guide_legend(override.aes = list(size=3, alpha = 0.8), ncol = 2))


#NCCapp.R: Shiny app for the NCC Review----
ui <- dashboardPage(
  dashboardHeader(title = "Nature Climate Change Review",
                  titleWidth = 325),#Width in pixels
  dashboardSidebar(width = 325),
  dashboardBody(),
  skin = "green"
)

server <- function(input, output) { }
shinyApp(ui, server)





