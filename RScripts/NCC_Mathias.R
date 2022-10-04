#Nature Climate Change review
#Created by Justin Mathias 9/26/2022

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "tidyverse", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg"))
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
belowground |>
  select(LatLon) |> #Select LatLon column
  drop_na() |> #Remove NA values
  group_by(LatLon) |> #Group by unique LatLon and only include one record per site
  filter(row_number() == 1) |>
  sep.coords(LatLon) |>
  print(n = 150)



####FIGURE 1####
#Figure 1a, Create map of study locations, circle size is number of trees#
#Figure 1a, Create map of study locations, circle size is number of trees#
meta.map <- meta.CRU %>% #Create dataframe with only have value for lon/lat per LeafType per Site per Study
  group_by(Citation, Site, Biome) %>%
  filter(row_number() == 1)

Fig.1a <- ggplot() + #Plot
  borders("world", colour = "gray40", fill = "gray95") +
  theme_few() +
  coord_fixed(1.2) +
  geom_point(aes(x = Longitude, y = Latitude, size = N, color = Biome),
             data = meta.map,
             # color = 'blue',
             alpha = 0.65) +
  scale_size_continuous(range = c(1, 8),
                        breaks = c(5, 10, 15)) +
  labs(size = '# Trees') +
  theme(legend.position = c(0.11 , 0.35),
        legend.title = element_text(size = 11, family = "Arial"),
        legend.text = element_text(size = 11, family = "Arial"),
        legend.background=element_blank(),
        axis.title.x = element_text(color = "black", size = 17, family = "Arial"), #x-axis title (Year)
        axis.title.y = element_text(color = "black", size = 17, family = "Arial"), #y-axis title (iWUE)
        axis.text = element_text(color = "black", size = 16, family = "Arial"),
        panel.border = element_rect(colour = "black", fill=NA, size=.9),
        plot.tag = element_text(family = "Arial", size = 18, face = "bold")) +
  labs(tag = "A") +
  # scale_color_npg() +
  scale_color_manual(values = c("#8491B4FF","#FFB154FF", "#B09C85FF", "#E64B35FF","#00A087FF","#3C5488FF","#4DBBD5FF","#91D1C2FF","#DC0000FF","#7E6148FF")) +
  xlab("Longitude") +
  ylab("Latitude") +
  guides(color = FALSE)
# guides(color = guide_legend(override.aes = list(size=7))) #This creates legend component for LeafType by color: red=BD, aqua=BE, teal=ND, blue=NE.
# Fig.1a
#Figure 1b#
Fig.1b <- meta.CRU %>%
  group_by(Unique) %>%
  mutate(iWUE.micromol.mol = iWUE.micromol.mol - mean(iWUE.micromol.mol)) %>%
  ggplot(aes(x = Year, y = iWUE.micromol.mol, color = Biome)) +
  geom_point(alpha = 0.6) +
  geom_smooth(aes(group = Period), method = 'lm', color = "black", size = 1) +
  geom_vline(xintercept = 1963.5, linetype = "dashed") +
  theme_few() +
  ylab(expression(paste('iWUE'[std]*' (µmol CO'[2]*' mol'^{-1}*' H'[2]*'O)', sep = ""))) +
  theme(legend.title = element_blank(),
        legend.position = c(-0.18, -0.4),
        legend.text = element_text(size=12, family = "Arial"),
        legend.background=element_blank(),
        # legend.title.align = 0.5,
        axis.title.x = element_text(color = "black", size = 17, family = "Arial"), #x-axis title (Year)
        axis.title.y = element_text(color = "black", size = 17, family = "Arial"), #y-axis title (iWUE)
        axis.text = element_text(color = "black", size = 16, family = "Arial"),
        panel.border = element_rect(colour = "black", fill=NA, size=.9),
        plot.tag = element_text(family = "Arial", size = 18, face = "bold")) +
  labs(tag = "B") +
  # scale_color_npg() +
  scale_color_manual(values = c("#8491B4FF","#FFB154FF", "#B09C85FF", "#E64B35FF","#00A087FF","#3C5488FF","#4DBBD5FF","#91D1C2FF","#DC0000FF","#7E6148FF")) +
  guides(color = guide_legend(override.aes = list(size=3, alpha = 0.8), nrow = 4))

Figure.1 <- Fig.1a + Fig.1b


