#NCC_Mathias_Belowground
#Created by justin mathias 11/28/22

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "tidyverse"))
theme_set(theme_clean(base_size = 13)) #Set ggplot2 theme

#Read files, starting with row three, where actual column headers are
belowground <- read.xlsx("/Users/justinmathias/Downloads/Literature_Data_extraction_NCC_v3.xlsx",
                         sheet = "Belowground",
                         startRow = 3)


#What units are given?
unique(belowground$SoilC_Units)
unique(belowground$SoilC1_Depth_cm)

##Workup soilC on area basis----
soilCareainclude <-
  c( #For these, only include mass soil per area basis
    "kgC_per_m2",
    "gC_per_m2",
    "MgC_per_hectare",
    "mgC_per_cm2",
    "gC_per_cm2",
    "kgC_per_hectare",
    "mgC_per_hectare",
    "Mg_per_hectare",
    "molC_per_m2"
  )

soilCarea <- belowground %>% filter(SoilC_Units_Control_StockData %in% soilCareainclude) #Filter belowgrounds column to only include soilC on area basis
soilCarea <- soilCarea %>%
  mutate(
    UniqueID = paste0(RecordID, "_", RecordSubID),
    SoilC1_Depth_cm_Control_StockData = as.numeric(SoilC1_Depth_cm_Control_StockData)
  ) %>%
  drop_na(SoilC1_Depth_cm_Control_StockData) #Remove NA values

#SoilCarea <-
soilCarea %>% #Work with soil C on area basis
  drop_na( #Drop rows where NA exists (i.e. no data)
    SoilC1_Depth_cm_Control_StockData,
    SoilC1_Control_StockData,
    SoilC1_Burned1_StockData
  ) %>%
  mutate( #Extract value from all records. Records generally given
    SoilC1_Control_StockData = sep.data(., in_col = SoilC1_Control_StockData, return = "Value"), #Use custom function to return numeric values
    SoilC1_Burned1_StockData = sep.data(., in_col = SoilC1_Burned1_StockData, return = "Value"), #Use custom function to return numeric values
  ) %>%
  dplyr::select(
    UniqueID,
    SoilC_Units_Control_StockData,
    SoilC1_Depth_cm_Control_StockData,
    SoilC1_Control_StockData,
    SoilC1_Burned1_StockData
  ) %>%
  mutate( #Convert soilC stocks to MgC_per_ha
    SoilC1_Control_StockData_MgC_ha = unlist(pmap(list(SoilC1_Control_StockData, SoilC_Units_Control_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
    SoilC1_Burned1_StockData_MgC_ha = unlist(pmap(list(SoilC1_Burned1_StockData, SoilC_Units_Control_StockData, "Mg / hectare"), convertSoilC)), #Convert to MgC per ha, pmap is the purrr equivalent to mapply in base R
    SoilC1_Delta = (SoilC1_Burned1_StockData_MgC_ha - SoilC1_Control_StockData_MgC_ha), #Negative means carbon lost
    SoilC1_Delta2 = scale.depth(SoilC1_Delta, SoilC1_Depth_cm_Control_StockData), #Scale based on proportion of C at depth
    SoilC1_percentChange = percentchange(SoilC1_Burned1_StockData_MgC_ha, SoilC1_Control_StockData_MgC_ha)
  ) %>%
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


