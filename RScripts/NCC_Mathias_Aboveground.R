#NCC_Mathias_Belowground
#Created by justin mathias 11/30/22

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "tidyverse", "patchwork"))
theme_set(theme_article(base_size = 13)) #Set ggplot2 theme

#Read files, starting with row three on belowground sheet, where actual column headers are ------------------------------------------------------
#Run this chunk of code to get biomes. We need to do it this way because we don't have a lat/lon for every case
aboveground <- read.xlsx("/Users/justinmathias/Downloads/Literature_Data_extraction_NCC_v3.xlsx",
                          sheet = "Aboveground",
                          startRow = 3)

##Read in biomes shapefile----
#biomes <- readOGR("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp") #World biomes from: Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm

##Append biome to each observation given lat/lon
Aboveground <- aboveground %>%
  mutate(UniqueID = paste(RecordID, RecordSubID, sep = "_")) %>% #First create UniqueID to join later
  drop_na(LatLon) %>% sep.coords(LatLon) #First separate Latitude and Longitude

Aboveground <- Aboveground %>%
  mutate(Lat = as.numeric(Lat),
         Lon = as.numeric(Lon))


#Create a new dataframe, coords, so we can extract data from aboveground
coords <- data.frame(Aboveground$Lon, Aboveground$Lat)
coords.sp <- SpatialPoints(coords) #Coords need to be LongLat
proj4string(coords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
Aboveground <- cbind(Aboveground, over(coords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(Aboveground)[names(Aboveground) == "over(coords.sp, biomes)$BIOME_NAME"] <- "Biome"

aboveground <- left_join(aboveground, Aboveground)








#Create unique columns for Latitude and Longitude
amap <- aboveground %>%
  drop_na(LatLon) %>% #Remove NA values only for LatLon column
  dplyr::select(LatLon, 12,13, 15:29) %>%
  group_by(LatLon) %>% #Group by unique LatLon and only include one record per site
  filter(row_number() == 1) %>%
  sep.coords(LatLon)
amap[] <- sapply(amap, as.numeric) #Assign all columns as numeric
str(amap)


###Map of binary information for data included in aboveground----
amap_long <- amap %>%
  pivot_longer(names_to = "Measurement", values_to = "Binary", -c(Lat,Lon)) %>%
  separate(Measurement, c("Measurement"), sep = "_Binary_Measurements") #Drop the "_Binary_Measurements" text

msmnts <- unique(amap_long$Measurement)
for (i in 1:length(msmnts)) {
  {x <- paste0(msmnts[[i]])
  obs <- sum(amap_long %>% filter(Measurement == x & Binary == 1) %>% dplyr::select(Binary))
  fname <- paste0(x, ".tiff")
  ggplotly(
    amap_long %>% filter(Measurement == x & Binary == 1) %>%
      ggplot() + #Plot
      borders("world", colour = "gray40", fill = "gray99") +
      theme_article() +
      coord_fixed(1.2) +
      geom_point(
        aes(x = Lon, y = Lat),
        size = 1.5,
        color = "#00A087FF"
      ) +
      scale_size_continuous(range = c(1, 8),
                            breaks = c(5, 10, 15)
      ) +
      ggtitle(paste0("Aboveground \n", x, "\n", "Obs:", sum(amap_long %>% filter(Measurement == x & Binary == 1) %>% dplyr::select(Binary))))
  )
  ggsave(paste0(fname), units = c("in"), width = 5, height = 4, dpi = 300)
  }
}


