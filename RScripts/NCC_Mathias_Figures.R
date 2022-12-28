#Created by Justin Mathias 12/27/22
#NCC Review Figures

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "tidyverse", "patchwork", "sf"))
theme_set(theme_article(base_size = 13)) #Set ggplot2 theme

#Load in data----
ag <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/AbovegroundConverted.csv")
bg <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/BelowgroundConverted.csv")
tec <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/TECConverted.csv")

#Extract only columns of interest here for each datasheet
ag.locations <- ag %>% dplyr::select(Lat, Lon, Biome_simple) %>% drop_na(Lat,Lon) %>% #Select Lat/Lon and drop na values
  group_by(Lat,Lon) %>% filter(row_number() == 1) %>% #Keep only one record per unique location
  mutate(Datasheet = "Aboveground")
bg.locations <- bg %>% dplyr::select(Lat, Lon, Biome_simple) %>% drop_na(Lat,Lon) %>% #Select Lat/Lon and drop na values
  group_by(Lat,Lon) %>% filter(row_number() == 1) %>% #Keep only one record per unique location
  mutate(Datasheet = "Belowground")
tec.locations <- tec %>% dplyr::select(Lat, Lon, Biome_simple) %>% drop_na(Lat,Lon) %>% #Select Lat/Lon and drop na values
  group_by(Lat,Lon) %>% filter(row_number() == 1) %>% #Keep only one record per unique location
  mutate(Datasheet = "TEC")

#Combine dataframes
map <- rbind(ag.locations, bg.locations, tec.locations)
map_reduced <- map %>% group_by(Lat,Lon) %>% filter(row_number() == 1)

#Create map----
map %>%
  ggplot() + #Plot
  borders("world", colour = "gray40", fill = "gray99") +
  coord_map(projection = "mollweide") +
  geom_point(aes(x = Lon, y = Lat), size = 1.5, color = "blue") +
  scale_size_continuous(range = c(1, 8), breaks = c(5, 10, 15)) +
  ylim(c(-60,90)) +
  xlim(c(-195,195)) +
  xlab("Longitude") +
  ylab("Latitude")
