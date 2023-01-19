#Created by Justin Mathias, 1/5/23

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "drc", "tidyverse", "patchwork","nationalparkcolors"))


ag <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/AbovegroundConvertedGFED.csv")
bg <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/BelowgroundConvertedGFED.csv")
tec <- read.csv("https://raw.githubusercontent.com/justinmathias/NCCFireReview/main/Data/Converted%20files/TECConverted_GFED.csv")


# Belowground C trajectories ----------------------------------------------
vars <- c("SoilC1_StockData_Mg_ha_scaled",
          "SoilC2_StockData_Mg_ha",
          "SoilC3_StockData_Mg_ha",
          "SoilC1_StockData_percent",
          "SoilC2_StockData_percent",
          "SoilC3_StockData_percent",
          "O_lyrC_StockData_Mg_ha",
          "O_lyrC_StockData_percent",
          "LitterDuffC_StockData_Mg_ha",
          "LitterDuffC_StockData_percent",
          "RootC_StockData_Mg_ha",
          "MBC_StockData_Mg_ha",
          "MBC_StockData_percent",
          "Rs_FluxData_g_m2",
          "Ra_FluxData_g_m2",
          "CH4_FluxData_g_m2",
          "PeatAccumulationRate_FluxData_g_m2")
##Continuous, all----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Belowground/TimeContinuous/All")
for (i in 1:length(vars)) {
  var <- vars[i]
  BG <- bg %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(Delta = Burn - Control,
           RR = log(Burn/Control))

  BG %>%
    ggplot(aes(x = TimeSinceFire_years, y = Delta)) +
    geom_point(alpha = 0.5) +
    geom_smooth() +
    xlim(0,150) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta")
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 4, height = 3)
  print(paste0("Finished ",var))
}
##Continuous, By GFED VegCover ----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Belowground/TimeContinuous/GFEDVegCover")
for (i in 1:length(vars)) {
  var <- vars[i]
  BG <- bg %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(Delta = Burn - Control,
           RR = log(Burn/Control))

  BG %>%
    ggplot(aes(x = TimeSinceFire_years, y = Delta, color = GFEDVegCover)) +
    geom_point(alpha = 0.5) +
    geom_smooth() +
    xlim(0,150) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta") +
    scale_color_manual(values = park_palette("Redwoods")) +
    facet_wrap(~GFEDVegCover)
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 9, height = 6)
  print(paste0("Finished ",var))
}
##Discrete, all----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Belowground/TimeDiscrete/All")
for (i in 1:length(vars)) {
  var <- vars[i]
  BG <- bg %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(TimeSinceFire_discrete = case_when(TimeSinceFire_years <= 5 ~ "0-5",
                                              TimeSinceFire_years >= 6 & TimeSinceFire_years <= 15 ~ "6-15",
                                              TimeSinceFire_years >= 16 & TimeSinceFire_years <= 30 ~ "16-30",
                                              TimeSinceFire_years >= 31 & TimeSinceFire_years <= 50 ~ "31-50",
                                              TimeSinceFire_years >= 51 & TimeSinceFire_years <= 150 ~ "51-150",
                                              TimeSinceFire_years >= 150 ~ ">150"),
           Delta = Burn - Control,
           RR = log(Burn/Control))

  #Set order of discrete categories
  BG$TimeSinceFire_discrete <- factor(BG$TimeSinceFire_discrete, levels = c("0-5","6-15","16-30","31-50","51-150",">150"))

  BG %>%
    ggplot(aes(x = TimeSinceFire_discrete, y = Delta)) +
    geom_point(alpha = 0.5) +
    geom_boxplot(alpha = 0) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta")
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 4, height = 3)
  print(paste0("Finished ",var))
}
##Discrete, By GFED VegCover ----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Belowground/TimeDiscrete/GFEDVegCover")
for (i in 1:length(vars)) {
  var <- vars[i]
  BG <- bg %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(TimeSinceFire_discrete = case_when(TimeSinceFire_years <= 5 ~ "0-5",
                                              TimeSinceFire_years >= 6 & TimeSinceFire_years <= 15 ~ "6-15",
                                              TimeSinceFire_years >= 16 & TimeSinceFire_years <= 30 ~ "16-30",
                                              TimeSinceFire_years >= 31 & TimeSinceFire_years <= 50 ~ "31-50",
                                              TimeSinceFire_years >= 51 & TimeSinceFire_years <= 150 ~ "51-150",
                                              TimeSinceFire_years >= 150 ~ ">150"),
           Delta = Burn - Control,
           RR = log(Burn/Control))

  #Set order of discrete categories
  BG$TimeSinceFire_discrete <- factor(BG$TimeSinceFire_discrete, levels = c("0-5","6-15","16-30","31-50","51-150",">150"))

  BG %>%
    ggplot(aes(x = TimeSinceFire_discrete, y = Delta, color = GFEDVegCover)) +
    geom_point(alpha = 0.5) +
    geom_boxplot(alpha = 0) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta") +
    scale_color_manual(values = park_palette("Redwoods")) +
    facet_wrap(~GFEDVegCover)
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 9, height = 6)
  print(paste0("Finished ",var))

}




# Aboveground C trajectories ----------------------------------------------
vars <- c(
  "LiveWoodC_StockData_MgC_ha",
  "FoliageC_StockData_MgC_ha",
  "TotalLive_StockData_MgC_ha",
  "TotalAboveground_StockData_MgC_ha",
  "PyC_StockData_MgC_ha",
  "CWDC_StockData_MgC_ha",
  "FWDC_StockData_MgC_ha",
  "TotalDead_StockData_MgC_ha",
  "LitterC_StockData_MgC_ha",
  "TEC_StockData_MgC_ha",
  "FoliageC_StockData_percent",
  "TotalAboveground_StockData_percent",
  "LitterC_StockData_percent",
  "ANPP_FluxData_g_m2",
  "GPP_FluxData_g_m2",
  "NPP_FluxData_g_m2",
  "NEP_FluxData_g_m2",
  "Reco_FluxData_g_m2",
  "Photosynthesis_FluxData_g_m2"
)
##Continuous, all----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Aboveground/TimeContinuous/All")
for (i in 1:length(vars)) {
  var <- vars[i]
  AG <- ag %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(Delta = Burn - Control,
           RR = log(Burn/Control))

  AG %>%
    ggplot(aes(x = TimeSinceFire_years, y = Delta)) +
    geom_point(alpha = 0.5) +
    geom_smooth() +
    xlim(0,150) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta")
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 4, height = 3)
  print(paste0("Finished ",var))

}
##Continuous, By GFED VegCover ----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Aboveground/TimeContinuous/GFEDVegCover")
for (i in 1:length(vars)) {
  var <- vars[i]
  AG <- ag %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(Delta = Burn - Control,
           RR = log(Burn/Control))

  AG %>%
    ggplot(aes(x = TimeSinceFire_years, y = Delta, color = GFEDVegCover)) +
    geom_point(alpha = 0.5) +
    geom_smooth() +
    xlim(0,150) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta") +
    scale_color_manual(values = park_palette("Redwoods")) +
    facet_wrap(~GFEDVegCover)
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 9, height = 6)
  print(paste0("Finished ",var))

}
##Discrete, all----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Aboveground/TimeDiscrete/All")
for (i in 1:length(vars)) {
  var <- vars[i]
  AG <- ag %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(TimeSinceFire_discrete = case_when(TimeSinceFire_years <= 5 ~ "0-5",
                                              TimeSinceFire_years >= 6 & TimeSinceFire_years <= 15 ~ "6-15",
                                              TimeSinceFire_years >= 16 & TimeSinceFire_years <= 30 ~ "16-30",
                                              TimeSinceFire_years >= 31 & TimeSinceFire_years <= 50 ~ "31-50",
                                              TimeSinceFire_years >= 51 & TimeSinceFire_years <= 150 ~ "51-150",
                                              TimeSinceFire_years >= 150 ~ ">150"),
           Delta = Burn - Control,
           RR = log(Burn/Control))

  #Set order of discrete categories
  AG$TimeSinceFire_discrete <- factor(AG$TimeSinceFire_discrete, levels = c("0-5","6-15","16-30","31-50","51-150",">150"))

  AG %>%
    ggplot(aes(x = TimeSinceFire_discrete, y = Delta)) +
    geom_point(alpha = 0.5) +
    geom_boxplot(alpha = 0) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta")
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 4, height = 3)
  print(paste0("Finished ",var))

}
##Discrete, By GFED VegCover ----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/Aboveground/TimeDiscrete/GFEDVegCover")
for (i in 1:length(vars)) {
  var <- vars[i]
  AG <- ag %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(TimeSinceFire_discrete = case_when(TimeSinceFire_years <= 5 ~ "0-5",
                                              TimeSinceFire_years >= 6 & TimeSinceFire_years <= 15 ~ "6-15",
                                              TimeSinceFire_years >= 16 & TimeSinceFire_years <= 30 ~ "16-30",
                                              TimeSinceFire_years >= 31 & TimeSinceFire_years <= 50 ~ "31-50",
                                              TimeSinceFire_years >= 51 & TimeSinceFire_years <= 150 ~ "51-150",
                                              TimeSinceFire_years >= 150 ~ ">150"),
           Delta = Burn - Control,
           RR = log(Burn/Control))

  #Set order of discrete categories
  AG$TimeSinceFire_discrete <- factor(AG$TimeSinceFire_discrete, levels = c("0-5","6-15","16-30","31-50","51-150",">150"))

  AG %>%
    ggplot(aes(x = TimeSinceFire_discrete, y = Delta, color = GFEDVegCover)) +
    geom_point(alpha = 0.5) +
    geom_boxplot(alpha = 0) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta") +
    scale_color_manual(values = park_palette("Redwoods")) +
    facet_wrap(~GFEDVegCover)
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 9, height = 6)
  print(paste0("Finished ",var))

}




# TEC trajectories ----------------------------------------------
vars <- c(
  "LiveC_StockData_MgC_ha",
  "DeadC_StockData_MgC_ha",
  "TotalSoilC_StockData_MgC_ha",
  "TotalSoilC_StockData_MgC_ha_scaled",
  "TotalSoilC_StockData_percent",
  "MCB_StockData_percent",
  "RootC_StockData_MgC_ha",
  "TotalBelowgroundC_StockData_MgC_ha",
  "TotalBelowgroundC_StockData_percent",
  "TotalAbovegroundC_StockData_MgC_ha",
  "TotalAbovegroundC_StockData_percent",
  "TEC_StockData_MgC_ha",
  "NPP_FluxData_g_m2",
  "ANPP_FluxData_g_m2",
  "BNPP_FluxData_g_m2",
  "GPP_FluxData_g_m2",
  "Sresp_FluxData_g_m2",
  "Rh_FluxData_g_m2",
  "Reco_FluxData_g_m2",
  "NEP_FluxData_g_m2",
  "NBP_FluxData_g_m2",
  "LiveC_EmissionsData_g_m2",
  "DeadC_EmissionsData_g_m2",
  "TotEmissions_EmissionsData_g_m2"

)
##Continuous, all----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/TEC/TimeContinuous/All")
for (i in 1:length(vars)) {
  var <- vars[i]
  TEC <- tec %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(Delta = Burn - Control,
           RR = log(Burn/Control))

  TEC %>%
    ggplot(aes(x = TimeSinceFire_years, y = Delta)) +
    geom_point(alpha = 0.5) +
    geom_smooth() +
    xlim(0,150) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta")
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 4, height = 3)
  print(paste0("Finished ",var))
}
##Continuous, By GFED VegCover ----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/TEC/TimeContinuous/GFEDVegCover")
for (i in 1:length(vars)) {
  var <- vars[i]
  TEC <- tec %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(Delta = Burn - Control,
           RR = log(Burn/Control))

  TEC %>%
    ggplot(aes(x = TimeSinceFire_years, y = Delta, color = GFEDVegCover)) +
    geom_point(alpha = 0.5) +
    geom_smooth() +
    xlim(0,150) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta") +
    scale_color_manual(values = park_palette("Redwoods")) +
    facet_wrap(~GFEDVegCover)
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 9, height = 6)
  print(paste0("Finished ",var))
}

##Discrete, all----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/TEC/TimeDiscrete/All")
for (i in 1:length(vars)) {
  var <- vars[i]
  TEC <- tec %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(TimeSinceFire_discrete = case_when(TimeSinceFire_years <= 5 ~ "0-5",
                                              TimeSinceFire_years >= 6 & TimeSinceFire_years <= 15 ~ "6-15",
                                              TimeSinceFire_years >= 16 & TimeSinceFire_years <= 30 ~ "16-30",
                                              TimeSinceFire_years >= 31 & TimeSinceFire_years <= 50 ~ "31-50",
                                              TimeSinceFire_years >= 51 & TimeSinceFire_years <= 150 ~ "51-150",
                                              TimeSinceFire_years >= 150 ~ ">150"),
           Delta = Burn - Control,
           RR = log(Burn/Control))

  #Set order of discrete categories
  TEC$TimeSinceFire_discrete <- factor(TEC$TimeSinceFire_discrete, levels = c("0-5","6-15","16-30","31-50","51-150",">150"))

  TEC %>%
    ggplot(aes(x = TimeSinceFire_discrete, y = Delta)) +
    geom_point(alpha = 0.5) +
    geom_boxplot(alpha = 0) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta")
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 4, height = 3)
  print(paste0("Finished ",var))
}
##Discrete, By GFED VegCover ----
setwd("/Users/justinmathias/Desktop/NCC TimeSinceFireFigs/TimeSeries/TEC/TimeDiscrete/GFEDVegCover")
for (i in 1:length(vars)) {
  var <- vars[i]
  TEC <- tec %>%
    dplyr::select(RecordID, RecordSubID_old, Treatment,TimeSinceFire_years,Study_Severity,StudyType,GFEDVegCover,var) %>%
    drop_na(var) %>%
    pivot_wider(names_from = Treatment, values_from = var, names_prefix = "") %>%
    unnest() %>%  #Unnest saves the day!!!
    mutate(TimeSinceFire_discrete = case_when(TimeSinceFire_years <= 5 ~ "0-5",
                                              TimeSinceFire_years >= 5.001 & TimeSinceFire_years <= 15 ~ "6-15",
                                              TimeSinceFire_years >= 15 & TimeSinceFire_years <= 30 ~ "16-30",
                                              TimeSinceFire_years >= 31 & TimeSinceFire_years <= 50 ~ "31-50",
                                              TimeSinceFire_years >= 51 & TimeSinceFire_years <= 150 ~ "51-150",
                                              TimeSinceFire_years >= 150 ~ ">150"),
           Delta = Burn - Control,
           RR = log(Burn/Control))

  #Set order of discrete categories
  TEC$TimeSinceFire_discrete <- factor(TEC$TimeSinceFire_discrete, levels = c("0-5","6-15","16-30","31-50","51-150",">150"))

  TEC %>%
    ggplot(aes(x = TimeSinceFire_discrete, y = Delta, color = GFEDVegCover)) +
    geom_point(alpha = 0.5) +
    geom_boxplot(alpha = 0) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray20") +
    ggtitle(var) +
    ylab("Delta") +
    scale_color_manual(values = park_palette("Redwoods")) +
    facet_wrap(~GFEDVegCover)
  ggsave(paste0(var,".tiff"), dpi = 300, units = c("in"), width = 9, height = 6)
  print(paste0("Finished ",var))

}




1885-800-300-96-16-105-150



#Notes
#Combine o-layer
#So, if o mineral combo, potentially exclude from analysis--think about this more
#0-2, 3-7,8-18
#Live and dead, but didn't measure foliage. Add up total.










