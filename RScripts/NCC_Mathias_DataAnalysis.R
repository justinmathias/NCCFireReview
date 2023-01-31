#Created by Justin Mathias, 1/5/23

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "patchwork","nationalparkcolors", "tidyverse"))


ag <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/AbovegroundConvertedGFED.csv")
bg <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/BelowgroundConvertedGFED.csv")
tec <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/TECConverted_GFED.csv")



#+For this analysis, we want to calculate percent change for each variable in ag, bg, and tec, respectively.
#+We then want to rbind all of the dataframes for each variable together so we have a long-format spreadsheet for analysis
#+and visualization.



# Aboveground -------------------------------------------------------------
var <- "LiveWoodC_StockData_MgC_ha"
AG1 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LiveWoodC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "FoliageC_StockData_MgC_ha"
AG2 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "FoliageC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "TotalLive_StockData_MgC_ha"
AG3 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalLive_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "TotalAboveground_StockData_MgC_ha"
AG4 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  filter(RecordSubID_old < 9) %>% #This excludes RecordSubIDs 9-20 from 1641 as they are shrubs
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalAboveground_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "PyC_StockData_MgC_ha"
AG5 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "PyC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "CWDC_StockData_MgC_ha"
AG6 <- ag %>%
  filter(RecordID != 1506) %>% #Exclude 1506, positive Infinity
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "CWDC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "FWDC_StockData_MgC_ha"
AG7 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "FWDC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "TotalDead_StockData_MgC_ha"
AG8 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  filter(RecordID != 1432) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalDead_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "LitterC_StockData_MgC_ha"
AG9 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "TEC_StockData_MgC_ha"
AG10 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TEC_StockData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Stock") %>%
  drop_na(pChange)

#+No observations for "LiveWoodC_StockData_percent", "TotalLive_StockData_percent"

var <- "FoliageC_StockData_percent"
AG11 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "FoliageC_StockData",
         DataType = "Percent",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "TotalAboveground_StockData_percent"
AG12 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalAboveground_StockData",
         DataType = "Percent",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "LitterC_StockData_percent"
AG13 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterC_StockData",
         DataType = "Percent",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "ANPP_FluxData_g_m2"
AG14 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "ANPP_FluxData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "GPP_FluxData_g_m2"
AG15 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "GPP_FluxData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Flux") %>%
  drop_na(pChange)

var <- "NPP_FluxData_g_m2"
AG16 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "NPP_FluxData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>% #Origin is technically AG in spreadsheet but TEC for our purposes
  drop_na(pChange)

var <- "NEP_FluxData_g_m2"
AG17 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "NEP_FluxData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>% #Origin is technically AG in spreadsheet but TEC for our purposes
  drop_na(pChange)

var <- "Reco_FluxData_g_m2"
AG18 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Reco_FluxData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>% #Origin is technically AG in spreadsheet but TEC for our purposes
  drop_na(pChange)

var <- "Photosynthesis_FluxData_g_m2"
AG19 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Photosynthesis_FluxData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Flux") %>%
  drop_na(pChange)



# Belowground -------------------------------------------------------------
var <- "SoilC1_StockData_Mg_ha_scaled"
BG1 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "SoilC1_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "SoilC1_StockData_percent"
BG2 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "SoilC1_StockData",
         DataType = "Percent",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "O_lyrC_StockData_Mg_ha"
BG3 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "O_lyrC_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "O_lyrC_StockData_percent"
BG4 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "O_lyrC_StockData",
         DataType = "Percent",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "LitterDuffC_StockData_Mg_ha"
BG5 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterDuffC_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "LitterDuffC_StockData_percent"
BG6 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterDuffC_StockData",
         DataType = "Percent",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "RootC_StockData_Mg_ha"
BG7 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "RootC_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "MBC_StockData_Mg_ha"
BG8 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "MBC_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "MBC_StockData_percent"
BG9 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "MBC_StockData",
         DataType = "Percent",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "Rs_FluxData_g_m2"
BG10 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Rs_FluxData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Flux") %>%
  drop_na(pChange)

var <- "Ra_FluxData_g_m2"
BG11 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Ra_FluxData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Flux") %>%
  drop_na(pChange)

var <- "CH4_FluxData_g_m2"
BG12 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "CH4_FluxData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "PeatAccumulationRate_FluxData_g_m2"
BG13 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "PeatAccumulationRate_FluxData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Flux") %>%
  drop_na(pChange)


# TEC ---------------------------------------------------------------------

var <- "LiveC_StockData_MgC_ha"
TEC1 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LiveC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "DeadC_StockData_MgC_ha"
TEC2 <- tec %>%
  filter(RecordID != 22) %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "DeadC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "TotalSoilC_StockData_MgC_ha_scaled"
TEC3 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalSoilC_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "TotalSoilC_StockData_percent"
TEC4 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalSoilC_StockData",
         DataType = "Percent",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "MCB_StockData_percent"
TEC5 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "MCB_StockData",
         DataType = "Percent",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "RootC_StockData_MgC_ha"
TEC6 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "RootC_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "TotalBelowgroundC_StockData_MgC_ha"
TEC7 <- tec %>%
  filter(RecordID != 1406) %>% #Remove outlier
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalBelowgroundC_StockData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)



var <- "TotalBelowgroundC_StockData_percent"
TEC8 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalBelowgroundC_StockData",
         DataType = "Percent",
         Origin = "BG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "TotalAbovegroundC_StockData_MgC_ha"
TEC9 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalAbovegroundC_StockData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)

var <- "TotalAbovegroundC_StockData_percent"
TEC10 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalAbovegroundC_StockData",
         DataType = "Percent",
         Origin = "AG",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "TEC_StockData_MgC_ha"
TEC11 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TEC_StockData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Stock") %>%
  drop_na(pChange)


var <- "NPP_FluxData_g_m2"
TEC12 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "NPP_FluxData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "ANPP_FluxData_g_m2"
TEC13 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "ANPP_FluxData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "BNPP_FluxData_g_m2"
TEC14 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "BNPP_FluxData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "GPP_FluxData_g_m2"
TEC15 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "GPP_FluxData",
         DataType = "MassArea",
         Origin = "AG",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "Sresp_FluxData_g_m2"
TEC16 <- tec %>%
  filter(RecordID != 1406) %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Sresp_FluxData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "Rh_FluxData_g_m2"
TEC17 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "RH_FluxData",
         DataType = "MassArea",
         Origin = "BG",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "Reco_FluxData_g_m2"
TEC18 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Reco_FluxData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "NEP_FluxData_g_m2"
TEC19 <- tec %>%
  filter(RecordID != 272) %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "NEP_FluxData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "NBP_FluxData_g_m2"
TEC20 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "NBP_FluxData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "LiveC_EmissionsData_g_m2"
TEC21 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LiveC_EmissionsData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>%
  drop_na(pChange)



var <- "DeadC_EmissionsData_g_m2"
TEC22 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "DeadC_EmissionsData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>%
  drop_na(pChange)


var <- "TotEmissions_EmissionsData_g_m2"
TEC23 <- tec %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotEmissions_EmissionsData",
         DataType = "MassArea",
         Origin = "TEC",
         Measurement = "Flux") %>%
  drop_na(pChange)




# Combine all -------------------------------------------------------------
datlist <- list(AG1, AG2, AG3, AG4, AG5, AG6, AG7, AG8, AG9, AG10, AG11, AG12, AG13, AG14, AG15, AG16, AG17, AG18, AG19,
                BG1, BG2, BG3, BG4, BG5, BG6, BG7, BG8, BG9, BG10, BG11, BG12, BG13,
                TEC1, TEC2,TEC3, TEC4, TEC5, TEC6, TEC7, TEC8, TEC9, TEC10, TEC11, TEC12, TEC13, TEC14, TEC15, TEC16, TEC17, TEC18, TEC19, TEC20, TEC21, TEC22, TEC23)
AG_BG_TEC <- do.call(rbind, datlist)

#Assign levels of fire severity
AG_BG_TEC$Study_Severity <- factor(AG_BG_TEC$Study_Severity, levels = c("Low", "Mixed", "High")) #Assign low, med, high

#Clean data frame
FinalData <- AG_BG_TEC %>%
  filter(Var != "PeatAccumulationRate_FluxData",
         Var != "PyC_StockData",
         Var != "TotEmissions_EmissionsData",
         Var != "DeadC_EmissionsData",
         Var != "LiveC_EmissionsData",
         Var != "Photosynthesis_FluxData",
         Var != "FWDC_StockData")

#Create Dataframes with new labels
FinalAboveground <- FinalData %>% filter(Origin == "AG")
FinalBelowground <- FinalData %>% filter(Origin == "BG")
FinalTEC <- FinalData %>% filter(Origin == "TEC")

#Create aboveground lookuptable
ag.lut <- c("TotalLive_StockData" = "Live",
            "TotalDead_StockData" = "Dead",
            "TotalAboveground_StockData" = "Total Aboveground",
            "LiveWoodC_StockData" = "Live Tree Wood",
            "LitterC_StockData" = "Litter",
            "GPP_FluxData" = "GPP",
            "FoliageC_StockData" = "Live Tree Foliage",
            "CWDC_StockData" = "Coarse Woody Debris",
            "ANPP_FluxData" = "Aboveground NPP",
            "LiveC_StockData" = "Live",
            "DeadC_StockData" = "Dead",
            "TotalAbovegroundC_StockData" = "Total Aboveground"
)
FinalAboveground$VarClean <- ag.lut[FinalAboveground$Var]
#Reorder aboveground factors
FinalAboveground$VarClean <- factor(FinalAboveground$VarClean, levels = rev(c("Total Aboveground",
                                                                          "Live",
                                                                          "Dead",
                                                                          "Live Tree Wood",
                                                                          "Coarse Woody Debris",
                                                                          "Live Tree Foliage",
                                                                          "Litter",
                                                                          "Aboveground NPP",
                                                                          "GPP")))



#Main Figure Aboveground----
Fig2A <- FinalAboveground %>%
  group_by(VarClean, Origin, Measurement) %>%
  summarise(n = n(),
            se = sd(pChange)/sqrt(n),
            pChange_mean = mean(pChange),
            pChange_median = median(pChange)) %>%
  ggplot(aes(x = VarClean, y = pChange_mean, shape = Measurement)) +
  geom_point(size = 4, alpha = .75) +
  geom_errorbar(aes(ymin = pChange_mean - se, ymax = pChange_mean + se), width = 0.2, size = 0.4) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray26") +
  coord_flip() +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.grid.major.y = element_line(color = "gray70", linetype = "dotted"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold", size = 15),
        legend.position = "none") +
  xlab("") +
  ylab("% Change due to burning") +
  geom_text(aes(y = 240, label = paste0("(",n,")")), size = 4.5, color = "black") +
  ylim(c(-100,250)) +
  scale_shape_manual(values = c(15,16)) +
  labs(tag = "A")

##Aboveground supplemental
pos <- position_dodge(0.75)
FinalAboveground %>%
  group_by(VarClean, Origin, Study_Severity) %>%
  summarise(n = n(),
            se = sd(pChange)/sqrt(n),
            pChange_mean = mean(pChange),
            pChange_median = median(pChange)) %>%
  ggplot(aes(x = VarClean, y = pChange_mean, color = Study_Severity)) +
  geom_point(size = 2.5, alpha = 0.65, position = pos) +
  geom_errorbar(aes(ymin = pChange_mean - se, ymax = pChange_mean + se), width = 0.2, size = 0.4, position = pos) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray26") +
  coord_flip() +
  scale_color_manual(values = c("blue", "orange", "red")) +
  theme_clean() +
  theme(axis.title  = element_text(size = 13),
        axis.text = element_text(size = 11),
        strip.text = element_text(size = 13),
        legend.position = "none") +
  xlab("") +
  ylab("% Change due to burning") +
  # annotate("text", label = n, x = Var, y = 220, fontface = "bold.italic", size = 5.5) +
  geom_text(aes(y = 240, label = paste0("(",n,")")), size = 4, color = "black") +
  ylim(c(-100,240)) +
  scale_shape_manual(values = c(15,16))

#Main Figure Belowground----
#Create belowground lookuptable
bg.lut <- c("SoilC1_StockData" = "Mineral Soil Layer",
            "Rs_FluxData" = "Total Rs",
            "Sresp_FluxData" = "Total Rs",
            "RootC_StockData" = "Root",
            "Ra_FluxData" = "Autotrophic Rs",
            "O_lyrC_StockData" = "Organic Soil Layer",
            "MBC_StockData" = "Microbial Biomass",
            "MCB_StockData" = "Microbial Biomass",
            "LitterDuffC_StockData" = "Litter/Duff",
            "CH4_FluxData" = "Methane",
            "TotalSoilC_StockData" = "Total Belowground",
            "TotalBelowgroundC_StockData" = "Total Belowground",
            "BNPP_FluxData" = "Belowground NPP",
            "RH_FluxData" = "Heterotrophic Rs"
            )
FinalBelowground$VarClean <- bg.lut[FinalBelowground$Var]
#Reorder aboveground factors
FinalBelowground$VarClean <- factor(FinalBelowground$VarClean, levels = rev(c("Total Belowground",
                                                                              "Litter/Duff",
                                                                          "Organic Soil Layer",
                                                                          "Mineral Soil Layer",
                                                                          "Root",
                                                                          "Microbial Biomass",
                                                                          "Belowground NPP",
                                                                          "Total Rs",
                                                                          "Autotrophic Rs",
                                                                          "Heterotrophic Rs",
                                                                          "Methane")))

Fig2C <- FinalBelowground %>%
  group_by(VarClean, Origin, Measurement) %>%
  summarise(n = n(),
            se = sd(pChange)/sqrt(n),
            pChange_mean = mean(pChange),
            pChange_median = median(pChange)) %>%
  ggplot(aes(x = VarClean, y = pChange_mean, shape = Measurement)) +
  geom_point(size = 4, alpha = .75) +
  geom_errorbar(aes(ymin = pChange_mean - se, ymax = pChange_mean + se), width = 0.2, size = 0.4) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray26") +
  coord_flip() +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.grid.major.y = element_line(color = "gray70", linetype = "dotted"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold", size = 15),
        legend.position = "none") +
  scale_x_discrete(labels = c("Autotrophic Rs" = expression("Autotrophic R"[s]*""),
                              "Heterotrophic Rs" = expression("Heterotrophic R"[s]*""),
                              "Total Rs" = expression("Total R"[s]*""))) +
  xlab("") +
  ylab("% Change due to burning") +
  # annotate("text", label = n, x = Var, y = 220, fontface = "bold.italic", size = 5.5) +
  geom_text(aes(y = 265, label = paste0("(",n,")")), size = 4.5, color = "black") +
  ylim(c(-90,280)) +
  scale_shape_manual(values = c(15,16)) +
  labs(tag = "C")


FinalBelowground %>%
  group_by(VarClean, Origin, Measurement, Study_Severity) %>%
  summarise(n = n(),
            se = sd(pChange)/sqrt(n),
            pChange_mean = mean(pChange),
            pChange_median = median(pChange)) %>%
  ggplot(aes(x = VarClean, y = pChange_mean, shape = Measurement, color = Study_Severity)) +
  geom_point(size = 2.5, alpha = 0.65, position = pos) +
  geom_errorbar(aes(ymin = pChange_mean - se, ymax = pChange_mean + se), width = 0.2, size = 0.4, position = pos) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray26") +
  coord_flip() +
  scale_color_manual(values = c("blue", "orange", "red")) +
  theme_clean() +
  theme(axis.title  = element_text(size = 13),
        axis.text = element_text(size = 11),
        strip.text = element_text(size = 13),
        legend.position = "none") +
  xlab("") +
  ylab("% Change due to burning") +
  # annotate("text", label = n, x = Var, y = 220, fontface = "bold.italic", size = 5.5) +
  geom_text(aes(y = 260, label = paste0("(",n,")")), size = 4, color = "black") +
  ylim(c(-100,270)) +
  scale_shape_manual(values = c(15,16))







# Final TEC ---------------------------------------------------------------

#Create belowground lookuptable
tec.lut <- c(
  "TEC_StockData" = "Total Ecosystem Carbon",
  "Reco_FluxData" = "Ecosystem Respiration",
  "NPP_FluxData" = "Net Primary Productivity",
  "NEP_FluxData" = "Net Ecosystem Productivity",
  "NBP_FluxData" = "Net Biome Productivity"
)
FinalTEC$VarClean <- tec.lut[FinalTEC$Var]
#Reorder aboveground factors
FinalTEC$VarClean <- factor(FinalTEC$VarClean, levels = rev(c(
  "Total Ecosystem Carbon",
  "Net Biome Productivity",
  "Net Ecosystem Productivity",
  "Net Primary Productivity",
  "Ecosystem Respiration")))



Fig2E <-
FinalTEC %>%
  group_by(VarClean, Origin, Measurement) %>%
  summarise(n = n(),
            se = sd(pChange)/sqrt(n),
            pChange_mean = mean(pChange),
            pChange_median = median(pChange)) %>%
  ggplot(aes(x = VarClean, y = pChange_mean, shape = Measurement)) +
  geom_point(size = 4, alpha = .75) +
  geom_errorbar(aes(ymin = pChange_mean - se, ymax = pChange_mean + se), width = 0.2, size = 0.4) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray26") +
  coord_flip() +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.grid.major.y = element_line(color = "gray70", linetype = "dotted"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold", size = 15),
        legend.position = "none") +
  xlab("") +
  ylab("% Change due to burning") +
  geom_text(aes(y = 42, label = paste0("(",n,")")), size = 4.5, color = "black") +
  ylim(c(-130,50)) +
  scale_shape_manual(values = c(15,16)) +
  labs(tag = "E") +
  scale_x_discrete(labels = c("Total Ecosystem Carbon" = "Total Ecosystem",
                              "Net Biome Productivity" = "Net Biome \n Productivity",
                              "Net Ecosystem Productivity" = "Net Ecosystem \n Productivity",
                              "Net Primary Productivity" = "Net Primary \n Productivity",
                              "Ecosystem Respiration" = "Ecosystem \n Respiration"))




setwd("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Figures")
plot_design <- "
AAAA
AAAA
AAAA
AAAA
BBBB
BBBB
BBBB
BBBB
CCCC
CCCC
CCCC
CCCC
"
Fig2A + Fig2B + Fig2C + plot_layout(design = plot_design, widths = c(4, 4, 4), heights = c(3.75, 3.75, 3.75))
ggsave("BurnResponse.tiff", dpi = 300, units = c("in"), width = 6, height = 10)






# Wrangle data to combine with map ----------------------------------------

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
Fig2B <- map_reduced %>%
  filter(Datasheet == "Aboveground") %>%
  ggplot() + #Plot
  borders("world", colour = "gray20", fill = "gray96", linewidth = 0.25) +
  # coord_map(projection = "mollweide") +
  geom_point(aes(x = Lon, y = Lat), size = 1.5, alpha = 0.6) +
  ylim(c(-65,95)) +
  xlim(c(-195,195)) +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.grid.major = element_line(color = "gray60", linetype = "dotted"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold"),
        legend.position = "none") +
  labs(tag = "B")
Fig2D <- map_reduced %>%
  filter(Datasheet == "Belowground") %>%
  ggplot() + #Plot
  borders("world", colour = "gray20", fill = "gray96", linewidth = 0.25) +
  # coord_map(projection = "mollweide") +
  geom_point(aes(x = Lon, y = Lat), size = 1.5, alpha = 0.6) +
  ylim(c(-65,95)) +
  xlim(c(-195,195)) +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.grid.major = element_line(color = "gray60", linetype = "dotted"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold"),
        legend.position = "none") +
  labs(tag = "D")
Fig2F <- map_reduced %>%
  filter(Datasheet == "TEC") %>%
  ggplot() + #Plot
  borders("world", colour = "gray20", fill = "gray96", linewidth = 0.25) +
  # coord_map(projection = "mollweide") +
  geom_point(aes(x = Lon, y = Lat), size = 1.5, alpha = 0.6) +
  ylim(c(-65,95)) +
  xlim(c(-195,195)) +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.grid.major = element_line(color = "gray60", linetype = "dotted"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold"),
        legend.position = "none") +
  labs(tag = "F")



setwd("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Figures")
plot_design <- "
AAAADDDDD
AAAADDDDD
AAAADDDDD
AAAADDDDD
BBBBEEEEE
BBBBEEEEE
BBBBEEEEE
BBBBEEEEE
CCCCFFFFF
CCCCFFFFF
CCCCFFFFF
CCCCFFFFF
"
Fig2A + Fig2C + Fig2E  + Fig2B + Fig2D + Fig2F +
  plot_layout(design = plot_design, widths = c(3, 3, 3, 3, 3, 3), heights = c(3.75, 3.75, 3.75, 3.75, 3.75, 3.75))
ggsave("BurnResponseAndMaps3.tiff", dpi = 300, units = c("in"), width = 12, height = 10)

ggsave("ProportionObs.tiff", dpi = 300, units = c("in"), width = 3.5, height = 3.25)

Fig2G <- AG_BG_TEC %>%
  group_by(Origin, GFEDVegCover) %>%
  summarise(BiomeTotal = sum(n())) %>%
  group_by(Origin) %>%
  mutate(BiomeN = sum(BiomeTotal),
         BiomeProportion = BiomeTotal/BiomeN) %>%
  filter(Origin == "AG") %>%
  ggplot(aes(fill = GFEDVegCover, x = Origin, y = BiomeProportion)) +
  geom_bar(position = "stack", stat = "identity", alpha = 0.95) +
  ylab("Proportion of Observations") +
  xlab("") +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold"),
        legend.title = element_text(hjust = 0.5)) +
  guides(fill=guide_legend(title="Biome")) +
  scale_fill_jama() +
  labs(tag = "G")
Fig2H <- AG_BG_TEC %>%
  group_by(Origin, GFEDVegCover) %>%
  summarise(BiomeTotal = sum(n())) %>%
  group_by(Origin) %>%
  mutate(BiomeN = sum(BiomeTotal),
         BiomeProportion = BiomeTotal/BiomeN) %>%
  filter(Origin == "BG") %>%
  ggplot(aes(fill = GFEDVegCover, x = Origin, y = BiomeProportion)) +
  geom_bar(position = "stack", stat = "identity", alpha = 0.95) +
  ylab("Proportion of Observations") +
  xlab("") +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold"),
        legend.title = element_text(hjust = 0.5)) +
  guides(fill=guide_legend(title="Biome")) +
  scale_fill_jama() +
  labs(tag = "H")
Fig2I <- AG_BG_TEC %>%
  group_by(Origin, GFEDVegCover) %>%
  summarise(BiomeTotal = sum(n())) %>%
  group_by(Origin) %>%
  mutate(BiomeN = sum(BiomeTotal),
         BiomeProportion = BiomeTotal/BiomeN) %>%
  filter(Origin == "TEC") %>%
  ggplot(aes(fill = GFEDVegCover, x = Origin, y = BiomeProportion)) +
  geom_bar(position = "stack", stat = "identity", alpha = 0.95) +
  ylab("Proportion of Observations") +
  xlab("") +
  theme_article() +
  theme(axis.title  = element_text(size = 15, color = "black"),
        axis.text = element_text(size = 14, color = "black"),
        strip.text = element_text(size = 15, color = "black"),
        panel.border = element_rect(color = "black"),
        plot.tag = element_text(face = "bold"),
        legend.title = element_text(hjust = 0.5)) +
  guides(fill=guide_legend(title="Biome")) +
  scale_fill_jama() +
  labs(tag = "I")


setwd("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Figures")
plot_design <- "
AAAADDDDDG
AAAADDDDDG
AAAADDDDDG
AAAADDDDDG
BBBBEEEEEH
BBBBEEEEEH
BBBBEEEEEH
BBBBEEEEEH
CCCCFFFFFI
CCCCFFFFFI
CCCCFFFFFI
CCCCFFFFFI
"
Fig2A + Fig2C + Fig2E  + Fig2B + Fig2D + Fig2F + Fig2G+Fig2H+Fig2I +
  plot_layout(design = plot_design, guides = "collect")
ggsave("BurnResponseAndMaps2.tiff", dpi = 300, units = c("in"), width = 14, height = 10)




# Aboveground Stats -------------------------------------------------------
live <- FinalAboveground %>%
  filter(VarClean == "Live") %>%
  dplyr::select(GFEDVegCover, Study_Severity, Control, Burn) %>%
  pivot_longer(names_to = "treatment", values_to = "LiveC", -c(GFEDVegCover, Study_Severity))
summary(aov(LiveC ~ treatment*GFEDVegCover*Study_Severity, data = live)) #LiveC is lower in burned, but this does not depend upon biome nor study severity

dead <- FinalAboveground %>%
  filter(VarClean == "Dead") %>%
  dplyr::select(GFEDVegCover, Study_Severity, Control, Burn) %>%
  pivot_longer(names_to = "treatment", values_to = "DeadC", -c(GFEDVegCover, Study_Severity))
summary(aov(DeadC ~ treatment*GFEDVegCover*Study_Severity, data = dead)) #DeadC is higher in burned, but this does not depend upon biome nor study severity
TukeyHSD(aov(DeadC ~ treatment*Study_Severity, data = dead))
ggplot(dead,aes(x = treatment, y = DeadC, color = Study_Severity)) +
  geom_boxplot()

FinalAboveground %>%
  filter(VarClean == "Dead") %>%
  group_by(VarClean, Origin, Measurement, Study_Severity) %>%
  summarise(n = n(),
            se = sd(pChange)/sqrt(n),
            pChange_mean = mean(pChange),
            pChange_median = median(pChange)) %>%
  ggplot(aes(x = Study_Severity, y = pChange_mean)) +
  geom_point()
