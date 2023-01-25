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



var <- "LiveWoodC_StockData_MgC_ha"
AG1 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LiveWoodC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "FoliageC_StockData_MgC_ha"
AG2 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "FoliageC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "TotalLive_StockData_MgC_ha"
AG3 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalLive_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "TotalAboveground_StockData_MgC_ha"
AG4 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalAboveground_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "PyC_StockData_MgC_ha"
AG5 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "PyC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)


var <- "CWDC_StockData_MgC_ha"
AG6 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "CWDC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "FWDC_StockData_MgC_ha"
AG7 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "FWDC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "TotalDead_StockData_MgC_ha"
AG8 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalDead_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "LitterC_StockData_MgC_ha"
AG9 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)


var <- "TEC_StockData_MgC_ha"
AG10 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TEC_StockData",
         DataType = "MassArea") %>%
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
         DataType = "Percent") %>%
  drop_na(pChange)


var <- "TotalAboveground_StockData_percent"
AG12 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalAboveground_StockData",
         DataType = "Percent") %>%
  drop_na(pChange)


var <- "LitterC_StockData_percent"
AG13 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterC_StockData",
         DataType = "Percent") %>%
  drop_na(pChange)

var <- "ANPP_FluxData_g_m2"
AG14 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "ANPP_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)


var <- "GPP_FluxData_g_m2"
AG15 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "GPP_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "NPP_FluxData_g_m2"
AG16 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "NPP_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "NEP_FluxData_g_m2"
AG17 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "NEP_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "Reco_FluxData_g_m2"
AG18 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Reco_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "Photosynthesis_FluxData_g_m2"
AG19 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Photosynthesis_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)


var <- "SoilC1_StockData_Mg_ha_scaled"
BG1 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "SoilC1_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "SoilC1_StockData_percent"
BG2 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "SoilC1_StockData",
         DataType = "Percent") %>%
  drop_na(pChange)


var <- "O_lyrC_StockData_Mg_ha"
BG3 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "O_lyrC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "O_lyrC_StockData_percent"
BG4 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "O_lyrC_StockData",
         DataType = "Percent") %>%
  drop_na(pChange)

var <- "LitterDuffC_StockData_Mg_ha"
BG5 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterDuffC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "LitterDuffC_StockData_percent"
BG6 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "LitterDuffC_StockData",
         DataType = "Percent") %>%
  drop_na(pChange)


var <- "RootC_StockData_Mg_ha"
BG7 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "RootC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "MBC_StockData_Mg_ha"
BG8 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "MBC_StockData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "MBC_StockData_percent"
BG9 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "MBC_StockData",
         DataType = "Percent") %>%
  drop_na(pChange)

var <- "Rs_FluxData_g_m2"
BG10 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Rs_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "Ra_FluxData_g_m2"
BG11 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "Ra_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)

var <- "CH4_FluxData_g_m2"
BG12 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "CH4_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)


var <- "PeatAccumulationRate_FluxData_g_m2"
BG13 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "PeatAccumulationRate_FluxData",
         DataType = "MassArea") %>%
  drop_na(pChange)




