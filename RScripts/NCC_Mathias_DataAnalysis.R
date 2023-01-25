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
         DataType = "MassArea",
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
  drop_na(pChange)

var <- "TotalAboveground_StockData_MgC_ha"
AG4 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalAboveground_StockData",
         DataType = "MassArea",
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
  drop_na(pChange)


var <- "CWDC_StockData_MgC_ha"
AG6 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "CWDC_StockData",
         DataType = "MassArea",
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
  drop_na(pChange)

var <- "TotalDead_StockData_MgC_ha"
AG8 <- ag %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "TotalDead_StockData",
         DataType = "MassArea",
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
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
         Origin = "Aboveground") %>%
  drop_na(pChange)


var <- "SoilC1_StockData_Mg_ha_scaled"
BG1 <- bg %>%
  dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
  drop_na(var) %>%
  pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
  unnest(cols = c(Control, Burn)) %>%
  mutate(pChange = percentchange(Burn, Control),
         Var = "SoilC1_StockData",
         DataType = "MassArea",
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
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
         Origin = "Belowground") %>%
  drop_na(pChange)


datlist <- list(AG1, AG2, AG3, AG4, AG5, AG6, AG7, AG8, AG9, AG10, AG11, AG12, AG13, AG14, AG15, AG16, AG17, AG18, AG19,
              BG1, BG2, BG3, BG4, BG5, BG6, BG7, BG8, BG9, BG10, BG11, BG12, BG13)
AG_BG <- do.call(rbind, datlist)

AG_BG$Study_Severity <- factor(AG_BG$Study_Severity, levels = c("Low", "Mixed", "High"))

AG_BG %>%
  group_by(Var, Origin) %>%
  summarise(n = n(),
            se = sd(pChange)/sqrt(n),
    pChange_mean = mean(pChange)) %>%
  ggplot(aes(x = Var, y = pChange_mean)) +
  geom_point(size = 2, alpha = 0.65) +
  geom_errorbar(aes(ymin = pChange_mean - se, ymax = pChange_mean + se), width = 0.2, size = 0.4) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray26") +
  coord_flip() +
  facet_wrap(~Origin) +
  # scale_color_manual(values = c("blue", "orange", "red")) +
  theme_clean() +
  ylim(c(-200,200))
