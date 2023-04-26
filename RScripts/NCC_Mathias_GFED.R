#Created by Justin Mathias, 12/28/22
#

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "rayshader", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "tidyverse", "rhdf5", "ncdf4", "raster", "patchwork", "job"))


#If you're reading this i know i should have used loops or apply, but i'm lazy
gfed1997ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_1997.hdf5")
gfed1998ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_1998.hdf5")
gfed1999ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_1999.hdf5")
gfed2000ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2000.hdf5")
gfed2001ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2001.hdf5")
gfed2002ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2002.hdf5")
gfed2003ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2003.hdf5")
gfed2004ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2004.hdf5")
gfed2005ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2005.hdf5")
gfed2006ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2006.hdf5")
gfed2007ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2007.hdf5")
gfed2008ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2008.hdf5")
gfed2009ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2009.hdf5")
gfed2010ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2010.hdf5")
gfed2011ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2011.hdf5")
gfed2012ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2012.hdf5")
gfed2013ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2013.hdf5")
gfed2014ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2014.hdf5")
gfed2015ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2015.hdf5")
gfed2016ras <- brick("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/GFED/fire_emissions_v4_R1_1293/data/GFED4.1s_2016.hdf5")

job({
#Set extent of each raster
extent(gfed1997ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed1998ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed1999ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2000ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2001ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2002ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2003ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2004ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2005ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2006ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2007ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2008ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2009ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2010ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2011ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2012ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2013ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2014ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2015ras) <- extent(-179.875, 179.875, -89.875, 89.875)
extent(gfed2016ras) <- extent(-179.875, 179.875, -89.875, 89.875)

#Set CRS
crs(gfed1997ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed1998ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed1999ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2000ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2001ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2002ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2003ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2004ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2005ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2006ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2007ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2008ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2009ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2010ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(gfed2011ras) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
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
emissions1997_1_gC_grid_cell <- gfed1997ras$C.1*gfed1997ras$grid_cell_area
emissions1997_2_gC_grid_cell <- gfed1997ras$C.2*gfed1997ras$grid_cell_area
emissions1997_3_gC_grid_cell <- gfed1997ras$C.3*gfed1997ras$grid_cell_area
emissions1997_4_gC_grid_cell <- gfed1997ras$C.4*gfed1997ras$grid_cell_area
emissions1997_5_gC_grid_cell <- gfed1997ras$C.5*gfed1997ras$grid_cell_area
emissions1997_6_gC_grid_cell <- gfed1997ras$C.6*gfed1997ras$grid_cell_area
emissions1997_7_gC_grid_cell <- gfed1997ras$C.7*gfed1997ras$grid_cell_area
emissions1997_8_gC_grid_cell <- gfed1997ras$C.8*gfed1997ras$grid_cell_area
emissions1997_9_gC_grid_cell <- gfed1997ras$C.9*gfed1997ras$grid_cell_area
emissions1997_10_gC_grid_cell <- gfed1997ras$C.10*gfed1997ras$grid_cell_area
emissions1997_11_gC_grid_cell <- gfed1997ras$C.11*gfed1997ras$grid_cell_area
emissions1997_12_gC_grid_cell <- gfed1997ras$C.12*gfed1997ras$grid_cell_area

emissions1998_1_gC_grid_cell  <- gfed1998ras$C.1*gfed1998ras$grid_cell_area
emissions1998_2_gC_grid_cell  <- gfed1998ras$C.2*gfed1998ras$grid_cell_area
emissions1998_3_gC_grid_cell  <- gfed1998ras$C.3*gfed1998ras$grid_cell_area
emissions1998_4_gC_grid_cell  <- gfed1998ras$C.4*gfed1998ras$grid_cell_area
emissions1998_5_gC_grid_cell  <- gfed1998ras$C.5*gfed1998ras$grid_cell_area
emissions1998_6_gC_grid_cell  <- gfed1998ras$C.6*gfed1998ras$grid_cell_area
emissions1998_7_gC_grid_cell  <- gfed1998ras$C.7*gfed1998ras$grid_cell_area
emissions1998_8_gC_grid_cell  <- gfed1998ras$C.8*gfed1998ras$grid_cell_area
emissions1998_9_gC_grid_cell  <- gfed1998ras$C.9*gfed1998ras$grid_cell_area
emissions1998_10_gC_grid_cell <- gfed1998ras$C.10*gfed1998ras$grid_cell_area
emissions1998_11_gC_grid_cell <- gfed1998ras$C.11*gfed1998ras$grid_cell_area
emissions1998_12_gC_grid_cell <- gfed1998ras$C.12*gfed1998ras$grid_cell_area

emissions1999_1_gC_grid_cell <- gfed1999ras$C.1*gfed1999ras$grid_cell_area
emissions1999_2_gC_grid_cell <- gfed1999ras$C.2*gfed1999ras$grid_cell_area
emissions1999_3_gC_grid_cell <- gfed1999ras$C.3*gfed1999ras$grid_cell_area
emissions1999_4_gC_grid_cell <- gfed1999ras$C.4*gfed1999ras$grid_cell_area
emissions1999_5_gC_grid_cell <- gfed1999ras$C.5*gfed1999ras$grid_cell_area
emissions1999_6_gC_grid_cell <- gfed1999ras$C.6*gfed1999ras$grid_cell_area
emissions1999_7_gC_grid_cell <- gfed1999ras$C.7*gfed1999ras$grid_cell_area
emissions1999_8_gC_grid_cell <- gfed1999ras$C.8*gfed1999ras$grid_cell_area
emissions1999_9_gC_grid_cell <- gfed1999ras$C.9*gfed1999ras$grid_cell_area
emissions1999_10_gC_grid_cell <- gfed1999ras$C.10*gfed1999ras$grid_cell_area
emissions1999_11_gC_grid_cell <- gfed1999ras$C.11*gfed1999ras$grid_cell_area
emissions1999_12_gC_grid_cell <- gfed1999ras$C.12*gfed1999ras$grid_cell_area

emissions2000_1_gC_grid_cell <- gfed2000ras$C.1*gfed2000ras$grid_cell_area
emissions2000_2_gC_grid_cell <- gfed2000ras$C.2*gfed2000ras$grid_cell_area
emissions2000_3_gC_grid_cell <- gfed2000ras$C.3*gfed2000ras$grid_cell_area
emissions2000_4_gC_grid_cell <- gfed2000ras$C.4*gfed2000ras$grid_cell_area
emissions2000_5_gC_grid_cell <- gfed2000ras$C.5*gfed2000ras$grid_cell_area
emissions2000_6_gC_grid_cell <- gfed2000ras$C.6*gfed2000ras$grid_cell_area
emissions2000_7_gC_grid_cell <- gfed2000ras$C.7*gfed2000ras$grid_cell_area
emissions2000_8_gC_grid_cell <- gfed2000ras$C.8*gfed2000ras$grid_cell_area
emissions2000_9_gC_grid_cell <- gfed2000ras$C.9*gfed2000ras$grid_cell_area
emissions2000_10_gC_grid_cell <- gfed2000ras$C.10*gfed2000ras$grid_cell_area
emissions2000_11_gC_grid_cell <- gfed2000ras$C.11*gfed2000ras$grid_cell_area
emissions2000_12_gC_grid_cell <- gfed2000ras$C.12*gfed2000ras$grid_cell_area

emissions2001_1_gC_grid_cell <- gfed2001ras$C.1*gfed2001ras$grid_cell_area
emissions2001_2_gC_grid_cell <- gfed2001ras$C.2*gfed2001ras$grid_cell_area
emissions2001_3_gC_grid_cell <- gfed2001ras$C.3*gfed2001ras$grid_cell_area
emissions2001_4_gC_grid_cell <- gfed2001ras$C.4*gfed2001ras$grid_cell_area
emissions2001_5_gC_grid_cell <- gfed2001ras$C.5*gfed2001ras$grid_cell_area
emissions2001_6_gC_grid_cell <- gfed2001ras$C.6*gfed2001ras$grid_cell_area
emissions2001_7_gC_grid_cell <- gfed2001ras$C.7*gfed2001ras$grid_cell_area
emissions2001_8_gC_grid_cell <- gfed2001ras$C.8*gfed2001ras$grid_cell_area
emissions2001_9_gC_grid_cell <- gfed2001ras$C.9*gfed2001ras$grid_cell_area
emissions2001_10_gC_grid_cell <- gfed2001ras$C.10*gfed2001ras$grid_cell_area
emissions2001_11_gC_grid_cell <- gfed2001ras$C.11*gfed2001ras$grid_cell_area
emissions2001_12_gC_grid_cell <- gfed2001ras$C.12*gfed2001ras$grid_cell_area

emissions2002_1_gC_grid_cell <- gfed2002ras$C.1*gfed2002ras$grid_cell_area
emissions2002_2_gC_grid_cell <- gfed2002ras$C.2*gfed2002ras$grid_cell_area
emissions2002_3_gC_grid_cell <- gfed2002ras$C.3*gfed2002ras$grid_cell_area
emissions2002_4_gC_grid_cell <- gfed2002ras$C.4*gfed2002ras$grid_cell_area
emissions2002_5_gC_grid_cell <- gfed2002ras$C.5*gfed2002ras$grid_cell_area
emissions2002_6_gC_grid_cell <- gfed2002ras$C.6*gfed2002ras$grid_cell_area
emissions2002_7_gC_grid_cell <- gfed2002ras$C.7*gfed2002ras$grid_cell_area
emissions2002_8_gC_grid_cell <- gfed2002ras$C.8*gfed2002ras$grid_cell_area
emissions2002_9_gC_grid_cell <- gfed2002ras$C.9*gfed2002ras$grid_cell_area
emissions2002_10_gC_grid_cell <- gfed2002ras$C.10*gfed2002ras$grid_cell_area
emissions2002_11_gC_grid_cell <- gfed2002ras$C.11*gfed2002ras$grid_cell_area
emissions2002_12_gC_grid_cell <- gfed2002ras$C.12*gfed2002ras$grid_cell_area

emissions2003_1_gC_grid_cell <- gfed2003ras$C.1*gfed2003ras$grid_cell_area
emissions2003_2_gC_grid_cell <- gfed2003ras$C.2*gfed2003ras$grid_cell_area
emissions2003_3_gC_grid_cell <- gfed2003ras$C.3*gfed2003ras$grid_cell_area
emissions2003_4_gC_grid_cell <- gfed2003ras$C.4*gfed2003ras$grid_cell_area
emissions2003_5_gC_grid_cell <- gfed2003ras$C.5*gfed2003ras$grid_cell_area
emissions2003_6_gC_grid_cell <- gfed2003ras$C.6*gfed2003ras$grid_cell_area
emissions2003_7_gC_grid_cell <- gfed2003ras$C.7*gfed2003ras$grid_cell_area
emissions2003_8_gC_grid_cell <- gfed2003ras$C.8*gfed2003ras$grid_cell_area
emissions2003_9_gC_grid_cell <- gfed2003ras$C.9*gfed2003ras$grid_cell_area
emissions2003_10_gC_grid_cell <- gfed2003ras$C.10*gfed2003ras$grid_cell_area
emissions2003_11_gC_grid_cell <- gfed2003ras$C.11*gfed2003ras$grid_cell_area
emissions2003_12_gC_grid_cell <- gfed2003ras$C.12*gfed2003ras$grid_cell_area

emissions2004_1_gC_grid_cell <- gfed2004ras$C.1*gfed2004ras$grid_cell_area
emissions2004_2_gC_grid_cell <- gfed2004ras$C.2*gfed2004ras$grid_cell_area
emissions2004_3_gC_grid_cell <- gfed2004ras$C.3*gfed2004ras$grid_cell_area
emissions2004_4_gC_grid_cell <- gfed2004ras$C.4*gfed2004ras$grid_cell_area
emissions2004_5_gC_grid_cell <- gfed2004ras$C.5*gfed2004ras$grid_cell_area
emissions2004_6_gC_grid_cell <- gfed2004ras$C.6*gfed2004ras$grid_cell_area
emissions2004_7_gC_grid_cell <- gfed2004ras$C.7*gfed2004ras$grid_cell_area
emissions2004_8_gC_grid_cell <- gfed2004ras$C.8*gfed2004ras$grid_cell_area
emissions2004_9_gC_grid_cell <- gfed2004ras$C.9*gfed2004ras$grid_cell_area
emissions2004_10_gC_grid_cell <- gfed2004ras$C.10*gfed2004ras$grid_cell_area
emissions2004_11_gC_grid_cell <- gfed2004ras$C.11*gfed2004ras$grid_cell_area
emissions2004_12_gC_grid_cell <- gfed2004ras$C.12*gfed2004ras$grid_cell_area

emissions2005_1_gC_grid_cell <- gfed2005ras$C.1*gfed2005ras$grid_cell_area
emissions2005_2_gC_grid_cell <- gfed2005ras$C.2*gfed2005ras$grid_cell_area
emissions2005_3_gC_grid_cell <- gfed2005ras$C.3*gfed2005ras$grid_cell_area
emissions2005_4_gC_grid_cell <- gfed2005ras$C.4*gfed2005ras$grid_cell_area
emissions2005_5_gC_grid_cell <- gfed2005ras$C.5*gfed2005ras$grid_cell_area
emissions2005_6_gC_grid_cell <- gfed2005ras$C.6*gfed2005ras$grid_cell_area
emissions2005_7_gC_grid_cell <- gfed2005ras$C.7*gfed2005ras$grid_cell_area
emissions2005_8_gC_grid_cell <- gfed2005ras$C.8*gfed2005ras$grid_cell_area
emissions2005_9_gC_grid_cell <- gfed2005ras$C.9*gfed2005ras$grid_cell_area
emissions2005_10_gC_grid_cell <- gfed2005ras$C.10*gfed2005ras$grid_cell_area
emissions2005_11_gC_grid_cell <- gfed2005ras$C.11*gfed2005ras$grid_cell_area
emissions2005_12_gC_grid_cell <- gfed2005ras$C.12*gfed2005ras$grid_cell_area

emissions2006_1_gC_grid_cell <- gfed2006ras$C.1*gfed2006ras$grid_cell_area
emissions2006_2_gC_grid_cell <- gfed2006ras$C.2*gfed2006ras$grid_cell_area
emissions2006_3_gC_grid_cell <- gfed2006ras$C.3*gfed2006ras$grid_cell_area
emissions2006_4_gC_grid_cell <- gfed2006ras$C.4*gfed2006ras$grid_cell_area
emissions2006_5_gC_grid_cell <- gfed2006ras$C.5*gfed2006ras$grid_cell_area
emissions2006_6_gC_grid_cell <- gfed2006ras$C.6*gfed2006ras$grid_cell_area
emissions2006_7_gC_grid_cell <- gfed2006ras$C.7*gfed2006ras$grid_cell_area
emissions2006_8_gC_grid_cell <- gfed2006ras$C.8*gfed2006ras$grid_cell_area
emissions2006_9_gC_grid_cell <- gfed2006ras$C.9*gfed2006ras$grid_cell_area
emissions2006_10_gC_grid_cell <- gfed2006ras$C.10*gfed2006ras$grid_cell_area
emissions2006_11_gC_grid_cell <- gfed2006ras$C.11*gfed2006ras$grid_cell_area
emissions2006_12_gC_grid_cell <- gfed2006ras$C.12*gfed2006ras$grid_cell_area

emissions2007_1_gC_grid_cell <- gfed2007ras$C.1*gfed2007ras$grid_cell_area
emissions2007_2_gC_grid_cell <- gfed2007ras$C.2*gfed2007ras$grid_cell_area
emissions2007_3_gC_grid_cell <- gfed2007ras$C.3*gfed2007ras$grid_cell_area
emissions2007_4_gC_grid_cell <- gfed2007ras$C.4*gfed2007ras$grid_cell_area
emissions2007_5_gC_grid_cell <- gfed2007ras$C.5*gfed2007ras$grid_cell_area
emissions2007_6_gC_grid_cell <- gfed2007ras$C.6*gfed2007ras$grid_cell_area
emissions2007_7_gC_grid_cell <- gfed2007ras$C.7*gfed2007ras$grid_cell_area
emissions2007_8_gC_grid_cell <- gfed2007ras$C.8*gfed2007ras$grid_cell_area
emissions2007_9_gC_grid_cell <- gfed2007ras$C.9*gfed2007ras$grid_cell_area
emissions2007_10_gC_grid_cell <- gfed2007ras$C.10*gfed2007ras$grid_cell_area
emissions2007_11_gC_grid_cell <- gfed2007ras$C.11*gfed2007ras$grid_cell_area
emissions2007_12_gC_grid_cell <- gfed2007ras$C.12*gfed2007ras$grid_cell_area

emissions2008_1_gC_grid_cell <- gfed2008ras$C.1*gfed2008ras$grid_cell_area
emissions2008_2_gC_grid_cell <- gfed2008ras$C.2*gfed2008ras$grid_cell_area
emissions2008_3_gC_grid_cell <- gfed2008ras$C.3*gfed2008ras$grid_cell_area
emissions2008_4_gC_grid_cell <- gfed2008ras$C.4*gfed2008ras$grid_cell_area
emissions2008_5_gC_grid_cell <- gfed2008ras$C.5*gfed2008ras$grid_cell_area
emissions2008_6_gC_grid_cell <- gfed2008ras$C.6*gfed2008ras$grid_cell_area
emissions2008_7_gC_grid_cell <- gfed2008ras$C.7*gfed2008ras$grid_cell_area
emissions2008_8_gC_grid_cell <- gfed2008ras$C.8*gfed2008ras$grid_cell_area
emissions2008_9_gC_grid_cell <- gfed2008ras$C.9*gfed2008ras$grid_cell_area
emissions2008_10_gC_grid_cell <- gfed2008ras$C.10*gfed2008ras$grid_cell_area
emissions2008_11_gC_grid_cell <- gfed2008ras$C.11*gfed2008ras$grid_cell_area
emissions2008_12_gC_grid_cell <- gfed2008ras$C.12*gfed2008ras$grid_cell_area

emissions2009_1_gC_grid_cell <- gfed2009ras$C.1*gfed2009ras$grid_cell_area
emissions2009_2_gC_grid_cell <- gfed2009ras$C.2*gfed2009ras$grid_cell_area
emissions2009_3_gC_grid_cell <- gfed2009ras$C.3*gfed2009ras$grid_cell_area
emissions2009_4_gC_grid_cell <- gfed2009ras$C.4*gfed2009ras$grid_cell_area
emissions2009_5_gC_grid_cell <- gfed2009ras$C.5*gfed2009ras$grid_cell_area
emissions2009_6_gC_grid_cell <- gfed2009ras$C.6*gfed2009ras$grid_cell_area
emissions2009_7_gC_grid_cell <- gfed2009ras$C.7*gfed2009ras$grid_cell_area
emissions2009_8_gC_grid_cell <- gfed2009ras$C.8*gfed2009ras$grid_cell_area
emissions2009_9_gC_grid_cell <- gfed2009ras$C.9*gfed2009ras$grid_cell_area
emissions2009_10_gC_grid_cell <- gfed2009ras$C.10*gfed2009ras$grid_cell_area
emissions2009_11_gC_grid_cell <- gfed2009ras$C.11*gfed2009ras$grid_cell_area
emissions2009_12_gC_grid_cell <- gfed2009ras$C.12*gfed2009ras$grid_cell_area

emissions2010_1_gC_grid_cell <- gfed2010ras$C.1*gfed2010ras$grid_cell_area
emissions2010_2_gC_grid_cell <- gfed2010ras$C.2*gfed2010ras$grid_cell_area
emissions2010_3_gC_grid_cell <- gfed2010ras$C.3*gfed2010ras$grid_cell_area
emissions2010_4_gC_grid_cell <- gfed2010ras$C.4*gfed2010ras$grid_cell_area
emissions2010_5_gC_grid_cell <- gfed2010ras$C.5*gfed2010ras$grid_cell_area
emissions2010_6_gC_grid_cell <- gfed2010ras$C.6*gfed2010ras$grid_cell_area
emissions2010_7_gC_grid_cell <- gfed2010ras$C.7*gfed2010ras$grid_cell_area
emissions2010_8_gC_grid_cell <- gfed2010ras$C.8*gfed2010ras$grid_cell_area
emissions2010_9_gC_grid_cell <- gfed2010ras$C.9*gfed2010ras$grid_cell_area
emissions2010_10_gC_grid_cell <- gfed2010ras$C.10*gfed2010ras$grid_cell_area
emissions2010_11_gC_grid_cell <- gfed2010ras$C.11*gfed2010ras$grid_cell_area
emissions2010_12_gC_grid_cell <- gfed2010ras$C.12*gfed2010ras$grid_cell_area

emissions2011_1_gC_grid_cell <- gfed2011ras$C.1*gfed2011ras$grid_cell_area
emissions2011_2_gC_grid_cell <- gfed2011ras$C.2*gfed2011ras$grid_cell_area
emissions2011_3_gC_grid_cell <- gfed2011ras$C.3*gfed2011ras$grid_cell_area
emissions2011_4_gC_grid_cell <- gfed2011ras$C.4*gfed2011ras$grid_cell_area
emissions2011_5_gC_grid_cell <- gfed2011ras$C.5*gfed2011ras$grid_cell_area
emissions2011_6_gC_grid_cell <- gfed2011ras$C.6*gfed2011ras$grid_cell_area
emissions2011_7_gC_grid_cell <- gfed2011ras$C.7*gfed2011ras$grid_cell_area
emissions2011_8_gC_grid_cell <- gfed2011ras$C.8*gfed2011ras$grid_cell_area
emissions2011_9_gC_grid_cell <- gfed2011ras$C.9*gfed2011ras$grid_cell_area
emissions2011_10_gC_grid_cell <- gfed2011ras$C.10*gfed2011ras$grid_cell_area
emissions2011_11_gC_grid_cell <- gfed2011ras$C.11*gfed2011ras$grid_cell_area
emissions2011_12_gC_grid_cell <- gfed2011ras$C.12*gfed2011ras$grid_cell_area

emissions2012_1_gC_grid_cell <- gfed2012ras$C.1*gfed2012ras$grid_cell_area
emissions2012_2_gC_grid_cell <- gfed2012ras$C.2*gfed2012ras$grid_cell_area
emissions2012_3_gC_grid_cell <- gfed2012ras$C.3*gfed2012ras$grid_cell_area
emissions2012_4_gC_grid_cell <- gfed2012ras$C.4*gfed2012ras$grid_cell_area
emissions2012_5_gC_grid_cell <- gfed2012ras$C.5*gfed2012ras$grid_cell_area
emissions2012_6_gC_grid_cell <- gfed2012ras$C.6*gfed2012ras$grid_cell_area
emissions2012_7_gC_grid_cell <- gfed2012ras$C.7*gfed2012ras$grid_cell_area
emissions2012_8_gC_grid_cell <- gfed2012ras$C.8*gfed2012ras$grid_cell_area
emissions2012_9_gC_grid_cell <- gfed2012ras$C.9*gfed2012ras$grid_cell_area
emissions2012_10_gC_grid_cell <- gfed2012ras$C.10*gfed2012ras$grid_cell_area
emissions2012_11_gC_grid_cell <- gfed2012ras$C.11*gfed2012ras$grid_cell_area
emissions2012_12_gC_grid_cell <- gfed2012ras$C.12*gfed2012ras$grid_cell_area

emissions2013_1_gC_grid_cell <- gfed2013ras$C.1*gfed2013ras$grid_cell_area
emissions2013_2_gC_grid_cell <- gfed2013ras$C.2*gfed2013ras$grid_cell_area
emissions2013_3_gC_grid_cell <- gfed2013ras$C.3*gfed2013ras$grid_cell_area
emissions2013_4_gC_grid_cell <- gfed2013ras$C.4*gfed2013ras$grid_cell_area
emissions2013_5_gC_grid_cell <- gfed2013ras$C.5*gfed2013ras$grid_cell_area
emissions2013_6_gC_grid_cell <- gfed2013ras$C.6*gfed2013ras$grid_cell_area
emissions2013_7_gC_grid_cell <- gfed2013ras$C.7*gfed2013ras$grid_cell_area
emissions2013_8_gC_grid_cell <- gfed2013ras$C.8*gfed2013ras$grid_cell_area
emissions2013_9_gC_grid_cell <- gfed2013ras$C.9*gfed2013ras$grid_cell_area
emissions2013_10_gC_grid_cell <- gfed2013ras$C.10*gfed2013ras$grid_cell_area
emissions2013_11_gC_grid_cell <- gfed2013ras$C.11*gfed2013ras$grid_cell_area
emissions2013_12_gC_grid_cell <- gfed2013ras$C.12*gfed2013ras$grid_cell_area

emissions2014_1_gC_grid_cell <- gfed2014ras$C.1*gfed2014ras$grid_cell_area
emissions2014_2_gC_grid_cell <- gfed2014ras$C.2*gfed2014ras$grid_cell_area
emissions2014_3_gC_grid_cell <- gfed2014ras$C.3*gfed2014ras$grid_cell_area
emissions2014_4_gC_grid_cell <- gfed2014ras$C.4*gfed2014ras$grid_cell_area
emissions2014_5_gC_grid_cell <- gfed2014ras$C.5*gfed2014ras$grid_cell_area
emissions2014_6_gC_grid_cell <- gfed2014ras$C.6*gfed2014ras$grid_cell_area
emissions2014_7_gC_grid_cell <- gfed2014ras$C.7*gfed2014ras$grid_cell_area
emissions2014_8_gC_grid_cell <- gfed2014ras$C.8*gfed2014ras$grid_cell_area
emissions2014_9_gC_grid_cell <- gfed2014ras$C.9*gfed2014ras$grid_cell_area
emissions2014_10_gC_grid_cell <- gfed2014ras$C.10*gfed2014ras$grid_cell_area
emissions2014_11_gC_grid_cell <- gfed2014ras$C.11*gfed2014ras$grid_cell_area
emissions2014_12_gC_grid_cell <- gfed2014ras$C.12*gfed2014ras$grid_cell_area

emissions2015_1_gC_grid_cell <- gfed2015ras$C.1*gfed2015ras$grid_cell_area
emissions2015_2_gC_grid_cell <- gfed2015ras$C.2*gfed2015ras$grid_cell_area
emissions2015_3_gC_grid_cell <- gfed2015ras$C.3*gfed2015ras$grid_cell_area
emissions2015_4_gC_grid_cell <- gfed2015ras$C.4*gfed2015ras$grid_cell_area
emissions2015_5_gC_grid_cell <- gfed2015ras$C.5*gfed2015ras$grid_cell_area
emissions2015_6_gC_grid_cell <- gfed2015ras$C.6*gfed2015ras$grid_cell_area
emissions2015_7_gC_grid_cell <- gfed2015ras$C.7*gfed2015ras$grid_cell_area
emissions2015_8_gC_grid_cell <- gfed2015ras$C.8*gfed2015ras$grid_cell_area
emissions2015_9_gC_grid_cell <- gfed2015ras$C.9*gfed2015ras$grid_cell_area
emissions2015_10_gC_grid_cell <- gfed2015ras$C.10*gfed2015ras$grid_cell_area
emissions2015_11_gC_grid_cell <- gfed2015ras$C.11*gfed2015ras$grid_cell_area
emissions2015_12_gC_grid_cell <- gfed2015ras$C.12*gfed2015ras$grid_cell_area

emissions2016_1_gC_grid_cell <- gfed2016ras$C.1*gfed2016ras$grid_cell_area
emissions2016_2_gC_grid_cell <- gfed2016ras$C.2*gfed2016ras$grid_cell_area
emissions2016_3_gC_grid_cell <- gfed2016ras$C.3*gfed2016ras$grid_cell_area
emissions2016_4_gC_grid_cell <- gfed2016ras$C.4*gfed2016ras$grid_cell_area
emissions2016_5_gC_grid_cell <- gfed2016ras$C.5*gfed2016ras$grid_cell_area
emissions2016_6_gC_grid_cell <- gfed2016ras$C.6*gfed2016ras$grid_cell_area
emissions2016_7_gC_grid_cell <- gfed2016ras$C.7*gfed2016ras$grid_cell_area
emissions2016_8_gC_grid_cell <- gfed2016ras$C.8*gfed2016ras$grid_cell_area
emissions2016_9_gC_grid_cell <- gfed2016ras$C.9*gfed2016ras$grid_cell_area
emissions2016_10_gC_grid_cell <- gfed2016ras$C.10*gfed2016ras$grid_cell_area
emissions2016_11_gC_grid_cell <- gfed2016ras$C.11*gfed2016ras$grid_cell_area
emissions2016_12_gC_grid_cell <- gfed2016ras$C.12*gfed2016ras$grid_cell_area

#Calculate PEAT, SAVA, BORF, and TEMF C emissions in gC per grid cell

#PEAT
PEATemissions1997_1_gC_grid_cell <- emissions1997_1_gC_grid_cell*gfed1997ras$C_PEAT.1 #1997
PEATemissions1997_2_gC_grid_cell <- emissions1997_2_gC_grid_cell*gfed1997ras$C_PEAT.2
PEATemissions1997_3_gC_grid_cell <- emissions1997_3_gC_grid_cell*gfed1997ras$C_PEAT.3
PEATemissions1997_4_gC_grid_cell <- emissions1997_4_gC_grid_cell*gfed1997ras$C_PEAT.4
PEATemissions1997_5_gC_grid_cell <- emissions1997_5_gC_grid_cell*gfed1997ras$C_PEAT.5
PEATemissions1997_6_gC_grid_cell <- emissions1997_6_gC_grid_cell*gfed1997ras$C_PEAT.6
PEATemissions1997_7_gC_grid_cell <- emissions1997_7_gC_grid_cell*gfed1997ras$C_PEAT.7
PEATemissions1997_8_gC_grid_cell <- emissions1997_8_gC_grid_cell*gfed1997ras$C_PEAT.8
PEATemissions1997_9_gC_grid_cell <- emissions1997_9_gC_grid_cell*gfed1997ras$C_PEAT.9
PEATemissions1997_10_gC_grid_cell <- emissions1997_10_gC_grid_cell*gfed1997ras$C_PEAT.10
PEATemissions1997_11_gC_grid_cell <- emissions1997_11_gC_grid_cell*gfed1997ras$C_PEAT.11
PEATemissions1997_12_gC_grid_cell <- emissions1997_12_gC_grid_cell*gfed1997ras$C_PEAT.12
PEATemissions1998_1_gC_grid_cell <- emissions1998_1_gC_grid_cell*gfed1998ras$C_PEAT.1 #1998
PEATemissions1998_2_gC_grid_cell <- emissions1998_2_gC_grid_cell*gfed1998ras$C_PEAT.2
PEATemissions1998_3_gC_grid_cell <- emissions1998_3_gC_grid_cell*gfed1998ras$C_PEAT.3
PEATemissions1998_4_gC_grid_cell <- emissions1998_4_gC_grid_cell*gfed1998ras$C_PEAT.4
PEATemissions1998_5_gC_grid_cell <- emissions1998_5_gC_grid_cell*gfed1998ras$C_PEAT.5
PEATemissions1998_6_gC_grid_cell <- emissions1998_6_gC_grid_cell*gfed1998ras$C_PEAT.6
PEATemissions1998_7_gC_grid_cell <- emissions1998_7_gC_grid_cell*gfed1998ras$C_PEAT.7
PEATemissions1998_8_gC_grid_cell <- emissions1998_8_gC_grid_cell*gfed1998ras$C_PEAT.8
PEATemissions1998_9_gC_grid_cell <- emissions1998_9_gC_grid_cell*gfed1998ras$C_PEAT.9
PEATemissions1998_10_gC_grid_cell <- emissions1998_10_gC_grid_cell*gfed1998ras$C_PEAT.10
PEATemissions1998_11_gC_grid_cell <- emissions1998_11_gC_grid_cell*gfed1998ras$C_PEAT.11
PEATemissions1998_12_gC_grid_cell <- emissions1998_12_gC_grid_cell*gfed1998ras$C_PEAT.12
PEATemissions1999_1_gC_grid_cell <- emissions1999_1_gC_grid_cell*gfed1999ras$C_PEAT.1 #1999
PEATemissions1999_2_gC_grid_cell <- emissions1999_2_gC_grid_cell*gfed1999ras$C_PEAT.2
PEATemissions1999_3_gC_grid_cell <- emissions1999_3_gC_grid_cell*gfed1999ras$C_PEAT.3
PEATemissions1999_4_gC_grid_cell <- emissions1999_4_gC_grid_cell*gfed1999ras$C_PEAT.4
PEATemissions1999_5_gC_grid_cell <- emissions1999_5_gC_grid_cell*gfed1999ras$C_PEAT.5
PEATemissions1999_6_gC_grid_cell <- emissions1999_6_gC_grid_cell*gfed1999ras$C_PEAT.6
PEATemissions1999_7_gC_grid_cell <- emissions1999_7_gC_grid_cell*gfed1999ras$C_PEAT.7
PEATemissions1999_8_gC_grid_cell <- emissions1999_8_gC_grid_cell*gfed1999ras$C_PEAT.8
PEATemissions1999_9_gC_grid_cell <- emissions1999_9_gC_grid_cell*gfed1999ras$C_PEAT.9
PEATemissions1999_10_gC_grid_cell <- emissions1999_10_gC_grid_cell*gfed1999ras$C_PEAT.10
PEATemissions1999_11_gC_grid_cell <- emissions1999_11_gC_grid_cell*gfed1999ras$C_PEAT.11
PEATemissions1999_12_gC_grid_cell <- emissions1999_12_gC_grid_cell*gfed1999ras$C_PEAT.12
PEATemissions2000_1_gC_grid_cell <- emissions2000_1_gC_grid_cell*gfed2000ras$C_PEAT.1 #2000
PEATemissions2000_2_gC_grid_cell <- emissions2000_2_gC_grid_cell*gfed2000ras$C_PEAT.2
PEATemissions2000_3_gC_grid_cell <- emissions2000_3_gC_grid_cell*gfed2000ras$C_PEAT.3
PEATemissions2000_4_gC_grid_cell <- emissions2000_4_gC_grid_cell*gfed2000ras$C_PEAT.4
PEATemissions2000_5_gC_grid_cell <- emissions2000_5_gC_grid_cell*gfed2000ras$C_PEAT.5
PEATemissions2000_6_gC_grid_cell <- emissions2000_6_gC_grid_cell*gfed2000ras$C_PEAT.6
PEATemissions2000_7_gC_grid_cell <- emissions2000_7_gC_grid_cell*gfed2000ras$C_PEAT.7
PEATemissions2000_8_gC_grid_cell <- emissions2000_8_gC_grid_cell*gfed2000ras$C_PEAT.8
PEATemissions2000_9_gC_grid_cell <- emissions2000_9_gC_grid_cell*gfed2000ras$C_PEAT.9
PEATemissions2000_10_gC_grid_cell <- emissions2000_10_gC_grid_cell*gfed2000ras$C_PEAT.10
PEATemissions2000_11_gC_grid_cell <- emissions2000_11_gC_grid_cell*gfed2000ras$C_PEAT.11
PEATemissions2000_12_gC_grid_cell <- emissions2000_12_gC_grid_cell*gfed2000ras$C_PEAT.12
PEATemissions2001_1_gC_grid_cell <- emissions2001_1_gC_grid_cell*gfed2001ras$C_PEAT.1 #2001
PEATemissions2001_2_gC_grid_cell <- emissions2001_2_gC_grid_cell*gfed2001ras$C_PEAT.2
PEATemissions2001_3_gC_grid_cell <- emissions2001_3_gC_grid_cell*gfed2001ras$C_PEAT.3
PEATemissions2001_4_gC_grid_cell <- emissions2001_4_gC_grid_cell*gfed2001ras$C_PEAT.4
PEATemissions2001_5_gC_grid_cell <- emissions2001_5_gC_grid_cell*gfed2001ras$C_PEAT.5
PEATemissions2001_6_gC_grid_cell <- emissions2001_6_gC_grid_cell*gfed2001ras$C_PEAT.6
PEATemissions2001_7_gC_grid_cell <- emissions2001_7_gC_grid_cell*gfed2001ras$C_PEAT.7
PEATemissions2001_8_gC_grid_cell <- emissions2001_8_gC_grid_cell*gfed2001ras$C_PEAT.8
PEATemissions2001_9_gC_grid_cell <- emissions2001_9_gC_grid_cell*gfed2001ras$C_PEAT.9
PEATemissions2001_10_gC_grid_cell <- emissions2001_10_gC_grid_cell*gfed2001ras$C_PEAT.10
PEATemissions2001_11_gC_grid_cell <- emissions2001_11_gC_grid_cell*gfed2001ras$C_PEAT.11
PEATemissions2001_12_gC_grid_cell <- emissions2001_12_gC_grid_cell*gfed2001ras$C_PEAT.12
PEATemissions2002_1_gC_grid_cell <- emissions2002_1_gC_grid_cell*gfed2002ras$C_PEAT.1 #2002
PEATemissions2002_2_gC_grid_cell <- emissions2002_2_gC_grid_cell*gfed2002ras$C_PEAT.2
PEATemissions2002_3_gC_grid_cell <- emissions2002_3_gC_grid_cell*gfed2002ras$C_PEAT.3
PEATemissions2002_4_gC_grid_cell <- emissions2002_4_gC_grid_cell*gfed2002ras$C_PEAT.4
PEATemissions2002_5_gC_grid_cell <- emissions2002_5_gC_grid_cell*gfed2002ras$C_PEAT.5
PEATemissions2002_6_gC_grid_cell <- emissions2002_6_gC_grid_cell*gfed2002ras$C_PEAT.6
PEATemissions2002_7_gC_grid_cell <- emissions2002_7_gC_grid_cell*gfed2002ras$C_PEAT.7
PEATemissions2002_8_gC_grid_cell <- emissions2002_8_gC_grid_cell*gfed2002ras$C_PEAT.8
PEATemissions2002_9_gC_grid_cell <- emissions2002_9_gC_grid_cell*gfed2002ras$C_PEAT.9
PEATemissions2002_10_gC_grid_cell <- emissions2002_10_gC_grid_cell*gfed2002ras$C_PEAT.10
PEATemissions2002_11_gC_grid_cell <- emissions2002_11_gC_grid_cell*gfed2002ras$C_PEAT.11
PEATemissions2002_12_gC_grid_cell <- emissions2002_12_gC_grid_cell*gfed2002ras$C_PEAT.12
PEATemissions2003_1_gC_grid_cell <- emissions2003_1_gC_grid_cell*gfed2003ras$C_PEAT.1 #2003
PEATemissions2003_2_gC_grid_cell <- emissions2003_2_gC_grid_cell*gfed2003ras$C_PEAT.2
PEATemissions2003_3_gC_grid_cell <- emissions2003_3_gC_grid_cell*gfed2003ras$C_PEAT.3
PEATemissions2003_4_gC_grid_cell <- emissions2003_4_gC_grid_cell*gfed2003ras$C_PEAT.4
PEATemissions2003_5_gC_grid_cell <- emissions2003_5_gC_grid_cell*gfed2003ras$C_PEAT.5
PEATemissions2003_6_gC_grid_cell <- emissions2003_6_gC_grid_cell*gfed2003ras$C_PEAT.6
PEATemissions2003_7_gC_grid_cell <- emissions2003_7_gC_grid_cell*gfed2003ras$C_PEAT.7
PEATemissions2003_8_gC_grid_cell <- emissions2003_8_gC_grid_cell*gfed2003ras$C_PEAT.8
PEATemissions2003_9_gC_grid_cell <- emissions2003_9_gC_grid_cell*gfed2003ras$C_PEAT.9
PEATemissions2003_10_gC_grid_cell <- emissions2003_10_gC_grid_cell*gfed2003ras$C_PEAT.10
PEATemissions2003_11_gC_grid_cell <- emissions2003_11_gC_grid_cell*gfed2003ras$C_PEAT.11
PEATemissions2003_12_gC_grid_cell <- emissions2003_12_gC_grid_cell*gfed2003ras$C_PEAT.12
PEATemissions2004_1_gC_grid_cell <- emissions2004_1_gC_grid_cell*gfed2004ras$C_PEAT.1 #2004
PEATemissions2004_2_gC_grid_cell <- emissions2004_2_gC_grid_cell*gfed2004ras$C_PEAT.2
PEATemissions2004_3_gC_grid_cell <- emissions2004_3_gC_grid_cell*gfed2004ras$C_PEAT.3
PEATemissions2004_4_gC_grid_cell <- emissions2004_4_gC_grid_cell*gfed2004ras$C_PEAT.4
PEATemissions2004_5_gC_grid_cell <- emissions2004_5_gC_grid_cell*gfed2004ras$C_PEAT.5
PEATemissions2004_6_gC_grid_cell <- emissions2004_6_gC_grid_cell*gfed2004ras$C_PEAT.6
PEATemissions2004_7_gC_grid_cell <- emissions2004_7_gC_grid_cell*gfed2004ras$C_PEAT.7
PEATemissions2004_8_gC_grid_cell <- emissions2004_8_gC_grid_cell*gfed2004ras$C_PEAT.8
PEATemissions2004_9_gC_grid_cell <- emissions2004_9_gC_grid_cell*gfed2004ras$C_PEAT.9
PEATemissions2004_10_gC_grid_cell <- emissions2004_10_gC_grid_cell*gfed2004ras$C_PEAT.10
PEATemissions2004_11_gC_grid_cell <- emissions2004_11_gC_grid_cell*gfed2004ras$C_PEAT.11
PEATemissions2004_12_gC_grid_cell <- emissions2004_12_gC_grid_cell*gfed2004ras$C_PEAT.12
PEATemissions2005_1_gC_grid_cell <- emissions2005_1_gC_grid_cell*gfed2005ras$C_PEAT.1 #2005
PEATemissions2005_2_gC_grid_cell <- emissions2005_2_gC_grid_cell*gfed2005ras$C_PEAT.2
PEATemissions2005_3_gC_grid_cell <- emissions2005_3_gC_grid_cell*gfed2005ras$C_PEAT.3
PEATemissions2005_4_gC_grid_cell <- emissions2005_4_gC_grid_cell*gfed2005ras$C_PEAT.4
PEATemissions2005_5_gC_grid_cell <- emissions2005_5_gC_grid_cell*gfed2005ras$C_PEAT.5
PEATemissions2005_6_gC_grid_cell <- emissions2005_6_gC_grid_cell*gfed2005ras$C_PEAT.6
PEATemissions2005_7_gC_grid_cell <- emissions2005_7_gC_grid_cell*gfed2005ras$C_PEAT.7
PEATemissions2005_8_gC_grid_cell <- emissions2005_8_gC_grid_cell*gfed2005ras$C_PEAT.8
PEATemissions2005_9_gC_grid_cell <- emissions2005_9_gC_grid_cell*gfed2005ras$C_PEAT.9
PEATemissions2005_10_gC_grid_cell <- emissions2005_10_gC_grid_cell*gfed2005ras$C_PEAT.10
PEATemissions2005_11_gC_grid_cell <- emissions2005_11_gC_grid_cell*gfed2005ras$C_PEAT.11
PEATemissions2005_12_gC_grid_cell <- emissions2005_12_gC_grid_cell*gfed2005ras$C_PEAT.12
PEATemissions2006_1_gC_grid_cell <- emissions2006_1_gC_grid_cell*gfed2006ras$C_PEAT.1 #2006
PEATemissions2006_2_gC_grid_cell <- emissions2006_2_gC_grid_cell*gfed2006ras$C_PEAT.2
PEATemissions2006_3_gC_grid_cell <- emissions2006_3_gC_grid_cell*gfed2006ras$C_PEAT.3
PEATemissions2006_4_gC_grid_cell <- emissions2006_4_gC_grid_cell*gfed2006ras$C_PEAT.4
PEATemissions2006_5_gC_grid_cell <- emissions2006_5_gC_grid_cell*gfed2006ras$C_PEAT.5
PEATemissions2006_6_gC_grid_cell <- emissions2006_6_gC_grid_cell*gfed2006ras$C_PEAT.6
PEATemissions2006_7_gC_grid_cell <- emissions2006_7_gC_grid_cell*gfed2006ras$C_PEAT.7
PEATemissions2006_8_gC_grid_cell <- emissions2006_8_gC_grid_cell*gfed2006ras$C_PEAT.8
PEATemissions2006_9_gC_grid_cell <- emissions2006_9_gC_grid_cell*gfed2006ras$C_PEAT.9
PEATemissions2006_10_gC_grid_cell <- emissions2006_10_gC_grid_cell*gfed2006ras$C_PEAT.10
PEATemissions2006_11_gC_grid_cell <- emissions2006_11_gC_grid_cell*gfed2006ras$C_PEAT.11
PEATemissions2006_12_gC_grid_cell <- emissions2006_12_gC_grid_cell*gfed2006ras$C_PEAT.12
PEATemissions2007_1_gC_grid_cell <- emissions2007_1_gC_grid_cell*gfed2007ras$C_PEAT.1 #2007
PEATemissions2007_2_gC_grid_cell <- emissions2007_2_gC_grid_cell*gfed2007ras$C_PEAT.2
PEATemissions2007_3_gC_grid_cell <- emissions2007_3_gC_grid_cell*gfed2007ras$C_PEAT.3
PEATemissions2007_4_gC_grid_cell <- emissions2007_4_gC_grid_cell*gfed2007ras$C_PEAT.4
PEATemissions2007_5_gC_grid_cell <- emissions2007_5_gC_grid_cell*gfed2007ras$C_PEAT.5
PEATemissions2007_6_gC_grid_cell <- emissions2007_6_gC_grid_cell*gfed2007ras$C_PEAT.6
PEATemissions2007_7_gC_grid_cell <- emissions2007_7_gC_grid_cell*gfed2007ras$C_PEAT.7
PEATemissions2007_8_gC_grid_cell <- emissions2007_8_gC_grid_cell*gfed2007ras$C_PEAT.8
PEATemissions2007_9_gC_grid_cell <- emissions2007_9_gC_grid_cell*gfed2007ras$C_PEAT.9
PEATemissions2007_10_gC_grid_cell <- emissions2007_10_gC_grid_cell*gfed2007ras$C_PEAT.10
PEATemissions2007_11_gC_grid_cell <- emissions2007_11_gC_grid_cell*gfed2007ras$C_PEAT.11
PEATemissions2007_12_gC_grid_cell <- emissions2007_12_gC_grid_cell*gfed2007ras$C_PEAT.12
PEATemissions2008_1_gC_grid_cell <- emissions2008_1_gC_grid_cell*gfed2008ras$C_PEAT.1 #2008
PEATemissions2008_2_gC_grid_cell <- emissions2008_2_gC_grid_cell*gfed2008ras$C_PEAT.2
PEATemissions2008_3_gC_grid_cell <- emissions2008_3_gC_grid_cell*gfed2008ras$C_PEAT.3
PEATemissions2008_4_gC_grid_cell <- emissions2008_4_gC_grid_cell*gfed2008ras$C_PEAT.4
PEATemissions2008_5_gC_grid_cell <- emissions2008_5_gC_grid_cell*gfed2008ras$C_PEAT.5
PEATemissions2008_6_gC_grid_cell <- emissions2008_6_gC_grid_cell*gfed2008ras$C_PEAT.6
PEATemissions2008_7_gC_grid_cell <- emissions2008_7_gC_grid_cell*gfed2008ras$C_PEAT.7
PEATemissions2008_8_gC_grid_cell <- emissions2008_8_gC_grid_cell*gfed2008ras$C_PEAT.8
PEATemissions2008_9_gC_grid_cell <- emissions2008_9_gC_grid_cell*gfed2008ras$C_PEAT.9
PEATemissions2008_10_gC_grid_cell <- emissions2008_10_gC_grid_cell*gfed2008ras$C_PEAT.10
PEATemissions2008_11_gC_grid_cell <- emissions2008_11_gC_grid_cell*gfed2008ras$C_PEAT.11
PEATemissions2008_12_gC_grid_cell <- emissions2008_12_gC_grid_cell*gfed2008ras$C_PEAT.12
PEATemissions2009_1_gC_grid_cell <- emissions2009_1_gC_grid_cell*gfed2009ras$C_PEAT.1 #2009
PEATemissions2009_2_gC_grid_cell <- emissions2009_2_gC_grid_cell*gfed2009ras$C_PEAT.2
PEATemissions2009_3_gC_grid_cell <- emissions2009_3_gC_grid_cell*gfed2009ras$C_PEAT.3
PEATemissions2009_4_gC_grid_cell <- emissions2009_4_gC_grid_cell*gfed2009ras$C_PEAT.4
PEATemissions2009_5_gC_grid_cell <- emissions2009_5_gC_grid_cell*gfed2009ras$C_PEAT.5
PEATemissions2009_6_gC_grid_cell <- emissions2009_6_gC_grid_cell*gfed2009ras$C_PEAT.6
PEATemissions2009_7_gC_grid_cell <- emissions2009_7_gC_grid_cell*gfed2009ras$C_PEAT.7
PEATemissions2009_8_gC_grid_cell <- emissions2009_8_gC_grid_cell*gfed2009ras$C_PEAT.8
PEATemissions2009_9_gC_grid_cell <- emissions2009_9_gC_grid_cell*gfed2009ras$C_PEAT.9
PEATemissions2009_10_gC_grid_cell <- emissions2009_10_gC_grid_cell*gfed2009ras$C_PEAT.10
PEATemissions2009_11_gC_grid_cell <- emissions2009_11_gC_grid_cell*gfed2009ras$C_PEAT.11
PEATemissions2009_12_gC_grid_cell <- emissions2009_12_gC_grid_cell*gfed2009ras$C_PEAT.12
PEATemissions2010_1_gC_grid_cell <- emissions2010_1_gC_grid_cell*gfed2010ras$C_PEAT.1 #2010
PEATemissions2010_2_gC_grid_cell <- emissions2010_2_gC_grid_cell*gfed2010ras$C_PEAT.2
PEATemissions2010_3_gC_grid_cell <- emissions2010_3_gC_grid_cell*gfed2010ras$C_PEAT.3
PEATemissions2010_4_gC_grid_cell <- emissions2010_4_gC_grid_cell*gfed2010ras$C_PEAT.4
PEATemissions2010_5_gC_grid_cell <- emissions2010_5_gC_grid_cell*gfed2010ras$C_PEAT.5
PEATemissions2010_6_gC_grid_cell <- emissions2010_6_gC_grid_cell*gfed2010ras$C_PEAT.6
PEATemissions2010_7_gC_grid_cell <- emissions2010_7_gC_grid_cell*gfed2010ras$C_PEAT.7
PEATemissions2010_8_gC_grid_cell <- emissions2010_8_gC_grid_cell*gfed2010ras$C_PEAT.8
PEATemissions2010_9_gC_grid_cell <- emissions2010_9_gC_grid_cell*gfed2010ras$C_PEAT.9
PEATemissions2010_10_gC_grid_cell <- emissions2010_10_gC_grid_cell*gfed2010ras$C_PEAT.10
PEATemissions2010_11_gC_grid_cell <- emissions2010_11_gC_grid_cell*gfed2010ras$C_PEAT.11
PEATemissions2010_12_gC_grid_cell <- emissions2010_12_gC_grid_cell*gfed2010ras$C_PEAT.12
PEATemissions2011_1_gC_grid_cell <- emissions2011_1_gC_grid_cell*gfed2011ras$C_PEAT.1 #2011
PEATemissions2011_2_gC_grid_cell <- emissions2011_2_gC_grid_cell*gfed2011ras$C_PEAT.2
PEATemissions2011_3_gC_grid_cell <- emissions2011_3_gC_grid_cell*gfed2011ras$C_PEAT.3
PEATemissions2011_4_gC_grid_cell <- emissions2011_4_gC_grid_cell*gfed2011ras$C_PEAT.4
PEATemissions2011_5_gC_grid_cell <- emissions2011_5_gC_grid_cell*gfed2011ras$C_PEAT.5
PEATemissions2011_6_gC_grid_cell <- emissions2011_6_gC_grid_cell*gfed2011ras$C_PEAT.6
PEATemissions2011_7_gC_grid_cell <- emissions2011_7_gC_grid_cell*gfed2011ras$C_PEAT.7
PEATemissions2011_8_gC_grid_cell <- emissions2011_8_gC_grid_cell*gfed2011ras$C_PEAT.8
PEATemissions2011_9_gC_grid_cell <- emissions2011_9_gC_grid_cell*gfed2011ras$C_PEAT.9
PEATemissions2011_10_gC_grid_cell <- emissions2011_10_gC_grid_cell*gfed2011ras$C_PEAT.10
PEATemissions2011_11_gC_grid_cell <- emissions2011_11_gC_grid_cell*gfed2011ras$C_PEAT.11
PEATemissions2011_12_gC_grid_cell <- emissions2011_12_gC_grid_cell*gfed2011ras$C_PEAT.12
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
TEMFemissions1997_1_gC_grid_cell <- emissions1997_1_gC_grid_cell*gfed1997ras$C_TEMF.1 #1997
TEMFemissions1997_2_gC_grid_cell <- emissions1997_2_gC_grid_cell*gfed1997ras$C_TEMF.2
TEMFemissions1997_3_gC_grid_cell <- emissions1997_3_gC_grid_cell*gfed1997ras$C_TEMF.3
TEMFemissions1997_4_gC_grid_cell <- emissions1997_4_gC_grid_cell*gfed1997ras$C_TEMF.4
TEMFemissions1997_5_gC_grid_cell <- emissions1997_5_gC_grid_cell*gfed1997ras$C_TEMF.5
TEMFemissions1997_6_gC_grid_cell <- emissions1997_6_gC_grid_cell*gfed1997ras$C_TEMF.6
TEMFemissions1997_7_gC_grid_cell <- emissions1997_7_gC_grid_cell*gfed1997ras$C_TEMF.7
TEMFemissions1997_8_gC_grid_cell <- emissions1997_8_gC_grid_cell*gfed1997ras$C_TEMF.8
TEMFemissions1997_9_gC_grid_cell <- emissions1997_9_gC_grid_cell*gfed1997ras$C_TEMF.9
TEMFemissions1997_10_gC_grid_cell <- emissions1997_10_gC_grid_cell*gfed1997ras$C_TEMF.10
TEMFemissions1997_11_gC_grid_cell <- emissions1997_11_gC_grid_cell*gfed1997ras$C_TEMF.11
TEMFemissions1997_12_gC_grid_cell <- emissions1997_12_gC_grid_cell*gfed1997ras$C_TEMF.12
TEMFemissions1998_1_gC_grid_cell <- emissions1998_1_gC_grid_cell*gfed1998ras$C_TEMF.1 #1998
TEMFemissions1998_2_gC_grid_cell <- emissions1998_2_gC_grid_cell*gfed1998ras$C_TEMF.2
TEMFemissions1998_3_gC_grid_cell <- emissions1998_3_gC_grid_cell*gfed1998ras$C_TEMF.3
TEMFemissions1998_4_gC_grid_cell <- emissions1998_4_gC_grid_cell*gfed1998ras$C_TEMF.4
TEMFemissions1998_5_gC_grid_cell <- emissions1998_5_gC_grid_cell*gfed1998ras$C_TEMF.5
TEMFemissions1998_6_gC_grid_cell <- emissions1998_6_gC_grid_cell*gfed1998ras$C_TEMF.6
TEMFemissions1998_7_gC_grid_cell <- emissions1998_7_gC_grid_cell*gfed1998ras$C_TEMF.7
TEMFemissions1998_8_gC_grid_cell <- emissions1998_8_gC_grid_cell*gfed1998ras$C_TEMF.8
TEMFemissions1998_9_gC_grid_cell <- emissions1998_9_gC_grid_cell*gfed1998ras$C_TEMF.9
TEMFemissions1998_10_gC_grid_cell <- emissions1998_10_gC_grid_cell*gfed1998ras$C_TEMF.10
TEMFemissions1998_11_gC_grid_cell <- emissions1998_11_gC_grid_cell*gfed1998ras$C_TEMF.11
TEMFemissions1998_12_gC_grid_cell <- emissions1998_12_gC_grid_cell*gfed1998ras$C_TEMF.12
TEMFemissions1999_1_gC_grid_cell <- emissions1999_1_gC_grid_cell*gfed1999ras$C_TEMF.1 #1999
TEMFemissions1999_2_gC_grid_cell <- emissions1999_2_gC_grid_cell*gfed1999ras$C_TEMF.2
TEMFemissions1999_3_gC_grid_cell <- emissions1999_3_gC_grid_cell*gfed1999ras$C_TEMF.3
TEMFemissions1999_4_gC_grid_cell <- emissions1999_4_gC_grid_cell*gfed1999ras$C_TEMF.4
TEMFemissions1999_5_gC_grid_cell <- emissions1999_5_gC_grid_cell*gfed1999ras$C_TEMF.5
TEMFemissions1999_6_gC_grid_cell <- emissions1999_6_gC_grid_cell*gfed1999ras$C_TEMF.6
TEMFemissions1999_7_gC_grid_cell <- emissions1999_7_gC_grid_cell*gfed1999ras$C_TEMF.7
TEMFemissions1999_8_gC_grid_cell <- emissions1999_8_gC_grid_cell*gfed1999ras$C_TEMF.8
TEMFemissions1999_9_gC_grid_cell <- emissions1999_9_gC_grid_cell*gfed1999ras$C_TEMF.9
TEMFemissions1999_10_gC_grid_cell <- emissions1999_10_gC_grid_cell*gfed1999ras$C_TEMF.10
TEMFemissions1999_11_gC_grid_cell <- emissions1999_11_gC_grid_cell*gfed1999ras$C_TEMF.11
TEMFemissions1999_12_gC_grid_cell <- emissions1999_12_gC_grid_cell*gfed1999ras$C_TEMF.12
TEMFemissions2000_1_gC_grid_cell <- emissions2000_1_gC_grid_cell*gfed2000ras$C_TEMF.1 #2000
TEMFemissions2000_2_gC_grid_cell <- emissions2000_2_gC_grid_cell*gfed2000ras$C_TEMF.2
TEMFemissions2000_3_gC_grid_cell <- emissions2000_3_gC_grid_cell*gfed2000ras$C_TEMF.3
TEMFemissions2000_4_gC_grid_cell <- emissions2000_4_gC_grid_cell*gfed2000ras$C_TEMF.4
TEMFemissions2000_5_gC_grid_cell <- emissions2000_5_gC_grid_cell*gfed2000ras$C_TEMF.5
TEMFemissions2000_6_gC_grid_cell <- emissions2000_6_gC_grid_cell*gfed2000ras$C_TEMF.6
TEMFemissions2000_7_gC_grid_cell <- emissions2000_7_gC_grid_cell*gfed2000ras$C_TEMF.7
TEMFemissions2000_8_gC_grid_cell <- emissions2000_8_gC_grid_cell*gfed2000ras$C_TEMF.8
TEMFemissions2000_9_gC_grid_cell <- emissions2000_9_gC_grid_cell*gfed2000ras$C_TEMF.9
TEMFemissions2000_10_gC_grid_cell <- emissions2000_10_gC_grid_cell*gfed2000ras$C_TEMF.10
TEMFemissions2000_11_gC_grid_cell <- emissions2000_11_gC_grid_cell*gfed2000ras$C_TEMF.11
TEMFemissions2000_12_gC_grid_cell <- emissions2000_12_gC_grid_cell*gfed2000ras$C_TEMF.12
TEMFemissions2001_1_gC_grid_cell <- emissions2001_1_gC_grid_cell*gfed2001ras$C_TEMF.1 #2001
TEMFemissions2001_2_gC_grid_cell <- emissions2001_2_gC_grid_cell*gfed2001ras$C_TEMF.2
TEMFemissions2001_3_gC_grid_cell <- emissions2001_3_gC_grid_cell*gfed2001ras$C_TEMF.3
TEMFemissions2001_4_gC_grid_cell <- emissions2001_4_gC_grid_cell*gfed2001ras$C_TEMF.4
TEMFemissions2001_5_gC_grid_cell <- emissions2001_5_gC_grid_cell*gfed2001ras$C_TEMF.5
TEMFemissions2001_6_gC_grid_cell <- emissions2001_6_gC_grid_cell*gfed2001ras$C_TEMF.6
TEMFemissions2001_7_gC_grid_cell <- emissions2001_7_gC_grid_cell*gfed2001ras$C_TEMF.7
TEMFemissions2001_8_gC_grid_cell <- emissions2001_8_gC_grid_cell*gfed2001ras$C_TEMF.8
TEMFemissions2001_9_gC_grid_cell <- emissions2001_9_gC_grid_cell*gfed2001ras$C_TEMF.9
TEMFemissions2001_10_gC_grid_cell <- emissions2001_10_gC_grid_cell*gfed2001ras$C_TEMF.10
TEMFemissions2001_11_gC_grid_cell <- emissions2001_11_gC_grid_cell*gfed2001ras$C_TEMF.11
TEMFemissions2001_12_gC_grid_cell <- emissions2001_12_gC_grid_cell*gfed2001ras$C_TEMF.12
TEMFemissions2002_1_gC_grid_cell <- emissions2002_1_gC_grid_cell*gfed2002ras$C_TEMF.1 #2002
TEMFemissions2002_2_gC_grid_cell <- emissions2002_2_gC_grid_cell*gfed2002ras$C_TEMF.2
TEMFemissions2002_3_gC_grid_cell <- emissions2002_3_gC_grid_cell*gfed2002ras$C_TEMF.3
TEMFemissions2002_4_gC_grid_cell <- emissions2002_4_gC_grid_cell*gfed2002ras$C_TEMF.4
TEMFemissions2002_5_gC_grid_cell <- emissions2002_5_gC_grid_cell*gfed2002ras$C_TEMF.5
TEMFemissions2002_6_gC_grid_cell <- emissions2002_6_gC_grid_cell*gfed2002ras$C_TEMF.6
TEMFemissions2002_7_gC_grid_cell <- emissions2002_7_gC_grid_cell*gfed2002ras$C_TEMF.7
TEMFemissions2002_8_gC_grid_cell <- emissions2002_8_gC_grid_cell*gfed2002ras$C_TEMF.8
TEMFemissions2002_9_gC_grid_cell <- emissions2002_9_gC_grid_cell*gfed2002ras$C_TEMF.9
TEMFemissions2002_10_gC_grid_cell <- emissions2002_10_gC_grid_cell*gfed2002ras$C_TEMF.10
TEMFemissions2002_11_gC_grid_cell <- emissions2002_11_gC_grid_cell*gfed2002ras$C_TEMF.11
TEMFemissions2002_12_gC_grid_cell <- emissions2002_12_gC_grid_cell*gfed2002ras$C_TEMF.12
TEMFemissions2003_1_gC_grid_cell <- emissions2003_1_gC_grid_cell*gfed2003ras$C_TEMF.1 #2003
TEMFemissions2003_2_gC_grid_cell <- emissions2003_2_gC_grid_cell*gfed2003ras$C_TEMF.2
TEMFemissions2003_3_gC_grid_cell <- emissions2003_3_gC_grid_cell*gfed2003ras$C_TEMF.3
TEMFemissions2003_4_gC_grid_cell <- emissions2003_4_gC_grid_cell*gfed2003ras$C_TEMF.4
TEMFemissions2003_5_gC_grid_cell <- emissions2003_5_gC_grid_cell*gfed2003ras$C_TEMF.5
TEMFemissions2003_6_gC_grid_cell <- emissions2003_6_gC_grid_cell*gfed2003ras$C_TEMF.6
TEMFemissions2003_7_gC_grid_cell <- emissions2003_7_gC_grid_cell*gfed2003ras$C_TEMF.7
TEMFemissions2003_8_gC_grid_cell <- emissions2003_8_gC_grid_cell*gfed2003ras$C_TEMF.8
TEMFemissions2003_9_gC_grid_cell <- emissions2003_9_gC_grid_cell*gfed2003ras$C_TEMF.9
TEMFemissions2003_10_gC_grid_cell <- emissions2003_10_gC_grid_cell*gfed2003ras$C_TEMF.10
TEMFemissions2003_11_gC_grid_cell <- emissions2003_11_gC_grid_cell*gfed2003ras$C_TEMF.11
TEMFemissions2003_12_gC_grid_cell <- emissions2003_12_gC_grid_cell*gfed2003ras$C_TEMF.12
TEMFemissions2004_1_gC_grid_cell <- emissions2004_1_gC_grid_cell*gfed2004ras$C_TEMF.1 #2004
TEMFemissions2004_2_gC_grid_cell <- emissions2004_2_gC_grid_cell*gfed2004ras$C_TEMF.2
TEMFemissions2004_3_gC_grid_cell <- emissions2004_3_gC_grid_cell*gfed2004ras$C_TEMF.3
TEMFemissions2004_4_gC_grid_cell <- emissions2004_4_gC_grid_cell*gfed2004ras$C_TEMF.4
TEMFemissions2004_5_gC_grid_cell <- emissions2004_5_gC_grid_cell*gfed2004ras$C_TEMF.5
TEMFemissions2004_6_gC_grid_cell <- emissions2004_6_gC_grid_cell*gfed2004ras$C_TEMF.6
TEMFemissions2004_7_gC_grid_cell <- emissions2004_7_gC_grid_cell*gfed2004ras$C_TEMF.7
TEMFemissions2004_8_gC_grid_cell <- emissions2004_8_gC_grid_cell*gfed2004ras$C_TEMF.8
TEMFemissions2004_9_gC_grid_cell <- emissions2004_9_gC_grid_cell*gfed2004ras$C_TEMF.9
TEMFemissions2004_10_gC_grid_cell <- emissions2004_10_gC_grid_cell*gfed2004ras$C_TEMF.10
TEMFemissions2004_11_gC_grid_cell <- emissions2004_11_gC_grid_cell*gfed2004ras$C_TEMF.11
TEMFemissions2004_12_gC_grid_cell <- emissions2004_12_gC_grid_cell*gfed2004ras$C_TEMF.12
TEMFemissions2005_1_gC_grid_cell <- emissions2005_1_gC_grid_cell*gfed2005ras$C_TEMF.1 #2005
TEMFemissions2005_2_gC_grid_cell <- emissions2005_2_gC_grid_cell*gfed2005ras$C_TEMF.2
TEMFemissions2005_3_gC_grid_cell <- emissions2005_3_gC_grid_cell*gfed2005ras$C_TEMF.3
TEMFemissions2005_4_gC_grid_cell <- emissions2005_4_gC_grid_cell*gfed2005ras$C_TEMF.4
TEMFemissions2005_5_gC_grid_cell <- emissions2005_5_gC_grid_cell*gfed2005ras$C_TEMF.5
TEMFemissions2005_6_gC_grid_cell <- emissions2005_6_gC_grid_cell*gfed2005ras$C_TEMF.6
TEMFemissions2005_7_gC_grid_cell <- emissions2005_7_gC_grid_cell*gfed2005ras$C_TEMF.7
TEMFemissions2005_8_gC_grid_cell <- emissions2005_8_gC_grid_cell*gfed2005ras$C_TEMF.8
TEMFemissions2005_9_gC_grid_cell <- emissions2005_9_gC_grid_cell*gfed2005ras$C_TEMF.9
TEMFemissions2005_10_gC_grid_cell <- emissions2005_10_gC_grid_cell*gfed2005ras$C_TEMF.10
TEMFemissions2005_11_gC_grid_cell <- emissions2005_11_gC_grid_cell*gfed2005ras$C_TEMF.11
TEMFemissions2005_12_gC_grid_cell <- emissions2005_12_gC_grid_cell*gfed2005ras$C_TEMF.12
TEMFemissions2006_1_gC_grid_cell <- emissions2006_1_gC_grid_cell*gfed2006ras$C_TEMF.1 #2006
TEMFemissions2006_2_gC_grid_cell <- emissions2006_2_gC_grid_cell*gfed2006ras$C_TEMF.2
TEMFemissions2006_3_gC_grid_cell <- emissions2006_3_gC_grid_cell*gfed2006ras$C_TEMF.3
TEMFemissions2006_4_gC_grid_cell <- emissions2006_4_gC_grid_cell*gfed2006ras$C_TEMF.4
TEMFemissions2006_5_gC_grid_cell <- emissions2006_5_gC_grid_cell*gfed2006ras$C_TEMF.5
TEMFemissions2006_6_gC_grid_cell <- emissions2006_6_gC_grid_cell*gfed2006ras$C_TEMF.6
TEMFemissions2006_7_gC_grid_cell <- emissions2006_7_gC_grid_cell*gfed2006ras$C_TEMF.7
TEMFemissions2006_8_gC_grid_cell <- emissions2006_8_gC_grid_cell*gfed2006ras$C_TEMF.8
TEMFemissions2006_9_gC_grid_cell <- emissions2006_9_gC_grid_cell*gfed2006ras$C_TEMF.9
TEMFemissions2006_10_gC_grid_cell <- emissions2006_10_gC_grid_cell*gfed2006ras$C_TEMF.10
TEMFemissions2006_11_gC_grid_cell <- emissions2006_11_gC_grid_cell*gfed2006ras$C_TEMF.11
TEMFemissions2006_12_gC_grid_cell <- emissions2006_12_gC_grid_cell*gfed2006ras$C_TEMF.12
TEMFemissions2007_1_gC_grid_cell <- emissions2007_1_gC_grid_cell*gfed2007ras$C_TEMF.1 #2007
TEMFemissions2007_2_gC_grid_cell <- emissions2007_2_gC_grid_cell*gfed2007ras$C_TEMF.2
TEMFemissions2007_3_gC_grid_cell <- emissions2007_3_gC_grid_cell*gfed2007ras$C_TEMF.3
TEMFemissions2007_4_gC_grid_cell <- emissions2007_4_gC_grid_cell*gfed2007ras$C_TEMF.4
TEMFemissions2007_5_gC_grid_cell <- emissions2007_5_gC_grid_cell*gfed2007ras$C_TEMF.5
TEMFemissions2007_6_gC_grid_cell <- emissions2007_6_gC_grid_cell*gfed2007ras$C_TEMF.6
TEMFemissions2007_7_gC_grid_cell <- emissions2007_7_gC_grid_cell*gfed2007ras$C_TEMF.7
TEMFemissions2007_8_gC_grid_cell <- emissions2007_8_gC_grid_cell*gfed2007ras$C_TEMF.8
TEMFemissions2007_9_gC_grid_cell <- emissions2007_9_gC_grid_cell*gfed2007ras$C_TEMF.9
TEMFemissions2007_10_gC_grid_cell <- emissions2007_10_gC_grid_cell*gfed2007ras$C_TEMF.10
TEMFemissions2007_11_gC_grid_cell <- emissions2007_11_gC_grid_cell*gfed2007ras$C_TEMF.11
TEMFemissions2007_12_gC_grid_cell <- emissions2007_12_gC_grid_cell*gfed2007ras$C_TEMF.12
TEMFemissions2008_1_gC_grid_cell <- emissions2008_1_gC_grid_cell*gfed2008ras$C_TEMF.1 #2008
TEMFemissions2008_2_gC_grid_cell <- emissions2008_2_gC_grid_cell*gfed2008ras$C_TEMF.2
TEMFemissions2008_3_gC_grid_cell <- emissions2008_3_gC_grid_cell*gfed2008ras$C_TEMF.3
TEMFemissions2008_4_gC_grid_cell <- emissions2008_4_gC_grid_cell*gfed2008ras$C_TEMF.4
TEMFemissions2008_5_gC_grid_cell <- emissions2008_5_gC_grid_cell*gfed2008ras$C_TEMF.5
TEMFemissions2008_6_gC_grid_cell <- emissions2008_6_gC_grid_cell*gfed2008ras$C_TEMF.6
TEMFemissions2008_7_gC_grid_cell <- emissions2008_7_gC_grid_cell*gfed2008ras$C_TEMF.7
TEMFemissions2008_8_gC_grid_cell <- emissions2008_8_gC_grid_cell*gfed2008ras$C_TEMF.8
TEMFemissions2008_9_gC_grid_cell <- emissions2008_9_gC_grid_cell*gfed2008ras$C_TEMF.9
TEMFemissions2008_10_gC_grid_cell <- emissions2008_10_gC_grid_cell*gfed2008ras$C_TEMF.10
TEMFemissions2008_11_gC_grid_cell <- emissions2008_11_gC_grid_cell*gfed2008ras$C_TEMF.11
TEMFemissions2008_12_gC_grid_cell <- emissions2008_12_gC_grid_cell*gfed2008ras$C_TEMF.12
TEMFemissions2009_1_gC_grid_cell <- emissions2009_1_gC_grid_cell*gfed2009ras$C_TEMF.1 #2009
TEMFemissions2009_2_gC_grid_cell <- emissions2009_2_gC_grid_cell*gfed2009ras$C_TEMF.2
TEMFemissions2009_3_gC_grid_cell <- emissions2009_3_gC_grid_cell*gfed2009ras$C_TEMF.3
TEMFemissions2009_4_gC_grid_cell <- emissions2009_4_gC_grid_cell*gfed2009ras$C_TEMF.4
TEMFemissions2009_5_gC_grid_cell <- emissions2009_5_gC_grid_cell*gfed2009ras$C_TEMF.5
TEMFemissions2009_6_gC_grid_cell <- emissions2009_6_gC_grid_cell*gfed2009ras$C_TEMF.6
TEMFemissions2009_7_gC_grid_cell <- emissions2009_7_gC_grid_cell*gfed2009ras$C_TEMF.7
TEMFemissions2009_8_gC_grid_cell <- emissions2009_8_gC_grid_cell*gfed2009ras$C_TEMF.8
TEMFemissions2009_9_gC_grid_cell <- emissions2009_9_gC_grid_cell*gfed2009ras$C_TEMF.9
TEMFemissions2009_10_gC_grid_cell <- emissions2009_10_gC_grid_cell*gfed2009ras$C_TEMF.10
TEMFemissions2009_11_gC_grid_cell <- emissions2009_11_gC_grid_cell*gfed2009ras$C_TEMF.11
TEMFemissions2009_12_gC_grid_cell <- emissions2009_12_gC_grid_cell*gfed2009ras$C_TEMF.12
TEMFemissions2010_1_gC_grid_cell <- emissions2010_1_gC_grid_cell*gfed2010ras$C_TEMF.1 #2010
TEMFemissions2010_2_gC_grid_cell <- emissions2010_2_gC_grid_cell*gfed2010ras$C_TEMF.2
TEMFemissions2010_3_gC_grid_cell <- emissions2010_3_gC_grid_cell*gfed2010ras$C_TEMF.3
TEMFemissions2010_4_gC_grid_cell <- emissions2010_4_gC_grid_cell*gfed2010ras$C_TEMF.4
TEMFemissions2010_5_gC_grid_cell <- emissions2010_5_gC_grid_cell*gfed2010ras$C_TEMF.5
TEMFemissions2010_6_gC_grid_cell <- emissions2010_6_gC_grid_cell*gfed2010ras$C_TEMF.6
TEMFemissions2010_7_gC_grid_cell <- emissions2010_7_gC_grid_cell*gfed2010ras$C_TEMF.7
TEMFemissions2010_8_gC_grid_cell <- emissions2010_8_gC_grid_cell*gfed2010ras$C_TEMF.8
TEMFemissions2010_9_gC_grid_cell <- emissions2010_9_gC_grid_cell*gfed2010ras$C_TEMF.9
TEMFemissions2010_10_gC_grid_cell <- emissions2010_10_gC_grid_cell*gfed2010ras$C_TEMF.10
TEMFemissions2010_11_gC_grid_cell <- emissions2010_11_gC_grid_cell*gfed2010ras$C_TEMF.11
TEMFemissions2010_12_gC_grid_cell <- emissions2010_12_gC_grid_cell*gfed2010ras$C_TEMF.12
TEMFemissions2011_1_gC_grid_cell <- emissions2011_1_gC_grid_cell*gfed2011ras$C_TEMF.1 #2011
TEMFemissions2011_2_gC_grid_cell <- emissions2011_2_gC_grid_cell*gfed2011ras$C_TEMF.2
TEMFemissions2011_3_gC_grid_cell <- emissions2011_3_gC_grid_cell*gfed2011ras$C_TEMF.3
TEMFemissions2011_4_gC_grid_cell <- emissions2011_4_gC_grid_cell*gfed2011ras$C_TEMF.4
TEMFemissions2011_5_gC_grid_cell <- emissions2011_5_gC_grid_cell*gfed2011ras$C_TEMF.5
TEMFemissions2011_6_gC_grid_cell <- emissions2011_6_gC_grid_cell*gfed2011ras$C_TEMF.6
TEMFemissions2011_7_gC_grid_cell <- emissions2011_7_gC_grid_cell*gfed2011ras$C_TEMF.7
TEMFemissions2011_8_gC_grid_cell <- emissions2011_8_gC_grid_cell*gfed2011ras$C_TEMF.8
TEMFemissions2011_9_gC_grid_cell <- emissions2011_9_gC_grid_cell*gfed2011ras$C_TEMF.9
TEMFemissions2011_10_gC_grid_cell <- emissions2011_10_gC_grid_cell*gfed2011ras$C_TEMF.10
TEMFemissions2011_11_gC_grid_cell <- emissions2011_11_gC_grid_cell*gfed2011ras$C_TEMF.11
TEMFemissions2011_12_gC_grid_cell <- emissions2011_12_gC_grid_cell*gfed2011ras$C_TEMF.12
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
SAVAemissions1997_1_gC_grid_cell <- emissions1997_1_gC_grid_cell*gfed1997ras$C_SAVA.1 #1997
SAVAemissions1997_2_gC_grid_cell <- emissions1997_2_gC_grid_cell*gfed1997ras$C_SAVA.2
SAVAemissions1997_3_gC_grid_cell <- emissions1997_3_gC_grid_cell*gfed1997ras$C_SAVA.3
SAVAemissions1997_4_gC_grid_cell <- emissions1997_4_gC_grid_cell*gfed1997ras$C_SAVA.4
SAVAemissions1997_5_gC_grid_cell <- emissions1997_5_gC_grid_cell*gfed1997ras$C_SAVA.5
SAVAemissions1997_6_gC_grid_cell <- emissions1997_6_gC_grid_cell*gfed1997ras$C_SAVA.6
SAVAemissions1997_7_gC_grid_cell <- emissions1997_7_gC_grid_cell*gfed1997ras$C_SAVA.7
SAVAemissions1997_8_gC_grid_cell <- emissions1997_8_gC_grid_cell*gfed1997ras$C_SAVA.8
SAVAemissions1997_9_gC_grid_cell <- emissions1997_9_gC_grid_cell*gfed1997ras$C_SAVA.9
SAVAemissions1997_10_gC_grid_cell <- emissions1997_10_gC_grid_cell*gfed1997ras$C_SAVA.10
SAVAemissions1997_11_gC_grid_cell <- emissions1997_11_gC_grid_cell*gfed1997ras$C_SAVA.11
SAVAemissions1997_12_gC_grid_cell <- emissions1997_12_gC_grid_cell*gfed1997ras$C_SAVA.12
SAVAemissions1998_1_gC_grid_cell <- emissions1998_1_gC_grid_cell*gfed1998ras$C_SAVA.1 #1998
SAVAemissions1998_2_gC_grid_cell <- emissions1998_2_gC_grid_cell*gfed1998ras$C_SAVA.2
SAVAemissions1998_3_gC_grid_cell <- emissions1998_3_gC_grid_cell*gfed1998ras$C_SAVA.3
SAVAemissions1998_4_gC_grid_cell <- emissions1998_4_gC_grid_cell*gfed1998ras$C_SAVA.4
SAVAemissions1998_5_gC_grid_cell <- emissions1998_5_gC_grid_cell*gfed1998ras$C_SAVA.5
SAVAemissions1998_6_gC_grid_cell <- emissions1998_6_gC_grid_cell*gfed1998ras$C_SAVA.6
SAVAemissions1998_7_gC_grid_cell <- emissions1998_7_gC_grid_cell*gfed1998ras$C_SAVA.7
SAVAemissions1998_8_gC_grid_cell <- emissions1998_8_gC_grid_cell*gfed1998ras$C_SAVA.8
SAVAemissions1998_9_gC_grid_cell <- emissions1998_9_gC_grid_cell*gfed1998ras$C_SAVA.9
SAVAemissions1998_10_gC_grid_cell <- emissions1998_10_gC_grid_cell*gfed1998ras$C_SAVA.10
SAVAemissions1998_11_gC_grid_cell <- emissions1998_11_gC_grid_cell*gfed1998ras$C_SAVA.11
SAVAemissions1998_12_gC_grid_cell <- emissions1998_12_gC_grid_cell*gfed1998ras$C_SAVA.12
SAVAemissions1999_1_gC_grid_cell <- emissions1999_1_gC_grid_cell*gfed1999ras$C_SAVA.1 #1999
SAVAemissions1999_2_gC_grid_cell <- emissions1999_2_gC_grid_cell*gfed1999ras$C_SAVA.2
SAVAemissions1999_3_gC_grid_cell <- emissions1999_3_gC_grid_cell*gfed1999ras$C_SAVA.3
SAVAemissions1999_4_gC_grid_cell <- emissions1999_4_gC_grid_cell*gfed1999ras$C_SAVA.4
SAVAemissions1999_5_gC_grid_cell <- emissions1999_5_gC_grid_cell*gfed1999ras$C_SAVA.5
SAVAemissions1999_6_gC_grid_cell <- emissions1999_6_gC_grid_cell*gfed1999ras$C_SAVA.6
SAVAemissions1999_7_gC_grid_cell <- emissions1999_7_gC_grid_cell*gfed1999ras$C_SAVA.7
SAVAemissions1999_8_gC_grid_cell <- emissions1999_8_gC_grid_cell*gfed1999ras$C_SAVA.8
SAVAemissions1999_9_gC_grid_cell <- emissions1999_9_gC_grid_cell*gfed1999ras$C_SAVA.9
SAVAemissions1999_10_gC_grid_cell <- emissions1999_10_gC_grid_cell*gfed1999ras$C_SAVA.10
SAVAemissions1999_11_gC_grid_cell <- emissions1999_11_gC_grid_cell*gfed1999ras$C_SAVA.11
SAVAemissions1999_12_gC_grid_cell <- emissions1999_12_gC_grid_cell*gfed1999ras$C_SAVA.12
SAVAemissions2000_1_gC_grid_cell <- emissions2000_1_gC_grid_cell*gfed2000ras$C_SAVA.1 #2000
SAVAemissions2000_2_gC_grid_cell <- emissions2000_2_gC_grid_cell*gfed2000ras$C_SAVA.2
SAVAemissions2000_3_gC_grid_cell <- emissions2000_3_gC_grid_cell*gfed2000ras$C_SAVA.3
SAVAemissions2000_4_gC_grid_cell <- emissions2000_4_gC_grid_cell*gfed2000ras$C_SAVA.4
SAVAemissions2000_5_gC_grid_cell <- emissions2000_5_gC_grid_cell*gfed2000ras$C_SAVA.5
SAVAemissions2000_6_gC_grid_cell <- emissions2000_6_gC_grid_cell*gfed2000ras$C_SAVA.6
SAVAemissions2000_7_gC_grid_cell <- emissions2000_7_gC_grid_cell*gfed2000ras$C_SAVA.7
SAVAemissions2000_8_gC_grid_cell <- emissions2000_8_gC_grid_cell*gfed2000ras$C_SAVA.8
SAVAemissions2000_9_gC_grid_cell <- emissions2000_9_gC_grid_cell*gfed2000ras$C_SAVA.9
SAVAemissions2000_10_gC_grid_cell <- emissions2000_10_gC_grid_cell*gfed2000ras$C_SAVA.10
SAVAemissions2000_11_gC_grid_cell <- emissions2000_11_gC_grid_cell*gfed2000ras$C_SAVA.11
SAVAemissions2000_12_gC_grid_cell <- emissions2000_12_gC_grid_cell*gfed2000ras$C_SAVA.12
SAVAemissions2001_1_gC_grid_cell <- emissions2001_1_gC_grid_cell*gfed2001ras$C_SAVA.1 #2001
SAVAemissions2001_2_gC_grid_cell <- emissions2001_2_gC_grid_cell*gfed2001ras$C_SAVA.2
SAVAemissions2001_3_gC_grid_cell <- emissions2001_3_gC_grid_cell*gfed2001ras$C_SAVA.3
SAVAemissions2001_4_gC_grid_cell <- emissions2001_4_gC_grid_cell*gfed2001ras$C_SAVA.4
SAVAemissions2001_5_gC_grid_cell <- emissions2001_5_gC_grid_cell*gfed2001ras$C_SAVA.5
SAVAemissions2001_6_gC_grid_cell <- emissions2001_6_gC_grid_cell*gfed2001ras$C_SAVA.6
SAVAemissions2001_7_gC_grid_cell <- emissions2001_7_gC_grid_cell*gfed2001ras$C_SAVA.7
SAVAemissions2001_8_gC_grid_cell <- emissions2001_8_gC_grid_cell*gfed2001ras$C_SAVA.8
SAVAemissions2001_9_gC_grid_cell <- emissions2001_9_gC_grid_cell*gfed2001ras$C_SAVA.9
SAVAemissions2001_10_gC_grid_cell <- emissions2001_10_gC_grid_cell*gfed2001ras$C_SAVA.10
SAVAemissions2001_11_gC_grid_cell <- emissions2001_11_gC_grid_cell*gfed2001ras$C_SAVA.11
SAVAemissions2001_12_gC_grid_cell <- emissions2001_12_gC_grid_cell*gfed2001ras$C_SAVA.12
SAVAemissions2002_1_gC_grid_cell <- emissions2002_1_gC_grid_cell*gfed2002ras$C_SAVA.1 #2002
SAVAemissions2002_2_gC_grid_cell <- emissions2002_2_gC_grid_cell*gfed2002ras$C_SAVA.2
SAVAemissions2002_3_gC_grid_cell <- emissions2002_3_gC_grid_cell*gfed2002ras$C_SAVA.3
SAVAemissions2002_4_gC_grid_cell <- emissions2002_4_gC_grid_cell*gfed2002ras$C_SAVA.4
SAVAemissions2002_5_gC_grid_cell <- emissions2002_5_gC_grid_cell*gfed2002ras$C_SAVA.5
SAVAemissions2002_6_gC_grid_cell <- emissions2002_6_gC_grid_cell*gfed2002ras$C_SAVA.6
SAVAemissions2002_7_gC_grid_cell <- emissions2002_7_gC_grid_cell*gfed2002ras$C_SAVA.7
SAVAemissions2002_8_gC_grid_cell <- emissions2002_8_gC_grid_cell*gfed2002ras$C_SAVA.8
SAVAemissions2002_9_gC_grid_cell <- emissions2002_9_gC_grid_cell*gfed2002ras$C_SAVA.9
SAVAemissions2002_10_gC_grid_cell <- emissions2002_10_gC_grid_cell*gfed2002ras$C_SAVA.10
SAVAemissions2002_11_gC_grid_cell <- emissions2002_11_gC_grid_cell*gfed2002ras$C_SAVA.11
SAVAemissions2002_12_gC_grid_cell <- emissions2002_12_gC_grid_cell*gfed2002ras$C_SAVA.12
SAVAemissions2003_1_gC_grid_cell <- emissions2003_1_gC_grid_cell*gfed2003ras$C_SAVA.1 #2003
SAVAemissions2003_2_gC_grid_cell <- emissions2003_2_gC_grid_cell*gfed2003ras$C_SAVA.2
SAVAemissions2003_3_gC_grid_cell <- emissions2003_3_gC_grid_cell*gfed2003ras$C_SAVA.3
SAVAemissions2003_4_gC_grid_cell <- emissions2003_4_gC_grid_cell*gfed2003ras$C_SAVA.4
SAVAemissions2003_5_gC_grid_cell <- emissions2003_5_gC_grid_cell*gfed2003ras$C_SAVA.5
SAVAemissions2003_6_gC_grid_cell <- emissions2003_6_gC_grid_cell*gfed2003ras$C_SAVA.6
SAVAemissions2003_7_gC_grid_cell <- emissions2003_7_gC_grid_cell*gfed2003ras$C_SAVA.7
SAVAemissions2003_8_gC_grid_cell <- emissions2003_8_gC_grid_cell*gfed2003ras$C_SAVA.8
SAVAemissions2003_9_gC_grid_cell <- emissions2003_9_gC_grid_cell*gfed2003ras$C_SAVA.9
SAVAemissions2003_10_gC_grid_cell <- emissions2003_10_gC_grid_cell*gfed2003ras$C_SAVA.10
SAVAemissions2003_11_gC_grid_cell <- emissions2003_11_gC_grid_cell*gfed2003ras$C_SAVA.11
SAVAemissions2003_12_gC_grid_cell <- emissions2003_12_gC_grid_cell*gfed2003ras$C_SAVA.12
SAVAemissions2004_1_gC_grid_cell <- emissions2004_1_gC_grid_cell*gfed2004ras$C_SAVA.1 #2004
SAVAemissions2004_2_gC_grid_cell <- emissions2004_2_gC_grid_cell*gfed2004ras$C_SAVA.2
SAVAemissions2004_3_gC_grid_cell <- emissions2004_3_gC_grid_cell*gfed2004ras$C_SAVA.3
SAVAemissions2004_4_gC_grid_cell <- emissions2004_4_gC_grid_cell*gfed2004ras$C_SAVA.4
SAVAemissions2004_5_gC_grid_cell <- emissions2004_5_gC_grid_cell*gfed2004ras$C_SAVA.5
SAVAemissions2004_6_gC_grid_cell <- emissions2004_6_gC_grid_cell*gfed2004ras$C_SAVA.6
SAVAemissions2004_7_gC_grid_cell <- emissions2004_7_gC_grid_cell*gfed2004ras$C_SAVA.7
SAVAemissions2004_8_gC_grid_cell <- emissions2004_8_gC_grid_cell*gfed2004ras$C_SAVA.8
SAVAemissions2004_9_gC_grid_cell <- emissions2004_9_gC_grid_cell*gfed2004ras$C_SAVA.9
SAVAemissions2004_10_gC_grid_cell <- emissions2004_10_gC_grid_cell*gfed2004ras$C_SAVA.10
SAVAemissions2004_11_gC_grid_cell <- emissions2004_11_gC_grid_cell*gfed2004ras$C_SAVA.11
SAVAemissions2004_12_gC_grid_cell <- emissions2004_12_gC_grid_cell*gfed2004ras$C_SAVA.12
SAVAemissions2005_1_gC_grid_cell <- emissions2005_1_gC_grid_cell*gfed2005ras$C_SAVA.1 #2005
SAVAemissions2005_2_gC_grid_cell <- emissions2005_2_gC_grid_cell*gfed2005ras$C_SAVA.2
SAVAemissions2005_3_gC_grid_cell <- emissions2005_3_gC_grid_cell*gfed2005ras$C_SAVA.3
SAVAemissions2005_4_gC_grid_cell <- emissions2005_4_gC_grid_cell*gfed2005ras$C_SAVA.4
SAVAemissions2005_5_gC_grid_cell <- emissions2005_5_gC_grid_cell*gfed2005ras$C_SAVA.5
SAVAemissions2005_6_gC_grid_cell <- emissions2005_6_gC_grid_cell*gfed2005ras$C_SAVA.6
SAVAemissions2005_7_gC_grid_cell <- emissions2005_7_gC_grid_cell*gfed2005ras$C_SAVA.7
SAVAemissions2005_8_gC_grid_cell <- emissions2005_8_gC_grid_cell*gfed2005ras$C_SAVA.8
SAVAemissions2005_9_gC_grid_cell <- emissions2005_9_gC_grid_cell*gfed2005ras$C_SAVA.9
SAVAemissions2005_10_gC_grid_cell <- emissions2005_10_gC_grid_cell*gfed2005ras$C_SAVA.10
SAVAemissions2005_11_gC_grid_cell <- emissions2005_11_gC_grid_cell*gfed2005ras$C_SAVA.11
SAVAemissions2005_12_gC_grid_cell <- emissions2005_12_gC_grid_cell*gfed2005ras$C_SAVA.12
SAVAemissions2006_1_gC_grid_cell <- emissions2006_1_gC_grid_cell*gfed2006ras$C_SAVA.1 #2006
SAVAemissions2006_2_gC_grid_cell <- emissions2006_2_gC_grid_cell*gfed2006ras$C_SAVA.2
SAVAemissions2006_3_gC_grid_cell <- emissions2006_3_gC_grid_cell*gfed2006ras$C_SAVA.3
SAVAemissions2006_4_gC_grid_cell <- emissions2006_4_gC_grid_cell*gfed2006ras$C_SAVA.4
SAVAemissions2006_5_gC_grid_cell <- emissions2006_5_gC_grid_cell*gfed2006ras$C_SAVA.5
SAVAemissions2006_6_gC_grid_cell <- emissions2006_6_gC_grid_cell*gfed2006ras$C_SAVA.6
SAVAemissions2006_7_gC_grid_cell <- emissions2006_7_gC_grid_cell*gfed2006ras$C_SAVA.7
SAVAemissions2006_8_gC_grid_cell <- emissions2006_8_gC_grid_cell*gfed2006ras$C_SAVA.8
SAVAemissions2006_9_gC_grid_cell <- emissions2006_9_gC_grid_cell*gfed2006ras$C_SAVA.9
SAVAemissions2006_10_gC_grid_cell <- emissions2006_10_gC_grid_cell*gfed2006ras$C_SAVA.10
SAVAemissions2006_11_gC_grid_cell <- emissions2006_11_gC_grid_cell*gfed2006ras$C_SAVA.11
SAVAemissions2006_12_gC_grid_cell <- emissions2006_12_gC_grid_cell*gfed2006ras$C_SAVA.12
SAVAemissions2007_1_gC_grid_cell <- emissions2007_1_gC_grid_cell*gfed2007ras$C_SAVA.1 #2007
SAVAemissions2007_2_gC_grid_cell <- emissions2007_2_gC_grid_cell*gfed2007ras$C_SAVA.2
SAVAemissions2007_3_gC_grid_cell <- emissions2007_3_gC_grid_cell*gfed2007ras$C_SAVA.3
SAVAemissions2007_4_gC_grid_cell <- emissions2007_4_gC_grid_cell*gfed2007ras$C_SAVA.4
SAVAemissions2007_5_gC_grid_cell <- emissions2007_5_gC_grid_cell*gfed2007ras$C_SAVA.5
SAVAemissions2007_6_gC_grid_cell <- emissions2007_6_gC_grid_cell*gfed2007ras$C_SAVA.6
SAVAemissions2007_7_gC_grid_cell <- emissions2007_7_gC_grid_cell*gfed2007ras$C_SAVA.7
SAVAemissions2007_8_gC_grid_cell <- emissions2007_8_gC_grid_cell*gfed2007ras$C_SAVA.8
SAVAemissions2007_9_gC_grid_cell <- emissions2007_9_gC_grid_cell*gfed2007ras$C_SAVA.9
SAVAemissions2007_10_gC_grid_cell <- emissions2007_10_gC_grid_cell*gfed2007ras$C_SAVA.10
SAVAemissions2007_11_gC_grid_cell <- emissions2007_11_gC_grid_cell*gfed2007ras$C_SAVA.11
SAVAemissions2007_12_gC_grid_cell <- emissions2007_12_gC_grid_cell*gfed2007ras$C_SAVA.12
SAVAemissions2008_1_gC_grid_cell <- emissions2008_1_gC_grid_cell*gfed2008ras$C_SAVA.1 #2008
SAVAemissions2008_2_gC_grid_cell <- emissions2008_2_gC_grid_cell*gfed2008ras$C_SAVA.2
SAVAemissions2008_3_gC_grid_cell <- emissions2008_3_gC_grid_cell*gfed2008ras$C_SAVA.3
SAVAemissions2008_4_gC_grid_cell <- emissions2008_4_gC_grid_cell*gfed2008ras$C_SAVA.4
SAVAemissions2008_5_gC_grid_cell <- emissions2008_5_gC_grid_cell*gfed2008ras$C_SAVA.5
SAVAemissions2008_6_gC_grid_cell <- emissions2008_6_gC_grid_cell*gfed2008ras$C_SAVA.6
SAVAemissions2008_7_gC_grid_cell <- emissions2008_7_gC_grid_cell*gfed2008ras$C_SAVA.7
SAVAemissions2008_8_gC_grid_cell <- emissions2008_8_gC_grid_cell*gfed2008ras$C_SAVA.8
SAVAemissions2008_9_gC_grid_cell <- emissions2008_9_gC_grid_cell*gfed2008ras$C_SAVA.9
SAVAemissions2008_10_gC_grid_cell <- emissions2008_10_gC_grid_cell*gfed2008ras$C_SAVA.10
SAVAemissions2008_11_gC_grid_cell <- emissions2008_11_gC_grid_cell*gfed2008ras$C_SAVA.11
SAVAemissions2008_12_gC_grid_cell <- emissions2008_12_gC_grid_cell*gfed2008ras$C_SAVA.12
SAVAemissions2009_1_gC_grid_cell <- emissions2009_1_gC_grid_cell*gfed2009ras$C_SAVA.1 #2009
SAVAemissions2009_2_gC_grid_cell <- emissions2009_2_gC_grid_cell*gfed2009ras$C_SAVA.2
SAVAemissions2009_3_gC_grid_cell <- emissions2009_3_gC_grid_cell*gfed2009ras$C_SAVA.3
SAVAemissions2009_4_gC_grid_cell <- emissions2009_4_gC_grid_cell*gfed2009ras$C_SAVA.4
SAVAemissions2009_5_gC_grid_cell <- emissions2009_5_gC_grid_cell*gfed2009ras$C_SAVA.5
SAVAemissions2009_6_gC_grid_cell <- emissions2009_6_gC_grid_cell*gfed2009ras$C_SAVA.6
SAVAemissions2009_7_gC_grid_cell <- emissions2009_7_gC_grid_cell*gfed2009ras$C_SAVA.7
SAVAemissions2009_8_gC_grid_cell <- emissions2009_8_gC_grid_cell*gfed2009ras$C_SAVA.8
SAVAemissions2009_9_gC_grid_cell <- emissions2009_9_gC_grid_cell*gfed2009ras$C_SAVA.9
SAVAemissions2009_10_gC_grid_cell <- emissions2009_10_gC_grid_cell*gfed2009ras$C_SAVA.10
SAVAemissions2009_11_gC_grid_cell <- emissions2009_11_gC_grid_cell*gfed2009ras$C_SAVA.11
SAVAemissions2009_12_gC_grid_cell <- emissions2009_12_gC_grid_cell*gfed2009ras$C_SAVA.12
SAVAemissions2010_1_gC_grid_cell <- emissions2010_1_gC_grid_cell*gfed2010ras$C_SAVA.1 #2010
SAVAemissions2010_2_gC_grid_cell <- emissions2010_2_gC_grid_cell*gfed2010ras$C_SAVA.2
SAVAemissions2010_3_gC_grid_cell <- emissions2010_3_gC_grid_cell*gfed2010ras$C_SAVA.3
SAVAemissions2010_4_gC_grid_cell <- emissions2010_4_gC_grid_cell*gfed2010ras$C_SAVA.4
SAVAemissions2010_5_gC_grid_cell <- emissions2010_5_gC_grid_cell*gfed2010ras$C_SAVA.5
SAVAemissions2010_6_gC_grid_cell <- emissions2010_6_gC_grid_cell*gfed2010ras$C_SAVA.6
SAVAemissions2010_7_gC_grid_cell <- emissions2010_7_gC_grid_cell*gfed2010ras$C_SAVA.7
SAVAemissions2010_8_gC_grid_cell <- emissions2010_8_gC_grid_cell*gfed2010ras$C_SAVA.8
SAVAemissions2010_9_gC_grid_cell <- emissions2010_9_gC_grid_cell*gfed2010ras$C_SAVA.9
SAVAemissions2010_10_gC_grid_cell <- emissions2010_10_gC_grid_cell*gfed2010ras$C_SAVA.10
SAVAemissions2010_11_gC_grid_cell <- emissions2010_11_gC_grid_cell*gfed2010ras$C_SAVA.11
SAVAemissions2010_12_gC_grid_cell <- emissions2010_12_gC_grid_cell*gfed2010ras$C_SAVA.12
SAVAemissions2011_1_gC_grid_cell <- emissions2011_1_gC_grid_cell*gfed2011ras$C_SAVA.1 #2011
SAVAemissions2011_2_gC_grid_cell <- emissions2011_2_gC_grid_cell*gfed2011ras$C_SAVA.2
SAVAemissions2011_3_gC_grid_cell <- emissions2011_3_gC_grid_cell*gfed2011ras$C_SAVA.3
SAVAemissions2011_4_gC_grid_cell <- emissions2011_4_gC_grid_cell*gfed2011ras$C_SAVA.4
SAVAemissions2011_5_gC_grid_cell <- emissions2011_5_gC_grid_cell*gfed2011ras$C_SAVA.5
SAVAemissions2011_6_gC_grid_cell <- emissions2011_6_gC_grid_cell*gfed2011ras$C_SAVA.6
SAVAemissions2011_7_gC_grid_cell <- emissions2011_7_gC_grid_cell*gfed2011ras$C_SAVA.7
SAVAemissions2011_8_gC_grid_cell <- emissions2011_8_gC_grid_cell*gfed2011ras$C_SAVA.8
SAVAemissions2011_9_gC_grid_cell <- emissions2011_9_gC_grid_cell*gfed2011ras$C_SAVA.9
SAVAemissions2011_10_gC_grid_cell <- emissions2011_10_gC_grid_cell*gfed2011ras$C_SAVA.10
SAVAemissions2011_11_gC_grid_cell <- emissions2011_11_gC_grid_cell*gfed2011ras$C_SAVA.11
SAVAemissions2011_12_gC_grid_cell <- emissions2011_12_gC_grid_cell*gfed2011ras$C_SAVA.12
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
BORFemissions1997_1_gC_grid_cell <- emissions1997_1_gC_grid_cell*gfed1997ras$C_BORF.1 #1997
BORFemissions1997_2_gC_grid_cell <- emissions1997_2_gC_grid_cell*gfed1997ras$C_BORF.2
BORFemissions1997_3_gC_grid_cell <- emissions1997_3_gC_grid_cell*gfed1997ras$C_BORF.3
BORFemissions1997_4_gC_grid_cell <- emissions1997_4_gC_grid_cell*gfed1997ras$C_BORF.4
BORFemissions1997_5_gC_grid_cell <- emissions1997_5_gC_grid_cell*gfed1997ras$C_BORF.5
BORFemissions1997_6_gC_grid_cell <- emissions1997_6_gC_grid_cell*gfed1997ras$C_BORF.6
BORFemissions1997_7_gC_grid_cell <- emissions1997_7_gC_grid_cell*gfed1997ras$C_BORF.7
BORFemissions1997_8_gC_grid_cell <- emissions1997_8_gC_grid_cell*gfed1997ras$C_BORF.8
BORFemissions1997_9_gC_grid_cell <- emissions1997_9_gC_grid_cell*gfed1997ras$C_BORF.9
BORFemissions1997_10_gC_grid_cell <- emissions1997_10_gC_grid_cell*gfed1997ras$C_BORF.10
BORFemissions1997_11_gC_grid_cell <- emissions1997_11_gC_grid_cell*gfed1997ras$C_BORF.11
BORFemissions1997_12_gC_grid_cell <- emissions1997_12_gC_grid_cell*gfed1997ras$C_BORF.12
BORFemissions1998_1_gC_grid_cell <- emissions1998_1_gC_grid_cell*gfed1998ras$C_BORF.1 #1998
BORFemissions1998_2_gC_grid_cell <- emissions1998_2_gC_grid_cell*gfed1998ras$C_BORF.2
BORFemissions1998_3_gC_grid_cell <- emissions1998_3_gC_grid_cell*gfed1998ras$C_BORF.3
BORFemissions1998_4_gC_grid_cell <- emissions1998_4_gC_grid_cell*gfed1998ras$C_BORF.4
BORFemissions1998_5_gC_grid_cell <- emissions1998_5_gC_grid_cell*gfed1998ras$C_BORF.5
BORFemissions1998_6_gC_grid_cell <- emissions1998_6_gC_grid_cell*gfed1998ras$C_BORF.6
BORFemissions1998_7_gC_grid_cell <- emissions1998_7_gC_grid_cell*gfed1998ras$C_BORF.7
BORFemissions1998_8_gC_grid_cell <- emissions1998_8_gC_grid_cell*gfed1998ras$C_BORF.8
BORFemissions1998_9_gC_grid_cell <- emissions1998_9_gC_grid_cell*gfed1998ras$C_BORF.9
BORFemissions1998_10_gC_grid_cell <- emissions1998_10_gC_grid_cell*gfed1998ras$C_BORF.10
BORFemissions1998_11_gC_grid_cell <- emissions1998_11_gC_grid_cell*gfed1998ras$C_BORF.11
BORFemissions1998_12_gC_grid_cell <- emissions1998_12_gC_grid_cell*gfed1998ras$C_BORF.12
BORFemissions1999_1_gC_grid_cell <- emissions1999_1_gC_grid_cell*gfed1999ras$C_BORF.1 #1999
BORFemissions1999_2_gC_grid_cell <- emissions1999_2_gC_grid_cell*gfed1999ras$C_BORF.2
BORFemissions1999_3_gC_grid_cell <- emissions1999_3_gC_grid_cell*gfed1999ras$C_BORF.3
BORFemissions1999_4_gC_grid_cell <- emissions1999_4_gC_grid_cell*gfed1999ras$C_BORF.4
BORFemissions1999_5_gC_grid_cell <- emissions1999_5_gC_grid_cell*gfed1999ras$C_BORF.5
BORFemissions1999_6_gC_grid_cell <- emissions1999_6_gC_grid_cell*gfed1999ras$C_BORF.6
BORFemissions1999_7_gC_grid_cell <- emissions1999_7_gC_grid_cell*gfed1999ras$C_BORF.7
BORFemissions1999_8_gC_grid_cell <- emissions1999_8_gC_grid_cell*gfed1999ras$C_BORF.8
BORFemissions1999_9_gC_grid_cell <- emissions1999_9_gC_grid_cell*gfed1999ras$C_BORF.9
BORFemissions1999_10_gC_grid_cell <- emissions1999_10_gC_grid_cell*gfed1999ras$C_BORF.10
BORFemissions1999_11_gC_grid_cell <- emissions1999_11_gC_grid_cell*gfed1999ras$C_BORF.11
BORFemissions1999_12_gC_grid_cell <- emissions1999_12_gC_grid_cell*gfed1999ras$C_BORF.12
BORFemissions2000_1_gC_grid_cell <- emissions2000_1_gC_grid_cell*gfed2000ras$C_BORF.1 #2000
BORFemissions2000_2_gC_grid_cell <- emissions2000_2_gC_grid_cell*gfed2000ras$C_BORF.2
BORFemissions2000_3_gC_grid_cell <- emissions2000_3_gC_grid_cell*gfed2000ras$C_BORF.3
BORFemissions2000_4_gC_grid_cell <- emissions2000_4_gC_grid_cell*gfed2000ras$C_BORF.4
BORFemissions2000_5_gC_grid_cell <- emissions2000_5_gC_grid_cell*gfed2000ras$C_BORF.5
BORFemissions2000_6_gC_grid_cell <- emissions2000_6_gC_grid_cell*gfed2000ras$C_BORF.6
BORFemissions2000_7_gC_grid_cell <- emissions2000_7_gC_grid_cell*gfed2000ras$C_BORF.7
BORFemissions2000_8_gC_grid_cell <- emissions2000_8_gC_grid_cell*gfed2000ras$C_BORF.8
BORFemissions2000_9_gC_grid_cell <- emissions2000_9_gC_grid_cell*gfed2000ras$C_BORF.9
BORFemissions2000_10_gC_grid_cell <- emissions2000_10_gC_grid_cell*gfed2000ras$C_BORF.10
BORFemissions2000_11_gC_grid_cell <- emissions2000_11_gC_grid_cell*gfed2000ras$C_BORF.11
BORFemissions2000_12_gC_grid_cell <- emissions2000_12_gC_grid_cell*gfed2000ras$C_BORF.12
BORFemissions2001_1_gC_grid_cell <- emissions2001_1_gC_grid_cell*gfed2001ras$C_BORF.1 #2001
BORFemissions2001_2_gC_grid_cell <- emissions2001_2_gC_grid_cell*gfed2001ras$C_BORF.2
BORFemissions2001_3_gC_grid_cell <- emissions2001_3_gC_grid_cell*gfed2001ras$C_BORF.3
BORFemissions2001_4_gC_grid_cell <- emissions2001_4_gC_grid_cell*gfed2001ras$C_BORF.4
BORFemissions2001_5_gC_grid_cell <- emissions2001_5_gC_grid_cell*gfed2001ras$C_BORF.5
BORFemissions2001_6_gC_grid_cell <- emissions2001_6_gC_grid_cell*gfed2001ras$C_BORF.6
BORFemissions2001_7_gC_grid_cell <- emissions2001_7_gC_grid_cell*gfed2001ras$C_BORF.7
BORFemissions2001_8_gC_grid_cell <- emissions2001_8_gC_grid_cell*gfed2001ras$C_BORF.8
BORFemissions2001_9_gC_grid_cell <- emissions2001_9_gC_grid_cell*gfed2001ras$C_BORF.9
BORFemissions2001_10_gC_grid_cell <- emissions2001_10_gC_grid_cell*gfed2001ras$C_BORF.10
BORFemissions2001_11_gC_grid_cell <- emissions2001_11_gC_grid_cell*gfed2001ras$C_BORF.11
BORFemissions2001_12_gC_grid_cell <- emissions2001_12_gC_grid_cell*gfed2001ras$C_BORF.12
BORFemissions2002_1_gC_grid_cell <- emissions2002_1_gC_grid_cell*gfed2002ras$C_BORF.1 #2002
BORFemissions2002_2_gC_grid_cell <- emissions2002_2_gC_grid_cell*gfed2002ras$C_BORF.2
BORFemissions2002_3_gC_grid_cell <- emissions2002_3_gC_grid_cell*gfed2002ras$C_BORF.3
BORFemissions2002_4_gC_grid_cell <- emissions2002_4_gC_grid_cell*gfed2002ras$C_BORF.4
BORFemissions2002_5_gC_grid_cell <- emissions2002_5_gC_grid_cell*gfed2002ras$C_BORF.5
BORFemissions2002_6_gC_grid_cell <- emissions2002_6_gC_grid_cell*gfed2002ras$C_BORF.6
BORFemissions2002_7_gC_grid_cell <- emissions2002_7_gC_grid_cell*gfed2002ras$C_BORF.7
BORFemissions2002_8_gC_grid_cell <- emissions2002_8_gC_grid_cell*gfed2002ras$C_BORF.8
BORFemissions2002_9_gC_grid_cell <- emissions2002_9_gC_grid_cell*gfed2002ras$C_BORF.9
BORFemissions2002_10_gC_grid_cell <- emissions2002_10_gC_grid_cell*gfed2002ras$C_BORF.10
BORFemissions2002_11_gC_grid_cell <- emissions2002_11_gC_grid_cell*gfed2002ras$C_BORF.11
BORFemissions2002_12_gC_grid_cell <- emissions2002_12_gC_grid_cell*gfed2002ras$C_BORF.12
BORFemissions2003_1_gC_grid_cell <- emissions2003_1_gC_grid_cell*gfed2003ras$C_BORF.1 #2003
BORFemissions2003_2_gC_grid_cell <- emissions2003_2_gC_grid_cell*gfed2003ras$C_BORF.2
BORFemissions2003_3_gC_grid_cell <- emissions2003_3_gC_grid_cell*gfed2003ras$C_BORF.3
BORFemissions2003_4_gC_grid_cell <- emissions2003_4_gC_grid_cell*gfed2003ras$C_BORF.4
BORFemissions2003_5_gC_grid_cell <- emissions2003_5_gC_grid_cell*gfed2003ras$C_BORF.5
BORFemissions2003_6_gC_grid_cell <- emissions2003_6_gC_grid_cell*gfed2003ras$C_BORF.6
BORFemissions2003_7_gC_grid_cell <- emissions2003_7_gC_grid_cell*gfed2003ras$C_BORF.7
BORFemissions2003_8_gC_grid_cell <- emissions2003_8_gC_grid_cell*gfed2003ras$C_BORF.8
BORFemissions2003_9_gC_grid_cell <- emissions2003_9_gC_grid_cell*gfed2003ras$C_BORF.9
BORFemissions2003_10_gC_grid_cell <- emissions2003_10_gC_grid_cell*gfed2003ras$C_BORF.10
BORFemissions2003_11_gC_grid_cell <- emissions2003_11_gC_grid_cell*gfed2003ras$C_BORF.11
BORFemissions2003_12_gC_grid_cell <- emissions2003_12_gC_grid_cell*gfed2003ras$C_BORF.12
BORFemissions2004_1_gC_grid_cell <- emissions2004_1_gC_grid_cell*gfed2004ras$C_BORF.1 #2004
BORFemissions2004_2_gC_grid_cell <- emissions2004_2_gC_grid_cell*gfed2004ras$C_BORF.2
BORFemissions2004_3_gC_grid_cell <- emissions2004_3_gC_grid_cell*gfed2004ras$C_BORF.3
BORFemissions2004_4_gC_grid_cell <- emissions2004_4_gC_grid_cell*gfed2004ras$C_BORF.4
BORFemissions2004_5_gC_grid_cell <- emissions2004_5_gC_grid_cell*gfed2004ras$C_BORF.5
BORFemissions2004_6_gC_grid_cell <- emissions2004_6_gC_grid_cell*gfed2004ras$C_BORF.6
BORFemissions2004_7_gC_grid_cell <- emissions2004_7_gC_grid_cell*gfed2004ras$C_BORF.7
BORFemissions2004_8_gC_grid_cell <- emissions2004_8_gC_grid_cell*gfed2004ras$C_BORF.8
BORFemissions2004_9_gC_grid_cell <- emissions2004_9_gC_grid_cell*gfed2004ras$C_BORF.9
BORFemissions2004_10_gC_grid_cell <- emissions2004_10_gC_grid_cell*gfed2004ras$C_BORF.10
BORFemissions2004_11_gC_grid_cell <- emissions2004_11_gC_grid_cell*gfed2004ras$C_BORF.11
BORFemissions2004_12_gC_grid_cell <- emissions2004_12_gC_grid_cell*gfed2004ras$C_BORF.12
BORFemissions2005_1_gC_grid_cell <- emissions2005_1_gC_grid_cell*gfed2005ras$C_BORF.1 #2005
BORFemissions2005_2_gC_grid_cell <- emissions2005_2_gC_grid_cell*gfed2005ras$C_BORF.2
BORFemissions2005_3_gC_grid_cell <- emissions2005_3_gC_grid_cell*gfed2005ras$C_BORF.3
BORFemissions2005_4_gC_grid_cell <- emissions2005_4_gC_grid_cell*gfed2005ras$C_BORF.4
BORFemissions2005_5_gC_grid_cell <- emissions2005_5_gC_grid_cell*gfed2005ras$C_BORF.5
BORFemissions2005_6_gC_grid_cell <- emissions2005_6_gC_grid_cell*gfed2005ras$C_BORF.6
BORFemissions2005_7_gC_grid_cell <- emissions2005_7_gC_grid_cell*gfed2005ras$C_BORF.7
BORFemissions2005_8_gC_grid_cell <- emissions2005_8_gC_grid_cell*gfed2005ras$C_BORF.8
BORFemissions2005_9_gC_grid_cell <- emissions2005_9_gC_grid_cell*gfed2005ras$C_BORF.9
BORFemissions2005_10_gC_grid_cell <- emissions2005_10_gC_grid_cell*gfed2005ras$C_BORF.10
BORFemissions2005_11_gC_grid_cell <- emissions2005_11_gC_grid_cell*gfed2005ras$C_BORF.11
BORFemissions2005_12_gC_grid_cell <- emissions2005_12_gC_grid_cell*gfed2005ras$C_BORF.12
BORFemissions2006_1_gC_grid_cell <- emissions2006_1_gC_grid_cell*gfed2006ras$C_BORF.1 #2006
BORFemissions2006_2_gC_grid_cell <- emissions2006_2_gC_grid_cell*gfed2006ras$C_BORF.2
BORFemissions2006_3_gC_grid_cell <- emissions2006_3_gC_grid_cell*gfed2006ras$C_BORF.3
BORFemissions2006_4_gC_grid_cell <- emissions2006_4_gC_grid_cell*gfed2006ras$C_BORF.4
BORFemissions2006_5_gC_grid_cell <- emissions2006_5_gC_grid_cell*gfed2006ras$C_BORF.5
BORFemissions2006_6_gC_grid_cell <- emissions2006_6_gC_grid_cell*gfed2006ras$C_BORF.6
BORFemissions2006_7_gC_grid_cell <- emissions2006_7_gC_grid_cell*gfed2006ras$C_BORF.7
BORFemissions2006_8_gC_grid_cell <- emissions2006_8_gC_grid_cell*gfed2006ras$C_BORF.8
BORFemissions2006_9_gC_grid_cell <- emissions2006_9_gC_grid_cell*gfed2006ras$C_BORF.9
BORFemissions2006_10_gC_grid_cell <- emissions2006_10_gC_grid_cell*gfed2006ras$C_BORF.10
BORFemissions2006_11_gC_grid_cell <- emissions2006_11_gC_grid_cell*gfed2006ras$C_BORF.11
BORFemissions2006_12_gC_grid_cell <- emissions2006_12_gC_grid_cell*gfed2006ras$C_BORF.12
BORFemissions2007_1_gC_grid_cell <- emissions2007_1_gC_grid_cell*gfed2007ras$C_BORF.1 #2007
BORFemissions2007_2_gC_grid_cell <- emissions2007_2_gC_grid_cell*gfed2007ras$C_BORF.2
BORFemissions2007_3_gC_grid_cell <- emissions2007_3_gC_grid_cell*gfed2007ras$C_BORF.3
BORFemissions2007_4_gC_grid_cell <- emissions2007_4_gC_grid_cell*gfed2007ras$C_BORF.4
BORFemissions2007_5_gC_grid_cell <- emissions2007_5_gC_grid_cell*gfed2007ras$C_BORF.5
BORFemissions2007_6_gC_grid_cell <- emissions2007_6_gC_grid_cell*gfed2007ras$C_BORF.6
BORFemissions2007_7_gC_grid_cell <- emissions2007_7_gC_grid_cell*gfed2007ras$C_BORF.7
BORFemissions2007_8_gC_grid_cell <- emissions2007_8_gC_grid_cell*gfed2007ras$C_BORF.8
BORFemissions2007_9_gC_grid_cell <- emissions2007_9_gC_grid_cell*gfed2007ras$C_BORF.9
BORFemissions2007_10_gC_grid_cell <- emissions2007_10_gC_grid_cell*gfed2007ras$C_BORF.10
BORFemissions2007_11_gC_grid_cell <- emissions2007_11_gC_grid_cell*gfed2007ras$C_BORF.11
BORFemissions2007_12_gC_grid_cell <- emissions2007_12_gC_grid_cell*gfed2007ras$C_BORF.12
BORFemissions2008_1_gC_grid_cell <- emissions2008_1_gC_grid_cell*gfed2008ras$C_BORF.1 #2008
BORFemissions2008_2_gC_grid_cell <- emissions2008_2_gC_grid_cell*gfed2008ras$C_BORF.2
BORFemissions2008_3_gC_grid_cell <- emissions2008_3_gC_grid_cell*gfed2008ras$C_BORF.3
BORFemissions2008_4_gC_grid_cell <- emissions2008_4_gC_grid_cell*gfed2008ras$C_BORF.4
BORFemissions2008_5_gC_grid_cell <- emissions2008_5_gC_grid_cell*gfed2008ras$C_BORF.5
BORFemissions2008_6_gC_grid_cell <- emissions2008_6_gC_grid_cell*gfed2008ras$C_BORF.6
BORFemissions2008_7_gC_grid_cell <- emissions2008_7_gC_grid_cell*gfed2008ras$C_BORF.7
BORFemissions2008_8_gC_grid_cell <- emissions2008_8_gC_grid_cell*gfed2008ras$C_BORF.8
BORFemissions2008_9_gC_grid_cell <- emissions2008_9_gC_grid_cell*gfed2008ras$C_BORF.9
BORFemissions2008_10_gC_grid_cell <- emissions2008_10_gC_grid_cell*gfed2008ras$C_BORF.10
BORFemissions2008_11_gC_grid_cell <- emissions2008_11_gC_grid_cell*gfed2008ras$C_BORF.11
BORFemissions2008_12_gC_grid_cell <- emissions2008_12_gC_grid_cell*gfed2008ras$C_BORF.12
BORFemissions2009_1_gC_grid_cell <- emissions2009_1_gC_grid_cell*gfed2009ras$C_BORF.1 #2009
BORFemissions2009_2_gC_grid_cell <- emissions2009_2_gC_grid_cell*gfed2009ras$C_BORF.2
BORFemissions2009_3_gC_grid_cell <- emissions2009_3_gC_grid_cell*gfed2009ras$C_BORF.3
BORFemissions2009_4_gC_grid_cell <- emissions2009_4_gC_grid_cell*gfed2009ras$C_BORF.4
BORFemissions2009_5_gC_grid_cell <- emissions2009_5_gC_grid_cell*gfed2009ras$C_BORF.5
BORFemissions2009_6_gC_grid_cell <- emissions2009_6_gC_grid_cell*gfed2009ras$C_BORF.6
BORFemissions2009_7_gC_grid_cell <- emissions2009_7_gC_grid_cell*gfed2009ras$C_BORF.7
BORFemissions2009_8_gC_grid_cell <- emissions2009_8_gC_grid_cell*gfed2009ras$C_BORF.8
BORFemissions2009_9_gC_grid_cell <- emissions2009_9_gC_grid_cell*gfed2009ras$C_BORF.9
BORFemissions2009_10_gC_grid_cell <- emissions2009_10_gC_grid_cell*gfed2009ras$C_BORF.10
BORFemissions2009_11_gC_grid_cell <- emissions2009_11_gC_grid_cell*gfed2009ras$C_BORF.11
BORFemissions2009_12_gC_grid_cell <- emissions2009_12_gC_grid_cell*gfed2009ras$C_BORF.12
BORFemissions2010_1_gC_grid_cell <- emissions2010_1_gC_grid_cell*gfed2010ras$C_BORF.1 #2010
BORFemissions2010_2_gC_grid_cell <- emissions2010_2_gC_grid_cell*gfed2010ras$C_BORF.2
BORFemissions2010_3_gC_grid_cell <- emissions2010_3_gC_grid_cell*gfed2010ras$C_BORF.3
BORFemissions2010_4_gC_grid_cell <- emissions2010_4_gC_grid_cell*gfed2010ras$C_BORF.4
BORFemissions2010_5_gC_grid_cell <- emissions2010_5_gC_grid_cell*gfed2010ras$C_BORF.5
BORFemissions2010_6_gC_grid_cell <- emissions2010_6_gC_grid_cell*gfed2010ras$C_BORF.6
BORFemissions2010_7_gC_grid_cell <- emissions2010_7_gC_grid_cell*gfed2010ras$C_BORF.7
BORFemissions2010_8_gC_grid_cell <- emissions2010_8_gC_grid_cell*gfed2010ras$C_BORF.8
BORFemissions2010_9_gC_grid_cell <- emissions2010_9_gC_grid_cell*gfed2010ras$C_BORF.9
BORFemissions2010_10_gC_grid_cell <- emissions2010_10_gC_grid_cell*gfed2010ras$C_BORF.10
BORFemissions2010_11_gC_grid_cell <- emissions2010_11_gC_grid_cell*gfed2010ras$C_BORF.11
BORFemissions2010_12_gC_grid_cell <- emissions2010_12_gC_grid_cell*gfed2010ras$C_BORF.12
BORFemissions2011_1_gC_grid_cell <- emissions2011_1_gC_grid_cell*gfed2011ras$C_BORF.1 #2011
BORFemissions2011_2_gC_grid_cell <- emissions2011_2_gC_grid_cell*gfed2011ras$C_BORF.2
BORFemissions2011_3_gC_grid_cell <- emissions2011_3_gC_grid_cell*gfed2011ras$C_BORF.3
BORFemissions2011_4_gC_grid_cell <- emissions2011_4_gC_grid_cell*gfed2011ras$C_BORF.4
BORFemissions2011_5_gC_grid_cell <- emissions2011_5_gC_grid_cell*gfed2011ras$C_BORF.5
BORFemissions2011_6_gC_grid_cell <- emissions2011_6_gC_grid_cell*gfed2011ras$C_BORF.6
BORFemissions2011_7_gC_grid_cell <- emissions2011_7_gC_grid_cell*gfed2011ras$C_BORF.7
BORFemissions2011_8_gC_grid_cell <- emissions2011_8_gC_grid_cell*gfed2011ras$C_BORF.8
BORFemissions2011_9_gC_grid_cell <- emissions2011_9_gC_grid_cell*gfed2011ras$C_BORF.9
BORFemissions2011_10_gC_grid_cell <- emissions2011_10_gC_grid_cell*gfed2011ras$C_BORF.10
BORFemissions2011_11_gC_grid_cell <- emissions2011_11_gC_grid_cell*gfed2011ras$C_BORF.11
BORFemissions2011_12_gC_grid_cell <- emissions2011_12_gC_grid_cell*gfed2011ras$C_BORF.12
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
AGRIemissions1997_1_gC_grid_cell <- emissions1997_1_gC_grid_cell*gfed1997ras$C_AGRI.1 #1997
AGRIemissions1997_2_gC_grid_cell <- emissions1997_2_gC_grid_cell*gfed1997ras$C_AGRI.2
AGRIemissions1997_3_gC_grid_cell <- emissions1997_3_gC_grid_cell*gfed1997ras$C_AGRI.3
AGRIemissions1997_4_gC_grid_cell <- emissions1997_4_gC_grid_cell*gfed1997ras$C_AGRI.4
AGRIemissions1997_5_gC_grid_cell <- emissions1997_5_gC_grid_cell*gfed1997ras$C_AGRI.5
AGRIemissions1997_6_gC_grid_cell <- emissions1997_6_gC_grid_cell*gfed1997ras$C_AGRI.6
AGRIemissions1997_7_gC_grid_cell <- emissions1997_7_gC_grid_cell*gfed1997ras$C_AGRI.7
AGRIemissions1997_8_gC_grid_cell <- emissions1997_8_gC_grid_cell*gfed1997ras$C_AGRI.8
AGRIemissions1997_9_gC_grid_cell <- emissions1997_9_gC_grid_cell*gfed1997ras$C_AGRI.9
AGRIemissions1997_10_gC_grid_cell <- emissions1997_10_gC_grid_cell*gfed1997ras$C_AGRI.10
AGRIemissions1997_11_gC_grid_cell <- emissions1997_11_gC_grid_cell*gfed1997ras$C_AGRI.11
AGRIemissions1997_12_gC_grid_cell <- emissions1997_12_gC_grid_cell*gfed1997ras$C_AGRI.12
AGRIemissions1998_1_gC_grid_cell <- emissions1998_1_gC_grid_cell*gfed1998ras$C_AGRI.1 #1998
AGRIemissions1998_2_gC_grid_cell <- emissions1998_2_gC_grid_cell*gfed1998ras$C_AGRI.2
AGRIemissions1998_3_gC_grid_cell <- emissions1998_3_gC_grid_cell*gfed1998ras$C_AGRI.3
AGRIemissions1998_4_gC_grid_cell <- emissions1998_4_gC_grid_cell*gfed1998ras$C_AGRI.4
AGRIemissions1998_5_gC_grid_cell <- emissions1998_5_gC_grid_cell*gfed1998ras$C_AGRI.5
AGRIemissions1998_6_gC_grid_cell <- emissions1998_6_gC_grid_cell*gfed1998ras$C_AGRI.6
AGRIemissions1998_7_gC_grid_cell <- emissions1998_7_gC_grid_cell*gfed1998ras$C_AGRI.7
AGRIemissions1998_8_gC_grid_cell <- emissions1998_8_gC_grid_cell*gfed1998ras$C_AGRI.8
AGRIemissions1998_9_gC_grid_cell <- emissions1998_9_gC_grid_cell*gfed1998ras$C_AGRI.9
AGRIemissions1998_10_gC_grid_cell <- emissions1998_10_gC_grid_cell*gfed1998ras$C_AGRI.10
AGRIemissions1998_11_gC_grid_cell <- emissions1998_11_gC_grid_cell*gfed1998ras$C_AGRI.11
AGRIemissions1998_12_gC_grid_cell <- emissions1998_12_gC_grid_cell*gfed1998ras$C_AGRI.12
AGRIemissions1999_1_gC_grid_cell <- emissions1999_1_gC_grid_cell*gfed1999ras$C_AGRI.1 #1999
AGRIemissions1999_2_gC_grid_cell <- emissions1999_2_gC_grid_cell*gfed1999ras$C_AGRI.2
AGRIemissions1999_3_gC_grid_cell <- emissions1999_3_gC_grid_cell*gfed1999ras$C_AGRI.3
AGRIemissions1999_4_gC_grid_cell <- emissions1999_4_gC_grid_cell*gfed1999ras$C_AGRI.4
AGRIemissions1999_5_gC_grid_cell <- emissions1999_5_gC_grid_cell*gfed1999ras$C_AGRI.5
AGRIemissions1999_6_gC_grid_cell <- emissions1999_6_gC_grid_cell*gfed1999ras$C_AGRI.6
AGRIemissions1999_7_gC_grid_cell <- emissions1999_7_gC_grid_cell*gfed1999ras$C_AGRI.7
AGRIemissions1999_8_gC_grid_cell <- emissions1999_8_gC_grid_cell*gfed1999ras$C_AGRI.8
AGRIemissions1999_9_gC_grid_cell <- emissions1999_9_gC_grid_cell*gfed1999ras$C_AGRI.9
AGRIemissions1999_10_gC_grid_cell <- emissions1999_10_gC_grid_cell*gfed1999ras$C_AGRI.10
AGRIemissions1999_11_gC_grid_cell <- emissions1999_11_gC_grid_cell*gfed1999ras$C_AGRI.11
AGRIemissions1999_12_gC_grid_cell <- emissions1999_12_gC_grid_cell*gfed1999ras$C_AGRI.12
AGRIemissions2000_1_gC_grid_cell <- emissions2000_1_gC_grid_cell*gfed2000ras$C_AGRI.1 #2000
AGRIemissions2000_2_gC_grid_cell <- emissions2000_2_gC_grid_cell*gfed2000ras$C_AGRI.2
AGRIemissions2000_3_gC_grid_cell <- emissions2000_3_gC_grid_cell*gfed2000ras$C_AGRI.3
AGRIemissions2000_4_gC_grid_cell <- emissions2000_4_gC_grid_cell*gfed2000ras$C_AGRI.4
AGRIemissions2000_5_gC_grid_cell <- emissions2000_5_gC_grid_cell*gfed2000ras$C_AGRI.5
AGRIemissions2000_6_gC_grid_cell <- emissions2000_6_gC_grid_cell*gfed2000ras$C_AGRI.6
AGRIemissions2000_7_gC_grid_cell <- emissions2000_7_gC_grid_cell*gfed2000ras$C_AGRI.7
AGRIemissions2000_8_gC_grid_cell <- emissions2000_8_gC_grid_cell*gfed2000ras$C_AGRI.8
AGRIemissions2000_9_gC_grid_cell <- emissions2000_9_gC_grid_cell*gfed2000ras$C_AGRI.9
AGRIemissions2000_10_gC_grid_cell <- emissions2000_10_gC_grid_cell*gfed2000ras$C_AGRI.10
AGRIemissions2000_11_gC_grid_cell <- emissions2000_11_gC_grid_cell*gfed2000ras$C_AGRI.11
AGRIemissions2000_12_gC_grid_cell <- emissions2000_12_gC_grid_cell*gfed2000ras$C_AGRI.12
AGRIemissions2001_1_gC_grid_cell <- emissions2001_1_gC_grid_cell*gfed2001ras$C_AGRI.1 #2001
AGRIemissions2001_2_gC_grid_cell <- emissions2001_2_gC_grid_cell*gfed2001ras$C_AGRI.2
AGRIemissions2001_3_gC_grid_cell <- emissions2001_3_gC_grid_cell*gfed2001ras$C_AGRI.3
AGRIemissions2001_4_gC_grid_cell <- emissions2001_4_gC_grid_cell*gfed2001ras$C_AGRI.4
AGRIemissions2001_5_gC_grid_cell <- emissions2001_5_gC_grid_cell*gfed2001ras$C_AGRI.5
AGRIemissions2001_6_gC_grid_cell <- emissions2001_6_gC_grid_cell*gfed2001ras$C_AGRI.6
AGRIemissions2001_7_gC_grid_cell <- emissions2001_7_gC_grid_cell*gfed2001ras$C_AGRI.7
AGRIemissions2001_8_gC_grid_cell <- emissions2001_8_gC_grid_cell*gfed2001ras$C_AGRI.8
AGRIemissions2001_9_gC_grid_cell <- emissions2001_9_gC_grid_cell*gfed2001ras$C_AGRI.9
AGRIemissions2001_10_gC_grid_cell <- emissions2001_10_gC_grid_cell*gfed2001ras$C_AGRI.10
AGRIemissions2001_11_gC_grid_cell <- emissions2001_11_gC_grid_cell*gfed2001ras$C_AGRI.11
AGRIemissions2001_12_gC_grid_cell <- emissions2001_12_gC_grid_cell*gfed2001ras$C_AGRI.12
AGRIemissions2002_1_gC_grid_cell <- emissions2002_1_gC_grid_cell*gfed2002ras$C_AGRI.1 #2002
AGRIemissions2002_2_gC_grid_cell <- emissions2002_2_gC_grid_cell*gfed2002ras$C_AGRI.2
AGRIemissions2002_3_gC_grid_cell <- emissions2002_3_gC_grid_cell*gfed2002ras$C_AGRI.3
AGRIemissions2002_4_gC_grid_cell <- emissions2002_4_gC_grid_cell*gfed2002ras$C_AGRI.4
AGRIemissions2002_5_gC_grid_cell <- emissions2002_5_gC_grid_cell*gfed2002ras$C_AGRI.5
AGRIemissions2002_6_gC_grid_cell <- emissions2002_6_gC_grid_cell*gfed2002ras$C_AGRI.6
AGRIemissions2002_7_gC_grid_cell <- emissions2002_7_gC_grid_cell*gfed2002ras$C_AGRI.7
AGRIemissions2002_8_gC_grid_cell <- emissions2002_8_gC_grid_cell*gfed2002ras$C_AGRI.8
AGRIemissions2002_9_gC_grid_cell <- emissions2002_9_gC_grid_cell*gfed2002ras$C_AGRI.9
AGRIemissions2002_10_gC_grid_cell <- emissions2002_10_gC_grid_cell*gfed2002ras$C_AGRI.10
AGRIemissions2002_11_gC_grid_cell <- emissions2002_11_gC_grid_cell*gfed2002ras$C_AGRI.11
AGRIemissions2002_12_gC_grid_cell <- emissions2002_12_gC_grid_cell*gfed2002ras$C_AGRI.12
AGRIemissions2003_1_gC_grid_cell <- emissions2003_1_gC_grid_cell*gfed2003ras$C_AGRI.1 #2003
AGRIemissions2003_2_gC_grid_cell <- emissions2003_2_gC_grid_cell*gfed2003ras$C_AGRI.2
AGRIemissions2003_3_gC_grid_cell <- emissions2003_3_gC_grid_cell*gfed2003ras$C_AGRI.3
AGRIemissions2003_4_gC_grid_cell <- emissions2003_4_gC_grid_cell*gfed2003ras$C_AGRI.4
AGRIemissions2003_5_gC_grid_cell <- emissions2003_5_gC_grid_cell*gfed2003ras$C_AGRI.5
AGRIemissions2003_6_gC_grid_cell <- emissions2003_6_gC_grid_cell*gfed2003ras$C_AGRI.6
AGRIemissions2003_7_gC_grid_cell <- emissions2003_7_gC_grid_cell*gfed2003ras$C_AGRI.7
AGRIemissions2003_8_gC_grid_cell <- emissions2003_8_gC_grid_cell*gfed2003ras$C_AGRI.8
AGRIemissions2003_9_gC_grid_cell <- emissions2003_9_gC_grid_cell*gfed2003ras$C_AGRI.9
AGRIemissions2003_10_gC_grid_cell <- emissions2003_10_gC_grid_cell*gfed2003ras$C_AGRI.10
AGRIemissions2003_11_gC_grid_cell <- emissions2003_11_gC_grid_cell*gfed2003ras$C_AGRI.11
AGRIemissions2003_12_gC_grid_cell <- emissions2003_12_gC_grid_cell*gfed2003ras$C_AGRI.12
AGRIemissions2004_1_gC_grid_cell <- emissions2004_1_gC_grid_cell*gfed2004ras$C_AGRI.1 #2004
AGRIemissions2004_2_gC_grid_cell <- emissions2004_2_gC_grid_cell*gfed2004ras$C_AGRI.2
AGRIemissions2004_3_gC_grid_cell <- emissions2004_3_gC_grid_cell*gfed2004ras$C_AGRI.3
AGRIemissions2004_4_gC_grid_cell <- emissions2004_4_gC_grid_cell*gfed2004ras$C_AGRI.4
AGRIemissions2004_5_gC_grid_cell <- emissions2004_5_gC_grid_cell*gfed2004ras$C_AGRI.5
AGRIemissions2004_6_gC_grid_cell <- emissions2004_6_gC_grid_cell*gfed2004ras$C_AGRI.6
AGRIemissions2004_7_gC_grid_cell <- emissions2004_7_gC_grid_cell*gfed2004ras$C_AGRI.7
AGRIemissions2004_8_gC_grid_cell <- emissions2004_8_gC_grid_cell*gfed2004ras$C_AGRI.8
AGRIemissions2004_9_gC_grid_cell <- emissions2004_9_gC_grid_cell*gfed2004ras$C_AGRI.9
AGRIemissions2004_10_gC_grid_cell <- emissions2004_10_gC_grid_cell*gfed2004ras$C_AGRI.10
AGRIemissions2004_11_gC_grid_cell <- emissions2004_11_gC_grid_cell*gfed2004ras$C_AGRI.11
AGRIemissions2004_12_gC_grid_cell <- emissions2004_12_gC_grid_cell*gfed2004ras$C_AGRI.12
AGRIemissions2005_1_gC_grid_cell <- emissions2005_1_gC_grid_cell*gfed2005ras$C_AGRI.1 #2005
AGRIemissions2005_2_gC_grid_cell <- emissions2005_2_gC_grid_cell*gfed2005ras$C_AGRI.2
AGRIemissions2005_3_gC_grid_cell <- emissions2005_3_gC_grid_cell*gfed2005ras$C_AGRI.3
AGRIemissions2005_4_gC_grid_cell <- emissions2005_4_gC_grid_cell*gfed2005ras$C_AGRI.4
AGRIemissions2005_5_gC_grid_cell <- emissions2005_5_gC_grid_cell*gfed2005ras$C_AGRI.5
AGRIemissions2005_6_gC_grid_cell <- emissions2005_6_gC_grid_cell*gfed2005ras$C_AGRI.6
AGRIemissions2005_7_gC_grid_cell <- emissions2005_7_gC_grid_cell*gfed2005ras$C_AGRI.7
AGRIemissions2005_8_gC_grid_cell <- emissions2005_8_gC_grid_cell*gfed2005ras$C_AGRI.8
AGRIemissions2005_9_gC_grid_cell <- emissions2005_9_gC_grid_cell*gfed2005ras$C_AGRI.9
AGRIemissions2005_10_gC_grid_cell <- emissions2005_10_gC_grid_cell*gfed2005ras$C_AGRI.10
AGRIemissions2005_11_gC_grid_cell <- emissions2005_11_gC_grid_cell*gfed2005ras$C_AGRI.11
AGRIemissions2005_12_gC_grid_cell <- emissions2005_12_gC_grid_cell*gfed2005ras$C_AGRI.12
AGRIemissions2006_1_gC_grid_cell <- emissions2006_1_gC_grid_cell*gfed2006ras$C_AGRI.1 #2006
AGRIemissions2006_2_gC_grid_cell <- emissions2006_2_gC_grid_cell*gfed2006ras$C_AGRI.2
AGRIemissions2006_3_gC_grid_cell <- emissions2006_3_gC_grid_cell*gfed2006ras$C_AGRI.3
AGRIemissions2006_4_gC_grid_cell <- emissions2006_4_gC_grid_cell*gfed2006ras$C_AGRI.4
AGRIemissions2006_5_gC_grid_cell <- emissions2006_5_gC_grid_cell*gfed2006ras$C_AGRI.5
AGRIemissions2006_6_gC_grid_cell <- emissions2006_6_gC_grid_cell*gfed2006ras$C_AGRI.6
AGRIemissions2006_7_gC_grid_cell <- emissions2006_7_gC_grid_cell*gfed2006ras$C_AGRI.7
AGRIemissions2006_8_gC_grid_cell <- emissions2006_8_gC_grid_cell*gfed2006ras$C_AGRI.8
AGRIemissions2006_9_gC_grid_cell <- emissions2006_9_gC_grid_cell*gfed2006ras$C_AGRI.9
AGRIemissions2006_10_gC_grid_cell <- emissions2006_10_gC_grid_cell*gfed2006ras$C_AGRI.10
AGRIemissions2006_11_gC_grid_cell <- emissions2006_11_gC_grid_cell*gfed2006ras$C_AGRI.11
AGRIemissions2006_12_gC_grid_cell <- emissions2006_12_gC_grid_cell*gfed2006ras$C_AGRI.12
AGRIemissions2007_1_gC_grid_cell <- emissions2007_1_gC_grid_cell*gfed2007ras$C_AGRI.1 #2007
AGRIemissions2007_2_gC_grid_cell <- emissions2007_2_gC_grid_cell*gfed2007ras$C_AGRI.2
AGRIemissions2007_3_gC_grid_cell <- emissions2007_3_gC_grid_cell*gfed2007ras$C_AGRI.3
AGRIemissions2007_4_gC_grid_cell <- emissions2007_4_gC_grid_cell*gfed2007ras$C_AGRI.4
AGRIemissions2007_5_gC_grid_cell <- emissions2007_5_gC_grid_cell*gfed2007ras$C_AGRI.5
AGRIemissions2007_6_gC_grid_cell <- emissions2007_6_gC_grid_cell*gfed2007ras$C_AGRI.6
AGRIemissions2007_7_gC_grid_cell <- emissions2007_7_gC_grid_cell*gfed2007ras$C_AGRI.7
AGRIemissions2007_8_gC_grid_cell <- emissions2007_8_gC_grid_cell*gfed2007ras$C_AGRI.8
AGRIemissions2007_9_gC_grid_cell <- emissions2007_9_gC_grid_cell*gfed2007ras$C_AGRI.9
AGRIemissions2007_10_gC_grid_cell <- emissions2007_10_gC_grid_cell*gfed2007ras$C_AGRI.10
AGRIemissions2007_11_gC_grid_cell <- emissions2007_11_gC_grid_cell*gfed2007ras$C_AGRI.11
AGRIemissions2007_12_gC_grid_cell <- emissions2007_12_gC_grid_cell*gfed2007ras$C_AGRI.12
AGRIemissions2008_1_gC_grid_cell <- emissions2008_1_gC_grid_cell*gfed2008ras$C_AGRI.1 #2008
AGRIemissions2008_2_gC_grid_cell <- emissions2008_2_gC_grid_cell*gfed2008ras$C_AGRI.2
AGRIemissions2008_3_gC_grid_cell <- emissions2008_3_gC_grid_cell*gfed2008ras$C_AGRI.3
AGRIemissions2008_4_gC_grid_cell <- emissions2008_4_gC_grid_cell*gfed2008ras$C_AGRI.4
AGRIemissions2008_5_gC_grid_cell <- emissions2008_5_gC_grid_cell*gfed2008ras$C_AGRI.5
AGRIemissions2008_6_gC_grid_cell <- emissions2008_6_gC_grid_cell*gfed2008ras$C_AGRI.6
AGRIemissions2008_7_gC_grid_cell <- emissions2008_7_gC_grid_cell*gfed2008ras$C_AGRI.7
AGRIemissions2008_8_gC_grid_cell <- emissions2008_8_gC_grid_cell*gfed2008ras$C_AGRI.8
AGRIemissions2008_9_gC_grid_cell <- emissions2008_9_gC_grid_cell*gfed2008ras$C_AGRI.9
AGRIemissions2008_10_gC_grid_cell <- emissions2008_10_gC_grid_cell*gfed2008ras$C_AGRI.10
AGRIemissions2008_11_gC_grid_cell <- emissions2008_11_gC_grid_cell*gfed2008ras$C_AGRI.11
AGRIemissions2008_12_gC_grid_cell <- emissions2008_12_gC_grid_cell*gfed2008ras$C_AGRI.12
AGRIemissions2009_1_gC_grid_cell <- emissions2009_1_gC_grid_cell*gfed2009ras$C_AGRI.1 #2009
AGRIemissions2009_2_gC_grid_cell <- emissions2009_2_gC_grid_cell*gfed2009ras$C_AGRI.2
AGRIemissions2009_3_gC_grid_cell <- emissions2009_3_gC_grid_cell*gfed2009ras$C_AGRI.3
AGRIemissions2009_4_gC_grid_cell <- emissions2009_4_gC_grid_cell*gfed2009ras$C_AGRI.4
AGRIemissions2009_5_gC_grid_cell <- emissions2009_5_gC_grid_cell*gfed2009ras$C_AGRI.5
AGRIemissions2009_6_gC_grid_cell <- emissions2009_6_gC_grid_cell*gfed2009ras$C_AGRI.6
AGRIemissions2009_7_gC_grid_cell <- emissions2009_7_gC_grid_cell*gfed2009ras$C_AGRI.7
AGRIemissions2009_8_gC_grid_cell <- emissions2009_8_gC_grid_cell*gfed2009ras$C_AGRI.8
AGRIemissions2009_9_gC_grid_cell <- emissions2009_9_gC_grid_cell*gfed2009ras$C_AGRI.9
AGRIemissions2009_10_gC_grid_cell <- emissions2009_10_gC_grid_cell*gfed2009ras$C_AGRI.10
AGRIemissions2009_11_gC_grid_cell <- emissions2009_11_gC_grid_cell*gfed2009ras$C_AGRI.11
AGRIemissions2009_12_gC_grid_cell <- emissions2009_12_gC_grid_cell*gfed2009ras$C_AGRI.12
AGRIemissions2010_1_gC_grid_cell <- emissions2010_1_gC_grid_cell*gfed2010ras$C_AGRI.1 #2010
AGRIemissions2010_2_gC_grid_cell <- emissions2010_2_gC_grid_cell*gfed2010ras$C_AGRI.2
AGRIemissions2010_3_gC_grid_cell <- emissions2010_3_gC_grid_cell*gfed2010ras$C_AGRI.3
AGRIemissions2010_4_gC_grid_cell <- emissions2010_4_gC_grid_cell*gfed2010ras$C_AGRI.4
AGRIemissions2010_5_gC_grid_cell <- emissions2010_5_gC_grid_cell*gfed2010ras$C_AGRI.5
AGRIemissions2010_6_gC_grid_cell <- emissions2010_6_gC_grid_cell*gfed2010ras$C_AGRI.6
AGRIemissions2010_7_gC_grid_cell <- emissions2010_7_gC_grid_cell*gfed2010ras$C_AGRI.7
AGRIemissions2010_8_gC_grid_cell <- emissions2010_8_gC_grid_cell*gfed2010ras$C_AGRI.8
AGRIemissions2010_9_gC_grid_cell <- emissions2010_9_gC_grid_cell*gfed2010ras$C_AGRI.9
AGRIemissions2010_10_gC_grid_cell <- emissions2010_10_gC_grid_cell*gfed2010ras$C_AGRI.10
AGRIemissions2010_11_gC_grid_cell <- emissions2010_11_gC_grid_cell*gfed2010ras$C_AGRI.11
AGRIemissions2010_12_gC_grid_cell <- emissions2010_12_gC_grid_cell*gfed2010ras$C_AGRI.12
AGRIemissions2011_1_gC_grid_cell <- emissions2011_1_gC_grid_cell*gfed2011ras$C_AGRI.1 #2011
AGRIemissions2011_2_gC_grid_cell <- emissions2011_2_gC_grid_cell*gfed2011ras$C_AGRI.2
AGRIemissions2011_3_gC_grid_cell <- emissions2011_3_gC_grid_cell*gfed2011ras$C_AGRI.3
AGRIemissions2011_4_gC_grid_cell <- emissions2011_4_gC_grid_cell*gfed2011ras$C_AGRI.4
AGRIemissions2011_5_gC_grid_cell <- emissions2011_5_gC_grid_cell*gfed2011ras$C_AGRI.5
AGRIemissions2011_6_gC_grid_cell <- emissions2011_6_gC_grid_cell*gfed2011ras$C_AGRI.6
AGRIemissions2011_7_gC_grid_cell <- emissions2011_7_gC_grid_cell*gfed2011ras$C_AGRI.7
AGRIemissions2011_8_gC_grid_cell <- emissions2011_8_gC_grid_cell*gfed2011ras$C_AGRI.8
AGRIemissions2011_9_gC_grid_cell <- emissions2011_9_gC_grid_cell*gfed2011ras$C_AGRI.9
AGRIemissions2011_10_gC_grid_cell <- emissions2011_10_gC_grid_cell*gfed2011ras$C_AGRI.10
AGRIemissions2011_11_gC_grid_cell <- emissions2011_11_gC_grid_cell*gfed2011ras$C_AGRI.11
AGRIemissions2011_12_gC_grid_cell <- emissions2011_12_gC_grid_cell*gfed2011ras$C_AGRI.12
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
DEFOemissions1997_1_gC_grid_cell <- emissions1997_1_gC_grid_cell*gfed1997ras$C_DEFO.1 #1997
DEFOemissions1997_2_gC_grid_cell <- emissions1997_2_gC_grid_cell*gfed1997ras$C_DEFO.2
DEFOemissions1997_3_gC_grid_cell <- emissions1997_3_gC_grid_cell*gfed1997ras$C_DEFO.3
DEFOemissions1997_4_gC_grid_cell <- emissions1997_4_gC_grid_cell*gfed1997ras$C_DEFO.4
DEFOemissions1997_5_gC_grid_cell <- emissions1997_5_gC_grid_cell*gfed1997ras$C_DEFO.5
DEFOemissions1997_6_gC_grid_cell <- emissions1997_6_gC_grid_cell*gfed1997ras$C_DEFO.6
DEFOemissions1997_7_gC_grid_cell <- emissions1997_7_gC_grid_cell*gfed1997ras$C_DEFO.7
DEFOemissions1997_8_gC_grid_cell <- emissions1997_8_gC_grid_cell*gfed1997ras$C_DEFO.8
DEFOemissions1997_9_gC_grid_cell <- emissions1997_9_gC_grid_cell*gfed1997ras$C_DEFO.9
DEFOemissions1997_10_gC_grid_cell <- emissions1997_10_gC_grid_cell*gfed1997ras$C_DEFO.10
DEFOemissions1997_11_gC_grid_cell <- emissions1997_11_gC_grid_cell*gfed1997ras$C_DEFO.11
DEFOemissions1997_12_gC_grid_cell <- emissions1997_12_gC_grid_cell*gfed1997ras$C_DEFO.12
DEFOemissions1998_1_gC_grid_cell <- emissions1998_1_gC_grid_cell*gfed1998ras$C_DEFO.1 #1998
DEFOemissions1998_2_gC_grid_cell <- emissions1998_2_gC_grid_cell*gfed1998ras$C_DEFO.2
DEFOemissions1998_3_gC_grid_cell <- emissions1998_3_gC_grid_cell*gfed1998ras$C_DEFO.3
DEFOemissions1998_4_gC_grid_cell <- emissions1998_4_gC_grid_cell*gfed1998ras$C_DEFO.4
DEFOemissions1998_5_gC_grid_cell <- emissions1998_5_gC_grid_cell*gfed1998ras$C_DEFO.5
DEFOemissions1998_6_gC_grid_cell <- emissions1998_6_gC_grid_cell*gfed1998ras$C_DEFO.6
DEFOemissions1998_7_gC_grid_cell <- emissions1998_7_gC_grid_cell*gfed1998ras$C_DEFO.7
DEFOemissions1998_8_gC_grid_cell <- emissions1998_8_gC_grid_cell*gfed1998ras$C_DEFO.8
DEFOemissions1998_9_gC_grid_cell <- emissions1998_9_gC_grid_cell*gfed1998ras$C_DEFO.9
DEFOemissions1998_10_gC_grid_cell <- emissions1998_10_gC_grid_cell*gfed1998ras$C_DEFO.10
DEFOemissions1998_11_gC_grid_cell <- emissions1998_11_gC_grid_cell*gfed1998ras$C_DEFO.11
DEFOemissions1998_12_gC_grid_cell <- emissions1998_12_gC_grid_cell*gfed1998ras$C_DEFO.12
DEFOemissions1999_1_gC_grid_cell <- emissions1999_1_gC_grid_cell*gfed1999ras$C_DEFO.1 #1999
DEFOemissions1999_2_gC_grid_cell <- emissions1999_2_gC_grid_cell*gfed1999ras$C_DEFO.2
DEFOemissions1999_3_gC_grid_cell <- emissions1999_3_gC_grid_cell*gfed1999ras$C_DEFO.3
DEFOemissions1999_4_gC_grid_cell <- emissions1999_4_gC_grid_cell*gfed1999ras$C_DEFO.4
DEFOemissions1999_5_gC_grid_cell <- emissions1999_5_gC_grid_cell*gfed1999ras$C_DEFO.5
DEFOemissions1999_6_gC_grid_cell <- emissions1999_6_gC_grid_cell*gfed1999ras$C_DEFO.6
DEFOemissions1999_7_gC_grid_cell <- emissions1999_7_gC_grid_cell*gfed1999ras$C_DEFO.7
DEFOemissions1999_8_gC_grid_cell <- emissions1999_8_gC_grid_cell*gfed1999ras$C_DEFO.8
DEFOemissions1999_9_gC_grid_cell <- emissions1999_9_gC_grid_cell*gfed1999ras$C_DEFO.9
DEFOemissions1999_10_gC_grid_cell <- emissions1999_10_gC_grid_cell*gfed1999ras$C_DEFO.10
DEFOemissions1999_11_gC_grid_cell <- emissions1999_11_gC_grid_cell*gfed1999ras$C_DEFO.11
DEFOemissions1999_12_gC_grid_cell <- emissions1999_12_gC_grid_cell*gfed1999ras$C_DEFO.12
DEFOemissions2000_1_gC_grid_cell <- emissions2000_1_gC_grid_cell*gfed2000ras$C_DEFO.1 #2000
DEFOemissions2000_2_gC_grid_cell <- emissions2000_2_gC_grid_cell*gfed2000ras$C_DEFO.2
DEFOemissions2000_3_gC_grid_cell <- emissions2000_3_gC_grid_cell*gfed2000ras$C_DEFO.3
DEFOemissions2000_4_gC_grid_cell <- emissions2000_4_gC_grid_cell*gfed2000ras$C_DEFO.4
DEFOemissions2000_5_gC_grid_cell <- emissions2000_5_gC_grid_cell*gfed2000ras$C_DEFO.5
DEFOemissions2000_6_gC_grid_cell <- emissions2000_6_gC_grid_cell*gfed2000ras$C_DEFO.6
DEFOemissions2000_7_gC_grid_cell <- emissions2000_7_gC_grid_cell*gfed2000ras$C_DEFO.7
DEFOemissions2000_8_gC_grid_cell <- emissions2000_8_gC_grid_cell*gfed2000ras$C_DEFO.8
DEFOemissions2000_9_gC_grid_cell <- emissions2000_9_gC_grid_cell*gfed2000ras$C_DEFO.9
DEFOemissions2000_10_gC_grid_cell <- emissions2000_10_gC_grid_cell*gfed2000ras$C_DEFO.10
DEFOemissions2000_11_gC_grid_cell <- emissions2000_11_gC_grid_cell*gfed2000ras$C_DEFO.11
DEFOemissions2000_12_gC_grid_cell <- emissions2000_12_gC_grid_cell*gfed2000ras$C_DEFO.12
DEFOemissions2001_1_gC_grid_cell <- emissions2001_1_gC_grid_cell*gfed2001ras$C_DEFO.1 #2001
DEFOemissions2001_2_gC_grid_cell <- emissions2001_2_gC_grid_cell*gfed2001ras$C_DEFO.2
DEFOemissions2001_3_gC_grid_cell <- emissions2001_3_gC_grid_cell*gfed2001ras$C_DEFO.3
DEFOemissions2001_4_gC_grid_cell <- emissions2001_4_gC_grid_cell*gfed2001ras$C_DEFO.4
DEFOemissions2001_5_gC_grid_cell <- emissions2001_5_gC_grid_cell*gfed2001ras$C_DEFO.5
DEFOemissions2001_6_gC_grid_cell <- emissions2001_6_gC_grid_cell*gfed2001ras$C_DEFO.6
DEFOemissions2001_7_gC_grid_cell <- emissions2001_7_gC_grid_cell*gfed2001ras$C_DEFO.7
DEFOemissions2001_8_gC_grid_cell <- emissions2001_8_gC_grid_cell*gfed2001ras$C_DEFO.8
DEFOemissions2001_9_gC_grid_cell <- emissions2001_9_gC_grid_cell*gfed2001ras$C_DEFO.9
DEFOemissions2001_10_gC_grid_cell <- emissions2001_10_gC_grid_cell*gfed2001ras$C_DEFO.10
DEFOemissions2001_11_gC_grid_cell <- emissions2001_11_gC_grid_cell*gfed2001ras$C_DEFO.11
DEFOemissions2001_12_gC_grid_cell <- emissions2001_12_gC_grid_cell*gfed2001ras$C_DEFO.12
DEFOemissions2002_1_gC_grid_cell <- emissions2002_1_gC_grid_cell*gfed2002ras$C_DEFO.1 #2002
DEFOemissions2002_2_gC_grid_cell <- emissions2002_2_gC_grid_cell*gfed2002ras$C_DEFO.2
DEFOemissions2002_3_gC_grid_cell <- emissions2002_3_gC_grid_cell*gfed2002ras$C_DEFO.3
DEFOemissions2002_4_gC_grid_cell <- emissions2002_4_gC_grid_cell*gfed2002ras$C_DEFO.4
DEFOemissions2002_5_gC_grid_cell <- emissions2002_5_gC_grid_cell*gfed2002ras$C_DEFO.5
DEFOemissions2002_6_gC_grid_cell <- emissions2002_6_gC_grid_cell*gfed2002ras$C_DEFO.6
DEFOemissions2002_7_gC_grid_cell <- emissions2002_7_gC_grid_cell*gfed2002ras$C_DEFO.7
DEFOemissions2002_8_gC_grid_cell <- emissions2002_8_gC_grid_cell*gfed2002ras$C_DEFO.8
DEFOemissions2002_9_gC_grid_cell <- emissions2002_9_gC_grid_cell*gfed2002ras$C_DEFO.9
DEFOemissions2002_10_gC_grid_cell <- emissions2002_10_gC_grid_cell*gfed2002ras$C_DEFO.10
DEFOemissions2002_11_gC_grid_cell <- emissions2002_11_gC_grid_cell*gfed2002ras$C_DEFO.11
DEFOemissions2002_12_gC_grid_cell <- emissions2002_12_gC_grid_cell*gfed2002ras$C_DEFO.12
DEFOemissions2003_1_gC_grid_cell <- emissions2003_1_gC_grid_cell*gfed2003ras$C_DEFO.1 #2003
DEFOemissions2003_2_gC_grid_cell <- emissions2003_2_gC_grid_cell*gfed2003ras$C_DEFO.2
DEFOemissions2003_3_gC_grid_cell <- emissions2003_3_gC_grid_cell*gfed2003ras$C_DEFO.3
DEFOemissions2003_4_gC_grid_cell <- emissions2003_4_gC_grid_cell*gfed2003ras$C_DEFO.4
DEFOemissions2003_5_gC_grid_cell <- emissions2003_5_gC_grid_cell*gfed2003ras$C_DEFO.5
DEFOemissions2003_6_gC_grid_cell <- emissions2003_6_gC_grid_cell*gfed2003ras$C_DEFO.6
DEFOemissions2003_7_gC_grid_cell <- emissions2003_7_gC_grid_cell*gfed2003ras$C_DEFO.7
DEFOemissions2003_8_gC_grid_cell <- emissions2003_8_gC_grid_cell*gfed2003ras$C_DEFO.8
DEFOemissions2003_9_gC_grid_cell <- emissions2003_9_gC_grid_cell*gfed2003ras$C_DEFO.9
DEFOemissions2003_10_gC_grid_cell <- emissions2003_10_gC_grid_cell*gfed2003ras$C_DEFO.10
DEFOemissions2003_11_gC_grid_cell <- emissions2003_11_gC_grid_cell*gfed2003ras$C_DEFO.11
DEFOemissions2003_12_gC_grid_cell <- emissions2003_12_gC_grid_cell*gfed2003ras$C_DEFO.12
DEFOemissions2004_1_gC_grid_cell <- emissions2004_1_gC_grid_cell*gfed2004ras$C_DEFO.1 #2004
DEFOemissions2004_2_gC_grid_cell <- emissions2004_2_gC_grid_cell*gfed2004ras$C_DEFO.2
DEFOemissions2004_3_gC_grid_cell <- emissions2004_3_gC_grid_cell*gfed2004ras$C_DEFO.3
DEFOemissions2004_4_gC_grid_cell <- emissions2004_4_gC_grid_cell*gfed2004ras$C_DEFO.4
DEFOemissions2004_5_gC_grid_cell <- emissions2004_5_gC_grid_cell*gfed2004ras$C_DEFO.5
DEFOemissions2004_6_gC_grid_cell <- emissions2004_6_gC_grid_cell*gfed2004ras$C_DEFO.6
DEFOemissions2004_7_gC_grid_cell <- emissions2004_7_gC_grid_cell*gfed2004ras$C_DEFO.7
DEFOemissions2004_8_gC_grid_cell <- emissions2004_8_gC_grid_cell*gfed2004ras$C_DEFO.8
DEFOemissions2004_9_gC_grid_cell <- emissions2004_9_gC_grid_cell*gfed2004ras$C_DEFO.9
DEFOemissions2004_10_gC_grid_cell <- emissions2004_10_gC_grid_cell*gfed2004ras$C_DEFO.10
DEFOemissions2004_11_gC_grid_cell <- emissions2004_11_gC_grid_cell*gfed2004ras$C_DEFO.11
DEFOemissions2004_12_gC_grid_cell <- emissions2004_12_gC_grid_cell*gfed2004ras$C_DEFO.12
DEFOemissions2005_1_gC_grid_cell <- emissions2005_1_gC_grid_cell*gfed2005ras$C_DEFO.1 #2005
DEFOemissions2005_2_gC_grid_cell <- emissions2005_2_gC_grid_cell*gfed2005ras$C_DEFO.2
DEFOemissions2005_3_gC_grid_cell <- emissions2005_3_gC_grid_cell*gfed2005ras$C_DEFO.3
DEFOemissions2005_4_gC_grid_cell <- emissions2005_4_gC_grid_cell*gfed2005ras$C_DEFO.4
DEFOemissions2005_5_gC_grid_cell <- emissions2005_5_gC_grid_cell*gfed2005ras$C_DEFO.5
DEFOemissions2005_6_gC_grid_cell <- emissions2005_6_gC_grid_cell*gfed2005ras$C_DEFO.6
DEFOemissions2005_7_gC_grid_cell <- emissions2005_7_gC_grid_cell*gfed2005ras$C_DEFO.7
DEFOemissions2005_8_gC_grid_cell <- emissions2005_8_gC_grid_cell*gfed2005ras$C_DEFO.8
DEFOemissions2005_9_gC_grid_cell <- emissions2005_9_gC_grid_cell*gfed2005ras$C_DEFO.9
DEFOemissions2005_10_gC_grid_cell <- emissions2005_10_gC_grid_cell*gfed2005ras$C_DEFO.10
DEFOemissions2005_11_gC_grid_cell <- emissions2005_11_gC_grid_cell*gfed2005ras$C_DEFO.11
DEFOemissions2005_12_gC_grid_cell <- emissions2005_12_gC_grid_cell*gfed2005ras$C_DEFO.12
DEFOemissions2006_1_gC_grid_cell <- emissions2006_1_gC_grid_cell*gfed2006ras$C_DEFO.1 #2006
DEFOemissions2006_2_gC_grid_cell <- emissions2006_2_gC_grid_cell*gfed2006ras$C_DEFO.2
DEFOemissions2006_3_gC_grid_cell <- emissions2006_3_gC_grid_cell*gfed2006ras$C_DEFO.3
DEFOemissions2006_4_gC_grid_cell <- emissions2006_4_gC_grid_cell*gfed2006ras$C_DEFO.4
DEFOemissions2006_5_gC_grid_cell <- emissions2006_5_gC_grid_cell*gfed2006ras$C_DEFO.5
DEFOemissions2006_6_gC_grid_cell <- emissions2006_6_gC_grid_cell*gfed2006ras$C_DEFO.6
DEFOemissions2006_7_gC_grid_cell <- emissions2006_7_gC_grid_cell*gfed2006ras$C_DEFO.7
DEFOemissions2006_8_gC_grid_cell <- emissions2006_8_gC_grid_cell*gfed2006ras$C_DEFO.8
DEFOemissions2006_9_gC_grid_cell <- emissions2006_9_gC_grid_cell*gfed2006ras$C_DEFO.9
DEFOemissions2006_10_gC_grid_cell <- emissions2006_10_gC_grid_cell*gfed2006ras$C_DEFO.10
DEFOemissions2006_11_gC_grid_cell <- emissions2006_11_gC_grid_cell*gfed2006ras$C_DEFO.11
DEFOemissions2006_12_gC_grid_cell <- emissions2006_12_gC_grid_cell*gfed2006ras$C_DEFO.12
DEFOemissions2007_1_gC_grid_cell <- emissions2007_1_gC_grid_cell*gfed2007ras$C_DEFO.1 #2007
DEFOemissions2007_2_gC_grid_cell <- emissions2007_2_gC_grid_cell*gfed2007ras$C_DEFO.2
DEFOemissions2007_3_gC_grid_cell <- emissions2007_3_gC_grid_cell*gfed2007ras$C_DEFO.3
DEFOemissions2007_4_gC_grid_cell <- emissions2007_4_gC_grid_cell*gfed2007ras$C_DEFO.4
DEFOemissions2007_5_gC_grid_cell <- emissions2007_5_gC_grid_cell*gfed2007ras$C_DEFO.5
DEFOemissions2007_6_gC_grid_cell <- emissions2007_6_gC_grid_cell*gfed2007ras$C_DEFO.6
DEFOemissions2007_7_gC_grid_cell <- emissions2007_7_gC_grid_cell*gfed2007ras$C_DEFO.7
DEFOemissions2007_8_gC_grid_cell <- emissions2007_8_gC_grid_cell*gfed2007ras$C_DEFO.8
DEFOemissions2007_9_gC_grid_cell <- emissions2007_9_gC_grid_cell*gfed2007ras$C_DEFO.9
DEFOemissions2007_10_gC_grid_cell <- emissions2007_10_gC_grid_cell*gfed2007ras$C_DEFO.10
DEFOemissions2007_11_gC_grid_cell <- emissions2007_11_gC_grid_cell*gfed2007ras$C_DEFO.11
DEFOemissions2007_12_gC_grid_cell <- emissions2007_12_gC_grid_cell*gfed2007ras$C_DEFO.12
DEFOemissions2008_1_gC_grid_cell <- emissions2008_1_gC_grid_cell*gfed2008ras$C_DEFO.1 #2008
DEFOemissions2008_2_gC_grid_cell <- emissions2008_2_gC_grid_cell*gfed2008ras$C_DEFO.2
DEFOemissions2008_3_gC_grid_cell <- emissions2008_3_gC_grid_cell*gfed2008ras$C_DEFO.3
DEFOemissions2008_4_gC_grid_cell <- emissions2008_4_gC_grid_cell*gfed2008ras$C_DEFO.4
DEFOemissions2008_5_gC_grid_cell <- emissions2008_5_gC_grid_cell*gfed2008ras$C_DEFO.5
DEFOemissions2008_6_gC_grid_cell <- emissions2008_6_gC_grid_cell*gfed2008ras$C_DEFO.6
DEFOemissions2008_7_gC_grid_cell <- emissions2008_7_gC_grid_cell*gfed2008ras$C_DEFO.7
DEFOemissions2008_8_gC_grid_cell <- emissions2008_8_gC_grid_cell*gfed2008ras$C_DEFO.8
DEFOemissions2008_9_gC_grid_cell <- emissions2008_9_gC_grid_cell*gfed2008ras$C_DEFO.9
DEFOemissions2008_10_gC_grid_cell <- emissions2008_10_gC_grid_cell*gfed2008ras$C_DEFO.10
DEFOemissions2008_11_gC_grid_cell <- emissions2008_11_gC_grid_cell*gfed2008ras$C_DEFO.11
DEFOemissions2008_12_gC_grid_cell <- emissions2008_12_gC_grid_cell*gfed2008ras$C_DEFO.12
DEFOemissions2009_1_gC_grid_cell <- emissions2009_1_gC_grid_cell*gfed2009ras$C_DEFO.1 #2009
DEFOemissions2009_2_gC_grid_cell <- emissions2009_2_gC_grid_cell*gfed2009ras$C_DEFO.2
DEFOemissions2009_3_gC_grid_cell <- emissions2009_3_gC_grid_cell*gfed2009ras$C_DEFO.3
DEFOemissions2009_4_gC_grid_cell <- emissions2009_4_gC_grid_cell*gfed2009ras$C_DEFO.4
DEFOemissions2009_5_gC_grid_cell <- emissions2009_5_gC_grid_cell*gfed2009ras$C_DEFO.5
DEFOemissions2009_6_gC_grid_cell <- emissions2009_6_gC_grid_cell*gfed2009ras$C_DEFO.6
DEFOemissions2009_7_gC_grid_cell <- emissions2009_7_gC_grid_cell*gfed2009ras$C_DEFO.7
DEFOemissions2009_8_gC_grid_cell <- emissions2009_8_gC_grid_cell*gfed2009ras$C_DEFO.8
DEFOemissions2009_9_gC_grid_cell <- emissions2009_9_gC_grid_cell*gfed2009ras$C_DEFO.9
DEFOemissions2009_10_gC_grid_cell <- emissions2009_10_gC_grid_cell*gfed2009ras$C_DEFO.10
DEFOemissions2009_11_gC_grid_cell <- emissions2009_11_gC_grid_cell*gfed2009ras$C_DEFO.11
DEFOemissions2009_12_gC_grid_cell <- emissions2009_12_gC_grid_cell*gfed2009ras$C_DEFO.12
DEFOemissions2010_1_gC_grid_cell <- emissions2010_1_gC_grid_cell*gfed2010ras$C_DEFO.1 #2010
DEFOemissions2010_2_gC_grid_cell <- emissions2010_2_gC_grid_cell*gfed2010ras$C_DEFO.2
DEFOemissions2010_3_gC_grid_cell <- emissions2010_3_gC_grid_cell*gfed2010ras$C_DEFO.3
DEFOemissions2010_4_gC_grid_cell <- emissions2010_4_gC_grid_cell*gfed2010ras$C_DEFO.4
DEFOemissions2010_5_gC_grid_cell <- emissions2010_5_gC_grid_cell*gfed2010ras$C_DEFO.5
DEFOemissions2010_6_gC_grid_cell <- emissions2010_6_gC_grid_cell*gfed2010ras$C_DEFO.6
DEFOemissions2010_7_gC_grid_cell <- emissions2010_7_gC_grid_cell*gfed2010ras$C_DEFO.7
DEFOemissions2010_8_gC_grid_cell <- emissions2010_8_gC_grid_cell*gfed2010ras$C_DEFO.8
DEFOemissions2010_9_gC_grid_cell <- emissions2010_9_gC_grid_cell*gfed2010ras$C_DEFO.9
DEFOemissions2010_10_gC_grid_cell <- emissions2010_10_gC_grid_cell*gfed2010ras$C_DEFO.10
DEFOemissions2010_11_gC_grid_cell <- emissions2010_11_gC_grid_cell*gfed2010ras$C_DEFO.11
DEFOemissions2010_12_gC_grid_cell <- emissions2010_12_gC_grid_cell*gfed2010ras$C_DEFO.12
DEFOemissions2011_1_gC_grid_cell <- emissions2011_1_gC_grid_cell*gfed2011ras$C_DEFO.1 #2011
DEFOemissions2011_2_gC_grid_cell <- emissions2011_2_gC_grid_cell*gfed2011ras$C_DEFO.2
DEFOemissions2011_3_gC_grid_cell <- emissions2011_3_gC_grid_cell*gfed2011ras$C_DEFO.3
DEFOemissions2011_4_gC_grid_cell <- emissions2011_4_gC_grid_cell*gfed2011ras$C_DEFO.4
DEFOemissions2011_5_gC_grid_cell <- emissions2011_5_gC_grid_cell*gfed2011ras$C_DEFO.5
DEFOemissions2011_6_gC_grid_cell <- emissions2011_6_gC_grid_cell*gfed2011ras$C_DEFO.6
DEFOemissions2011_7_gC_grid_cell <- emissions2011_7_gC_grid_cell*gfed2011ras$C_DEFO.7
DEFOemissions2011_8_gC_grid_cell <- emissions2011_8_gC_grid_cell*gfed2011ras$C_DEFO.8
DEFOemissions2011_9_gC_grid_cell <- emissions2011_9_gC_grid_cell*gfed2011ras$C_DEFO.9
DEFOemissions2011_10_gC_grid_cell <- emissions2011_10_gC_grid_cell*gfed2011ras$C_DEFO.10
DEFOemissions2011_11_gC_grid_cell <- emissions2011_11_gC_grid_cell*gfed2011ras$C_DEFO.11
DEFOemissions2011_12_gC_grid_cell <- emissions2011_12_gC_grid_cell*gfed2011ras$C_DEFO.12
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
PEATemissions1997 <- (PEATemissions1997_1_gC_grid_cell+
                        PEATemissions1997_2_gC_grid_cell+
                        PEATemissions1997_3_gC_grid_cell+
                        PEATemissions1997_4_gC_grid_cell+
                        PEATemissions1997_5_gC_grid_cell+
                        PEATemissions1997_6_gC_grid_cell+
                        PEATemissions1997_7_gC_grid_cell+
                        PEATemissions1997_8_gC_grid_cell+
                        PEATemissions1997_9_gC_grid_cell+
                        PEATemissions1997_10_gC_grid_cell+
                        PEATemissions1997_11_gC_grid_cell+
                        PEATemissions1997_12_gC_grid_cell)
PEATemissions1998 <- (PEATemissions1998_1_gC_grid_cell+
                        PEATemissions1998_2_gC_grid_cell+
                        PEATemissions1998_3_gC_grid_cell+
                        PEATemissions1998_4_gC_grid_cell+
                        PEATemissions1998_5_gC_grid_cell+
                        PEATemissions1998_6_gC_grid_cell+
                        PEATemissions1998_7_gC_grid_cell+
                        PEATemissions1998_8_gC_grid_cell+
                        PEATemissions1998_9_gC_grid_cell+
                        PEATemissions1998_10_gC_grid_cell+
                        PEATemissions1998_11_gC_grid_cell+
                        PEATemissions1998_12_gC_grid_cell)
PEATemissions1999 <- (PEATemissions1999_1_gC_grid_cell+
                        PEATemissions1999_2_gC_grid_cell+
                        PEATemissions1999_3_gC_grid_cell+
                        PEATemissions1999_4_gC_grid_cell+
                        PEATemissions1999_5_gC_grid_cell+
                        PEATemissions1999_6_gC_grid_cell+
                        PEATemissions1999_7_gC_grid_cell+
                        PEATemissions1999_8_gC_grid_cell+
                        PEATemissions1999_9_gC_grid_cell+
                        PEATemissions1999_10_gC_grid_cell+
                        PEATemissions1999_11_gC_grid_cell+
                        PEATemissions1999_12_gC_grid_cell)
PEATemissions2000 <- (PEATemissions2000_1_gC_grid_cell+
                        PEATemissions2000_2_gC_grid_cell+
                        PEATemissions2000_3_gC_grid_cell+
                        PEATemissions2000_4_gC_grid_cell+
                        PEATemissions2000_5_gC_grid_cell+
                        PEATemissions2000_6_gC_grid_cell+
                        PEATemissions2000_7_gC_grid_cell+
                        PEATemissions2000_8_gC_grid_cell+
                        PEATemissions2000_9_gC_grid_cell+
                        PEATemissions2000_10_gC_grid_cell+
                        PEATemissions2000_11_gC_grid_cell+
                        PEATemissions2000_12_gC_grid_cell)
PEATemissions2001 <- (PEATemissions2001_1_gC_grid_cell+
                        PEATemissions2001_2_gC_grid_cell+
                        PEATemissions2001_3_gC_grid_cell+
                        PEATemissions2001_4_gC_grid_cell+
                        PEATemissions2001_5_gC_grid_cell+
                        PEATemissions2001_6_gC_grid_cell+
                        PEATemissions2001_7_gC_grid_cell+
                        PEATemissions2001_8_gC_grid_cell+
                        PEATemissions2001_9_gC_grid_cell+
                        PEATemissions2001_10_gC_grid_cell+
                        PEATemissions2001_11_gC_grid_cell+
                        PEATemissions2001_12_gC_grid_cell)
PEATemissions2002 <- (PEATemissions2002_1_gC_grid_cell+
                        PEATemissions2002_2_gC_grid_cell+
                        PEATemissions2002_3_gC_grid_cell+
                        PEATemissions2002_4_gC_grid_cell+
                        PEATemissions2002_5_gC_grid_cell+
                        PEATemissions2002_6_gC_grid_cell+
                        PEATemissions2002_7_gC_grid_cell+
                        PEATemissions2002_8_gC_grid_cell+
                        PEATemissions2002_9_gC_grid_cell+
                        PEATemissions2002_10_gC_grid_cell+
                        PEATemissions2002_11_gC_grid_cell+
                        PEATemissions2002_12_gC_grid_cell)
PEATemissions2003 <- (PEATemissions2003_1_gC_grid_cell+
                        PEATemissions2003_2_gC_grid_cell+
                        PEATemissions2003_3_gC_grid_cell+
                        PEATemissions2003_4_gC_grid_cell+
                        PEATemissions2003_5_gC_grid_cell+
                        PEATemissions2003_6_gC_grid_cell+
                        PEATemissions2003_7_gC_grid_cell+
                        PEATemissions2003_8_gC_grid_cell+
                        PEATemissions2003_9_gC_grid_cell+
                        PEATemissions2003_10_gC_grid_cell+
                        PEATemissions2003_11_gC_grid_cell+
                        PEATemissions2003_12_gC_grid_cell)
PEATemissions2004 <- (PEATemissions2004_1_gC_grid_cell+
                        PEATemissions2004_2_gC_grid_cell+
                        PEATemissions2004_3_gC_grid_cell+
                        PEATemissions2004_4_gC_grid_cell+
                        PEATemissions2004_5_gC_grid_cell+
                        PEATemissions2004_6_gC_grid_cell+
                        PEATemissions2004_7_gC_grid_cell+
                        PEATemissions2004_8_gC_grid_cell+
                        PEATemissions2004_9_gC_grid_cell+
                        PEATemissions2004_10_gC_grid_cell+
                        PEATemissions2004_11_gC_grid_cell+
                        PEATemissions2004_12_gC_grid_cell)
PEATemissions2005 <- (PEATemissions2005_1_gC_grid_cell+
                        PEATemissions2005_2_gC_grid_cell+
                        PEATemissions2005_3_gC_grid_cell+
                        PEATemissions2005_4_gC_grid_cell+
                        PEATemissions2005_5_gC_grid_cell+
                        PEATemissions2005_6_gC_grid_cell+
                        PEATemissions2005_7_gC_grid_cell+
                        PEATemissions2005_8_gC_grid_cell+
                        PEATemissions2005_9_gC_grid_cell+
                        PEATemissions2005_10_gC_grid_cell+
                        PEATemissions2005_11_gC_grid_cell+
                        PEATemissions2005_12_gC_grid_cell)
PEATemissions2006 <- (PEATemissions2006_1_gC_grid_cell+
                        PEATemissions2006_2_gC_grid_cell+
                        PEATemissions2006_3_gC_grid_cell+
                        PEATemissions2006_4_gC_grid_cell+
                        PEATemissions2006_5_gC_grid_cell+
                        PEATemissions2006_6_gC_grid_cell+
                        PEATemissions2006_7_gC_grid_cell+
                        PEATemissions2006_8_gC_grid_cell+
                        PEATemissions2006_9_gC_grid_cell+
                        PEATemissions2006_10_gC_grid_cell+
                        PEATemissions2006_11_gC_grid_cell+
                        PEATemissions2006_12_gC_grid_cell)
PEATemissions2007 <- (PEATemissions2007_1_gC_grid_cell+
                        PEATemissions2007_2_gC_grid_cell+
                        PEATemissions2007_3_gC_grid_cell+
                        PEATemissions2007_4_gC_grid_cell+
                        PEATemissions2007_5_gC_grid_cell+
                        PEATemissions2007_6_gC_grid_cell+
                        PEATemissions2007_7_gC_grid_cell+
                        PEATemissions2007_8_gC_grid_cell+
                        PEATemissions2007_9_gC_grid_cell+
                        PEATemissions2007_10_gC_grid_cell+
                        PEATemissions2007_11_gC_grid_cell+
                        PEATemissions2007_12_gC_grid_cell)
PEATemissions2008 <- (PEATemissions2008_1_gC_grid_cell+
                        PEATemissions2008_2_gC_grid_cell+
                        PEATemissions2008_3_gC_grid_cell+
                        PEATemissions2008_4_gC_grid_cell+
                        PEATemissions2008_5_gC_grid_cell+
                        PEATemissions2008_6_gC_grid_cell+
                        PEATemissions2008_7_gC_grid_cell+
                        PEATemissions2008_8_gC_grid_cell+
                        PEATemissions2008_9_gC_grid_cell+
                        PEATemissions2008_10_gC_grid_cell+
                        PEATemissions2008_11_gC_grid_cell+
                        PEATemissions2008_12_gC_grid_cell)
PEATemissions2009 <- (PEATemissions2009_1_gC_grid_cell+
                        PEATemissions2009_2_gC_grid_cell+
                        PEATemissions2009_3_gC_grid_cell+
                        PEATemissions2009_4_gC_grid_cell+
                        PEATemissions2009_5_gC_grid_cell+
                        PEATemissions2009_6_gC_grid_cell+
                        PEATemissions2009_7_gC_grid_cell+
                        PEATemissions2009_8_gC_grid_cell+
                        PEATemissions2009_9_gC_grid_cell+
                        PEATemissions2009_10_gC_grid_cell+
                        PEATemissions2009_11_gC_grid_cell+
                        PEATemissions2009_12_gC_grid_cell)
PEATemissions2010 <- (PEATemissions2010_1_gC_grid_cell+
                        PEATemissions2010_2_gC_grid_cell+
                        PEATemissions2010_3_gC_grid_cell+
                        PEATemissions2010_4_gC_grid_cell+
                        PEATemissions2010_5_gC_grid_cell+
                        PEATemissions2010_6_gC_grid_cell+
                        PEATemissions2010_7_gC_grid_cell+
                        PEATemissions2010_8_gC_grid_cell+
                        PEATemissions2010_9_gC_grid_cell+
                        PEATemissions2010_10_gC_grid_cell+
                        PEATemissions2010_11_gC_grid_cell+
                        PEATemissions2010_12_gC_grid_cell)
PEATemissions2011 <- (PEATemissions2011_1_gC_grid_cell+
                        PEATemissions2011_2_gC_grid_cell+
                        PEATemissions2011_3_gC_grid_cell+
                        PEATemissions2011_4_gC_grid_cell+
                        PEATemissions2011_5_gC_grid_cell+
                        PEATemissions2011_6_gC_grid_cell+
                        PEATemissions2011_7_gC_grid_cell+
                        PEATemissions2011_8_gC_grid_cell+
                        PEATemissions2011_9_gC_grid_cell+
                        PEATemissions2011_10_gC_grid_cell+
                        PEATemissions2011_11_gC_grid_cell+
                        PEATemissions2011_12_gC_grid_cell)
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
BORFemissions1997 <- (BORFemissions1997_1_gC_grid_cell+
                        BORFemissions1997_2_gC_grid_cell+
                        BORFemissions1997_3_gC_grid_cell+
                        BORFemissions1997_4_gC_grid_cell+
                        BORFemissions1997_5_gC_grid_cell+
                        BORFemissions1997_6_gC_grid_cell+
                        BORFemissions1997_7_gC_grid_cell+
                        BORFemissions1997_8_gC_grid_cell+
                        BORFemissions1997_9_gC_grid_cell+
                        BORFemissions1997_10_gC_grid_cell+
                        BORFemissions1997_11_gC_grid_cell+
                        BORFemissions1997_12_gC_grid_cell)
BORFemissions1998 <- (BORFemissions1998_1_gC_grid_cell+
                        BORFemissions1998_2_gC_grid_cell+
                        BORFemissions1998_3_gC_grid_cell+
                        BORFemissions1998_4_gC_grid_cell+
                        BORFemissions1998_5_gC_grid_cell+
                        BORFemissions1998_6_gC_grid_cell+
                        BORFemissions1998_7_gC_grid_cell+
                        BORFemissions1998_8_gC_grid_cell+
                        BORFemissions1998_9_gC_grid_cell+
                        BORFemissions1998_10_gC_grid_cell+
                        BORFemissions1998_11_gC_grid_cell+
                        BORFemissions1998_12_gC_grid_cell)
BORFemissions1999 <- (BORFemissions1999_1_gC_grid_cell+
                        BORFemissions1999_2_gC_grid_cell+
                        BORFemissions1999_3_gC_grid_cell+
                        BORFemissions1999_4_gC_grid_cell+
                        BORFemissions1999_5_gC_grid_cell+
                        BORFemissions1999_6_gC_grid_cell+
                        BORFemissions1999_7_gC_grid_cell+
                        BORFemissions1999_8_gC_grid_cell+
                        BORFemissions1999_9_gC_grid_cell+
                        BORFemissions1999_10_gC_grid_cell+
                        BORFemissions1999_11_gC_grid_cell+
                        BORFemissions1999_12_gC_grid_cell)
BORFemissions2000 <- (BORFemissions2000_1_gC_grid_cell+
                        BORFemissions2000_2_gC_grid_cell+
                        BORFemissions2000_3_gC_grid_cell+
                        BORFemissions2000_4_gC_grid_cell+
                        BORFemissions2000_5_gC_grid_cell+
                        BORFemissions2000_6_gC_grid_cell+
                        BORFemissions2000_7_gC_grid_cell+
                        BORFemissions2000_8_gC_grid_cell+
                        BORFemissions2000_9_gC_grid_cell+
                        BORFemissions2000_10_gC_grid_cell+
                        BORFemissions2000_11_gC_grid_cell+
                        BORFemissions2000_12_gC_grid_cell)
BORFemissions2001 <- (BORFemissions2001_1_gC_grid_cell+
                        BORFemissions2001_2_gC_grid_cell+
                        BORFemissions2001_3_gC_grid_cell+
                        BORFemissions2001_4_gC_grid_cell+
                        BORFemissions2001_5_gC_grid_cell+
                        BORFemissions2001_6_gC_grid_cell+
                        BORFemissions2001_7_gC_grid_cell+
                        BORFemissions2001_8_gC_grid_cell+
                        BORFemissions2001_9_gC_grid_cell+
                        BORFemissions2001_10_gC_grid_cell+
                        BORFemissions2001_11_gC_grid_cell+
                        BORFemissions2001_12_gC_grid_cell)
BORFemissions2002 <- (BORFemissions2002_1_gC_grid_cell+
                        BORFemissions2002_2_gC_grid_cell+
                        BORFemissions2002_3_gC_grid_cell+
                        BORFemissions2002_4_gC_grid_cell+
                        BORFemissions2002_5_gC_grid_cell+
                        BORFemissions2002_6_gC_grid_cell+
                        BORFemissions2002_7_gC_grid_cell+
                        BORFemissions2002_8_gC_grid_cell+
                        BORFemissions2002_9_gC_grid_cell+
                        BORFemissions2002_10_gC_grid_cell+
                        BORFemissions2002_11_gC_grid_cell+
                        BORFemissions2002_12_gC_grid_cell)
BORFemissions2003 <- (BORFemissions2003_1_gC_grid_cell+
                        BORFemissions2003_2_gC_grid_cell+
                        BORFemissions2003_3_gC_grid_cell+
                        BORFemissions2003_4_gC_grid_cell+
                        BORFemissions2003_5_gC_grid_cell+
                        BORFemissions2003_6_gC_grid_cell+
                        BORFemissions2003_7_gC_grid_cell+
                        BORFemissions2003_8_gC_grid_cell+
                        BORFemissions2003_9_gC_grid_cell+
                        BORFemissions2003_10_gC_grid_cell+
                        BORFemissions2003_11_gC_grid_cell+
                        BORFemissions2003_12_gC_grid_cell)
BORFemissions2004 <- (BORFemissions2004_1_gC_grid_cell+
                        BORFemissions2004_2_gC_grid_cell+
                        BORFemissions2004_3_gC_grid_cell+
                        BORFemissions2004_4_gC_grid_cell+
                        BORFemissions2004_5_gC_grid_cell+
                        BORFemissions2004_6_gC_grid_cell+
                        BORFemissions2004_7_gC_grid_cell+
                        BORFemissions2004_8_gC_grid_cell+
                        BORFemissions2004_9_gC_grid_cell+
                        BORFemissions2004_10_gC_grid_cell+
                        BORFemissions2004_11_gC_grid_cell+
                        BORFemissions2004_12_gC_grid_cell)
BORFemissions2005 <- (BORFemissions2005_1_gC_grid_cell+
                        BORFemissions2005_2_gC_grid_cell+
                        BORFemissions2005_3_gC_grid_cell+
                        BORFemissions2005_4_gC_grid_cell+
                        BORFemissions2005_5_gC_grid_cell+
                        BORFemissions2005_6_gC_grid_cell+
                        BORFemissions2005_7_gC_grid_cell+
                        BORFemissions2005_8_gC_grid_cell+
                        BORFemissions2005_9_gC_grid_cell+
                        BORFemissions2005_10_gC_grid_cell+
                        BORFemissions2005_11_gC_grid_cell+
                        BORFemissions2005_12_gC_grid_cell)
BORFemissions2006 <- (BORFemissions2006_1_gC_grid_cell+
                        BORFemissions2006_2_gC_grid_cell+
                        BORFemissions2006_3_gC_grid_cell+
                        BORFemissions2006_4_gC_grid_cell+
                        BORFemissions2006_5_gC_grid_cell+
                        BORFemissions2006_6_gC_grid_cell+
                        BORFemissions2006_7_gC_grid_cell+
                        BORFemissions2006_8_gC_grid_cell+
                        BORFemissions2006_9_gC_grid_cell+
                        BORFemissions2006_10_gC_grid_cell+
                        BORFemissions2006_11_gC_grid_cell+
                        BORFemissions2006_12_gC_grid_cell)
BORFemissions2007 <- (BORFemissions2007_1_gC_grid_cell+
                        BORFemissions2007_2_gC_grid_cell+
                        BORFemissions2007_3_gC_grid_cell+
                        BORFemissions2007_4_gC_grid_cell+
                        BORFemissions2007_5_gC_grid_cell+
                        BORFemissions2007_6_gC_grid_cell+
                        BORFemissions2007_7_gC_grid_cell+
                        BORFemissions2007_8_gC_grid_cell+
                        BORFemissions2007_9_gC_grid_cell+
                        BORFemissions2007_10_gC_grid_cell+
                        BORFemissions2007_11_gC_grid_cell+
                        BORFemissions2007_12_gC_grid_cell)
BORFemissions2008 <- (BORFemissions2008_1_gC_grid_cell+
                        BORFemissions2008_2_gC_grid_cell+
                        BORFemissions2008_3_gC_grid_cell+
                        BORFemissions2008_4_gC_grid_cell+
                        BORFemissions2008_5_gC_grid_cell+
                        BORFemissions2008_6_gC_grid_cell+
                        BORFemissions2008_7_gC_grid_cell+
                        BORFemissions2008_8_gC_grid_cell+
                        BORFemissions2008_9_gC_grid_cell+
                        BORFemissions2008_10_gC_grid_cell+
                        BORFemissions2008_11_gC_grid_cell+
                        BORFemissions2008_12_gC_grid_cell)
BORFemissions2009 <- (BORFemissions2009_1_gC_grid_cell+
                        BORFemissions2009_2_gC_grid_cell+
                        BORFemissions2009_3_gC_grid_cell+
                        BORFemissions2009_4_gC_grid_cell+
                        BORFemissions2009_5_gC_grid_cell+
                        BORFemissions2009_6_gC_grid_cell+
                        BORFemissions2009_7_gC_grid_cell+
                        BORFemissions2009_8_gC_grid_cell+
                        BORFemissions2009_9_gC_grid_cell+
                        BORFemissions2009_10_gC_grid_cell+
                        BORFemissions2009_11_gC_grid_cell+
                        BORFemissions2009_12_gC_grid_cell)
BORFemissions2010 <- (BORFemissions2010_1_gC_grid_cell+
                        BORFemissions2010_2_gC_grid_cell+
                        BORFemissions2010_3_gC_grid_cell+
                        BORFemissions2010_4_gC_grid_cell+
                        BORFemissions2010_5_gC_grid_cell+
                        BORFemissions2010_6_gC_grid_cell+
                        BORFemissions2010_7_gC_grid_cell+
                        BORFemissions2010_8_gC_grid_cell+
                        BORFemissions2010_9_gC_grid_cell+
                        BORFemissions2010_10_gC_grid_cell+
                        BORFemissions2010_11_gC_grid_cell+
                        BORFemissions2010_12_gC_grid_cell)
BORFemissions2011 <- (BORFemissions2011_1_gC_grid_cell+
                        BORFemissions2011_2_gC_grid_cell+
                        BORFemissions2011_3_gC_grid_cell+
                        BORFemissions2011_4_gC_grid_cell+
                        BORFemissions2011_5_gC_grid_cell+
                        BORFemissions2011_6_gC_grid_cell+
                        BORFemissions2011_7_gC_grid_cell+
                        BORFemissions2011_8_gC_grid_cell+
                        BORFemissions2011_9_gC_grid_cell+
                        BORFemissions2011_10_gC_grid_cell+
                        BORFemissions2011_11_gC_grid_cell+
                        BORFemissions2011_12_gC_grid_cell)
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
SAVAemissions1997 <- (SAVAemissions1997_1_gC_grid_cell+
                        SAVAemissions1997_2_gC_grid_cell+
                        SAVAemissions1997_3_gC_grid_cell+
                        SAVAemissions1997_4_gC_grid_cell+
                        SAVAemissions1997_5_gC_grid_cell+
                        SAVAemissions1997_6_gC_grid_cell+
                        SAVAemissions1997_7_gC_grid_cell+
                        SAVAemissions1997_8_gC_grid_cell+
                        SAVAemissions1997_9_gC_grid_cell+
                        SAVAemissions1997_10_gC_grid_cell+
                        SAVAemissions1997_11_gC_grid_cell+
                        SAVAemissions1997_12_gC_grid_cell)
SAVAemissions1998 <- (SAVAemissions1998_1_gC_grid_cell+
                        SAVAemissions1998_2_gC_grid_cell+
                        SAVAemissions1998_3_gC_grid_cell+
                        SAVAemissions1998_4_gC_grid_cell+
                        SAVAemissions1998_5_gC_grid_cell+
                        SAVAemissions1998_6_gC_grid_cell+
                        SAVAemissions1998_7_gC_grid_cell+
                        SAVAemissions1998_8_gC_grid_cell+
                        SAVAemissions1998_9_gC_grid_cell+
                        SAVAemissions1998_10_gC_grid_cell+
                        SAVAemissions1998_11_gC_grid_cell+
                        SAVAemissions1998_12_gC_grid_cell)
SAVAemissions1999 <- (SAVAemissions1999_1_gC_grid_cell+
                        SAVAemissions1999_2_gC_grid_cell+
                        SAVAemissions1999_3_gC_grid_cell+
                        SAVAemissions1999_4_gC_grid_cell+
                        SAVAemissions1999_5_gC_grid_cell+
                        SAVAemissions1999_6_gC_grid_cell+
                        SAVAemissions1999_7_gC_grid_cell+
                        SAVAemissions1999_8_gC_grid_cell+
                        SAVAemissions1999_9_gC_grid_cell+
                        SAVAemissions1999_10_gC_grid_cell+
                        SAVAemissions1999_11_gC_grid_cell+
                        SAVAemissions1999_12_gC_grid_cell)
SAVAemissions2000 <- (SAVAemissions2000_1_gC_grid_cell+
                        SAVAemissions2000_2_gC_grid_cell+
                        SAVAemissions2000_3_gC_grid_cell+
                        SAVAemissions2000_4_gC_grid_cell+
                        SAVAemissions2000_5_gC_grid_cell+
                        SAVAemissions2000_6_gC_grid_cell+
                        SAVAemissions2000_7_gC_grid_cell+
                        SAVAemissions2000_8_gC_grid_cell+
                        SAVAemissions2000_9_gC_grid_cell+
                        SAVAemissions2000_10_gC_grid_cell+
                        SAVAemissions2000_11_gC_grid_cell+
                        SAVAemissions2000_12_gC_grid_cell)
SAVAemissions2001 <- (SAVAemissions2001_1_gC_grid_cell+
                        SAVAemissions2001_2_gC_grid_cell+
                        SAVAemissions2001_3_gC_grid_cell+
                        SAVAemissions2001_4_gC_grid_cell+
                        SAVAemissions2001_5_gC_grid_cell+
                        SAVAemissions2001_6_gC_grid_cell+
                        SAVAemissions2001_7_gC_grid_cell+
                        SAVAemissions2001_8_gC_grid_cell+
                        SAVAemissions2001_9_gC_grid_cell+
                        SAVAemissions2001_10_gC_grid_cell+
                        SAVAemissions2001_11_gC_grid_cell+
                        SAVAemissions2001_12_gC_grid_cell)
SAVAemissions2002 <- (SAVAemissions2002_1_gC_grid_cell+
                        SAVAemissions2002_2_gC_grid_cell+
                        SAVAemissions2002_3_gC_grid_cell+
                        SAVAemissions2002_4_gC_grid_cell+
                        SAVAemissions2002_5_gC_grid_cell+
                        SAVAemissions2002_6_gC_grid_cell+
                        SAVAemissions2002_7_gC_grid_cell+
                        SAVAemissions2002_8_gC_grid_cell+
                        SAVAemissions2002_9_gC_grid_cell+
                        SAVAemissions2002_10_gC_grid_cell+
                        SAVAemissions2002_11_gC_grid_cell+
                        SAVAemissions2002_12_gC_grid_cell)
SAVAemissions2003 <- (SAVAemissions2003_1_gC_grid_cell+
                        SAVAemissions2003_2_gC_grid_cell+
                        SAVAemissions2003_3_gC_grid_cell+
                        SAVAemissions2003_4_gC_grid_cell+
                        SAVAemissions2003_5_gC_grid_cell+
                        SAVAemissions2003_6_gC_grid_cell+
                        SAVAemissions2003_7_gC_grid_cell+
                        SAVAemissions2003_8_gC_grid_cell+
                        SAVAemissions2003_9_gC_grid_cell+
                        SAVAemissions2003_10_gC_grid_cell+
                        SAVAemissions2003_11_gC_grid_cell+
                        SAVAemissions2003_12_gC_grid_cell)
SAVAemissions2004 <- (SAVAemissions2004_1_gC_grid_cell+
                        SAVAemissions2004_2_gC_grid_cell+
                        SAVAemissions2004_3_gC_grid_cell+
                        SAVAemissions2004_4_gC_grid_cell+
                        SAVAemissions2004_5_gC_grid_cell+
                        SAVAemissions2004_6_gC_grid_cell+
                        SAVAemissions2004_7_gC_grid_cell+
                        SAVAemissions2004_8_gC_grid_cell+
                        SAVAemissions2004_9_gC_grid_cell+
                        SAVAemissions2004_10_gC_grid_cell+
                        SAVAemissions2004_11_gC_grid_cell+
                        SAVAemissions2004_12_gC_grid_cell)
SAVAemissions2005 <- (SAVAemissions2005_1_gC_grid_cell+
                        SAVAemissions2005_2_gC_grid_cell+
                        SAVAemissions2005_3_gC_grid_cell+
                        SAVAemissions2005_4_gC_grid_cell+
                        SAVAemissions2005_5_gC_grid_cell+
                        SAVAemissions2005_6_gC_grid_cell+
                        SAVAemissions2005_7_gC_grid_cell+
                        SAVAemissions2005_8_gC_grid_cell+
                        SAVAemissions2005_9_gC_grid_cell+
                        SAVAemissions2005_10_gC_grid_cell+
                        SAVAemissions2005_11_gC_grid_cell+
                        SAVAemissions2005_12_gC_grid_cell)
SAVAemissions2006 <- (SAVAemissions2006_1_gC_grid_cell+
                        SAVAemissions2006_2_gC_grid_cell+
                        SAVAemissions2006_3_gC_grid_cell+
                        SAVAemissions2006_4_gC_grid_cell+
                        SAVAemissions2006_5_gC_grid_cell+
                        SAVAemissions2006_6_gC_grid_cell+
                        SAVAemissions2006_7_gC_grid_cell+
                        SAVAemissions2006_8_gC_grid_cell+
                        SAVAemissions2006_9_gC_grid_cell+
                        SAVAemissions2006_10_gC_grid_cell+
                        SAVAemissions2006_11_gC_grid_cell+
                        SAVAemissions2006_12_gC_grid_cell)
SAVAemissions2007 <- (SAVAemissions2007_1_gC_grid_cell+
                        SAVAemissions2007_2_gC_grid_cell+
                        SAVAemissions2007_3_gC_grid_cell+
                        SAVAemissions2007_4_gC_grid_cell+
                        SAVAemissions2007_5_gC_grid_cell+
                        SAVAemissions2007_6_gC_grid_cell+
                        SAVAemissions2007_7_gC_grid_cell+
                        SAVAemissions2007_8_gC_grid_cell+
                        SAVAemissions2007_9_gC_grid_cell+
                        SAVAemissions2007_10_gC_grid_cell+
                        SAVAemissions2007_11_gC_grid_cell+
                        SAVAemissions2007_12_gC_grid_cell)
SAVAemissions2008 <- (SAVAemissions2008_1_gC_grid_cell+
                        SAVAemissions2008_2_gC_grid_cell+
                        SAVAemissions2008_3_gC_grid_cell+
                        SAVAemissions2008_4_gC_grid_cell+
                        SAVAemissions2008_5_gC_grid_cell+
                        SAVAemissions2008_6_gC_grid_cell+
                        SAVAemissions2008_7_gC_grid_cell+
                        SAVAemissions2008_8_gC_grid_cell+
                        SAVAemissions2008_9_gC_grid_cell+
                        SAVAemissions2008_10_gC_grid_cell+
                        SAVAemissions2008_11_gC_grid_cell+
                        SAVAemissions2008_12_gC_grid_cell)
SAVAemissions2009 <- (SAVAemissions2009_1_gC_grid_cell+
                        SAVAemissions2009_2_gC_grid_cell+
                        SAVAemissions2009_3_gC_grid_cell+
                        SAVAemissions2009_4_gC_grid_cell+
                        SAVAemissions2009_5_gC_grid_cell+
                        SAVAemissions2009_6_gC_grid_cell+
                        SAVAemissions2009_7_gC_grid_cell+
                        SAVAemissions2009_8_gC_grid_cell+
                        SAVAemissions2009_9_gC_grid_cell+
                        SAVAemissions2009_10_gC_grid_cell+
                        SAVAemissions2009_11_gC_grid_cell+
                        SAVAemissions2009_12_gC_grid_cell)
SAVAemissions2010 <- (SAVAemissions2010_1_gC_grid_cell+
                        SAVAemissions2010_2_gC_grid_cell+
                        SAVAemissions2010_3_gC_grid_cell+
                        SAVAemissions2010_4_gC_grid_cell+
                        SAVAemissions2010_5_gC_grid_cell+
                        SAVAemissions2010_6_gC_grid_cell+
                        SAVAemissions2010_7_gC_grid_cell+
                        SAVAemissions2010_8_gC_grid_cell+
                        SAVAemissions2010_9_gC_grid_cell+
                        SAVAemissions2010_10_gC_grid_cell+
                        SAVAemissions2010_11_gC_grid_cell+
                        SAVAemissions2010_12_gC_grid_cell)
SAVAemissions2011 <- (SAVAemissions2011_1_gC_grid_cell+
                        SAVAemissions2011_2_gC_grid_cell+
                        SAVAemissions2011_3_gC_grid_cell+
                        SAVAemissions2011_4_gC_grid_cell+
                        SAVAemissions2011_5_gC_grid_cell+
                        SAVAemissions2011_6_gC_grid_cell+
                        SAVAemissions2011_7_gC_grid_cell+
                        SAVAemissions2011_8_gC_grid_cell+
                        SAVAemissions2011_9_gC_grid_cell+
                        SAVAemissions2011_10_gC_grid_cell+
                        SAVAemissions2011_11_gC_grid_cell+
                        SAVAemissions2011_12_gC_grid_cell)
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
TEMFemissions1997 <- (TEMFemissions1997_1_gC_grid_cell+
                        TEMFemissions1997_2_gC_grid_cell+
                        TEMFemissions1997_3_gC_grid_cell+
                        TEMFemissions1997_4_gC_grid_cell+
                        TEMFemissions1997_5_gC_grid_cell+
                        TEMFemissions1997_6_gC_grid_cell+
                        TEMFemissions1997_7_gC_grid_cell+
                        TEMFemissions1997_8_gC_grid_cell+
                        TEMFemissions1997_9_gC_grid_cell+
                        TEMFemissions1997_10_gC_grid_cell+
                        TEMFemissions1997_11_gC_grid_cell+
                        TEMFemissions1997_12_gC_grid_cell)
TEMFemissions1998 <- (TEMFemissions1998_1_gC_grid_cell+
                        TEMFemissions1998_2_gC_grid_cell+
                        TEMFemissions1998_3_gC_grid_cell+
                        TEMFemissions1998_4_gC_grid_cell+
                        TEMFemissions1998_5_gC_grid_cell+
                        TEMFemissions1998_6_gC_grid_cell+
                        TEMFemissions1998_7_gC_grid_cell+
                        TEMFemissions1998_8_gC_grid_cell+
                        TEMFemissions1998_9_gC_grid_cell+
                        TEMFemissions1998_10_gC_grid_cell+
                        TEMFemissions1998_11_gC_grid_cell+
                        TEMFemissions1998_12_gC_grid_cell)
TEMFemissions1999 <- (TEMFemissions1999_1_gC_grid_cell+
                        TEMFemissions1999_2_gC_grid_cell+
                        TEMFemissions1999_3_gC_grid_cell+
                        TEMFemissions1999_4_gC_grid_cell+
                        TEMFemissions1999_5_gC_grid_cell+
                        TEMFemissions1999_6_gC_grid_cell+
                        TEMFemissions1999_7_gC_grid_cell+
                        TEMFemissions1999_8_gC_grid_cell+
                        TEMFemissions1999_9_gC_grid_cell+
                        TEMFemissions1999_10_gC_grid_cell+
                        TEMFemissions1999_11_gC_grid_cell+
                        TEMFemissions1999_12_gC_grid_cell)
TEMFemissions2000 <- (TEMFemissions2000_1_gC_grid_cell+
                        TEMFemissions2000_2_gC_grid_cell+
                        TEMFemissions2000_3_gC_grid_cell+
                        TEMFemissions2000_4_gC_grid_cell+
                        TEMFemissions2000_5_gC_grid_cell+
                        TEMFemissions2000_6_gC_grid_cell+
                        TEMFemissions2000_7_gC_grid_cell+
                        TEMFemissions2000_8_gC_grid_cell+
                        TEMFemissions2000_9_gC_grid_cell+
                        TEMFemissions2000_10_gC_grid_cell+
                        TEMFemissions2000_11_gC_grid_cell+
                        TEMFemissions2000_12_gC_grid_cell)
TEMFemissions2001 <- (TEMFemissions2001_1_gC_grid_cell+
                        TEMFemissions2001_2_gC_grid_cell+
                        TEMFemissions2001_3_gC_grid_cell+
                        TEMFemissions2001_4_gC_grid_cell+
                        TEMFemissions2001_5_gC_grid_cell+
                        TEMFemissions2001_6_gC_grid_cell+
                        TEMFemissions2001_7_gC_grid_cell+
                        TEMFemissions2001_8_gC_grid_cell+
                        TEMFemissions2001_9_gC_grid_cell+
                        TEMFemissions2001_10_gC_grid_cell+
                        TEMFemissions2001_11_gC_grid_cell+
                        TEMFemissions2001_12_gC_grid_cell)
TEMFemissions2002 <- (TEMFemissions2002_1_gC_grid_cell+
                        TEMFemissions2002_2_gC_grid_cell+
                        TEMFemissions2002_3_gC_grid_cell+
                        TEMFemissions2002_4_gC_grid_cell+
                        TEMFemissions2002_5_gC_grid_cell+
                        TEMFemissions2002_6_gC_grid_cell+
                        TEMFemissions2002_7_gC_grid_cell+
                        TEMFemissions2002_8_gC_grid_cell+
                        TEMFemissions2002_9_gC_grid_cell+
                        TEMFemissions2002_10_gC_grid_cell+
                        TEMFemissions2002_11_gC_grid_cell+
                        TEMFemissions2002_12_gC_grid_cell)
TEMFemissions2003 <- (TEMFemissions2003_1_gC_grid_cell+
                        TEMFemissions2003_2_gC_grid_cell+
                        TEMFemissions2003_3_gC_grid_cell+
                        TEMFemissions2003_4_gC_grid_cell+
                        TEMFemissions2003_5_gC_grid_cell+
                        TEMFemissions2003_6_gC_grid_cell+
                        TEMFemissions2003_7_gC_grid_cell+
                        TEMFemissions2003_8_gC_grid_cell+
                        TEMFemissions2003_9_gC_grid_cell+
                        TEMFemissions2003_10_gC_grid_cell+
                        TEMFemissions2003_11_gC_grid_cell+
                        TEMFemissions2003_12_gC_grid_cell)
TEMFemissions2004 <- (TEMFemissions2004_1_gC_grid_cell+
                        TEMFemissions2004_2_gC_grid_cell+
                        TEMFemissions2004_3_gC_grid_cell+
                        TEMFemissions2004_4_gC_grid_cell+
                        TEMFemissions2004_5_gC_grid_cell+
                        TEMFemissions2004_6_gC_grid_cell+
                        TEMFemissions2004_7_gC_grid_cell+
                        TEMFemissions2004_8_gC_grid_cell+
                        TEMFemissions2004_9_gC_grid_cell+
                        TEMFemissions2004_10_gC_grid_cell+
                        TEMFemissions2004_11_gC_grid_cell+
                        TEMFemissions2004_12_gC_grid_cell)
TEMFemissions2005 <- (TEMFemissions2005_1_gC_grid_cell+
                        TEMFemissions2005_2_gC_grid_cell+
                        TEMFemissions2005_3_gC_grid_cell+
                        TEMFemissions2005_4_gC_grid_cell+
                        TEMFemissions2005_5_gC_grid_cell+
                        TEMFemissions2005_6_gC_grid_cell+
                        TEMFemissions2005_7_gC_grid_cell+
                        TEMFemissions2005_8_gC_grid_cell+
                        TEMFemissions2005_9_gC_grid_cell+
                        TEMFemissions2005_10_gC_grid_cell+
                        TEMFemissions2005_11_gC_grid_cell+
                        TEMFemissions2005_12_gC_grid_cell)
TEMFemissions2006 <- (TEMFemissions2006_1_gC_grid_cell+
                        TEMFemissions2006_2_gC_grid_cell+
                        TEMFemissions2006_3_gC_grid_cell+
                        TEMFemissions2006_4_gC_grid_cell+
                        TEMFemissions2006_5_gC_grid_cell+
                        TEMFemissions2006_6_gC_grid_cell+
                        TEMFemissions2006_7_gC_grid_cell+
                        TEMFemissions2006_8_gC_grid_cell+
                        TEMFemissions2006_9_gC_grid_cell+
                        TEMFemissions2006_10_gC_grid_cell+
                        TEMFemissions2006_11_gC_grid_cell+
                        TEMFemissions2006_12_gC_grid_cell)
TEMFemissions2007 <- (TEMFemissions2007_1_gC_grid_cell+
                        TEMFemissions2007_2_gC_grid_cell+
                        TEMFemissions2007_3_gC_grid_cell+
                        TEMFemissions2007_4_gC_grid_cell+
                        TEMFemissions2007_5_gC_grid_cell+
                        TEMFemissions2007_6_gC_grid_cell+
                        TEMFemissions2007_7_gC_grid_cell+
                        TEMFemissions2007_8_gC_grid_cell+
                        TEMFemissions2007_9_gC_grid_cell+
                        TEMFemissions2007_10_gC_grid_cell+
                        TEMFemissions2007_11_gC_grid_cell+
                        TEMFemissions2007_12_gC_grid_cell)
TEMFemissions2008 <- (TEMFemissions2008_1_gC_grid_cell+
                        TEMFemissions2008_2_gC_grid_cell+
                        TEMFemissions2008_3_gC_grid_cell+
                        TEMFemissions2008_4_gC_grid_cell+
                        TEMFemissions2008_5_gC_grid_cell+
                        TEMFemissions2008_6_gC_grid_cell+
                        TEMFemissions2008_7_gC_grid_cell+
                        TEMFemissions2008_8_gC_grid_cell+
                        TEMFemissions2008_9_gC_grid_cell+
                        TEMFemissions2008_10_gC_grid_cell+
                        TEMFemissions2008_11_gC_grid_cell+
                        TEMFemissions2008_12_gC_grid_cell)
TEMFemissions2009 <- (TEMFemissions2009_1_gC_grid_cell+
                        TEMFemissions2009_2_gC_grid_cell+
                        TEMFemissions2009_3_gC_grid_cell+
                        TEMFemissions2009_4_gC_grid_cell+
                        TEMFemissions2009_5_gC_grid_cell+
                        TEMFemissions2009_6_gC_grid_cell+
                        TEMFemissions2009_7_gC_grid_cell+
                        TEMFemissions2009_8_gC_grid_cell+
                        TEMFemissions2009_9_gC_grid_cell+
                        TEMFemissions2009_10_gC_grid_cell+
                        TEMFemissions2009_11_gC_grid_cell+
                        TEMFemissions2009_12_gC_grid_cell)
TEMFemissions2010 <- (TEMFemissions2010_1_gC_grid_cell+
                        TEMFemissions2010_2_gC_grid_cell+
                        TEMFemissions2010_3_gC_grid_cell+
                        TEMFemissions2010_4_gC_grid_cell+
                        TEMFemissions2010_5_gC_grid_cell+
                        TEMFemissions2010_6_gC_grid_cell+
                        TEMFemissions2010_7_gC_grid_cell+
                        TEMFemissions2010_8_gC_grid_cell+
                        TEMFemissions2010_9_gC_grid_cell+
                        TEMFemissions2010_10_gC_grid_cell+
                        TEMFemissions2010_11_gC_grid_cell+
                        TEMFemissions2010_12_gC_grid_cell)
TEMFemissions2011 <- (TEMFemissions2011_1_gC_grid_cell+
                        TEMFemissions2011_2_gC_grid_cell+
                        TEMFemissions2011_3_gC_grid_cell+
                        TEMFemissions2011_4_gC_grid_cell+
                        TEMFemissions2011_5_gC_grid_cell+
                        TEMFemissions2011_6_gC_grid_cell+
                        TEMFemissions2011_7_gC_grid_cell+
                        TEMFemissions2011_8_gC_grid_cell+
                        TEMFemissions2011_9_gC_grid_cell+
                        TEMFemissions2011_10_gC_grid_cell+
                        TEMFemissions2011_11_gC_grid_cell+
                        TEMFemissions2011_12_gC_grid_cell)
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
AGRIemissions1997 <- (AGRIemissions1997_1_gC_grid_cell+
                        AGRIemissions1997_2_gC_grid_cell+
                        AGRIemissions1997_3_gC_grid_cell+
                        AGRIemissions1997_4_gC_grid_cell+
                        AGRIemissions1997_5_gC_grid_cell+
                        AGRIemissions1997_6_gC_grid_cell+
                        AGRIemissions1997_7_gC_grid_cell+
                        AGRIemissions1997_8_gC_grid_cell+
                        AGRIemissions1997_9_gC_grid_cell+
                        AGRIemissions1997_10_gC_grid_cell+
                        AGRIemissions1997_11_gC_grid_cell+
                        AGRIemissions1997_12_gC_grid_cell)
AGRIemissions1998 <- (AGRIemissions1998_1_gC_grid_cell+
                        AGRIemissions1998_2_gC_grid_cell+
                        AGRIemissions1998_3_gC_grid_cell+
                        AGRIemissions1998_4_gC_grid_cell+
                        AGRIemissions1998_5_gC_grid_cell+
                        AGRIemissions1998_6_gC_grid_cell+
                        AGRIemissions1998_7_gC_grid_cell+
                        AGRIemissions1998_8_gC_grid_cell+
                        AGRIemissions1998_9_gC_grid_cell+
                        AGRIemissions1998_10_gC_grid_cell+
                        AGRIemissions1998_11_gC_grid_cell+
                        AGRIemissions1998_12_gC_grid_cell)
AGRIemissions1999 <- (AGRIemissions1999_1_gC_grid_cell+
                        AGRIemissions1999_2_gC_grid_cell+
                        AGRIemissions1999_3_gC_grid_cell+
                        AGRIemissions1999_4_gC_grid_cell+
                        AGRIemissions1999_5_gC_grid_cell+
                        AGRIemissions1999_6_gC_grid_cell+
                        AGRIemissions1999_7_gC_grid_cell+
                        AGRIemissions1999_8_gC_grid_cell+
                        AGRIemissions1999_9_gC_grid_cell+
                        AGRIemissions1999_10_gC_grid_cell+
                        AGRIemissions1999_11_gC_grid_cell+
                        AGRIemissions1999_12_gC_grid_cell)
AGRIemissions2000 <- (AGRIemissions2000_1_gC_grid_cell+
                        AGRIemissions2000_2_gC_grid_cell+
                        AGRIemissions2000_3_gC_grid_cell+
                        AGRIemissions2000_4_gC_grid_cell+
                        AGRIemissions2000_5_gC_grid_cell+
                        AGRIemissions2000_6_gC_grid_cell+
                        AGRIemissions2000_7_gC_grid_cell+
                        AGRIemissions2000_8_gC_grid_cell+
                        AGRIemissions2000_9_gC_grid_cell+
                        AGRIemissions2000_10_gC_grid_cell+
                        AGRIemissions2000_11_gC_grid_cell+
                        AGRIemissions2000_12_gC_grid_cell)
AGRIemissions2001 <- (AGRIemissions2001_1_gC_grid_cell+
                        AGRIemissions2001_2_gC_grid_cell+
                        AGRIemissions2001_3_gC_grid_cell+
                        AGRIemissions2001_4_gC_grid_cell+
                        AGRIemissions2001_5_gC_grid_cell+
                        AGRIemissions2001_6_gC_grid_cell+
                        AGRIemissions2001_7_gC_grid_cell+
                        AGRIemissions2001_8_gC_grid_cell+
                        AGRIemissions2001_9_gC_grid_cell+
                        AGRIemissions2001_10_gC_grid_cell+
                        AGRIemissions2001_11_gC_grid_cell+
                        AGRIemissions2001_12_gC_grid_cell)
AGRIemissions2002 <- (AGRIemissions2002_1_gC_grid_cell+
                        AGRIemissions2002_2_gC_grid_cell+
                        AGRIemissions2002_3_gC_grid_cell+
                        AGRIemissions2002_4_gC_grid_cell+
                        AGRIemissions2002_5_gC_grid_cell+
                        AGRIemissions2002_6_gC_grid_cell+
                        AGRIemissions2002_7_gC_grid_cell+
                        AGRIemissions2002_8_gC_grid_cell+
                        AGRIemissions2002_9_gC_grid_cell+
                        AGRIemissions2002_10_gC_grid_cell+
                        AGRIemissions2002_11_gC_grid_cell+
                        AGRIemissions2002_12_gC_grid_cell)
AGRIemissions2003 <- (AGRIemissions2003_1_gC_grid_cell+
                        AGRIemissions2003_2_gC_grid_cell+
                        AGRIemissions2003_3_gC_grid_cell+
                        AGRIemissions2003_4_gC_grid_cell+
                        AGRIemissions2003_5_gC_grid_cell+
                        AGRIemissions2003_6_gC_grid_cell+
                        AGRIemissions2003_7_gC_grid_cell+
                        AGRIemissions2003_8_gC_grid_cell+
                        AGRIemissions2003_9_gC_grid_cell+
                        AGRIemissions2003_10_gC_grid_cell+
                        AGRIemissions2003_11_gC_grid_cell+
                        AGRIemissions2003_12_gC_grid_cell)
AGRIemissions2004 <- (AGRIemissions2004_1_gC_grid_cell+
                        AGRIemissions2004_2_gC_grid_cell+
                        AGRIemissions2004_3_gC_grid_cell+
                        AGRIemissions2004_4_gC_grid_cell+
                        AGRIemissions2004_5_gC_grid_cell+
                        AGRIemissions2004_6_gC_grid_cell+
                        AGRIemissions2004_7_gC_grid_cell+
                        AGRIemissions2004_8_gC_grid_cell+
                        AGRIemissions2004_9_gC_grid_cell+
                        AGRIemissions2004_10_gC_grid_cell+
                        AGRIemissions2004_11_gC_grid_cell+
                        AGRIemissions2004_12_gC_grid_cell)
AGRIemissions2005 <- (AGRIemissions2005_1_gC_grid_cell+
                        AGRIemissions2005_2_gC_grid_cell+
                        AGRIemissions2005_3_gC_grid_cell+
                        AGRIemissions2005_4_gC_grid_cell+
                        AGRIemissions2005_5_gC_grid_cell+
                        AGRIemissions2005_6_gC_grid_cell+
                        AGRIemissions2005_7_gC_grid_cell+
                        AGRIemissions2005_8_gC_grid_cell+
                        AGRIemissions2005_9_gC_grid_cell+
                        AGRIemissions2005_10_gC_grid_cell+
                        AGRIemissions2005_11_gC_grid_cell+
                        AGRIemissions2005_12_gC_grid_cell)
AGRIemissions2006 <- (AGRIemissions2006_1_gC_grid_cell+
                        AGRIemissions2006_2_gC_grid_cell+
                        AGRIemissions2006_3_gC_grid_cell+
                        AGRIemissions2006_4_gC_grid_cell+
                        AGRIemissions2006_5_gC_grid_cell+
                        AGRIemissions2006_6_gC_grid_cell+
                        AGRIemissions2006_7_gC_grid_cell+
                        AGRIemissions2006_8_gC_grid_cell+
                        AGRIemissions2006_9_gC_grid_cell+
                        AGRIemissions2006_10_gC_grid_cell+
                        AGRIemissions2006_11_gC_grid_cell+
                        AGRIemissions2006_12_gC_grid_cell)
AGRIemissions2007 <- (AGRIemissions2007_1_gC_grid_cell+
                        AGRIemissions2007_2_gC_grid_cell+
                        AGRIemissions2007_3_gC_grid_cell+
                        AGRIemissions2007_4_gC_grid_cell+
                        AGRIemissions2007_5_gC_grid_cell+
                        AGRIemissions2007_6_gC_grid_cell+
                        AGRIemissions2007_7_gC_grid_cell+
                        AGRIemissions2007_8_gC_grid_cell+
                        AGRIemissions2007_9_gC_grid_cell+
                        AGRIemissions2007_10_gC_grid_cell+
                        AGRIemissions2007_11_gC_grid_cell+
                        AGRIemissions2007_12_gC_grid_cell)
AGRIemissions2008 <- (AGRIemissions2008_1_gC_grid_cell+
                        AGRIemissions2008_2_gC_grid_cell+
                        AGRIemissions2008_3_gC_grid_cell+
                        AGRIemissions2008_4_gC_grid_cell+
                        AGRIemissions2008_5_gC_grid_cell+
                        AGRIemissions2008_6_gC_grid_cell+
                        AGRIemissions2008_7_gC_grid_cell+
                        AGRIemissions2008_8_gC_grid_cell+
                        AGRIemissions2008_9_gC_grid_cell+
                        AGRIemissions2008_10_gC_grid_cell+
                        AGRIemissions2008_11_gC_grid_cell+
                        AGRIemissions2008_12_gC_grid_cell)
AGRIemissions2009 <- (AGRIemissions2009_1_gC_grid_cell+
                        AGRIemissions2009_2_gC_grid_cell+
                        AGRIemissions2009_3_gC_grid_cell+
                        AGRIemissions2009_4_gC_grid_cell+
                        AGRIemissions2009_5_gC_grid_cell+
                        AGRIemissions2009_6_gC_grid_cell+
                        AGRIemissions2009_7_gC_grid_cell+
                        AGRIemissions2009_8_gC_grid_cell+
                        AGRIemissions2009_9_gC_grid_cell+
                        AGRIemissions2009_10_gC_grid_cell+
                        AGRIemissions2009_11_gC_grid_cell+
                        AGRIemissions2009_12_gC_grid_cell)
AGRIemissions2010 <- (AGRIemissions2010_1_gC_grid_cell+
                        AGRIemissions2010_2_gC_grid_cell+
                        AGRIemissions2010_3_gC_grid_cell+
                        AGRIemissions2010_4_gC_grid_cell+
                        AGRIemissions2010_5_gC_grid_cell+
                        AGRIemissions2010_6_gC_grid_cell+
                        AGRIemissions2010_7_gC_grid_cell+
                        AGRIemissions2010_8_gC_grid_cell+
                        AGRIemissions2010_9_gC_grid_cell+
                        AGRIemissions2010_10_gC_grid_cell+
                        AGRIemissions2010_11_gC_grid_cell+
                        AGRIemissions2010_12_gC_grid_cell)
AGRIemissions2011 <- (AGRIemissions2011_1_gC_grid_cell+
                        AGRIemissions2011_2_gC_grid_cell+
                        AGRIemissions2011_3_gC_grid_cell+
                        AGRIemissions2011_4_gC_grid_cell+
                        AGRIemissions2011_5_gC_grid_cell+
                        AGRIemissions2011_6_gC_grid_cell+
                        AGRIemissions2011_7_gC_grid_cell+
                        AGRIemissions2011_8_gC_grid_cell+
                        AGRIemissions2011_9_gC_grid_cell+
                        AGRIemissions2011_10_gC_grid_cell+
                        AGRIemissions2011_11_gC_grid_cell+
                        AGRIemissions2011_12_gC_grid_cell)
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
DEFOemissions1997 <- (DEFOemissions1997_1_gC_grid_cell+
                        DEFOemissions1997_2_gC_grid_cell+
                        DEFOemissions1997_3_gC_grid_cell+
                        DEFOemissions1997_4_gC_grid_cell+
                        DEFOemissions1997_5_gC_grid_cell+
                        DEFOemissions1997_6_gC_grid_cell+
                        DEFOemissions1997_7_gC_grid_cell+
                        DEFOemissions1997_8_gC_grid_cell+
                        DEFOemissions1997_9_gC_grid_cell+
                        DEFOemissions1997_10_gC_grid_cell+
                        DEFOemissions1997_11_gC_grid_cell+
                        DEFOemissions1997_12_gC_grid_cell)
DEFOemissions1998 <- (DEFOemissions1998_1_gC_grid_cell+
                        DEFOemissions1998_2_gC_grid_cell+
                        DEFOemissions1998_3_gC_grid_cell+
                        DEFOemissions1998_4_gC_grid_cell+
                        DEFOemissions1998_5_gC_grid_cell+
                        DEFOemissions1998_6_gC_grid_cell+
                        DEFOemissions1998_7_gC_grid_cell+
                        DEFOemissions1998_8_gC_grid_cell+
                        DEFOemissions1998_9_gC_grid_cell+
                        DEFOemissions1998_10_gC_grid_cell+
                        DEFOemissions1998_11_gC_grid_cell+
                        DEFOemissions1998_12_gC_grid_cell)
DEFOemissions1999 <- (DEFOemissions1999_1_gC_grid_cell+
                        DEFOemissions1999_2_gC_grid_cell+
                        DEFOemissions1999_3_gC_grid_cell+
                        DEFOemissions1999_4_gC_grid_cell+
                        DEFOemissions1999_5_gC_grid_cell+
                        DEFOemissions1999_6_gC_grid_cell+
                        DEFOemissions1999_7_gC_grid_cell+
                        DEFOemissions1999_8_gC_grid_cell+
                        DEFOemissions1999_9_gC_grid_cell+
                        DEFOemissions1999_10_gC_grid_cell+
                        DEFOemissions1999_11_gC_grid_cell+
                        DEFOemissions1999_12_gC_grid_cell)
DEFOemissions2000 <- (DEFOemissions2000_1_gC_grid_cell+
                        DEFOemissions2000_2_gC_grid_cell+
                        DEFOemissions2000_3_gC_grid_cell+
                        DEFOemissions2000_4_gC_grid_cell+
                        DEFOemissions2000_5_gC_grid_cell+
                        DEFOemissions2000_6_gC_grid_cell+
                        DEFOemissions2000_7_gC_grid_cell+
                        DEFOemissions2000_8_gC_grid_cell+
                        DEFOemissions2000_9_gC_grid_cell+
                        DEFOemissions2000_10_gC_grid_cell+
                        DEFOemissions2000_11_gC_grid_cell+
                        DEFOemissions2000_12_gC_grid_cell)
DEFOemissions2001 <- (DEFOemissions2001_1_gC_grid_cell+
                        DEFOemissions2001_2_gC_grid_cell+
                        DEFOemissions2001_3_gC_grid_cell+
                        DEFOemissions2001_4_gC_grid_cell+
                        DEFOemissions2001_5_gC_grid_cell+
                        DEFOemissions2001_6_gC_grid_cell+
                        DEFOemissions2001_7_gC_grid_cell+
                        DEFOemissions2001_8_gC_grid_cell+
                        DEFOemissions2001_9_gC_grid_cell+
                        DEFOemissions2001_10_gC_grid_cell+
                        DEFOemissions2001_11_gC_grid_cell+
                        DEFOemissions2001_12_gC_grid_cell)
DEFOemissions2002 <- (DEFOemissions2002_1_gC_grid_cell+
                        DEFOemissions2002_2_gC_grid_cell+
                        DEFOemissions2002_3_gC_grid_cell+
                        DEFOemissions2002_4_gC_grid_cell+
                        DEFOemissions2002_5_gC_grid_cell+
                        DEFOemissions2002_6_gC_grid_cell+
                        DEFOemissions2002_7_gC_grid_cell+
                        DEFOemissions2002_8_gC_grid_cell+
                        DEFOemissions2002_9_gC_grid_cell+
                        DEFOemissions2002_10_gC_grid_cell+
                        DEFOemissions2002_11_gC_grid_cell+
                        DEFOemissions2002_12_gC_grid_cell)
DEFOemissions2003 <- (DEFOemissions2003_1_gC_grid_cell+
                        DEFOemissions2003_2_gC_grid_cell+
                        DEFOemissions2003_3_gC_grid_cell+
                        DEFOemissions2003_4_gC_grid_cell+
                        DEFOemissions2003_5_gC_grid_cell+
                        DEFOemissions2003_6_gC_grid_cell+
                        DEFOemissions2003_7_gC_grid_cell+
                        DEFOemissions2003_8_gC_grid_cell+
                        DEFOemissions2003_9_gC_grid_cell+
                        DEFOemissions2003_10_gC_grid_cell+
                        DEFOemissions2003_11_gC_grid_cell+
                        DEFOemissions2003_12_gC_grid_cell)
DEFOemissions2004 <- (DEFOemissions2004_1_gC_grid_cell+
                        DEFOemissions2004_2_gC_grid_cell+
                        DEFOemissions2004_3_gC_grid_cell+
                        DEFOemissions2004_4_gC_grid_cell+
                        DEFOemissions2004_5_gC_grid_cell+
                        DEFOemissions2004_6_gC_grid_cell+
                        DEFOemissions2004_7_gC_grid_cell+
                        DEFOemissions2004_8_gC_grid_cell+
                        DEFOemissions2004_9_gC_grid_cell+
                        DEFOemissions2004_10_gC_grid_cell+
                        DEFOemissions2004_11_gC_grid_cell+
                        DEFOemissions2004_12_gC_grid_cell)
DEFOemissions2005 <- (DEFOemissions2005_1_gC_grid_cell+
                        DEFOemissions2005_2_gC_grid_cell+
                        DEFOemissions2005_3_gC_grid_cell+
                        DEFOemissions2005_4_gC_grid_cell+
                        DEFOemissions2005_5_gC_grid_cell+
                        DEFOemissions2005_6_gC_grid_cell+
                        DEFOemissions2005_7_gC_grid_cell+
                        DEFOemissions2005_8_gC_grid_cell+
                        DEFOemissions2005_9_gC_grid_cell+
                        DEFOemissions2005_10_gC_grid_cell+
                        DEFOemissions2005_11_gC_grid_cell+
                        DEFOemissions2005_12_gC_grid_cell)
DEFOemissions2006 <- (DEFOemissions2006_1_gC_grid_cell+
                        DEFOemissions2006_2_gC_grid_cell+
                        DEFOemissions2006_3_gC_grid_cell+
                        DEFOemissions2006_4_gC_grid_cell+
                        DEFOemissions2006_5_gC_grid_cell+
                        DEFOemissions2006_6_gC_grid_cell+
                        DEFOemissions2006_7_gC_grid_cell+
                        DEFOemissions2006_8_gC_grid_cell+
                        DEFOemissions2006_9_gC_grid_cell+
                        DEFOemissions2006_10_gC_grid_cell+
                        DEFOemissions2006_11_gC_grid_cell+
                        DEFOemissions2006_12_gC_grid_cell)
DEFOemissions2007 <- (DEFOemissions2007_1_gC_grid_cell+
                        DEFOemissions2007_2_gC_grid_cell+
                        DEFOemissions2007_3_gC_grid_cell+
                        DEFOemissions2007_4_gC_grid_cell+
                        DEFOemissions2007_5_gC_grid_cell+
                        DEFOemissions2007_6_gC_grid_cell+
                        DEFOemissions2007_7_gC_grid_cell+
                        DEFOemissions2007_8_gC_grid_cell+
                        DEFOemissions2007_9_gC_grid_cell+
                        DEFOemissions2007_10_gC_grid_cell+
                        DEFOemissions2007_11_gC_grid_cell+
                        DEFOemissions2007_12_gC_grid_cell)
DEFOemissions2008 <- (DEFOemissions2008_1_gC_grid_cell+
                        DEFOemissions2008_2_gC_grid_cell+
                        DEFOemissions2008_3_gC_grid_cell+
                        DEFOemissions2008_4_gC_grid_cell+
                        DEFOemissions2008_5_gC_grid_cell+
                        DEFOemissions2008_6_gC_grid_cell+
                        DEFOemissions2008_7_gC_grid_cell+
                        DEFOemissions2008_8_gC_grid_cell+
                        DEFOemissions2008_9_gC_grid_cell+
                        DEFOemissions2008_10_gC_grid_cell+
                        DEFOemissions2008_11_gC_grid_cell+
                        DEFOemissions2008_12_gC_grid_cell)
DEFOemissions2009 <- (DEFOemissions2009_1_gC_grid_cell+
                        DEFOemissions2009_2_gC_grid_cell+
                        DEFOemissions2009_3_gC_grid_cell+
                        DEFOemissions2009_4_gC_grid_cell+
                        DEFOemissions2009_5_gC_grid_cell+
                        DEFOemissions2009_6_gC_grid_cell+
                        DEFOemissions2009_7_gC_grid_cell+
                        DEFOemissions2009_8_gC_grid_cell+
                        DEFOemissions2009_9_gC_grid_cell+
                        DEFOemissions2009_10_gC_grid_cell+
                        DEFOemissions2009_11_gC_grid_cell+
                        DEFOemissions2009_12_gC_grid_cell)
DEFOemissions2010 <- (DEFOemissions2010_1_gC_grid_cell+
                        DEFOemissions2010_2_gC_grid_cell+
                        DEFOemissions2010_3_gC_grid_cell+
                        DEFOemissions2010_4_gC_grid_cell+
                        DEFOemissions2010_5_gC_grid_cell+
                        DEFOemissions2010_6_gC_grid_cell+
                        DEFOemissions2010_7_gC_grid_cell+
                        DEFOemissions2010_8_gC_grid_cell+
                        DEFOemissions2010_9_gC_grid_cell+
                        DEFOemissions2010_10_gC_grid_cell+
                        DEFOemissions2010_11_gC_grid_cell+
                        DEFOemissions2010_12_gC_grid_cell)
DEFOemissions2011 <- (DEFOemissions2011_1_gC_grid_cell+
                        DEFOemissions2011_2_gC_grid_cell+
                        DEFOemissions2011_3_gC_grid_cell+
                        DEFOemissions2011_4_gC_grid_cell+
                        DEFOemissions2011_5_gC_grid_cell+
                        DEFOemissions2011_6_gC_grid_cell+
                        DEFOemissions2011_7_gC_grid_cell+
                        DEFOemissions2011_8_gC_grid_cell+
                        DEFOemissions2011_9_gC_grid_cell+
                        DEFOemissions2011_10_gC_grid_cell+
                        DEFOemissions2011_11_gC_grid_cell+
                        DEFOemissions2011_12_gC_grid_cell)
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
PEATemissions1997_2016 <- raster::stack(PEATemissions1997,
                                        PEATemissions1998,
                                        PEATemissions1999,
                                        PEATemissions2000,
                                        PEATemissions2001,
                                        PEATemissions2002,
                                        PEATemissions2003,
                                        PEATemissions2004,
                                        PEATemissions2005,
                                        PEATemissions2006,
                                        PEATemissions2007,
                                        PEATemissions2008,
                                        PEATemissions2009,
                                        PEATemissions2010,
                                        PEATemissions2011,
                                        PEATemissions2012,
                                        PEATemissions2013,
                                        PEATemissions2014,
                                        PEATemissions2015,
                                        PEATemissions2016)
BORFemissions1997_2016 <- raster::stack(BORFemissions1997,
                                        BORFemissions1998,
                                        BORFemissions1999,
                                        BORFemissions2000,
                                        BORFemissions2001,
                                        BORFemissions2002,
                                        BORFemissions2003,
                                        BORFemissions2004,
                                        BORFemissions2005,
                                        BORFemissions2006,
                                        BORFemissions2007,
                                        BORFemissions2008,
                                        BORFemissions2009,
                                        BORFemissions2010,
                                        BORFemissions2011,
                                        BORFemissions2012,
                                        BORFemissions2013,
                                        BORFemissions2014,
                                        BORFemissions2015,
                                        BORFemissions2016)
TEMFemissions1997_2016 <- raster::stack(TEMFemissions1997,
                                        TEMFemissions1998,
                                        TEMFemissions1999,
                                        TEMFemissions2000,
                                        TEMFemissions2001,
                                        TEMFemissions2002,
                                        TEMFemissions2003,
                                        TEMFemissions2004,
                                        TEMFemissions2005,
                                        TEMFemissions2006,
                                        TEMFemissions2007,
                                        TEMFemissions2008,
                                        TEMFemissions2009,
                                        TEMFemissions2010,
                                        TEMFemissions2011,
                                        TEMFemissions2012,
                                        TEMFemissions2013,
                                        TEMFemissions2014,
                                        TEMFemissions2015,
                                        TEMFemissions2016)
SAVAemissions1997_2016 <- raster::stack(SAVAemissions1997,
                                        SAVAemissions1998,
                                        SAVAemissions1999,
                                        SAVAemissions2000,
                                        SAVAemissions2001,
                                        SAVAemissions2002,
                                        SAVAemissions2003,
                                        SAVAemissions2004,
                                        SAVAemissions2005,
                                        SAVAemissions2006,
                                        SAVAemissions2007,
                                        SAVAemissions2008,
                                        SAVAemissions2009,
                                        SAVAemissions2010,
                                        SAVAemissions2011,
                                        SAVAemissions2012,
                                        SAVAemissions2013,
                                        SAVAemissions2014,
                                        SAVAemissions2015,
                                        SAVAemissions2016)
AGRIemissions1997_2016 <- raster::stack(AGRIemissions1997,
                                        AGRIemissions1998,
                                        AGRIemissions1999,
                                        AGRIemissions2000,
                                        AGRIemissions2001,
                                        AGRIemissions2002,
                                        AGRIemissions2003,
                                        AGRIemissions2004,
                                        AGRIemissions2005,
                                        AGRIemissions2006,
                                        AGRIemissions2007,
                                        AGRIemissions2008,
                                        AGRIemissions2009,
                                        AGRIemissions2010,
                                        AGRIemissions2011,
                                        AGRIemissions2012,
                                        AGRIemissions2013,
                                        AGRIemissions2014,
                                        AGRIemissions2015,
                                        AGRIemissions2016)
DEFOemissions1997_2016 <- raster::stack(DEFOemissions1997,
                                        DEFOemissions1998,
                                        DEFOemissions1999,
                                        DEFOemissions2000,
                                        DEFOemissions2001,
                                        DEFOemissions2002,
                                        DEFOemissions2003,
                                        DEFOemissions2004,
                                        DEFOemissions2005,
                                        DEFOemissions2006,
                                        DEFOemissions2007,
                                        DEFOemissions2008,
                                        DEFOemissions2009,
                                        DEFOemissions2010,
                                        DEFOemissions2011,
                                        DEFOemissions2012,
                                        DEFOemissions2013,
                                        DEFOemissions2014,
                                        DEFOemissions2015,
                                        DEFOemissions2016)



#Get means
PEATemissions <- calc(PEATemissions1997_2016, fun = mean, na.rm = T)
BORFemissions <- calc(BORFemissions1997_2016, fun = mean, na.rm = T)
TEMFemissions <- calc(TEMFemissions1997_2016, fun = mean, na.rm = T)
SAVAemissions <- calc(SAVAemissions1997_2016, fun = mean, na.rm = T)
AGRIemissions <- calc(AGRIemissions1997_2016, fun = mean, na.rm = T)
DEFOemissions <- calc(DEFOemissions1997_2016, fun = mean, na.rm = T)

#Caclulate the mean total annual C emissions for the period 2012-2016
PEATsum <- conv_unit(cellStats(PEATemissions, sum), from = "g", to = "Pg")  #Get sum and convert to PgC
PEATsum
BORFsum <- conv_unit(cellStats(BORFemissions, sum), from = "g", to = "Pg")  #Get sum and convert to PgC
BORFsum
TEMFsum <- conv_unit(cellStats(TEMFemissions, sum), from = "g", to = "Pg")  #Get sum and convert to PgC
TEMFsum
SAVAsum <- conv_unit(cellStats(SAVAemissions, sum), from = "g", to = "Pg")  #Get sum and convert to PgC
SAVAsum
AGRIsum <- conv_unit(cellStats(AGRIemissions, sum), from = "g", to = "Pg")  #Get sum and convert to PgC
AGRIsum
DEFOsum <- conv_unit(cellStats(DEFOemissions, sum), from = "g", to = "Pg")  #Get sum and convert to TPgC
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
                            "Emissions_PgC" = c(BORFsum,
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
})

#Create quick df to autoplace percents over columns
placement <- GFEDemissions %>% #We want to create a dataframe to assign the position of the C emissions
  group_by(Biome) %>%
  mutate(PlacementValue = Emissions_PgC + 0.1)

GFEDemissions <- left_join(GFEDemissions, placement) %>% mutate(Emissions_percent = round(Emissions_percent, 0))



#Calculate change in mean emissions over time
#PEAT
sumPEATemissions1997 <- conv_unit(cellStats(PEATemissions1997_2016[[1]], stat = sum), from = "g", to = "Pg")
sumPEATemissions1998 <- conv_unit(cellStats(PEATemissions1997_2016[[2]], stat = sum), from = "g", to = "Pg")
sumPEATemissions1999 <- conv_unit(cellStats(PEATemissions1997_2016[[3]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2000 <- conv_unit(cellStats(PEATemissions1997_2016[[4]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2001 <- conv_unit(cellStats(PEATemissions1997_2016[[5]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2002 <- conv_unit(cellStats(PEATemissions1997_2016[[6]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2003 <- conv_unit(cellStats(PEATemissions1997_2016[[7]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2004 <- conv_unit(cellStats(PEATemissions1997_2016[[8]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2005 <- conv_unit(cellStats(PEATemissions1997_2016[[9]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2006 <- conv_unit(cellStats(PEATemissions1997_2016[[10]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2007 <- conv_unit(cellStats(PEATemissions1997_2016[[11]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2008 <- conv_unit(cellStats(PEATemissions1997_2016[[12]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2009 <- conv_unit(cellStats(PEATemissions1997_2016[[13]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2010 <- conv_unit(cellStats(PEATemissions1997_2016[[14]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2011 <- conv_unit(cellStats(PEATemissions1997_2016[[15]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2012 <- conv_unit(cellStats(PEATemissions1997_2016[[16]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2013 <- conv_unit(cellStats(PEATemissions1997_2016[[17]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2014 <- conv_unit(cellStats(PEATemissions1997_2016[[18]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2015 <- conv_unit(cellStats(PEATemissions1997_2016[[19]], stat = sum), from = "g", to = "Pg")
sumPEATemissions2016 <- conv_unit(cellStats(PEATemissions1997_2016[[20]], stat = sum), from = "g", to = "Pg")
#DEFO, from = "g", to = "Pg")
sumDEFOemissions1997 <- conv_unit(cellStats(DEFOemissions1997_2016[[1]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions1998 <- conv_unit(cellStats(DEFOemissions1997_2016[[2]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions1999 <- conv_unit(cellStats(DEFOemissions1997_2016[[3]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2000 <- conv_unit(cellStats(DEFOemissions1997_2016[[4]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2001 <- conv_unit(cellStats(DEFOemissions1997_2016[[5]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2002 <- conv_unit(cellStats(DEFOemissions1997_2016[[6]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2003 <- conv_unit(cellStats(DEFOemissions1997_2016[[7]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2004 <- conv_unit(cellStats(DEFOemissions1997_2016[[8]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2005 <- conv_unit(cellStats(DEFOemissions1997_2016[[9]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2006 <- conv_unit(cellStats(DEFOemissions1997_2016[[10]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2007 <- conv_unit(cellStats(DEFOemissions1997_2016[[11]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2008 <- conv_unit(cellStats(DEFOemissions1997_2016[[12]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2009 <- conv_unit(cellStats(DEFOemissions1997_2016[[13]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2010 <- conv_unit(cellStats(DEFOemissions1997_2016[[14]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2011 <- conv_unit(cellStats(DEFOemissions1997_2016[[15]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2012 <- conv_unit(cellStats(DEFOemissions1997_2016[[16]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2013 <- conv_unit(cellStats(DEFOemissions1997_2016[[17]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2014 <- conv_unit(cellStats(DEFOemissions1997_2016[[18]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2015 <- conv_unit(cellStats(DEFOemissions1997_2016[[19]], stat = sum), from = "g", to = "Pg")
sumDEFOemissions2016 <- conv_unit(cellStats(DEFOemissions1997_2016[[20]], stat = sum), from = "g", to = "Pg")
#AGRI
sumAGRIemissions1997 <- conv_unit(cellStats(AGRIemissions1997_2016[[1]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions1998 <- conv_unit(cellStats(AGRIemissions1997_2016[[2]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions1999 <- conv_unit(cellStats(AGRIemissions1997_2016[[3]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2000 <- conv_unit(cellStats(AGRIemissions1997_2016[[4]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2001 <- conv_unit(cellStats(AGRIemissions1997_2016[[5]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2002 <- conv_unit(cellStats(AGRIemissions1997_2016[[6]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2003 <- conv_unit(cellStats(AGRIemissions1997_2016[[7]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2004 <- conv_unit(cellStats(AGRIemissions1997_2016[[8]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2005 <- conv_unit(cellStats(AGRIemissions1997_2016[[9]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2006 <- conv_unit(cellStats(AGRIemissions1997_2016[[10]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2007 <- conv_unit(cellStats(AGRIemissions1997_2016[[11]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2008 <- conv_unit(cellStats(AGRIemissions1997_2016[[12]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2009 <- conv_unit(cellStats(AGRIemissions1997_2016[[13]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2010 <- conv_unit(cellStats(AGRIemissions1997_2016[[14]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2011 <- conv_unit(cellStats(AGRIemissions1997_2016[[15]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2012 <- conv_unit(cellStats(AGRIemissions1997_2016[[16]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2013 <- conv_unit(cellStats(AGRIemissions1997_2016[[17]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2014 <- conv_unit(cellStats(AGRIemissions1997_2016[[18]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2015 <- conv_unit(cellStats(AGRIemissions1997_2016[[19]], stat = sum), from = "g", to = "Pg")
sumAGRIemissions2016 <- conv_unit(cellStats(AGRIemissions1997_2016[[20]], stat = sum), from = "g", to = "Pg")
#BORF
sumBORFemissions1997 <- conv_unit(cellStats(BORFemissions1997_2016[[1]], stat = sum), from = "g", to = "Pg")
sumBORFemissions1998 <- conv_unit(cellStats(BORFemissions1997_2016[[2]], stat = sum), from = "g", to = "Pg")
sumBORFemissions1999 <- conv_unit(cellStats(BORFemissions1997_2016[[3]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2000 <- conv_unit(cellStats(BORFemissions1997_2016[[4]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2001 <- conv_unit(cellStats(BORFemissions1997_2016[[5]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2002 <- conv_unit(cellStats(BORFemissions1997_2016[[6]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2003 <- conv_unit(cellStats(BORFemissions1997_2016[[7]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2004 <- conv_unit(cellStats(BORFemissions1997_2016[[8]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2005 <- conv_unit(cellStats(BORFemissions1997_2016[[9]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2006 <- conv_unit(cellStats(BORFemissions1997_2016[[10]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2007 <- conv_unit(cellStats(BORFemissions1997_2016[[11]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2008 <- conv_unit(cellStats(BORFemissions1997_2016[[12]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2009 <- conv_unit(cellStats(BORFemissions1997_2016[[13]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2010 <- conv_unit(cellStats(BORFemissions1997_2016[[14]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2011 <- conv_unit(cellStats(BORFemissions1997_2016[[15]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2012 <- conv_unit(cellStats(BORFemissions1997_2016[[16]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2013 <- conv_unit(cellStats(BORFemissions1997_2016[[17]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2014 <- conv_unit(cellStats(BORFemissions1997_2016[[18]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2015 <- conv_unit(cellStats(BORFemissions1997_2016[[19]], stat = sum), from = "g", to = "Pg")
sumBORFemissions2016 <- conv_unit(cellStats(BORFemissions1997_2016[[20]], stat = sum), from = "g", to = "Pg")
#TEMF
sumTEMFemissions1997 <- conv_unit(cellStats(TEMFemissions1997_2016[[1]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions1998 <- conv_unit(cellStats(TEMFemissions1997_2016[[2]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions1999 <- conv_unit(cellStats(TEMFemissions1997_2016[[3]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2000 <- conv_unit(cellStats(TEMFemissions1997_2016[[4]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2001 <- conv_unit(cellStats(TEMFemissions1997_2016[[5]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2002 <- conv_unit(cellStats(TEMFemissions1997_2016[[6]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2003 <- conv_unit(cellStats(TEMFemissions1997_2016[[7]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2004 <- conv_unit(cellStats(TEMFemissions1997_2016[[8]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2005 <- conv_unit(cellStats(TEMFemissions1997_2016[[9]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2006 <- conv_unit(cellStats(TEMFemissions1997_2016[[10]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2007 <- conv_unit(cellStats(TEMFemissions1997_2016[[11]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2008 <- conv_unit(cellStats(TEMFemissions1997_2016[[12]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2009 <- conv_unit(cellStats(TEMFemissions1997_2016[[13]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2010 <- conv_unit(cellStats(TEMFemissions1997_2016[[14]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2011 <- conv_unit(cellStats(TEMFemissions1997_2016[[15]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2012 <- conv_unit(cellStats(TEMFemissions1997_2016[[16]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2013 <- conv_unit(cellStats(TEMFemissions1997_2016[[17]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2014 <- conv_unit(cellStats(TEMFemissions1997_2016[[18]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2015 <- conv_unit(cellStats(TEMFemissions1997_2016[[19]], stat = sum), from = "g", to = "Pg")
sumTEMFemissions2016 <- conv_unit(cellStats(TEMFemissions1997_2016[[20]], stat = sum), from = "g", to = "Pg")
#SAVA
sumSAVAemissions1997 <- conv_unit(cellStats(SAVAemissions1997_2016[[1]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions1998 <- conv_unit(cellStats(SAVAemissions1997_2016[[2]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions1999 <- conv_unit(cellStats(SAVAemissions1997_2016[[3]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2000 <- conv_unit(cellStats(SAVAemissions1997_2016[[4]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2001 <- conv_unit(cellStats(SAVAemissions1997_2016[[5]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2002 <- conv_unit(cellStats(SAVAemissions1997_2016[[6]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2003 <- conv_unit(cellStats(SAVAemissions1997_2016[[7]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2004 <- conv_unit(cellStats(SAVAemissions1997_2016[[8]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2005 <- conv_unit(cellStats(SAVAemissions1997_2016[[9]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2006 <- conv_unit(cellStats(SAVAemissions1997_2016[[10]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2007 <- conv_unit(cellStats(SAVAemissions1997_2016[[11]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2008 <- conv_unit(cellStats(SAVAemissions1997_2016[[12]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2009 <- conv_unit(cellStats(SAVAemissions1997_2016[[13]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2010 <- conv_unit(cellStats(SAVAemissions1997_2016[[14]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2011 <- conv_unit(cellStats(SAVAemissions1997_2016[[15]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2012 <- conv_unit(cellStats(SAVAemissions1997_2016[[16]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2013 <- conv_unit(cellStats(SAVAemissions1997_2016[[17]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2014 <- conv_unit(cellStats(SAVAemissions1997_2016[[18]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2015 <- conv_unit(cellStats(SAVAemissions1997_2016[[19]], stat = sum), from = "g", to = "Pg")
sumSAVAemissions2016 <- conv_unit(cellStats(SAVAemissions1997_2016[[20]], stat = sum), from = "g", to = "Pg")

GFEDemissionsTime <- data.frame("Year" = rep(1998:2016, 6),
                                "Biome" = c(rep("SAVA", 19),
                                            rep("BORF", 19),
                                            rep("PEAT", 19),
                                            rep("TEMF", 19),
                                            rep("DEFO", 19),
                                            rep("AGRI", 19)),
                                "Emissions_PgC" = c(sumSAVAemissions1998,
                                                    sumSAVAemissions1999,
                                                    sumSAVAemissions2000,
                                                    sumSAVAemissions2001,
                                                    sumSAVAemissions2002,
                                                    sumSAVAemissions2003,
                                                    sumSAVAemissions2004,
                                                    sumSAVAemissions2005,
                                                    sumSAVAemissions2006,
                                                    sumSAVAemissions2007,
                                                    sumSAVAemissions2008,
                                                    sumSAVAemissions2009,
                                                    sumSAVAemissions2010,
                                                    sumSAVAemissions2011,
                                                    sumSAVAemissions2012,
                                                    sumSAVAemissions2013,
                                                    sumSAVAemissions2014,
                                                    sumSAVAemissions2015,
                                                    sumSAVAemissions2016,
                                                    sumBORFemissions1998,
                                                    sumBORFemissions1999,
                                                    sumBORFemissions2000,
                                                    sumBORFemissions2001,
                                                    sumBORFemissions2002,
                                                    sumBORFemissions2003,
                                                    sumBORFemissions2004,
                                                    sumBORFemissions2005,
                                                    sumBORFemissions2006,
                                                    sumBORFemissions2007,
                                                    sumBORFemissions2008,
                                                    sumBORFemissions2009,
                                                    sumBORFemissions2010,
                                                    sumBORFemissions2011,
                                                    sumBORFemissions2012,
                                                    sumBORFemissions2013,
                                                    sumBORFemissions2014,
                                                    sumBORFemissions2015,
                                                    sumBORFemissions2016,
                                                    sumPEATemissions1998,
                                                    sumPEATemissions1999,
                                                    sumPEATemissions2000,
                                                    sumPEATemissions2001,
                                                    sumPEATemissions2002,
                                                    sumPEATemissions2003,
                                                    sumPEATemissions2004,
                                                    sumPEATemissions2005,
                                                    sumPEATemissions2006,
                                                    sumPEATemissions2007,
                                                    sumPEATemissions2008,
                                                    sumPEATemissions2009,
                                                    sumPEATemissions2010,
                                                    sumPEATemissions2011,
                                                    sumPEATemissions2012,
                                                    sumPEATemissions2013,
                                                    sumPEATemissions2014,
                                                    sumPEATemissions2015,
                                                    sumPEATemissions2016,
                                                    sumTEMFemissions1998,
                                                    sumTEMFemissions1999,
                                                    sumTEMFemissions2000,
                                                    sumTEMFemissions2001,
                                                    sumTEMFemissions2002,
                                                    sumTEMFemissions2003,
                                                    sumTEMFemissions2004,
                                                    sumTEMFemissions2005,
                                                    sumTEMFemissions2006,
                                                    sumTEMFemissions2007,
                                                    sumTEMFemissions2008,
                                                    sumTEMFemissions2009,
                                                    sumTEMFemissions2010,
                                                    sumTEMFemissions2011,
                                                    sumTEMFemissions2012,
                                                    sumTEMFemissions2013,
                                                    sumTEMFemissions2014,
                                                    sumTEMFemissions2015,
                                                    sumTEMFemissions2016,
                                                    sumDEFOemissions1998,
                                                    sumDEFOemissions1999,
                                                    sumDEFOemissions2000,
                                                    sumDEFOemissions2001,
                                                    sumDEFOemissions2002,
                                                    sumDEFOemissions2003,
                                                    sumDEFOemissions2004,
                                                    sumDEFOemissions2005,
                                                    sumDEFOemissions2006,
                                                    sumDEFOemissions2007,
                                                    sumDEFOemissions2008,
                                                    sumDEFOemissions2009,
                                                    sumDEFOemissions2010,
                                                    sumDEFOemissions2011,
                                                    sumDEFOemissions2012,
                                                    sumDEFOemissions2013,
                                                    sumDEFOemissions2014,
                                                    sumDEFOemissions2015,
                                                    sumDEFOemissions2016,
                                                    sumAGRIemissions1998,
                                                    sumAGRIemissions1999,
                                                    sumAGRIemissions2000,
                                                    sumAGRIemissions2001,
                                                    sumAGRIemissions2002,
                                                    sumAGRIemissions2003,
                                                    sumAGRIemissions2004,
                                                    sumAGRIemissions2005,
                                                    sumAGRIemissions2006,
                                                    sumAGRIemissions2007,
                                                    sumAGRIemissions2008,
                                                    sumAGRIemissions2009,
                                                    sumAGRIemissions2010,
                                                    sumAGRIemissions2011,
                                                    sumAGRIemissions2012,
                                                    sumAGRIemissions2013,
                                                    sumAGRIemissions2014,
                                                    sumAGRIemissions2015,
                                                    sumAGRIemissions2016)
                                )


GFEDerr <- GFEDemissionsTime %>%
  group_by(Biome) %>%
  summarise(SD = sd(Emissions_PgC),
            SE = SD/sqrt(length(Emissions_PgC)))

GFEDemissions <- left_join(GFEDemissions, GFEDerr)


GFEDemissions %>%   filter(Biome != "AGRI", Biome != "DEFO") %>%
summarise(total = sum(Emissions_percent))


GFEDemissions
GFEDemissionsTime

# setwd("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data")
# write.xlsx(GFEDemissionsTime, "GFEDemissionsTime.xlsx")
#
#
GFEDemissions <- read.xlsx("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/GFEDemissions.xlsx")
GFEDemissionsTime <- read.xlsx("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/GFEDemissionsTime.xlsx")

FigEmis <- GFEDemissions %>%
  filter(Biome != "AGRI", Biome != "DEFO") %>%
  ggplot(aes(x = reorder(Biome, -Emissions_PgC, mean), y = Emissions_PgC)) +
  geom_col(aes(fill = Biome), alpha = 0.95, width = 0.75) +
  geom_errorbar(aes(ymin = Emissions_PgC - SD, ymax = Emissions_PgC + SD), width = 0.2, size = 0.4) +
  xlab("Biome") +
  ylab("Emissions (Pg C)") +
  theme(
    legend.position = "none",
    legend.title = element_text(size = 11, family = "Arial"),
    legend.text = element_text(size = 11, family = "Arial"),
    legend.background = element_blank(),
    axis.title.x = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.title.y = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.text = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      linewidth = .9),
    panel.background = element_blank(),
    plot.tag = element_text(
      family = "Arial",
      size = 14,
      face = "bold")) +
  scale_fill_tableau() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray25") +
  geom_text(aes(y = PlacementValue, label = paste0(Emissions_percent, "%")), size = 4, color = "black", fontface = "bold", hjust = -0.65) +
  labs(tag = "A")




FigEmisInset <- GFEDemissionsTime %>%
  filter(Biome != "AGRI", Biome != "DEFO") %>%
  ggplot(aes(x = Year, y = Emissions_PgC, color = Biome)) +
  geom_point(alpha = 0.75) +
  geom_smooth(se = FALSE) +
  xlab("Year") +
  ylab("Emissions (Pg C)") +
  theme(
    legend.position = "none",
    legend.title = element_text(size = 11, family = "Arial"),
    legend.text = element_text(size = 11, family = "Arial"),
    legend.background = element_blank(),
    axis.title.x = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.title.y = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.text = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    panel.border = element_blank(),
    panel.background = element_blank(),
    plot.tag = element_text(
      family = "Arial",
      size = 14,
      face = "bold"),
    axis.line.x.bottom = element_line(color = "black"),
    axis.line.y.left = element_line(color = "black")
    ) +
  scale_color_tableau() +
  scale_x_continuous(breaks = c(2000,2008, 2016))




#Global ff emissions
ff <- read.csv("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/global_1751_2017.csv")
FF <- ff %>% dplyr::select(Year, TotalCarbonEmissions.from.fossil.fuel.consumption.and.cement.production..million.metric.tons.of.C.) %>%
  rename("FFemissionsTgC" = "TotalCarbonEmissions.from.fossil.fuel.consumption.and.cement.production..million.metric.tons.of.C.") %>%
  mutate(FFemissionsPgC = conv_unit(FFemissionsTgC*10^6, from = "metric_ton", "Pg")) %>%
  dplyr::select(Year, FFemissionsPgC) %>%
  filter(Year <= 2016, Year >= 1998)

GFEDsummary <- GFEDemissionsTime %>% group_by(Year) %>%
  summarise(FireEmissions_PgC = sum(Emissions_PgC))

EmissionsAll <- left_join(GFEDsummary, FF) %>%
  pivot_longer(names_to = "EmissionsType", values_to = "Emissions_PgC", -Year)

EmissionsAllSummary <- EmissionsAll %>%
  group_by(EmissionsType) %>%
  summarise(SD = sd(Emissions_PgC),
            Emissions_PgC = mean(Emissions_PgC)) %>%
  mutate(Emissions_percent = round(Emissions_PgC/sum(Emissions_PgC)*100, 0),
         PlacementValue = Emissions_PgC + 0.65)






FigEmisB <-
  EmissionsAllSummary %>%
  ggplot(aes(x = EmissionsType, y = Emissions_PgC)) +
  geom_col(aes(fill = EmissionsType), alpha = 0.95, width = 0.75) +
  geom_errorbar(aes(ymin = Emissions_PgC - SD, ymax = Emissions_PgC + SD), width = 0.2, size = 0.4) +
  xlab("Emissions Type") +
  ylab(expression("Emissions (Pg C)")) +
  theme(
    legend.position = "none",
    legend.title = element_text(size = 11, family = "Arial"),
    legend.text = element_text(size = 11, family = "Arial"),
    legend.background = element_blank(),
    axis.title.x = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.title.y = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.text = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      linewidth = .9),
    panel.background = element_blank(),
    plot.tag = element_text(
      family = "Arial",
      size = 14,
      face = "bold")) +
  scale_fill_simpsons() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray25") +
  labs(tag = "B") +
  scale_x_discrete(labels=c("Fossil \n Fuels", "Wildfire")) +
  geom_text(aes(y = PlacementValue, label = paste0(Emissions_percent, "%")), size = 4, color = "black", fontface = "bold", vjust = 0.5, hjust = -0.4)




plot_design <- "
AAAAABBB
AAAAABBB
AAAAABBB
"

setwd("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Figures")
p1 <- FigEmis + inset_element(FigEmisInset, 0.35, 0.23, 0.95,0.925)
p2 <- FigEmisB
p1 + p2 + plot_layout(design = plot_design, widths = c(5,2))
ggsave("GFEDemissions.tiff", dpi = 300, units = c("in"), width = 8, height = 4)


#Create dataframe for panel B multicolor
StackedEmissions <- GFEDemissions %>% select(Biome, Emissions_TgC) %>% rename(Type = Biome)

StackedFF <- FF %>% rename(Emissions_TgC = FFemissionsTgC) %>%
  summarise(Emissions_TgC = mean(Emissions_TgC)) %>%
  mutate(Type = "FF") %>%
  select(Type, Emissions_TgC)

StackedFinal <- rbind(StackedEmissions, StackedFF)


StackedFinal %>%
  filter(Type == "FFemissionsTgC") %>%
  ggplot(aes(x=as.numeric(EmissionsType) - 0.15, weight=Emissions_TgC, fill=variable)) +
  geom_bar(position="identity", width=0.3) +
  scale_x_continuous(breaks=c(1, 2, 3, 4), labels=unique(dat1$name)) +
  labs(x="name")

# 2nd layer
g1 + geom_bar(data=dat1 %>% filter(grepl("part", variable)),
              aes(x=as.numeric(name) + 0.15, fill=variable),
              position="stack", width=0.3)








# Scaling GFED emissions by biome area ---------------------------------------------------

#First, extract data for each biome using Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm
biomes <- vect("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp")
biomes
ex <- expanse(biomes, transform = TRUE, unit = "ha")
bm <- biomes$BIOME_NAME

bms <- data.frame("Area_ha" = ex, "Biome" = bm)
areas <- bms %>% group_by(Biome) %>%
  summarise(Area_ha_sum = sum(Area_ha))

BORFarea_ha <- areas %>%
  filter(Biome == "Boreal Forests/Taiga") %>%
  dplyr::select(Area_ha_sum)

TEMFarea_ha <- areas %>%
  filter(Biome == "Temperate Broadleaf & Mixed Forests" | Biome == "Temperate Conifer Forests") %>%
  dplyr::select(Area_ha_sum) %>%
  summarise(Sum = sum(Area_ha_sum))

SAVAarea_ha <- areas %>%
  filter(Biome %in% c("Flooded Grasslands & Savannas", "Temperate Grasslands, Savannas & Shrublands", "Tropical & Subtropical Grasslands, Savannas & Shrublands")) %>%
  dplyr::select(Area_ha_sum) %>%
  summarise(Sum = sum(Area_ha_sum))

PEATarea_ha <- conv_unit(4230000, from = "km2", to = "hectare") #Area from PEATMAP, https://www.sciencedirect.com/science/article/pii/S0341816217303004


#Create df for area
area_merge <- data.frame(Biome = c("BORF","TEMF","SAVA","PEAT"), area_ha = c(1540041825, #BORFarea_ha
                                                                             1635444101,#TEMFarea_ha,
                                                                             3305786312, #SAVAarea_ha,
                                                                             4.23e+08))#PEATarea_ha

#Add in areas for new figure
GFEDemissions2 <- GFEDemissions %>% filter(Biome != "DEFO", Biome != "AGRI") %>% left_join(area_merge) %>%
  mutate(Emissions_kgC_ha = conv_unit(Emissions_PgC, from = "Pg", to = "kg")/area_ha,
         PlacementValue2 = Emissions_kgC_ha + 20)


GFEDemissionsTime2 <- GFEDemissionsTime %>%
  filter(Biome != "AGRI", Biome != "DEFO") %>%
  left_join(area_merge) %>%
  mutate(Emissions_kgC_ha = conv_unit(Emissions_PgC, from = "Pg", to = "kg")/area_ha)


GFEDerr2 <-GFEDemissionsTime2 %>%
  group_by(Biome) %>%
  summarise(SD = sd(Emissions_kgC_ha),
            SE = SD/sqrt(length(Emissions_kgC_ha)))

GFEDemissions2 <- GFEDemissions2 %>% dplyr::select(c(-SD, -SE)) %>% left_join(GFEDerr2)



FigEmis <- GFEDemissions2 %>%
  filter(Biome != "AGRI", Biome != "DEFO") %>%
  ggplot(aes(x = reorder(Biome, -Emissions_kgC_ha, mean), y = Emissions_kgC_ha)) +
  geom_col(aes(fill = Biome), alpha = 0.95, width = 0.75) +
  scale_fill_manual(values = c("#4b9a7a","#ADAF71", "#7371af", "#9A4B6B")) +
  geom_errorbar(aes(ymin = Emissions_kgC_ha - SD, ymax = Emissions_kgC_ha + SD), width = 0.2, size = 0.4) +
  xlab("Biome") +
  ylab(expression("Emissions (kg C ha"^{-1}*")")) +
  theme(
    legend.position = "none",
    legend.title = element_text(size = 11, family = "Arial"),
    legend.text = element_text(size = 11, family = "Arial"),
    legend.background = element_blank(),
    axis.title.x = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.title.y = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.text = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      linewidth = .9),
    panel.background = element_blank(),
    plot.tag = element_text(
      family = "Arial",
      size = 14,
      face = "bold")) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray25") +
#  geom_text(aes(y = PlacementValue2, label = paste0(Emissions_percent, "%")), size = 4, color = "black", fontface = "bold", hjust = -0.65) +
  labs(tag = "A")


FigEmisInset <- GFEDemissionsTime2 %>%
  filter(Biome != "AGRI", Biome != "DEFO") %>%
  ggplot(aes(x = Year, y = Emissions_kgC_ha, color = Biome)) +
  geom_point(alpha = 0.75) +
  geom_smooth(se = FALSE) +
  xlab("Year") +
  ylab(expression("Emissions")) +
  theme(
    legend.position = "none",
    legend.title = element_text(size = 11, family = "Arial"),
    legend.text = element_text(size = 11, family = "Arial"),
    legend.background = element_blank(),
    axis.title.x = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.title.y = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.text = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    panel.border = element_blank(),
    panel.background = element_blank(),
    plot.tag = element_text(
      family = "Arial",
      size = 14,
      face = "bold"),
    axis.line.x.bottom = element_line(color = "black"),
    axis.line.y.left = element_line(color = "black"),
    rect = element_rect(fill = "transparent")
  ) +
  scale_color_manual(values = c("#4b9a7a","#ADAF71", "#7371af", "#9A4B6B")) +
  scale_x_continuous(breaks = c(2000,2008, 2016))



#Global ff emissions
ff <- read.csv("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Data/global_1751_2017.csv")
FF <- ff %>% dplyr::select(Year, Total.carbon.emissions.from.fossil.fuel.consumption.and.cement.production..million.metric.tons.of.C.) %>%
  rename("FFemissionsTgC" = "Total.carbon.emissions.from.fossil.fuel.consumption.and.cement.production..million.metric.tons.of.C.") %>%
  mutate(FFemissionsPgC = conv_unit(FFemissionsTgC*10^6, from = "metric_ton", "Pg")) %>%
  dplyr::select(Year, FFemissionsPgC) %>%
  filter(Year <= 2016, Year >= 1998)


#
# #Original
# GFEDsummary <- GFEDemissionsTime %>% group_by(Year) %>%
#   summarise(FireEmissions_PgC = sum(Emissions_PgC))
#
# EmissionsAll <- left_join(GFEDsummary, FF) %>%
#   pivot_longer(names_to = "EmissionsType", values_to = "Emissions_PgC", -Year)
#
# EmissionsAllSummary <- EmissionsAll %>%
#   group_by(EmissionsType) %>%
#   summarise(SD = sd(Emissions_PgC),
#             Emissions_PgC = mean(Emissions_PgC)) %>%
#   mutate(Emissions_percent = round(Emissions_PgC/sum(Emissions_PgC)*100, 0),
#          PlacementValue = Emissions_PgC + 0.65)







GFEDsummary <- GFEDemissionsTime %>% group_by(Year) %>%
  summarise(Emissions_PgC = sum(Emissions_PgC)) %>% #Get sum of GFED fire emissions
  summarise(SE = sd(Emissions_PgC)/sqrt(n()),
            Emissions_PgC = mean(Emissions_PgC)) %>%
  mutate(EmissionsType = "Fire") #Add emissions type

FFemissions <- data.frame(SE = 0.8, Emissions_PgC = 10.9, EmissionsType = "Anthropogenic")

EmissionsAllSummary <- rbind(GFEDsummary, FFemissions)


EmissionsAllSummary <- EmissionsAllSummary %>%
  mutate(PlacementValue = Emissions_PgC + 0.65,
         Emissions_percent = 100*round(Emissions_PgC/sum(Emissions_PgC), 2))




FigEmisB <-
  EmissionsAllSummary %>%
  ggplot(aes(x = EmissionsType, y = Emissions_PgC)) +
  geom_col(aes(fill = EmissionsType), alpha = 0.95, width = 0.75) +
  geom_errorbar(aes(ymin = Emissions_PgC - SE, ymax = Emissions_PgC + SE), width = 0.2, size = 0.4) +
  xlab("Emissions Type") +
  ylab(expression("Emissions (Pg C)")) +
  theme(
    legend.position = "none",
    legend.title = element_text(size = 11, family = "Arial"),
    legend.text = element_text(size = 11, family = "Arial"),
    legend.background = element_blank(),
    axis.title.x = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.title.y = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    axis.text = element_text(
      color = "black",
      size = 14,
      family = "Arial"),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      linewidth = .9),
    panel.background = element_blank(),
    plot.tag = element_text(
      family = "Arial",
      size = 14,
      face = "bold")) +
  scale_fill_manual(values = c("#45A3BA","#BA5C45")) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray25") +
  labs(tag = "B") +
  scale_x_discrete(labels=c("Fossil \n Fuels", "Wildfire")) #+
  #geom_text(aes(y = PlacementValue, label = paste0(Emissions_percent, "%")), size = 4, color = "black", fontface = "bold", vjust = 0.5, hjust = -0.4)




plot_design <- "
AAAAABBB
AAAAABBB
AAAAABBB
"

setwd("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/NCCFireReview/Figures")
p1 <- FigEmis + inset_element(FigEmisInset, 0.41, 0.42, 0.95,0.945)
p2 <- FigEmisB
p1 + p2 + plot_layout(design = plot_design, widths = c(5,2))
ggsave("GFEDemissionsAnthro2.tiff", dpi = 300, units = c("in"), width = 8, height = 4.25)


