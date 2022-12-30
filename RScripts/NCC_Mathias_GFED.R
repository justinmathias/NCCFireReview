#Created by Justin Mathias, 12/28/22

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "tidyverse", "rhdf5", "ncdf4", "raster"))
theme_set(theme_clean(base_size = 13)) #Set ggplot2 theme

gfed2012ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2012.hdf5")
gfed2013ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2013.hdf5")
gfed2014ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2014.hdf5")
gfed2015ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2015.hdf5")
gfed2016ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2016.hdf5")

extent(gfed2012ras) <- extent(-179.875, 179.875, -89.875, 89.875) #Set extent of each raster
extent(gfed2013ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2014ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2015ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2016ras) <- extent(-179.875, 179.875, -89.875, 89.875)

crs(gfed2012ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2013ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2014ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2015ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2016ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

#Calculate  carbon (g C) emissions for each grid cell
#for each year. Multiply C emissions on area basis by the total area of grid cell
#then scale by the fraction of land area burned.
#Finally, adjust for each biome

#Global C emissions for each month of each year. Should have used a loop, but oh well
emissions2012_1_gC_grid_cell <- gfed2012ras$C.1*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.1
emissions2012_2_gC_grid_cell <- gfed2012ras$C.2*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.2
emissions2012_3_gC_grid_cell <- gfed2012ras$C.3*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.3
emissions2012_4_gC_grid_cell <- gfed2012ras$C.4*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.4
emissions2012_5_gC_grid_cell <- gfed2012ras$C.5*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.5
emissions2012_6_gC_grid_cell <- gfed2012ras$C.6*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.6
emissions2012_7_gC_grid_cell <- gfed2012ras$C.7*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.7
emissions2012_8_gC_grid_cell <- gfed2012ras$C.8*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.8
emissions2012_9_gC_grid_cell <- gfed2012ras$C.9*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.9
emissions2012_10_gC_grid_cell <- gfed2012ras$C.10*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.10
emissions2012_11_gC_grid_cell <- gfed2012ras$C.11*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.11
emissions2012_12_gC_grid_cell <- gfed2012ras$C.12*gfed2012ras$grid_cell_area*gfed2012ras$burned_fraction.12

emissions2013_1_gC_grid_cell <- gfed2013ras$C.1*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.1
emissions2013_2_gC_grid_cell <- gfed2013ras$C.2*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.2
emissions2013_3_gC_grid_cell <- gfed2013ras$C.3*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.3
emissions2013_4_gC_grid_cell <- gfed2013ras$C.4*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.4
emissions2013_5_gC_grid_cell <- gfed2013ras$C.5*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.5
emissions2013_6_gC_grid_cell <- gfed2013ras$C.6*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.6
emissions2013_7_gC_grid_cell <- gfed2013ras$C.7*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.7
emissions2013_8_gC_grid_cell <- gfed2013ras$C.8*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.8
emissions2013_9_gC_grid_cell <- gfed2013ras$C.9*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.9
emissions2013_10_gC_grid_cell <- gfed2013ras$C.10*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.10
emissions2013_11_gC_grid_cell <- gfed2013ras$C.11*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.11
emissions2013_12_gC_grid_cell <- gfed2013ras$C.12*gfed2013ras$grid_cell_area*gfed2013ras$burned_fraction.12

emissions2014_1_gC_grid_cell <- gfed2014ras$C.1*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.1
emissions2014_2_gC_grid_cell <- gfed2014ras$C.2*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.2
emissions2014_3_gC_grid_cell <- gfed2014ras$C.3*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.3
emissions2014_4_gC_grid_cell <- gfed2014ras$C.4*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.4
emissions2014_5_gC_grid_cell <- gfed2014ras$C.5*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.5
emissions2014_6_gC_grid_cell <- gfed2014ras$C.6*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.6
emissions2014_7_gC_grid_cell <- gfed2014ras$C.7*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.7
emissions2014_8_gC_grid_cell <- gfed2014ras$C.8*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.8
emissions2014_9_gC_grid_cell <- gfed2014ras$C.9*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.9
emissions2014_10_gC_grid_cell <- gfed2014ras$C.10*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.10
emissions2014_11_gC_grid_cell <- gfed2014ras$C.11*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.11
emissions2014_12_gC_grid_cell <- gfed2014ras$C.12*gfed2014ras$grid_cell_area*gfed2014ras$burned_fraction.12

emissions2015_1_gC_grid_cell <- gfed2015ras$C.1*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.1
emissions2015_2_gC_grid_cell <- gfed2015ras$C.2*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.2
emissions2015_3_gC_grid_cell <- gfed2015ras$C.3*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.3
emissions2015_4_gC_grid_cell <- gfed2015ras$C.4*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.4
emissions2015_5_gC_grid_cell <- gfed2015ras$C.5*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.5
emissions2015_6_gC_grid_cell <- gfed2015ras$C.6*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.6
emissions2015_7_gC_grid_cell <- gfed2015ras$C.7*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.7
emissions2015_8_gC_grid_cell <- gfed2015ras$C.8*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.8
emissions2015_9_gC_grid_cell <- gfed2015ras$C.9*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.9
emissions2015_10_gC_grid_cell <- gfed2015ras$C.10*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.10
emissions2015_11_gC_grid_cell <- gfed2015ras$C.11*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.11
emissions2015_12_gC_grid_cell <- gfed2015ras$C.12*gfed2015ras$grid_cell_area*gfed2015ras$burned_fraction.12

emissions2016_1_gC_grid_cell <- gfed2016ras$C.1*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.1
emissions2016_2_gC_grid_cell <- gfed2016ras$C.2*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.2
emissions2016_3_gC_grid_cell <- gfed2016ras$C.3*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.3
emissions2016_4_gC_grid_cell <- gfed2016ras$C.4*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.4
emissions2016_5_gC_grid_cell <- gfed2016ras$C.5*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.5
emissions2016_6_gC_grid_cell <- gfed2016ras$C.6*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.6
emissions2016_7_gC_grid_cell <- gfed2016ras$C.7*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.7
emissions2016_8_gC_grid_cell <- gfed2016ras$C.8*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.8
emissions2016_9_gC_grid_cell <- gfed2016ras$C.9*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.9
emissions2016_10_gC_grid_cell <- gfed2016ras$C.10*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.10
emissions2016_11_gC_grid_cell <- gfed2016ras$C.11*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.11
emissions2016_12_gC_grid_cell <- gfed2016ras$C.12*gfed2016ras$grid_cell_area*gfed2016ras$burned_fraction.12

Calculate PEAT, SAVA, BORF, and TEMF C emissions in gC per grid cell

#PEAT
PEATemissions2012_1_gC_grid_cell <- emissions2012_1_gC_grid_cell*gfed2012ras$C_PEAT.1 #2012
PEATemissions2012_2_gC_grid_cell <- emissions2012_2_gC_grid_cell*gfed2012ras$C_PEAT.2
PEATemissions2012_3_gC_grid_cell <- emissions2012_3_gC_grid_cell*gfed2012ras$C_PEAT.3
PEATemissions2012_4_gC_grid_cell <- emissions2012_4_gC_grid_cell*gfed2012ras$C_PEAT.4
PEATemissions2012_5_gC_grid_cell <- emissions2012_5_gC_grid_cell*gfed2012ras$C_PEAT.5
PEATemissions2012_6_gC_grid_cell <- emissions2012_6_gC_grid_cell*gfed2012ras$C_PEAT.6
PEATemissions2012_7_gC_grid_cell <- emissions2012_7_gC_grid_cell*gfed2012ras$C_PEAT.7
PEATemissions2012_8_gC_grid_cell <- emissions2012_8_gC_grid_cell*gfed2012ras$C_PEAT.8
PEATemissions2012_9_gC_grid_cell <- emissions2012_9_gC_grid_cell*gfed2012ras$C_PEAT.9
PEATemissions2012_10_gC_grid_cell <- emissions2012_10_gC_grid_cell*gfed2012ras$C_PEAT.10
PEATemissions2012_11_gC_grid_cell <- emissions2012_11_gC_grid_cell*gfed2012ras$C_PEAT.11
PEATemissions2012_12_gC_grid_cell <- emissions2012_12_gC_grid_cell*gfed2012ras$C_PEAT.12
PEATemissions2013_1_gC_grid_cell <- emissions2013_1_gC_grid_cell*gfed2013ras$C_PEAT.1 #2013
PEATemissions2013_2_gC_grid_cell <- emissions2013_2_gC_grid_cell*gfed2013ras$C_PEAT.2
PEATemissions2013_3_gC_grid_cell <- emissions2013_3_gC_grid_cell*gfed2013ras$C_PEAT.3
PEATemissions2013_4_gC_grid_cell <- emissions2013_4_gC_grid_cell*gfed2013ras$C_PEAT.4
PEATemissions2013_5_gC_grid_cell <- emissions2013_5_gC_grid_cell*gfed2013ras$C_PEAT.5
PEATemissions2013_6_gC_grid_cell <- emissions2013_6_gC_grid_cell*gfed2013ras$C_PEAT.6
PEATemissions2013_7_gC_grid_cell <- emissions2013_7_gC_grid_cell*gfed2013ras$C_PEAT.7
PEATemissions2013_8_gC_grid_cell <- emissions2013_8_gC_grid_cell*gfed2013ras$C_PEAT.8
PEATemissions2013_9_gC_grid_cell <- emissions2013_9_gC_grid_cell*gfed2013ras$C_PEAT.9
PEATemissions2013_10_gC_grid_cell <- emissions2013_10_gC_grid_cell*gfed2013ras$C_PEAT.10
PEATemissions2013_11_gC_grid_cell <- emissions2013_11_gC_grid_cell*gfed2013ras$C_PEAT.11
PEATemissions2013_12_gC_grid_cell <- emissions2013_12_gC_grid_cell*gfed2013ras$C_PEAT.12
PEATemissions2014_1_gC_grid_cell <- emissions2014_1_gC_grid_cell*gfed2014ras$C_PEAT.1 #2014
PEATemissions2014_2_gC_grid_cell <- emissions2014_2_gC_grid_cell*gfed2014ras$C_PEAT.2
PEATemissions2014_3_gC_grid_cell <- emissions2014_3_gC_grid_cell*gfed2014ras$C_PEAT.3
PEATemissions2014_4_gC_grid_cell <- emissions2014_4_gC_grid_cell*gfed2014ras$C_PEAT.4
PEATemissions2014_5_gC_grid_cell <- emissions2014_5_gC_grid_cell*gfed2014ras$C_PEAT.5
PEATemissions2014_6_gC_grid_cell <- emissions2014_6_gC_grid_cell*gfed2014ras$C_PEAT.6
PEATemissions2014_7_gC_grid_cell <- emissions2014_7_gC_grid_cell*gfed2014ras$C_PEAT.7
PEATemissions2014_8_gC_grid_cell <- emissions2014_8_gC_grid_cell*gfed2014ras$C_PEAT.8
PEATemissions2014_9_gC_grid_cell <- emissions2014_9_gC_grid_cell*gfed2014ras$C_PEAT.9
PEATemissions2014_10_gC_grid_cell <- emissions2014_10_gC_grid_cell*gfed2014ras$C_PEAT.10
PEATemissions2014_11_gC_grid_cell <- emissions2014_11_gC_grid_cell*gfed2014ras$C_PEAT.11
PEATemissions2014_12_gC_grid_cell <- emissions2014_12_gC_grid_cell*gfed2014ras$C_PEAT.12
PEATemissions2015_1_gC_grid_cell <- emissions2015_1_gC_grid_cell*gfed2015ras$C_PEAT.1 #2015
PEATemissions2015_2_gC_grid_cell <- emissions2015_2_gC_grid_cell*gfed2015ras$C_PEAT.2
PEATemissions2015_3_gC_grid_cell <- emissions2015_3_gC_grid_cell*gfed2015ras$C_PEAT.3
PEATemissions2015_4_gC_grid_cell <- emissions2015_4_gC_grid_cell*gfed2015ras$C_PEAT.4
PEATemissions2015_5_gC_grid_cell <- emissions2015_5_gC_grid_cell*gfed2015ras$C_PEAT.5
PEATemissions2015_6_gC_grid_cell <- emissions2015_6_gC_grid_cell*gfed2015ras$C_PEAT.6
PEATemissions2015_7_gC_grid_cell <- emissions2015_7_gC_grid_cell*gfed2015ras$C_PEAT.7
PEATemissions2015_8_gC_grid_cell <- emissions2015_8_gC_grid_cell*gfed2015ras$C_PEAT.8
PEATemissions2015_9_gC_grid_cell <- emissions2015_9_gC_grid_cell*gfed2015ras$C_PEAT.9
PEATemissions2015_10_gC_grid_cell <- emissions2015_10_gC_grid_cell*gfed2015ras$C_PEAT.10
PEATemissions2015_11_gC_grid_cell <- emissions2015_11_gC_grid_cell*gfed2015ras$C_PEAT.11
PEATemissions2015_12_gC_grid_cell <- emissions2015_12_gC_grid_cell*gfed2015ras$C_PEAT.12
PEATemissions2016_1_gC_grid_cell <- emissions2016_1_gC_grid_cell*gfed2016ras$C_PEAT.1 #2016
PEATemissions2016_2_gC_grid_cell <- emissions2016_2_gC_grid_cell*gfed2016ras$C_PEAT.2
PEATemissions2016_3_gC_grid_cell <- emissions2016_3_gC_grid_cell*gfed2016ras$C_PEAT.3
PEATemissions2016_4_gC_grid_cell <- emissions2016_4_gC_grid_cell*gfed2016ras$C_PEAT.4
PEATemissions2016_5_gC_grid_cell <- emissions2016_5_gC_grid_cell*gfed2016ras$C_PEAT.5
PEATemissions2016_6_gC_grid_cell <- emissions2016_6_gC_grid_cell*gfed2016ras$C_PEAT.6
PEATemissions2016_7_gC_grid_cell <- emissions2016_7_gC_grid_cell*gfed2016ras$C_PEAT.7
PEATemissions2016_8_gC_grid_cell <- emissions2016_8_gC_grid_cell*gfed2016ras$C_PEAT.8
PEATemissions2016_9_gC_grid_cell <- emissions2016_9_gC_grid_cell*gfed2016ras$C_PEAT.9
PEATemissions2016_10_gC_grid_cell <- emissions2016_10_gC_grid_cell*gfed2016ras$C_PEAT.10
PEATemissions2016_11_gC_grid_cell <- emissions2016_11_gC_grid_cell*gfed2016ras$C_PEAT.11
PEATemissions2016_12_gC_grid_cell <- emissions2016_12_gC_grid_cell*gfed2016ras$C_PEAT.12

#TEMF
TEMFemissions2012_1_gC_grid_cell <- emissions2012_1_gC_grid_cell*gfed2012ras$C_TEMF.1 #2012
TEMFemissions2012_2_gC_grid_cell <- emissions2012_2_gC_grid_cell*gfed2012ras$C_TEMF.2
TEMFemissions2012_3_gC_grid_cell <- emissions2012_3_gC_grid_cell*gfed2012ras$C_TEMF.3
TEMFemissions2012_4_gC_grid_cell <- emissions2012_4_gC_grid_cell*gfed2012ras$C_TEMF.4
TEMFemissions2012_5_gC_grid_cell <- emissions2012_5_gC_grid_cell*gfed2012ras$C_TEMF.5
TEMFemissions2012_6_gC_grid_cell <- emissions2012_6_gC_grid_cell*gfed2012ras$C_TEMF.6
TEMFemissions2012_7_gC_grid_cell <- emissions2012_7_gC_grid_cell*gfed2012ras$C_TEMF.7
TEMFemissions2012_8_gC_grid_cell <- emissions2012_8_gC_grid_cell*gfed2012ras$C_TEMF.8
TEMFemissions2012_9_gC_grid_cell <- emissions2012_9_gC_grid_cell*gfed2012ras$C_TEMF.9
TEMFemissions2012_10_gC_grid_cell <- emissions2012_10_gC_grid_cell*gfed2012ras$C_TEMF.10
TEMFemissions2012_11_gC_grid_cell <- emissions2012_11_gC_grid_cell*gfed2012ras$C_TEMF.11
TEMFemissions2012_12_gC_grid_cell <- emissions2012_12_gC_grid_cell*gfed2012ras$C_TEMF.12
TEMFemissions2013_1_gC_grid_cell <- emissions2013_1_gC_grid_cell*gfed2013ras$C_TEMF.1 #2013
TEMFemissions2013_2_gC_grid_cell <- emissions2013_2_gC_grid_cell*gfed2013ras$C_TEMF.2
TEMFemissions2013_3_gC_grid_cell <- emissions2013_3_gC_grid_cell*gfed2013ras$C_TEMF.3
TEMFemissions2013_4_gC_grid_cell <- emissions2013_4_gC_grid_cell*gfed2013ras$C_TEMF.4
TEMFemissions2013_5_gC_grid_cell <- emissions2013_5_gC_grid_cell*gfed2013ras$C_TEMF.5
TEMFemissions2013_6_gC_grid_cell <- emissions2013_6_gC_grid_cell*gfed2013ras$C_TEMF.6
TEMFemissions2013_7_gC_grid_cell <- emissions2013_7_gC_grid_cell*gfed2013ras$C_TEMF.7
TEMFemissions2013_8_gC_grid_cell <- emissions2013_8_gC_grid_cell*gfed2013ras$C_TEMF.8
TEMFemissions2013_9_gC_grid_cell <- emissions2013_9_gC_grid_cell*gfed2013ras$C_TEMF.9
TEMFemissions2013_10_gC_grid_cell <- emissions2013_10_gC_grid_cell*gfed2013ras$C_TEMF.10
TEMFemissions2013_11_gC_grid_cell <- emissions2013_11_gC_grid_cell*gfed2013ras$C_TEMF.11
TEMFemissions2013_12_gC_grid_cell <- emissions2013_12_gC_grid_cell*gfed2013ras$C_TEMF.12
TEMFemissions2014_1_gC_grid_cell <- emissions2014_1_gC_grid_cell*gfed2014ras$C_TEMF.1 #2014
TEMFemissions2014_2_gC_grid_cell <- emissions2014_2_gC_grid_cell*gfed2014ras$C_TEMF.2
TEMFemissions2014_3_gC_grid_cell <- emissions2014_3_gC_grid_cell*gfed2014ras$C_TEMF.3
TEMFemissions2014_4_gC_grid_cell <- emissions2014_4_gC_grid_cell*gfed2014ras$C_TEMF.4
TEMFemissions2014_5_gC_grid_cell <- emissions2014_5_gC_grid_cell*gfed2014ras$C_TEMF.5
TEMFemissions2014_6_gC_grid_cell <- emissions2014_6_gC_grid_cell*gfed2014ras$C_TEMF.6
TEMFemissions2014_7_gC_grid_cell <- emissions2014_7_gC_grid_cell*gfed2014ras$C_TEMF.7
TEMFemissions2014_8_gC_grid_cell <- emissions2014_8_gC_grid_cell*gfed2014ras$C_TEMF.8
TEMFemissions2014_9_gC_grid_cell <- emissions2014_9_gC_grid_cell*gfed2014ras$C_TEMF.9
TEMFemissions2014_10_gC_grid_cell <- emissions2014_10_gC_grid_cell*gfed2014ras$C_TEMF.10
TEMFemissions2014_11_gC_grid_cell <- emissions2014_11_gC_grid_cell*gfed2014ras$C_TEMF.11
TEMFemissions2014_12_gC_grid_cell <- emissions2014_12_gC_grid_cell*gfed2014ras$C_TEMF.12
TEMFemissions2015_1_gC_grid_cell <- emissions2015_1_gC_grid_cell*gfed2015ras$C_TEMF.1 #2015
TEMFemissions2015_2_gC_grid_cell <- emissions2015_2_gC_grid_cell*gfed2015ras$C_TEMF.2
TEMFemissions2015_3_gC_grid_cell <- emissions2015_3_gC_grid_cell*gfed2015ras$C_TEMF.3
TEMFemissions2015_4_gC_grid_cell <- emissions2015_4_gC_grid_cell*gfed2015ras$C_TEMF.4
TEMFemissions2015_5_gC_grid_cell <- emissions2015_5_gC_grid_cell*gfed2015ras$C_TEMF.5
TEMFemissions2015_6_gC_grid_cell <- emissions2015_6_gC_grid_cell*gfed2015ras$C_TEMF.6
TEMFemissions2015_7_gC_grid_cell <- emissions2015_7_gC_grid_cell*gfed2015ras$C_TEMF.7
TEMFemissions2015_8_gC_grid_cell <- emissions2015_8_gC_grid_cell*gfed2015ras$C_TEMF.8
TEMFemissions2015_9_gC_grid_cell <- emissions2015_9_gC_grid_cell*gfed2015ras$C_TEMF.9
TEMFemissions2015_10_gC_grid_cell <- emissions2015_10_gC_grid_cell*gfed2015ras$C_TEMF.10
TEMFemissions2015_11_gC_grid_cell <- emissions2015_11_gC_grid_cell*gfed2015ras$C_TEMF.11
TEMFemissions2015_12_gC_grid_cell <- emissions2015_12_gC_grid_cell*gfed2015ras$C_TEMF.12
TEMFemissions2016_1_gC_grid_cell <- emissions2016_1_gC_grid_cell*gfed2016ras$C_TEMF.1 #2016
TEMFemissions2016_2_gC_grid_cell <- emissions2016_2_gC_grid_cell*gfed2016ras$C_TEMF.2
TEMFemissions2016_3_gC_grid_cell <- emissions2016_3_gC_grid_cell*gfed2016ras$C_TEMF.3
TEMFemissions2016_4_gC_grid_cell <- emissions2016_4_gC_grid_cell*gfed2016ras$C_TEMF.4
TEMFemissions2016_5_gC_grid_cell <- emissions2016_5_gC_grid_cell*gfed2016ras$C_TEMF.5
TEMFemissions2016_6_gC_grid_cell <- emissions2016_6_gC_grid_cell*gfed2016ras$C_TEMF.6
TEMFemissions2016_7_gC_grid_cell <- emissions2016_7_gC_grid_cell*gfed2016ras$C_TEMF.7
TEMFemissions2016_8_gC_grid_cell <- emissions2016_8_gC_grid_cell*gfed2016ras$C_TEMF.8
TEMFemissions2016_9_gC_grid_cell <- emissions2016_9_gC_grid_cell*gfed2016ras$C_TEMF.9
TEMFemissions2016_10_gC_grid_cell <- emissions2016_10_gC_grid_cell*gfed2016ras$C_TEMF.10
TEMFemissions2016_11_gC_grid_cell <- emissions2016_11_gC_grid_cell*gfed2016ras$C_TEMF.11
TEMFemissions2016_12_gC_grid_cell <- emissions2016_12_gC_grid_cell*gfed2016ras$C_TEMF.12


#SAVA
SAVAemissions2012_1_gC_grid_cell <- emissions2012_1_gC_grid_cell*gfed2012ras$C_SAVA.1 #2012
SAVAemissions2012_2_gC_grid_cell <- emissions2012_2_gC_grid_cell*gfed2012ras$C_SAVA.2
SAVAemissions2012_3_gC_grid_cell <- emissions2012_3_gC_grid_cell*gfed2012ras$C_SAVA.3
SAVAemissions2012_4_gC_grid_cell <- emissions2012_4_gC_grid_cell*gfed2012ras$C_SAVA.4
SAVAemissions2012_5_gC_grid_cell <- emissions2012_5_gC_grid_cell*gfed2012ras$C_SAVA.5
SAVAemissions2012_6_gC_grid_cell <- emissions2012_6_gC_grid_cell*gfed2012ras$C_SAVA.6
SAVAemissions2012_7_gC_grid_cell <- emissions2012_7_gC_grid_cell*gfed2012ras$C_SAVA.7
SAVAemissions2012_8_gC_grid_cell <- emissions2012_8_gC_grid_cell*gfed2012ras$C_SAVA.8
SAVAemissions2012_9_gC_grid_cell <- emissions2012_9_gC_grid_cell*gfed2012ras$C_SAVA.9
SAVAemissions2012_10_gC_grid_cell <- emissions2012_10_gC_grid_cell*gfed2012ras$C_SAVA.10
SAVAemissions2012_11_gC_grid_cell <- emissions2012_11_gC_grid_cell*gfed2012ras$C_SAVA.11
SAVAemissions2012_12_gC_grid_cell <- emissions2012_12_gC_grid_cell*gfed2012ras$C_SAVA.12
SAVAemissions2013_1_gC_grid_cell <- emissions2013_1_gC_grid_cell*gfed2013ras$C_SAVA.1 #2013
SAVAemissions2013_2_gC_grid_cell <- emissions2013_2_gC_grid_cell*gfed2013ras$C_SAVA.2
SAVAemissions2013_3_gC_grid_cell <- emissions2013_3_gC_grid_cell*gfed2013ras$C_SAVA.3
SAVAemissions2013_4_gC_grid_cell <- emissions2013_4_gC_grid_cell*gfed2013ras$C_SAVA.4
SAVAemissions2013_5_gC_grid_cell <- emissions2013_5_gC_grid_cell*gfed2013ras$C_SAVA.5
SAVAemissions2013_6_gC_grid_cell <- emissions2013_6_gC_grid_cell*gfed2013ras$C_SAVA.6
SAVAemissions2013_7_gC_grid_cell <- emissions2013_7_gC_grid_cell*gfed2013ras$C_SAVA.7
SAVAemissions2013_8_gC_grid_cell <- emissions2013_8_gC_grid_cell*gfed2013ras$C_SAVA.8
SAVAemissions2013_9_gC_grid_cell <- emissions2013_9_gC_grid_cell*gfed2013ras$C_SAVA.9
SAVAemissions2013_10_gC_grid_cell <- emissions2013_10_gC_grid_cell*gfed2013ras$C_SAVA.10
SAVAemissions2013_11_gC_grid_cell <- emissions2013_11_gC_grid_cell*gfed2013ras$C_SAVA.11
SAVAemissions2013_12_gC_grid_cell <- emissions2013_12_gC_grid_cell*gfed2013ras$C_SAVA.12
SAVAemissions2014_1_gC_grid_cell <- emissions2014_1_gC_grid_cell*gfed2014ras$C_SAVA.1 #2014
SAVAemissions2014_2_gC_grid_cell <- emissions2014_2_gC_grid_cell*gfed2014ras$C_SAVA.2
SAVAemissions2014_3_gC_grid_cell <- emissions2014_3_gC_grid_cell*gfed2014ras$C_SAVA.3
SAVAemissions2014_4_gC_grid_cell <- emissions2014_4_gC_grid_cell*gfed2014ras$C_SAVA.4
SAVAemissions2014_5_gC_grid_cell <- emissions2014_5_gC_grid_cell*gfed2014ras$C_SAVA.5
SAVAemissions2014_6_gC_grid_cell <- emissions2014_6_gC_grid_cell*gfed2014ras$C_SAVA.6
SAVAemissions2014_7_gC_grid_cell <- emissions2014_7_gC_grid_cell*gfed2014ras$C_SAVA.7
SAVAemissions2014_8_gC_grid_cell <- emissions2014_8_gC_grid_cell*gfed2014ras$C_SAVA.8
SAVAemissions2014_9_gC_grid_cell <- emissions2014_9_gC_grid_cell*gfed2014ras$C_SAVA.9
SAVAemissions2014_10_gC_grid_cell <- emissions2014_10_gC_grid_cell*gfed2014ras$C_SAVA.10
SAVAemissions2014_11_gC_grid_cell <- emissions2014_11_gC_grid_cell*gfed2014ras$C_SAVA.11
SAVAemissions2014_12_gC_grid_cell <- emissions2014_12_gC_grid_cell*gfed2014ras$C_SAVA.12
SAVAemissions2015_1_gC_grid_cell <- emissions2015_1_gC_grid_cell*gfed2015ras$C_SAVA.1 #2015
SAVAemissions2015_2_gC_grid_cell <- emissions2015_2_gC_grid_cell*gfed2015ras$C_SAVA.2
SAVAemissions2015_3_gC_grid_cell <- emissions2015_3_gC_grid_cell*gfed2015ras$C_SAVA.3
SAVAemissions2015_4_gC_grid_cell <- emissions2015_4_gC_grid_cell*gfed2015ras$C_SAVA.4
SAVAemissions2015_5_gC_grid_cell <- emissions2015_5_gC_grid_cell*gfed2015ras$C_SAVA.5
SAVAemissions2015_6_gC_grid_cell <- emissions2015_6_gC_grid_cell*gfed2015ras$C_SAVA.6
SAVAemissions2015_7_gC_grid_cell <- emissions2015_7_gC_grid_cell*gfed2015ras$C_SAVA.7
SAVAemissions2015_8_gC_grid_cell <- emissions2015_8_gC_grid_cell*gfed2015ras$C_SAVA.8
SAVAemissions2015_9_gC_grid_cell <- emissions2015_9_gC_grid_cell*gfed2015ras$C_SAVA.9
SAVAemissions2015_10_gC_grid_cell <- emissions2015_10_gC_grid_cell*gfed2015ras$C_SAVA.10
SAVAemissions2015_11_gC_grid_cell <- emissions2015_11_gC_grid_cell*gfed2015ras$C_SAVA.11
SAVAemissions2015_12_gC_grid_cell <- emissions2015_12_gC_grid_cell*gfed2015ras$C_SAVA.12
SAVAemissions2016_1_gC_grid_cell <- emissions2016_1_gC_grid_cell*gfed2016ras$C_SAVA.1 #2016
SAVAemissions2016_2_gC_grid_cell <- emissions2016_2_gC_grid_cell*gfed2016ras$C_SAVA.2
SAVAemissions2016_3_gC_grid_cell <- emissions2016_3_gC_grid_cell*gfed2016ras$C_SAVA.3
SAVAemissions2016_4_gC_grid_cell <- emissions2016_4_gC_grid_cell*gfed2016ras$C_SAVA.4
SAVAemissions2016_5_gC_grid_cell <- emissions2016_5_gC_grid_cell*gfed2016ras$C_SAVA.5
SAVAemissions2016_6_gC_grid_cell <- emissions2016_6_gC_grid_cell*gfed2016ras$C_SAVA.6
SAVAemissions2016_7_gC_grid_cell <- emissions2016_7_gC_grid_cell*gfed2016ras$C_SAVA.7
SAVAemissions2016_8_gC_grid_cell <- emissions2016_8_gC_grid_cell*gfed2016ras$C_SAVA.8
SAVAemissions2016_9_gC_grid_cell <- emissions2016_9_gC_grid_cell*gfed2016ras$C_SAVA.9
SAVAemissions2016_10_gC_grid_cell <- emissions2016_10_gC_grid_cell*gfed2016ras$C_SAVA.10
SAVAemissions2016_11_gC_grid_cell <- emissions2016_11_gC_grid_cell*gfed2016ras$C_SAVA.11
SAVAemissions2016_12_gC_grid_cell <- emissions2016_12_gC_grid_cell*gfed2016ras$C_SAVA.12



#BORF
BORFemissions2012_1_gC_grid_cell <- emissions2012_1_gC_grid_cell*gfed2012ras$C_BORF.1 #2012
BORFemissions2012_2_gC_grid_cell <- emissions2012_2_gC_grid_cell*gfed2012ras$C_BORF.2
BORFemissions2012_3_gC_grid_cell <- emissions2012_3_gC_grid_cell*gfed2012ras$C_BORF.3
BORFemissions2012_4_gC_grid_cell <- emissions2012_4_gC_grid_cell*gfed2012ras$C_BORF.4
BORFemissions2012_5_gC_grid_cell <- emissions2012_5_gC_grid_cell*gfed2012ras$C_BORF.5
BORFemissions2012_6_gC_grid_cell <- emissions2012_6_gC_grid_cell*gfed2012ras$C_BORF.6
BORFemissions2012_7_gC_grid_cell <- emissions2012_7_gC_grid_cell*gfed2012ras$C_BORF.7
BORFemissions2012_8_gC_grid_cell <- emissions2012_8_gC_grid_cell*gfed2012ras$C_BORF.8
BORFemissions2012_9_gC_grid_cell <- emissions2012_9_gC_grid_cell*gfed2012ras$C_BORF.9
BORFemissions2012_10_gC_grid_cell <- emissions2012_10_gC_grid_cell*gfed2012ras$C_BORF.10
BORFemissions2012_11_gC_grid_cell <- emissions2012_11_gC_grid_cell*gfed2012ras$C_BORF.11
BORFemissions2012_12_gC_grid_cell <- emissions2012_12_gC_grid_cell*gfed2012ras$C_BORF.12
BORFemissions2013_1_gC_grid_cell <- emissions2013_1_gC_grid_cell*gfed2013ras$C_BORF.1 #2013
BORFemissions2013_2_gC_grid_cell <- emissions2013_2_gC_grid_cell*gfed2013ras$C_BORF.2
BORFemissions2013_3_gC_grid_cell <- emissions2013_3_gC_grid_cell*gfed2013ras$C_BORF.3
BORFemissions2013_4_gC_grid_cell <- emissions2013_4_gC_grid_cell*gfed2013ras$C_BORF.4
BORFemissions2013_5_gC_grid_cell <- emissions2013_5_gC_grid_cell*gfed2013ras$C_BORF.5
BORFemissions2013_6_gC_grid_cell <- emissions2013_6_gC_grid_cell*gfed2013ras$C_BORF.6
BORFemissions2013_7_gC_grid_cell <- emissions2013_7_gC_grid_cell*gfed2013ras$C_BORF.7
BORFemissions2013_8_gC_grid_cell <- emissions2013_8_gC_grid_cell*gfed2013ras$C_BORF.8
BORFemissions2013_9_gC_grid_cell <- emissions2013_9_gC_grid_cell*gfed2013ras$C_BORF.9
BORFemissions2013_10_gC_grid_cell <- emissions2013_10_gC_grid_cell*gfed2013ras$C_BORF.10
BORFemissions2013_11_gC_grid_cell <- emissions2013_11_gC_grid_cell*gfed2013ras$C_BORF.11
BORFemissions2013_12_gC_grid_cell <- emissions2013_12_gC_grid_cell*gfed2013ras$C_BORF.12
BORFemissions2014_1_gC_grid_cell <- emissions2014_1_gC_grid_cell*gfed2014ras$C_BORF.1 #2014
BORFemissions2014_2_gC_grid_cell <- emissions2014_2_gC_grid_cell*gfed2014ras$C_BORF.2
BORFemissions2014_3_gC_grid_cell <- emissions2014_3_gC_grid_cell*gfed2014ras$C_BORF.3
BORFemissions2014_4_gC_grid_cell <- emissions2014_4_gC_grid_cell*gfed2014ras$C_BORF.4
BORFemissions2014_5_gC_grid_cell <- emissions2014_5_gC_grid_cell*gfed2014ras$C_BORF.5
BORFemissions2014_6_gC_grid_cell <- emissions2014_6_gC_grid_cell*gfed2014ras$C_BORF.6
BORFemissions2014_7_gC_grid_cell <- emissions2014_7_gC_grid_cell*gfed2014ras$C_BORF.7
BORFemissions2014_8_gC_grid_cell <- emissions2014_8_gC_grid_cell*gfed2014ras$C_BORF.8
BORFemissions2014_9_gC_grid_cell <- emissions2014_9_gC_grid_cell*gfed2014ras$C_BORF.9
BORFemissions2014_10_gC_grid_cell <- emissions2014_10_gC_grid_cell*gfed2014ras$C_BORF.10
BORFemissions2014_11_gC_grid_cell <- emissions2014_11_gC_grid_cell*gfed2014ras$C_BORF.11
BORFemissions2014_12_gC_grid_cell <- emissions2014_12_gC_grid_cell*gfed2014ras$C_BORF.12
BORFemissions2015_1_gC_grid_cell <- emissions2015_1_gC_grid_cell*gfed2015ras$C_BORF.1 #2015
BORFemissions2015_2_gC_grid_cell <- emissions2015_2_gC_grid_cell*gfed2015ras$C_BORF.2
BORFemissions2015_3_gC_grid_cell <- emissions2015_3_gC_grid_cell*gfed2015ras$C_BORF.3
BORFemissions2015_4_gC_grid_cell <- emissions2015_4_gC_grid_cell*gfed2015ras$C_BORF.4
BORFemissions2015_5_gC_grid_cell <- emissions2015_5_gC_grid_cell*gfed2015ras$C_BORF.5
BORFemissions2015_6_gC_grid_cell <- emissions2015_6_gC_grid_cell*gfed2015ras$C_BORF.6
BORFemissions2015_7_gC_grid_cell <- emissions2015_7_gC_grid_cell*gfed2015ras$C_BORF.7
BORFemissions2015_8_gC_grid_cell <- emissions2015_8_gC_grid_cell*gfed2015ras$C_BORF.8
BORFemissions2015_9_gC_grid_cell <- emissions2015_9_gC_grid_cell*gfed2015ras$C_BORF.9
BORFemissions2015_10_gC_grid_cell <- emissions2015_10_gC_grid_cell*gfed2015ras$C_BORF.10
BORFemissions2015_11_gC_grid_cell <- emissions2015_11_gC_grid_cell*gfed2015ras$C_BORF.11
BORFemissions2015_12_gC_grid_cell <- emissions2015_12_gC_grid_cell*gfed2015ras$C_BORF.12
BORFemissions2016_1_gC_grid_cell <- emissions2016_1_gC_grid_cell*gfed2016ras$C_BORF.1 #2016
BORFemissions2016_2_gC_grid_cell <- emissions2016_2_gC_grid_cell*gfed2016ras$C_BORF.2
BORFemissions2016_3_gC_grid_cell <- emissions2016_3_gC_grid_cell*gfed2016ras$C_BORF.3
BORFemissions2016_4_gC_grid_cell <- emissions2016_4_gC_grid_cell*gfed2016ras$C_BORF.4
BORFemissions2016_5_gC_grid_cell <- emissions2016_5_gC_grid_cell*gfed2016ras$C_BORF.5
BORFemissions2016_6_gC_grid_cell <- emissions2016_6_gC_grid_cell*gfed2016ras$C_BORF.6
BORFemissions2016_7_gC_grid_cell <- emissions2016_7_gC_grid_cell*gfed2016ras$C_BORF.7
BORFemissions2016_8_gC_grid_cell <- emissions2016_8_gC_grid_cell*gfed2016ras$C_BORF.8
BORFemissions2016_9_gC_grid_cell <- emissions2016_9_gC_grid_cell*gfed2016ras$C_BORF.9
BORFemissions2016_10_gC_grid_cell <- emissions2016_10_gC_grid_cell*gfed2016ras$C_BORF.10
BORFemissions2016_11_gC_grid_cell <- emissions2016_11_gC_grid_cell*gfed2016ras$C_BORF.11
BORFemissions2016_12_gC_grid_cell <- emissions2016_12_gC_grid_cell*gfed2016ras$C_BORF.12

#AGRI
AGRIemissions2012_1_gC_grid_cell <- emissions2012_1_gC_grid_cell*gfed2012ras$C_AGRI.1 #2012
AGRIemissions2012_2_gC_grid_cell <- emissions2012_2_gC_grid_cell*gfed2012ras$C_AGRI.2
AGRIemissions2012_3_gC_grid_cell <- emissions2012_3_gC_grid_cell*gfed2012ras$C_AGRI.3
AGRIemissions2012_4_gC_grid_cell <- emissions2012_4_gC_grid_cell*gfed2012ras$C_AGRI.4
AGRIemissions2012_5_gC_grid_cell <- emissions2012_5_gC_grid_cell*gfed2012ras$C_AGRI.5
AGRIemissions2012_6_gC_grid_cell <- emissions2012_6_gC_grid_cell*gfed2012ras$C_AGRI.6
AGRIemissions2012_7_gC_grid_cell <- emissions2012_7_gC_grid_cell*gfed2012ras$C_AGRI.7
AGRIemissions2012_8_gC_grid_cell <- emissions2012_8_gC_grid_cell*gfed2012ras$C_AGRI.8
AGRIemissions2012_9_gC_grid_cell <- emissions2012_9_gC_grid_cell*gfed2012ras$C_AGRI.9
AGRIemissions2012_10_gC_grid_cell <- emissions2012_10_gC_grid_cell*gfed2012ras$C_AGRI.10
AGRIemissions2012_11_gC_grid_cell <- emissions2012_11_gC_grid_cell*gfed2012ras$C_AGRI.11
AGRIemissions2012_12_gC_grid_cell <- emissions2012_12_gC_grid_cell*gfed2012ras$C_AGRI.12
AGRIemissions2013_1_gC_grid_cell <- emissions2013_1_gC_grid_cell*gfed2013ras$C_AGRI.1 #2013
AGRIemissions2013_2_gC_grid_cell <- emissions2013_2_gC_grid_cell*gfed2013ras$C_AGRI.2
AGRIemissions2013_3_gC_grid_cell <- emissions2013_3_gC_grid_cell*gfed2013ras$C_AGRI.3
AGRIemissions2013_4_gC_grid_cell <- emissions2013_4_gC_grid_cell*gfed2013ras$C_AGRI.4
AGRIemissions2013_5_gC_grid_cell <- emissions2013_5_gC_grid_cell*gfed2013ras$C_AGRI.5
AGRIemissions2013_6_gC_grid_cell <- emissions2013_6_gC_grid_cell*gfed2013ras$C_AGRI.6
AGRIemissions2013_7_gC_grid_cell <- emissions2013_7_gC_grid_cell*gfed2013ras$C_AGRI.7
AGRIemissions2013_8_gC_grid_cell <- emissions2013_8_gC_grid_cell*gfed2013ras$C_AGRI.8
AGRIemissions2013_9_gC_grid_cell <- emissions2013_9_gC_grid_cell*gfed2013ras$C_AGRI.9
AGRIemissions2013_10_gC_grid_cell <- emissions2013_10_gC_grid_cell*gfed2013ras$C_AGRI.10
AGRIemissions2013_11_gC_grid_cell <- emissions2013_11_gC_grid_cell*gfed2013ras$C_AGRI.11
AGRIemissions2013_12_gC_grid_cell <- emissions2013_12_gC_grid_cell*gfed2013ras$C_AGRI.12
AGRIemissions2014_1_gC_grid_cell <- emissions2014_1_gC_grid_cell*gfed2014ras$C_AGRI.1 #2014
AGRIemissions2014_2_gC_grid_cell <- emissions2014_2_gC_grid_cell*gfed2014ras$C_AGRI.2
AGRIemissions2014_3_gC_grid_cell <- emissions2014_3_gC_grid_cell*gfed2014ras$C_AGRI.3
AGRIemissions2014_4_gC_grid_cell <- emissions2014_4_gC_grid_cell*gfed2014ras$C_AGRI.4
AGRIemissions2014_5_gC_grid_cell <- emissions2014_5_gC_grid_cell*gfed2014ras$C_AGRI.5
AGRIemissions2014_6_gC_grid_cell <- emissions2014_6_gC_grid_cell*gfed2014ras$C_AGRI.6
AGRIemissions2014_7_gC_grid_cell <- emissions2014_7_gC_grid_cell*gfed2014ras$C_AGRI.7
AGRIemissions2014_8_gC_grid_cell <- emissions2014_8_gC_grid_cell*gfed2014ras$C_AGRI.8
AGRIemissions2014_9_gC_grid_cell <- emissions2014_9_gC_grid_cell*gfed2014ras$C_AGRI.9
AGRIemissions2014_10_gC_grid_cell <- emissions2014_10_gC_grid_cell*gfed2014ras$C_AGRI.10
AGRIemissions2014_11_gC_grid_cell <- emissions2014_11_gC_grid_cell*gfed2014ras$C_AGRI.11
AGRIemissions2014_12_gC_grid_cell <- emissions2014_12_gC_grid_cell*gfed2014ras$C_AGRI.12
AGRIemissions2015_1_gC_grid_cell <- emissions2015_1_gC_grid_cell*gfed2015ras$C_AGRI.1 #2015
AGRIemissions2015_2_gC_grid_cell <- emissions2015_2_gC_grid_cell*gfed2015ras$C_AGRI.2
AGRIemissions2015_3_gC_grid_cell <- emissions2015_3_gC_grid_cell*gfed2015ras$C_AGRI.3
AGRIemissions2015_4_gC_grid_cell <- emissions2015_4_gC_grid_cell*gfed2015ras$C_AGRI.4
AGRIemissions2015_5_gC_grid_cell <- emissions2015_5_gC_grid_cell*gfed2015ras$C_AGRI.5
AGRIemissions2015_6_gC_grid_cell <- emissions2015_6_gC_grid_cell*gfed2015ras$C_AGRI.6
AGRIemissions2015_7_gC_grid_cell <- emissions2015_7_gC_grid_cell*gfed2015ras$C_AGRI.7
AGRIemissions2015_8_gC_grid_cell <- emissions2015_8_gC_grid_cell*gfed2015ras$C_AGRI.8
AGRIemissions2015_9_gC_grid_cell <- emissions2015_9_gC_grid_cell*gfed2015ras$C_AGRI.9
AGRIemissions2015_10_gC_grid_cell <- emissions2015_10_gC_grid_cell*gfed2015ras$C_AGRI.10
AGRIemissions2015_11_gC_grid_cell <- emissions2015_11_gC_grid_cell*gfed2015ras$C_AGRI.11
AGRIemissions2015_12_gC_grid_cell <- emissions2015_12_gC_grid_cell*gfed2015ras$C_AGRI.12
AGRIemissions2016_1_gC_grid_cell <- emissions2016_1_gC_grid_cell*gfed2016ras$C_AGRI.1 #2016
AGRIemissions2016_2_gC_grid_cell <- emissions2016_2_gC_grid_cell*gfed2016ras$C_AGRI.2
AGRIemissions2016_3_gC_grid_cell <- emissions2016_3_gC_grid_cell*gfed2016ras$C_AGRI.3
AGRIemissions2016_4_gC_grid_cell <- emissions2016_4_gC_grid_cell*gfed2016ras$C_AGRI.4
AGRIemissions2016_5_gC_grid_cell <- emissions2016_5_gC_grid_cell*gfed2016ras$C_AGRI.5
AGRIemissions2016_6_gC_grid_cell <- emissions2016_6_gC_grid_cell*gfed2016ras$C_AGRI.6
AGRIemissions2016_7_gC_grid_cell <- emissions2016_7_gC_grid_cell*gfed2016ras$C_AGRI.7
AGRIemissions2016_8_gC_grid_cell <- emissions2016_8_gC_grid_cell*gfed2016ras$C_AGRI.8
AGRIemissions2016_9_gC_grid_cell <- emissions2016_9_gC_grid_cell*gfed2016ras$C_AGRI.9
AGRIemissions2016_10_gC_grid_cell <- emissions2016_10_gC_grid_cell*gfed2016ras$C_AGRI.10
AGRIemissions2016_11_gC_grid_cell <- emissions2016_11_gC_grid_cell*gfed2016ras$C_AGRI.11
AGRIemissions2016_12_gC_grid_cell <- emissions2016_12_gC_grid_cell*gfed2016ras$C_AGRI.12

#DEFO
DEFOemissions2012_1_gC_grid_cell <- emissions2012_1_gC_grid_cell*gfed2012ras$C_DEFO.1 #2012
DEFOemissions2012_2_gC_grid_cell <- emissions2012_2_gC_grid_cell*gfed2012ras$C_DEFO.2
DEFOemissions2012_3_gC_grid_cell <- emissions2012_3_gC_grid_cell*gfed2012ras$C_DEFO.3
DEFOemissions2012_4_gC_grid_cell <- emissions2012_4_gC_grid_cell*gfed2012ras$C_DEFO.4
DEFOemissions2012_5_gC_grid_cell <- emissions2012_5_gC_grid_cell*gfed2012ras$C_DEFO.5
DEFOemissions2012_6_gC_grid_cell <- emissions2012_6_gC_grid_cell*gfed2012ras$C_DEFO.6
DEFOemissions2012_7_gC_grid_cell <- emissions2012_7_gC_grid_cell*gfed2012ras$C_DEFO.7
DEFOemissions2012_8_gC_grid_cell <- emissions2012_8_gC_grid_cell*gfed2012ras$C_DEFO.8
DEFOemissions2012_9_gC_grid_cell <- emissions2012_9_gC_grid_cell*gfed2012ras$C_DEFO.9
DEFOemissions2012_10_gC_grid_cell <- emissions2012_10_gC_grid_cell*gfed2012ras$C_DEFO.10
DEFOemissions2012_11_gC_grid_cell <- emissions2012_11_gC_grid_cell*gfed2012ras$C_DEFO.11
DEFOemissions2012_12_gC_grid_cell <- emissions2012_12_gC_grid_cell*gfed2012ras$C_DEFO.12
DEFOemissions2013_1_gC_grid_cell <- emissions2013_1_gC_grid_cell*gfed2013ras$C_DEFO.1 #2013
DEFOemissions2013_2_gC_grid_cell <- emissions2013_2_gC_grid_cell*gfed2013ras$C_DEFO.2
DEFOemissions2013_3_gC_grid_cell <- emissions2013_3_gC_grid_cell*gfed2013ras$C_DEFO.3
DEFOemissions2013_4_gC_grid_cell <- emissions2013_4_gC_grid_cell*gfed2013ras$C_DEFO.4
DEFOemissions2013_5_gC_grid_cell <- emissions2013_5_gC_grid_cell*gfed2013ras$C_DEFO.5
DEFOemissions2013_6_gC_grid_cell <- emissions2013_6_gC_grid_cell*gfed2013ras$C_DEFO.6
DEFOemissions2013_7_gC_grid_cell <- emissions2013_7_gC_grid_cell*gfed2013ras$C_DEFO.7
DEFOemissions2013_8_gC_grid_cell <- emissions2013_8_gC_grid_cell*gfed2013ras$C_DEFO.8
DEFOemissions2013_9_gC_grid_cell <- emissions2013_9_gC_grid_cell*gfed2013ras$C_DEFO.9
DEFOemissions2013_10_gC_grid_cell <- emissions2013_10_gC_grid_cell*gfed2013ras$C_DEFO.10
DEFOemissions2013_11_gC_grid_cell <- emissions2013_11_gC_grid_cell*gfed2013ras$C_DEFO.11
DEFOemissions2013_12_gC_grid_cell <- emissions2013_12_gC_grid_cell*gfed2013ras$C_DEFO.12
DEFOemissions2014_1_gC_grid_cell <- emissions2014_1_gC_grid_cell*gfed2014ras$C_DEFO.1 #2014
DEFOemissions2014_2_gC_grid_cell <- emissions2014_2_gC_grid_cell*gfed2014ras$C_DEFO.2
DEFOemissions2014_3_gC_grid_cell <- emissions2014_3_gC_grid_cell*gfed2014ras$C_DEFO.3
DEFOemissions2014_4_gC_grid_cell <- emissions2014_4_gC_grid_cell*gfed2014ras$C_DEFO.4
DEFOemissions2014_5_gC_grid_cell <- emissions2014_5_gC_grid_cell*gfed2014ras$C_DEFO.5
DEFOemissions2014_6_gC_grid_cell <- emissions2014_6_gC_grid_cell*gfed2014ras$C_DEFO.6
DEFOemissions2014_7_gC_grid_cell <- emissions2014_7_gC_grid_cell*gfed2014ras$C_DEFO.7
DEFOemissions2014_8_gC_grid_cell <- emissions2014_8_gC_grid_cell*gfed2014ras$C_DEFO.8
DEFOemissions2014_9_gC_grid_cell <- emissions2014_9_gC_grid_cell*gfed2014ras$C_DEFO.9
DEFOemissions2014_10_gC_grid_cell <- emissions2014_10_gC_grid_cell*gfed2014ras$C_DEFO.10
DEFOemissions2014_11_gC_grid_cell <- emissions2014_11_gC_grid_cell*gfed2014ras$C_DEFO.11
DEFOemissions2014_12_gC_grid_cell <- emissions2014_12_gC_grid_cell*gfed2014ras$C_DEFO.12
DEFOemissions2015_1_gC_grid_cell <- emissions2015_1_gC_grid_cell*gfed2015ras$C_DEFO.1 #2015
DEFOemissions2015_2_gC_grid_cell <- emissions2015_2_gC_grid_cell*gfed2015ras$C_DEFO.2
DEFOemissions2015_3_gC_grid_cell <- emissions2015_3_gC_grid_cell*gfed2015ras$C_DEFO.3
DEFOemissions2015_4_gC_grid_cell <- emissions2015_4_gC_grid_cell*gfed2015ras$C_DEFO.4
DEFOemissions2015_5_gC_grid_cell <- emissions2015_5_gC_grid_cell*gfed2015ras$C_DEFO.5
DEFOemissions2015_6_gC_grid_cell <- emissions2015_6_gC_grid_cell*gfed2015ras$C_DEFO.6
DEFOemissions2015_7_gC_grid_cell <- emissions2015_7_gC_grid_cell*gfed2015ras$C_DEFO.7
DEFOemissions2015_8_gC_grid_cell <- emissions2015_8_gC_grid_cell*gfed2015ras$C_DEFO.8
DEFOemissions2015_9_gC_grid_cell <- emissions2015_9_gC_grid_cell*gfed2015ras$C_DEFO.9
DEFOemissions2015_10_gC_grid_cell <- emissions2015_10_gC_grid_cell*gfed2015ras$C_DEFO.10
DEFOemissions2015_11_gC_grid_cell <- emissions2015_11_gC_grid_cell*gfed2015ras$C_DEFO.11
DEFOemissions2015_12_gC_grid_cell <- emissions2015_12_gC_grid_cell*gfed2015ras$C_DEFO.12
DEFOemissions2016_1_gC_grid_cell <- emissions2016_1_gC_grid_cell*gfed2016ras$C_DEFO.1 #2016
DEFOemissions2016_2_gC_grid_cell <- emissions2016_2_gC_grid_cell*gfed2016ras$C_DEFO.2
DEFOemissions2016_3_gC_grid_cell <- emissions2016_3_gC_grid_cell*gfed2016ras$C_DEFO.3
DEFOemissions2016_4_gC_grid_cell <- emissions2016_4_gC_grid_cell*gfed2016ras$C_DEFO.4
DEFOemissions2016_5_gC_grid_cell <- emissions2016_5_gC_grid_cell*gfed2016ras$C_DEFO.5
DEFOemissions2016_6_gC_grid_cell <- emissions2016_6_gC_grid_cell*gfed2016ras$C_DEFO.6
DEFOemissions2016_7_gC_grid_cell <- emissions2016_7_gC_grid_cell*gfed2016ras$C_DEFO.7
DEFOemissions2016_8_gC_grid_cell <- emissions2016_8_gC_grid_cell*gfed2016ras$C_DEFO.8
DEFOemissions2016_9_gC_grid_cell <- emissions2016_9_gC_grid_cell*gfed2016ras$C_DEFO.9
DEFOemissions2016_10_gC_grid_cell <- emissions2016_10_gC_grid_cell*gfed2016ras$C_DEFO.10
DEFOemissions2016_11_gC_grid_cell <- emissions2016_11_gC_grid_cell*gfed2016ras$C_DEFO.11
DEFOemissions2016_12_gC_grid_cell <- emissions2016_12_gC_grid_cell*gfed2016ras$C_DEFO.12


#Sum monthly emissions----
##PEAT----
PEATemissions2012 <- (PEATemissions2012_1_gC_grid_cell+
                        PEATemissions2012_2_gC_grid_cell+
                        PEATemissions2012_3_gC_grid_cell+
                        PEATemissions2012_4_gC_grid_cell+
                        PEATemissions2012_5_gC_grid_cell+
                        PEATemissions2012_6_gC_grid_cell+
                        PEATemissions2012_7_gC_grid_cell+
                        PEATemissions2012_8_gC_grid_cell+
                        PEATemissions2012_9_gC_grid_cell+
                        PEATemissions2012_10_gC_grid_cell+
                        PEATemissions2012_11_gC_grid_cell+
                        PEATemissions2012_12_gC_grid_cell)
PEATemissions2013 <- (PEATemissions2013_1_gC_grid_cell+
                        PEATemissions2013_2_gC_grid_cell+
                        PEATemissions2013_3_gC_grid_cell+
                        PEATemissions2013_4_gC_grid_cell+
                        PEATemissions2013_5_gC_grid_cell+
                        PEATemissions2013_6_gC_grid_cell+
                        PEATemissions2013_7_gC_grid_cell+
                        PEATemissions2013_8_gC_grid_cell+
                        PEATemissions2013_9_gC_grid_cell+
                        PEATemissions2013_10_gC_grid_cell+
                        PEATemissions2013_11_gC_grid_cell+
                        PEATemissions2013_12_gC_grid_cell)
PEATemissions2014 <- (PEATemissions2014_1_gC_grid_cell+
                        PEATemissions2014_2_gC_grid_cell+
                        PEATemissions2014_3_gC_grid_cell+
                        PEATemissions2014_4_gC_grid_cell+
                        PEATemissions2014_5_gC_grid_cell+
                        PEATemissions2014_6_gC_grid_cell+
                        PEATemissions2014_7_gC_grid_cell+
                        PEATemissions2014_8_gC_grid_cell+
                        PEATemissions2014_9_gC_grid_cell+
                        PEATemissions2014_10_gC_grid_cell+
                        PEATemissions2014_11_gC_grid_cell+
                        PEATemissions2014_12_gC_grid_cell)
PEATemissions2015 <- (PEATemissions2015_1_gC_grid_cell+
                        PEATemissions2015_2_gC_grid_cell+
                        PEATemissions2015_3_gC_grid_cell+
                        PEATemissions2015_4_gC_grid_cell+
                        PEATemissions2015_5_gC_grid_cell+
                        PEATemissions2015_6_gC_grid_cell+
                        PEATemissions2015_7_gC_grid_cell+
                        PEATemissions2015_8_gC_grid_cell+
                        PEATemissions2015_9_gC_grid_cell+
                        PEATemissions2015_10_gC_grid_cell+
                        PEATemissions2015_11_gC_grid_cell+
                        PEATemissions2015_12_gC_grid_cell)
PEATemissions2016 <- (PEATemissions2016_1_gC_grid_cell+
                        PEATemissions2016_2_gC_grid_cell+
                        PEATemissions2016_3_gC_grid_cell+
                        PEATemissions2016_4_gC_grid_cell+
                        PEATemissions2016_5_gC_grid_cell+
                        PEATemissions2016_6_gC_grid_cell+
                        PEATemissions2016_7_gC_grid_cell+
                        PEATemissions2016_8_gC_grid_cell+
                        PEATemissions2016_9_gC_grid_cell+
                        PEATemissions2016_10_gC_grid_cell+
                        PEATemissions2016_11_gC_grid_cell+
                        PEATemissions2016_12_gC_grid_cell)
##BORF----
BORFemissions2012 <- (BORFemissions2012_1_gC_grid_cell+
                        BORFemissions2012_2_gC_grid_cell+
                        BORFemissions2012_3_gC_grid_cell+
                        BORFemissions2012_4_gC_grid_cell+
                        BORFemissions2012_5_gC_grid_cell+
                        BORFemissions2012_6_gC_grid_cell+
                        BORFemissions2012_7_gC_grid_cell+
                        BORFemissions2012_8_gC_grid_cell+
                        BORFemissions2012_9_gC_grid_cell+
                        BORFemissions2012_10_gC_grid_cell+
                        BORFemissions2012_11_gC_grid_cell+
                        BORFemissions2012_12_gC_grid_cell)
BORFemissions2013 <- (BORFemissions2013_1_gC_grid_cell+
                        BORFemissions2013_2_gC_grid_cell+
                        BORFemissions2013_3_gC_grid_cell+
                        BORFemissions2013_4_gC_grid_cell+
                        BORFemissions2013_5_gC_grid_cell+
                        BORFemissions2013_6_gC_grid_cell+
                        BORFemissions2013_7_gC_grid_cell+
                        BORFemissions2013_8_gC_grid_cell+
                        BORFemissions2013_9_gC_grid_cell+
                        BORFemissions2013_10_gC_grid_cell+
                        BORFemissions2013_11_gC_grid_cell+
                        BORFemissions2013_12_gC_grid_cell)
BORFemissions2014 <- (BORFemissions2014_1_gC_grid_cell+
                        BORFemissions2014_2_gC_grid_cell+
                        BORFemissions2014_3_gC_grid_cell+
                        BORFemissions2014_4_gC_grid_cell+
                        BORFemissions2014_5_gC_grid_cell+
                        BORFemissions2014_6_gC_grid_cell+
                        BORFemissions2014_7_gC_grid_cell+
                        BORFemissions2014_8_gC_grid_cell+
                        BORFemissions2014_9_gC_grid_cell+
                        BORFemissions2014_10_gC_grid_cell+
                        BORFemissions2014_11_gC_grid_cell+
                        BORFemissions2014_12_gC_grid_cell)
BORFemissions2015 <- (BORFemissions2015_1_gC_grid_cell+
                        BORFemissions2015_2_gC_grid_cell+
                        BORFemissions2015_3_gC_grid_cell+
                        BORFemissions2015_4_gC_grid_cell+
                        BORFemissions2015_5_gC_grid_cell+
                        BORFemissions2015_6_gC_grid_cell+
                        BORFemissions2015_7_gC_grid_cell+
                        BORFemissions2015_8_gC_grid_cell+
                        BORFemissions2015_9_gC_grid_cell+
                        BORFemissions2015_10_gC_grid_cell+
                        BORFemissions2015_11_gC_grid_cell+
                        BORFemissions2015_12_gC_grid_cell)
BORFemissions2016 <- (BORFemissions2016_1_gC_grid_cell+
                        BORFemissions2016_2_gC_grid_cell+
                        BORFemissions2016_3_gC_grid_cell+
                        BORFemissions2016_4_gC_grid_cell+
                        BORFemissions2016_5_gC_grid_cell+
                        BORFemissions2016_6_gC_grid_cell+
                        BORFemissions2016_7_gC_grid_cell+
                        BORFemissions2016_8_gC_grid_cell+
                        BORFemissions2016_9_gC_grid_cell+
                        BORFemissions2016_10_gC_grid_cell+
                        BORFemissions2016_11_gC_grid_cell+
                        BORFemissions2016_12_gC_grid_cell)
##SAVA----
SAVAemissions2012 <- (SAVAemissions2012_1_gC_grid_cell+
                        SAVAemissions2012_2_gC_grid_cell+
                        SAVAemissions2012_3_gC_grid_cell+
                        SAVAemissions2012_4_gC_grid_cell+
                        SAVAemissions2012_5_gC_grid_cell+
                        SAVAemissions2012_6_gC_grid_cell+
                        SAVAemissions2012_7_gC_grid_cell+
                        SAVAemissions2012_8_gC_grid_cell+
                        SAVAemissions2012_9_gC_grid_cell+
                        SAVAemissions2012_10_gC_grid_cell+
                        SAVAemissions2012_11_gC_grid_cell+
                        SAVAemissions2012_12_gC_grid_cell)
SAVAemissions2013 <- (SAVAemissions2013_1_gC_grid_cell+
                        SAVAemissions2013_2_gC_grid_cell+
                        SAVAemissions2013_3_gC_grid_cell+
                        SAVAemissions2013_4_gC_grid_cell+
                        SAVAemissions2013_5_gC_grid_cell+
                        SAVAemissions2013_6_gC_grid_cell+
                        SAVAemissions2013_7_gC_grid_cell+
                        SAVAemissions2013_8_gC_grid_cell+
                        SAVAemissions2013_9_gC_grid_cell+
                        SAVAemissions2013_10_gC_grid_cell+
                        SAVAemissions2013_11_gC_grid_cell+
                        SAVAemissions2013_12_gC_grid_cell)
SAVAemissions2014 <- (SAVAemissions2014_1_gC_grid_cell+
                        SAVAemissions2014_2_gC_grid_cell+
                        SAVAemissions2014_3_gC_grid_cell+
                        SAVAemissions2014_4_gC_grid_cell+
                        SAVAemissions2014_5_gC_grid_cell+
                        SAVAemissions2014_6_gC_grid_cell+
                        SAVAemissions2014_7_gC_grid_cell+
                        SAVAemissions2014_8_gC_grid_cell+
                        SAVAemissions2014_9_gC_grid_cell+
                        SAVAemissions2014_10_gC_grid_cell+
                        SAVAemissions2014_11_gC_grid_cell+
                        SAVAemissions2014_12_gC_grid_cell)
SAVAemissions2015 <- (SAVAemissions2015_1_gC_grid_cell+
                        SAVAemissions2015_2_gC_grid_cell+
                        SAVAemissions2015_3_gC_grid_cell+
                        SAVAemissions2015_4_gC_grid_cell+
                        SAVAemissions2015_5_gC_grid_cell+
                        SAVAemissions2015_6_gC_grid_cell+
                        SAVAemissions2015_7_gC_grid_cell+
                        SAVAemissions2015_8_gC_grid_cell+
                        SAVAemissions2015_9_gC_grid_cell+
                        SAVAemissions2015_10_gC_grid_cell+
                        SAVAemissions2015_11_gC_grid_cell+
                        SAVAemissions2015_12_gC_grid_cell)
SAVAemissions2016 <- (SAVAemissions2016_1_gC_grid_cell+
                        SAVAemissions2016_2_gC_grid_cell+
                        SAVAemissions2016_3_gC_grid_cell+
                        SAVAemissions2016_4_gC_grid_cell+
                        SAVAemissions2016_5_gC_grid_cell+
                        SAVAemissions2016_6_gC_grid_cell+
                        SAVAemissions2016_7_gC_grid_cell+
                        SAVAemissions2016_8_gC_grid_cell+
                        SAVAemissions2016_9_gC_grid_cell+
                        SAVAemissions2016_10_gC_grid_cell+
                        SAVAemissions2016_11_gC_grid_cell+
                        SAVAemissions2016_12_gC_grid_cell)

##TEMF----
TEMFemissions2012 <- (TEMFemissions2012_1_gC_grid_cell+
                        TEMFemissions2012_2_gC_grid_cell+
                        TEMFemissions2012_3_gC_grid_cell+
                        TEMFemissions2012_4_gC_grid_cell+
                        TEMFemissions2012_5_gC_grid_cell+
                        TEMFemissions2012_6_gC_grid_cell+
                        TEMFemissions2012_7_gC_grid_cell+
                        TEMFemissions2012_8_gC_grid_cell+
                        TEMFemissions2012_9_gC_grid_cell+
                        TEMFemissions2012_10_gC_grid_cell+
                        TEMFemissions2012_11_gC_grid_cell+
                        TEMFemissions2012_12_gC_grid_cell)
TEMFemissions2013 <- (TEMFemissions2013_1_gC_grid_cell+
                        TEMFemissions2013_2_gC_grid_cell+
                        TEMFemissions2013_3_gC_grid_cell+
                        TEMFemissions2013_4_gC_grid_cell+
                        TEMFemissions2013_5_gC_grid_cell+
                        TEMFemissions2013_6_gC_grid_cell+
                        TEMFemissions2013_7_gC_grid_cell+
                        TEMFemissions2013_8_gC_grid_cell+
                        TEMFemissions2013_9_gC_grid_cell+
                        TEMFemissions2013_10_gC_grid_cell+
                        TEMFemissions2013_11_gC_grid_cell+
                        TEMFemissions2013_12_gC_grid_cell)
TEMFemissions2014 <- (TEMFemissions2014_1_gC_grid_cell+
                        TEMFemissions2014_2_gC_grid_cell+
                        TEMFemissions2014_3_gC_grid_cell+
                        TEMFemissions2014_4_gC_grid_cell+
                        TEMFemissions2014_5_gC_grid_cell+
                        TEMFemissions2014_6_gC_grid_cell+
                        TEMFemissions2014_7_gC_grid_cell+
                        TEMFemissions2014_8_gC_grid_cell+
                        TEMFemissions2014_9_gC_grid_cell+
                        TEMFemissions2014_10_gC_grid_cell+
                        TEMFemissions2014_11_gC_grid_cell+
                        TEMFemissions2014_12_gC_grid_cell)
TEMFemissions2015 <- (TEMFemissions2015_1_gC_grid_cell+
                        TEMFemissions2015_2_gC_grid_cell+
                        TEMFemissions2015_3_gC_grid_cell+
                        TEMFemissions2015_4_gC_grid_cell+
                        TEMFemissions2015_5_gC_grid_cell+
                        TEMFemissions2015_6_gC_grid_cell+
                        TEMFemissions2015_7_gC_grid_cell+
                        TEMFemissions2015_8_gC_grid_cell+
                        TEMFemissions2015_9_gC_grid_cell+
                        TEMFemissions2015_10_gC_grid_cell+
                        TEMFemissions2015_11_gC_grid_cell+
                        TEMFemissions2015_12_gC_grid_cell)
TEMFemissions2016 <- (TEMFemissions2016_1_gC_grid_cell+
                        TEMFemissions2016_2_gC_grid_cell+
                        TEMFemissions2016_3_gC_grid_cell+
                        TEMFemissions2016_4_gC_grid_cell+
                        TEMFemissions2016_5_gC_grid_cell+
                        TEMFemissions2016_6_gC_grid_cell+
                        TEMFemissions2016_7_gC_grid_cell+
                        TEMFemissions2016_8_gC_grid_cell+
                        TEMFemissions2016_9_gC_grid_cell+
                        TEMFemissions2016_10_gC_grid_cell+
                        TEMFemissions2016_11_gC_grid_cell+
                        TEMFemissions2016_12_gC_grid_cell)

##AGRI----
AGRIemissions2012 <- (AGRIemissions2012_1_gC_grid_cell+
                        AGRIemissions2012_2_gC_grid_cell+
                        AGRIemissions2012_3_gC_grid_cell+
                        AGRIemissions2012_4_gC_grid_cell+
                        AGRIemissions2012_5_gC_grid_cell+
                        AGRIemissions2012_6_gC_grid_cell+
                        AGRIemissions2012_7_gC_grid_cell+
                        AGRIemissions2012_8_gC_grid_cell+
                        AGRIemissions2012_9_gC_grid_cell+
                        AGRIemissions2012_10_gC_grid_cell+
                        AGRIemissions2012_11_gC_grid_cell+
                        AGRIemissions2012_12_gC_grid_cell)
AGRIemissions2013 <- (AGRIemissions2013_1_gC_grid_cell+
                        AGRIemissions2013_2_gC_grid_cell+
                        AGRIemissions2013_3_gC_grid_cell+
                        AGRIemissions2013_4_gC_grid_cell+
                        AGRIemissions2013_5_gC_grid_cell+
                        AGRIemissions2013_6_gC_grid_cell+
                        AGRIemissions2013_7_gC_grid_cell+
                        AGRIemissions2013_8_gC_grid_cell+
                        AGRIemissions2013_9_gC_grid_cell+
                        AGRIemissions2013_10_gC_grid_cell+
                        AGRIemissions2013_11_gC_grid_cell+
                        AGRIemissions2013_12_gC_grid_cell)
AGRIemissions2014 <- (AGRIemissions2014_1_gC_grid_cell+
                        AGRIemissions2014_2_gC_grid_cell+
                        AGRIemissions2014_3_gC_grid_cell+
                        AGRIemissions2014_4_gC_grid_cell+
                        AGRIemissions2014_5_gC_grid_cell+
                        AGRIemissions2014_6_gC_grid_cell+
                        AGRIemissions2014_7_gC_grid_cell+
                        AGRIemissions2014_8_gC_grid_cell+
                        AGRIemissions2014_9_gC_grid_cell+
                        AGRIemissions2014_10_gC_grid_cell+
                        AGRIemissions2014_11_gC_grid_cell+
                        AGRIemissions2014_12_gC_grid_cell)
AGRIemissions2015 <- (AGRIemissions2015_1_gC_grid_cell+
                        AGRIemissions2015_2_gC_grid_cell+
                        AGRIemissions2015_3_gC_grid_cell+
                        AGRIemissions2015_4_gC_grid_cell+
                        AGRIemissions2015_5_gC_grid_cell+
                        AGRIemissions2015_6_gC_grid_cell+
                        AGRIemissions2015_7_gC_grid_cell+
                        AGRIemissions2015_8_gC_grid_cell+
                        AGRIemissions2015_9_gC_grid_cell+
                        AGRIemissions2015_10_gC_grid_cell+
                        AGRIemissions2015_11_gC_grid_cell+
                        AGRIemissions2015_12_gC_grid_cell)
AGRIemissions2016 <- (AGRIemissions2016_1_gC_grid_cell+
                        AGRIemissions2016_2_gC_grid_cell+
                        AGRIemissions2016_3_gC_grid_cell+
                        AGRIemissions2016_4_gC_grid_cell+
                        AGRIemissions2016_5_gC_grid_cell+
                        AGRIemissions2016_6_gC_grid_cell+
                        AGRIemissions2016_7_gC_grid_cell+
                        AGRIemissions2016_8_gC_grid_cell+
                        AGRIemissions2016_9_gC_grid_cell+
                        AGRIemissions2016_10_gC_grid_cell+
                        AGRIemissions2016_11_gC_grid_cell+
                        AGRIemissions2016_12_gC_grid_cell)

##DEFO----
DEFOemissions2012 <- (DEFOemissions2012_1_gC_grid_cell+
                        DEFOemissions2012_2_gC_grid_cell+
                        DEFOemissions2012_3_gC_grid_cell+
                        DEFOemissions2012_4_gC_grid_cell+
                        DEFOemissions2012_5_gC_grid_cell+
                        DEFOemissions2012_6_gC_grid_cell+
                        DEFOemissions2012_7_gC_grid_cell+
                        DEFOemissions2012_8_gC_grid_cell+
                        DEFOemissions2012_9_gC_grid_cell+
                        DEFOemissions2012_10_gC_grid_cell+
                        DEFOemissions2012_11_gC_grid_cell+
                        DEFOemissions2012_12_gC_grid_cell)
DEFOemissions2013 <- (DEFOemissions2013_1_gC_grid_cell+
                        DEFOemissions2013_2_gC_grid_cell+
                        DEFOemissions2013_3_gC_grid_cell+
                        DEFOemissions2013_4_gC_grid_cell+
                        DEFOemissions2013_5_gC_grid_cell+
                        DEFOemissions2013_6_gC_grid_cell+
                        DEFOemissions2013_7_gC_grid_cell+
                        DEFOemissions2013_8_gC_grid_cell+
                        DEFOemissions2013_9_gC_grid_cell+
                        DEFOemissions2013_10_gC_grid_cell+
                        DEFOemissions2013_11_gC_grid_cell+
                        DEFOemissions2013_12_gC_grid_cell)
DEFOemissions2014 <- (DEFOemissions2014_1_gC_grid_cell+
                        DEFOemissions2014_2_gC_grid_cell+
                        DEFOemissions2014_3_gC_grid_cell+
                        DEFOemissions2014_4_gC_grid_cell+
                        DEFOemissions2014_5_gC_grid_cell+
                        DEFOemissions2014_6_gC_grid_cell+
                        DEFOemissions2014_7_gC_grid_cell+
                        DEFOemissions2014_8_gC_grid_cell+
                        DEFOemissions2014_9_gC_grid_cell+
                        DEFOemissions2014_10_gC_grid_cell+
                        DEFOemissions2014_11_gC_grid_cell+
                        DEFOemissions2014_12_gC_grid_cell)
DEFOemissions2015 <- (DEFOemissions2015_1_gC_grid_cell+
                        DEFOemissions2015_2_gC_grid_cell+
                        DEFOemissions2015_3_gC_grid_cell+
                        DEFOemissions2015_4_gC_grid_cell+
                        DEFOemissions2015_5_gC_grid_cell+
                        DEFOemissions2015_6_gC_grid_cell+
                        DEFOemissions2015_7_gC_grid_cell+
                        DEFOemissions2015_8_gC_grid_cell+
                        DEFOemissions2015_9_gC_grid_cell+
                        DEFOemissions2015_10_gC_grid_cell+
                        DEFOemissions2015_11_gC_grid_cell+
                        DEFOemissions2015_12_gC_grid_cell)
DEFOemissions2016 <- (DEFOemissions2016_1_gC_grid_cell+
                        DEFOemissions2016_2_gC_grid_cell+
                        DEFOemissions2016_3_gC_grid_cell+
                        DEFOemissions2016_4_gC_grid_cell+
                        DEFOemissions2016_5_gC_grid_cell+
                        DEFOemissions2016_6_gC_grid_cell+
                        DEFOemissions2016_7_gC_grid_cell+
                        DEFOemissions2016_8_gC_grid_cell+
                        DEFOemissions2016_9_gC_grid_cell+
                        DEFOemissions2016_10_gC_grid_cell+
                        DEFOemissions2016_11_gC_grid_cell+
                        DEFOemissions2016_12_gC_grid_cell)
#Create stacks to get mean for all biomes
PEATemissions2012_2016 <- raster::stack(PEATemissions2012,
                                        PEATemissions2013,
                                        PEATemissions2014,
                                        PEATemissions2015,
                                        PEATemissions2016)
BORFemissions2012_2016 <- raster::stack(BORFemissions2012,
                                        BORFemissions2013,
                                        BORFemissions2014,
                                        BORFemissions2015,
                                        BORFemissions2016)
TEMFemissions2012_2016 <- raster::stack(TEMFemissions2012,
                                        TEMFemissions2013,
                                        TEMFemissions2014,
                                        TEMFemissions2015,
                                        TEMFemissions2016)
SAVAemissions2012_2016 <- raster::stack(SAVAemissions2012,
                                        SAVAemissions2013,
                                        SAVAemissions2014,
                                        SAVAemissions2015,
                                        SAVAemissions2016)
AGRIemissions2012_2016 <- raster::stack(AGRIemissions2012,
                                        AGRIemissions2013,
                                        AGRIemissions2014,
                                        AGRIemissions2015,
                                        AGRIemissions2016)
DEFOemissions2012_2016 <- raster::stack(DEFOemissions2012,
                                        DEFOemissions2013,
                                        DEFOemissions2014,
                                        DEFOemissions2015,
                                        DEFOemissions2016)

#Get means
PEATemissions <- calc(PEATemissions2012_2016, fun = mean, na.rm = T)
BORFemissions <- calc(BORFemissions2012_2016, fun = mean, na.rm = T)
TEMFemissions <- calc(TEMFemissions2012_2016, fun = mean, na.rm = T)
SAVAemissions <- calc(SAVAemissions2012_2016, fun = mean, na.rm = T)
AGRIemissions <- calc(AGRIemissions2012_2016, fun = mean, na.rm = T)
DEFOemissions <- calc(DEFOemissions2012_2016, fun = mean, na.rm = T)


#Caclulate the mean total annual C emissions for the period 2012-2016
PEATsum <- conv_unit(cellStats(PEATemissions, sum), from = "g", to = "Tg")  #Get sum and convert to PgC
PEATsum
BORFsum <- conv_unit(cellStats(BORFemissions, sum), from = "g", to = "Tg")  #Get sum and convert to PgC
BORFsum
TEMFsum <- conv_unit(cellStats(TEMFemissions, sum), from = "g", to = "Tg")  #Get sum and convert to PgC
TEMFsum
SAVAsum <- conv_unit(cellStats(SAVAemissions, sum), from = "g", to = "Tg")  #Get sum and convert to PgC
SAVAsum
AGRIsum <- conv_unit(cellStats(AGRIemissions, sum), from = "g", to = "Tg")  #Get sum and convert to PgC
AGRIsum
DEFOsum <- conv_unit(cellStats(DEFOemissions, sum), from = "g", to = "Tg")  #Get sum and convert to PgC
DEFOsum

TOTALemissions <- (PEATsum+BORFsum+TEMFsum+SAVAsum+AGRIsum+DEFOsum)

PEATpercent <- PEATsum/TOTALemissions*100
BORFpercent <- BORFsum/TOTALemissions*100
TEMFpercent <- TEMFsum/TOTALemissions*100
SAVApercent <- SAVAsum/TOTALemissions*100
AGRIpercent <- AGRIsum/TOTALemissions*100
DEFOpercent <- DEFOsum/TOTALemissions*100

GFEDemissions <- data.frame("Biome" = c("BORF",
                                        "TEMF",
                                        "SAVA",
                                        "PEAT",
                                        "DEFO",
                                        "AGRI"),
                            "Emissions_TgC" = c(BORFsum,
                                                TEMFsum,
                                                SAVAsum,
                                                PEATsum,
                                                DEFOsum,
                                                AGRIsum),
                            "Emissions_percent" = c(BORFpercent,
                                                    TEMFpercent,
                                                    SAVApercent,
                                                    PEATpercent,
                                                    DEFOpercent,
                                                    AGRIpercent))
GFEDemissions %>%
  filter(Biome != "AGRI", Biome != "DEFO") %>%
  ggplot(aes(x = reorder(Biome, -Emissions_TgC, mean), y = Emissions_TgC)) +
  geom_col(aes(fill = Biome), alpha = 0.95, width = 0.75) +
  xlab("Biome") +
  ylab("C Emissions (Tg)") +
  theme(legend.position = "none")




