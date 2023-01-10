#Nature Climate Change review
#Created by Justin Mathias 9/26/2022

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "tidyverse"))
theme_set(theme_clean(base_size = 15)) #Set ggplot2 theme

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
#Read files, starting with row three, where actual column headers are
belowground <- read.xlsx("/Users/justinmathias/Downloads/Literature_Data_extraction_NCC_v3.xlsx",
                         sheet = "Belowground",
                         startRow = 3)

#Create unique columns for Latitude and Longitude
bmap <- belowground %>%
  drop_na(LatLon) %>% #Remove NA values only for LatLon column
  select(LatLon, 12:29) %>%
  group_by(LatLon) %>% #Group by unique LatLon and only include one record per site
  filter(row_number() == 1) %>%
  sep.coords(LatLon)
bmap[] <- sapply(bmap, as.numeric) #Assign all columns as numeric
str(bmap)

##Belowground map of study locations----
biomes <- readOGR("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp") #World biomes from: Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm

#Create a new dataframe, coords, so we can extract data from bmap
coords <- data.frame(bmap$Lon, bmap$Lat)
coords.sp <- SpatialPoints(coords) #Coords need to be LongLat
proj4string(coords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
bmap <- cbind(bmap, over(coords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(bmap)[names(bmap) == "over(coords.sp, biomes)$BIOME_NAME"] <- "Biome"

str(bmap)

###Map of binary information for data included in belowground----
bmap_long <- bmap %>%
  pivot_longer(names_to = "Measurement", values_to = "Binary", -c(Lat,Lon)) %>%
  separate(Measurement, c("Measurement"), sep = "_Binary_Measurements") #Drop the "_Binary_Measurements" text

x <- paste0("SoilC")
ggplotly(
  bmap_long %>% filter(Measurement == x & Binary == 1) %>%
    ggplot() + #Plot
    borders("world", colour = "gray40", fill = "gray99") +
    theme_article() +
    coord_fixed(1.2) +
    geom_point(
      aes(x = Lon, y = Lat),
      size = 1.5,
      color = "blue"
    ) +
    scale_size_continuous(range = c(1, 8),
                          breaks = c(5, 10, 15)
    ) +
    ggtitle(x)
)





####Map of bmap papers----
ggplotly(bmap %>%
           ggplot() + #Plot
           borders("world", colour = "gray40", fill = "gray99") +
           theme_article() +
           coord_fixed(1.2) +
           geom_point(aes(x = Lon, y = Lat, color = Biome),
                      alpha = 0.65,
                      size = 1.5) +
           scale_size_continuous(range = c(1, 8),
                                 breaks = c(5, 10, 15)) +
           theme(
             legend.position = "bottom",
             legend.title = element_text(size = 11, family = "Arial"),
             legend.text = element_text(size = 11, family = "Arial"),
             legend.background = element_blank(),
             axis.title.x = element_text(
               color = "black",
               size = 17,
               family = "Arial"
             ),
             axis.title.y = element_text(
               color = "black",
               size = 17,
               family = "Arial"
             ),
             axis.text = element_text(
               color = "black",
               size = 16,
               family = "Arial"
             ),
             panel.border = element_rect(
               colour = "black",
               fill = NA,
               size = .9
             ),
             plot.tag = element_text(
               family = "Arial",
               size = 18,
               face = "bold"
             )
           ) +
           xlab("Longitude") +
           ylab("Latitude") +
           ggtit

)



#NCCapp.R: Shiny app for the NCC Review----
ui <- dashboardPage( #Begin UI. Include menu items and set appearance
  dashboardHeader(title = "Nature Climate Change Review",
                  titleWidth = 325),#Width in pixels
  dashboardSidebar(width = 325,
                   sidebarMenu(
                     menuItem("Map Overview", tabName = "map"),
                     menuItem("Aboveground", tabName = "above"),
                     menuItem("Belowground", tabName = "below"),
                     menuItem("Modeling", tabName = "model"),
                     menuItem("Emissions", tabName = "emissions"),
                     menuItem("Total Carbon Dynamics", tabName = "Cdynamics"),
                     menuItem("Policy Implications", tabName = "policy")

                   )),
  dashboardBody(#Begin dashboard body.

  ),
  skin = "green"
)

server <- function(input, output) { }
shinyApp(ui, server)


# Summary stats -----------------------------------------------------------
bstats <- belowground %>% select(12:29) #Select binary indexed columns for summary stats
bstats[] <- sapply(bstats, as.numeric) #Assign all columns as numeric
str(bstats) #Confirm numeric

#Density plot of time since fire
belowground$TimeSinceFire_years <- as.numeric(belowground$TimeSinceFire_years)

belowground %>%
  select(TimeSinceFire_years) %>%
  ggplot(aes(x = TimeSinceFire_years)) +
  geom_density(fill = "blue", alpha = 0.5)

#Study type wordcloud
unique(belowground$Study.Type)
wordcloud(words = belowground$Study.Type, min.freq = 1,
          max.words=200, random.order=FALSE,
          colors=brewer.pal(8, "Dark2"))
wordcloud(words = belowground$Region, min.freq = 1,
          max.words=200, random.order=FALSE,
          colors=brewer.pal(8, "Dark2"))
wordcloud(words = belowground$Severity, min.freq = 1,
          max.words=200, random.order=FALSE,
          colors=brewer.pal(8, "Dark2"))
wordcloud(words = belowground$CO2mic_text, min.freq = 1,
          max.words=200, random.order=FALSE,
          colors=brewer.pal(8, "Dark2"))
wordcloud(words = belowground$Notes, min.freq = 1,
          max.words=200, random.order=FALSE,
          colors=brewer.pal(8, "Dark2"))


# Soil carbon stocks ------------------------------------------------------
##Fetch and wrangle soil C data from soilgrids.org to scale soil C with depth----
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

#Create dataframe containing UniqueIDs and Lat/Lon to get get biome information
soilsLocations <- belowground %>%
  mutate(UniqueID = paste(RecordID, RecordSubID, sep = "_")) %>%
  drop_na(LatLon) %>%
  group_by(UniqueID) %>% #Group by UniqueID to remove duplicate rows
  filter(row_number() == 1) %>%  #Remove duplicate ID rows
  ungroup() %>%
  sep.coords(LatLon) %>%
  select(UniqueID, Lat, Lon)

#Join dataframes to get locations for soilC
soilsCarbon <- left_join(soilsFinal, soilsLocations)

#Create a new dataframe, soilscoords, so we can extract data from the soilsCarbon dataset
soilscoords <- data.frame(soilsCarbon$Lon, soilsCarbon$Lat)
soilscoords.sp <- SpatialPoints(soilscoords) #Coords need to be LongLat
proj4string(soilscoords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
soilsCarbon <- cbind(soilsCarbon, over(soilscoords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(soilsCarbon)[names(soilsCarbon) == "over(soilscoords.sp, biomes)$BIOME_NAME"] <- "Biome"

