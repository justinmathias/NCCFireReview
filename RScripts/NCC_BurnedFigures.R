#Created by Justin Mathias, 12/28/22
#

#Housekeeping: load packages, set themes, etc.
library("easypackages")
libraries(c("terra", "ggsci", "ggthemes", "RColorBrewer", "measurements", "stringr", "egg", "rgdal", "openxlsx", "shiny", "shinydashboard",
            "plotly", "wordcloud", "tm", "soilDB", "aqp", "rhdf5", "tidyverse", "rhdf5", "ncdf4", "raster", "patchwork", "job", "viridis"))

#Load files.
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

#Set extent and CRS of each raster. Determine burned area fraction for each pixel.
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

  gfed_area_km2 <- raster::area(gfed1997ras) #Get cell area in km2

#1997 burned fraction
burnedarea1997_km2 <- (gfed1997ras$burned_fraction.1+
                         gfed1997ras$burned_fraction.2+
                         gfed1997ras$burned_fraction.3+
                         gfed1997ras$burned_fraction.4+
                         gfed1997ras$burned_fraction.5+
                         gfed1997ras$burned_fraction.6+
                         gfed1997ras$burned_fraction.7+
                         gfed1997ras$burned_fraction.8+
                         gfed1997ras$burned_fraction.9+
                         gfed1997ras$burned_fraction.10+
                         gfed1997ras$burned_fraction.11+
                         gfed1997ras$burned_fraction.12)*gfed_area_km2

#1998 burned fraction
burnedarea1998_km2 <- (gfed1998ras$burned_fraction.1+
                        gfed1998ras$burned_fraction.2+
                        gfed1998ras$burned_fraction.3+
                        gfed1998ras$burned_fraction.4+
                        gfed1998ras$burned_fraction.5+
                        gfed1998ras$burned_fraction.6+
                        gfed1998ras$burned_fraction.7+
                        gfed1998ras$burned_fraction.8+
                        gfed1998ras$burned_fraction.9+
                        gfed1998ras$burned_fraction.10+
                        gfed1998ras$burned_fraction.11+
                        gfed1998ras$burned_fraction.12)*gfed_area_km2


#1999 burned fraction
burnedarea1999_km2 <- (gfed1999ras$burned_fraction.1+
                        gfed1999ras$burned_fraction.2+
                        gfed1999ras$burned_fraction.3+
                        gfed1999ras$burned_fraction.4+
                        gfed1999ras$burned_fraction.5+
                        gfed1999ras$burned_fraction.6+
                        gfed1999ras$burned_fraction.7+
                        gfed1999ras$burned_fraction.8+
                        gfed1999ras$burned_fraction.9+
                        gfed1999ras$burned_fraction.10+
                        gfed1999ras$burned_fraction.11+
                        gfed1999ras$burned_fraction.12)*gfed_area_km2


#2000 burned fraction
burnedarea2000_km2 <- (gfed2000ras$burned_fraction.1+
                        gfed2000ras$burned_fraction.2+
                        gfed2000ras$burned_fraction.3+
                        gfed2000ras$burned_fraction.4+
                        gfed2000ras$burned_fraction.5+
                        gfed2000ras$burned_fraction.6+
                        gfed2000ras$burned_fraction.7+
                        gfed2000ras$burned_fraction.8+
                        gfed2000ras$burned_fraction.9+
                        gfed2000ras$burned_fraction.10+
                        gfed2000ras$burned_fraction.11+
                        gfed2000ras$burned_fraction.12)*gfed_area_km2

#2001 burned fraction
burnedarea2001_km2 <- (gfed2001ras$burned_fraction.1+
                        gfed2001ras$burned_fraction.2+
                        gfed2001ras$burned_fraction.3+
                        gfed2001ras$burned_fraction.4+
                        gfed2001ras$burned_fraction.5+
                        gfed2001ras$burned_fraction.6+
                        gfed2001ras$burned_fraction.7+
                        gfed2001ras$burned_fraction.8+
                        gfed2001ras$burned_fraction.9+
                        gfed2001ras$burned_fraction.10+
                        gfed2001ras$burned_fraction.11+
                        gfed2001ras$burned_fraction.12)*gfed_area_km2

#2002 burned fraction
burnedarea2002_km2 <- (gfed2002ras$burned_fraction.1+
                        gfed2002ras$burned_fraction.2+
                        gfed2002ras$burned_fraction.3+
                        gfed2002ras$burned_fraction.4+
                        gfed2002ras$burned_fraction.5+
                        gfed2002ras$burned_fraction.6+
                        gfed2002ras$burned_fraction.7+
                        gfed2002ras$burned_fraction.8+
                        gfed2002ras$burned_fraction.9+
                        gfed2002ras$burned_fraction.10+
                        gfed2002ras$burned_fraction.11+
                        gfed2002ras$burned_fraction.12)*gfed_area_km2

#2003 burned fraction
burnedarea2003_km2 <- (gfed2003ras$burned_fraction.1+
                        gfed2003ras$burned_fraction.2+
                        gfed2003ras$burned_fraction.3+
                        gfed2003ras$burned_fraction.4+
                        gfed2003ras$burned_fraction.5+
                        gfed2003ras$burned_fraction.6+
                        gfed2003ras$burned_fraction.7+
                        gfed2003ras$burned_fraction.8+
                        gfed2003ras$burned_fraction.9+
                        gfed2003ras$burned_fraction.10+
                        gfed2003ras$burned_fraction.11+
                        gfed2003ras$burned_fraction.12)*gfed_area_km2

#2004 burned fraction
burnedarea2004_km2 <- (gfed2004ras$burned_fraction.1+
                        gfed2004ras$burned_fraction.2+
                        gfed2004ras$burned_fraction.3+
                        gfed2004ras$burned_fraction.4+
                        gfed2004ras$burned_fraction.5+
                        gfed2004ras$burned_fraction.6+
                        gfed2004ras$burned_fraction.7+
                        gfed2004ras$burned_fraction.8+
                        gfed2004ras$burned_fraction.9+
                        gfed2004ras$burned_fraction.10+
                        gfed2004ras$burned_fraction.11+
                        gfed2004ras$burned_fraction.12)*gfed_area_km2

#2005 burned fraction
burnedarea2005_km2 <- (gfed2005ras$burned_fraction.1+
                        gfed2005ras$burned_fraction.2+
                        gfed2005ras$burned_fraction.3+
                        gfed2005ras$burned_fraction.4+
                        gfed2005ras$burned_fraction.5+
                        gfed2005ras$burned_fraction.6+
                        gfed2005ras$burned_fraction.7+
                        gfed2005ras$burned_fraction.8+
                        gfed2005ras$burned_fraction.9+
                        gfed2005ras$burned_fraction.10+
                        gfed2005ras$burned_fraction.11+
                        gfed2005ras$burned_fraction.12)*gfed_area_km2


#2006 burned fraction
burnedarea2006_km2 <- (gfed2006ras$burned_fraction.1+
                        gfed2006ras$burned_fraction.2+
                        gfed2006ras$burned_fraction.3+
                        gfed2006ras$burned_fraction.4+
                        gfed2006ras$burned_fraction.5+
                        gfed2006ras$burned_fraction.6+
                        gfed2006ras$burned_fraction.7+
                        gfed2006ras$burned_fraction.8+
                        gfed2006ras$burned_fraction.9+
                        gfed2006ras$burned_fraction.10+
                        gfed2006ras$burned_fraction.11+
                        gfed2006ras$burned_fraction.12)*gfed_area_km2

#2007 burned fraction
burnedarea2007_km2 <- (gfed2007ras$burned_fraction.1+
                        gfed2007ras$burned_fraction.2+
                        gfed2007ras$burned_fraction.3+
                        gfed2007ras$burned_fraction.4+
                        gfed2007ras$burned_fraction.5+
                        gfed2007ras$burned_fraction.6+
                        gfed2007ras$burned_fraction.7+
                        gfed2007ras$burned_fraction.8+
                        gfed2007ras$burned_fraction.9+
                        gfed2007ras$burned_fraction.10+
                        gfed2007ras$burned_fraction.11+
                        gfed2007ras$burned_fraction.12)*gfed_area_km2

#2008 burned fraction
burnedarea2008_km2 <- (gfed2008ras$burned_fraction.1+
                        gfed2008ras$burned_fraction.2+
                        gfed2008ras$burned_fraction.3+
                        gfed2008ras$burned_fraction.4+
                        gfed2008ras$burned_fraction.5+
                        gfed2008ras$burned_fraction.6+
                        gfed2008ras$burned_fraction.7+
                        gfed2008ras$burned_fraction.8+
                        gfed2008ras$burned_fraction.9+
                        gfed2008ras$burned_fraction.10+
                        gfed2008ras$burned_fraction.11+
                        gfed2008ras$burned_fraction.12)*gfed_area_km2


#2009 burned fraction
burnedarea2009_km2 <- (gfed2009ras$burned_fraction.1+
                        gfed2009ras$burned_fraction.2+
                        gfed2009ras$burned_fraction.3+
                        gfed2009ras$burned_fraction.4+
                        gfed2009ras$burned_fraction.5+
                        gfed2009ras$burned_fraction.6+
                        gfed2009ras$burned_fraction.7+
                        gfed2009ras$burned_fraction.8+
                        gfed2009ras$burned_fraction.9+
                        gfed2009ras$burned_fraction.10+
                        gfed2009ras$burned_fraction.11+
                        gfed2009ras$burned_fraction.12)*gfed_area_km2


#2010 burned fraction
burnedarea2010_km2 <- (gfed2010ras$burned_fraction.1+
                        gfed2010ras$burned_fraction.2+
                        gfed2010ras$burned_fraction.3+
                        gfed2010ras$burned_fraction.4+
                        gfed2010ras$burned_fraction.5+
                        gfed2010ras$burned_fraction.6+
                        gfed2010ras$burned_fraction.7+
                        gfed2010ras$burned_fraction.8+
                        gfed2010ras$burned_fraction.9+
                        gfed2010ras$burned_fraction.10+
                        gfed2010ras$burned_fraction.11+
                        gfed2010ras$burned_fraction.12)*gfed_area_km2


#2011 burned fraction
burnedarea2011_km2 <- (gfed2011ras$burned_fraction.1+
                        gfed2011ras$burned_fraction.2+
                        gfed2011ras$burned_fraction.3+
                        gfed2011ras$burned_fraction.4+
                        gfed2011ras$burned_fraction.5+
                        gfed2011ras$burned_fraction.6+
                        gfed2011ras$burned_fraction.7+
                        gfed2011ras$burned_fraction.8+
                        gfed2011ras$burned_fraction.9+
                        gfed2011ras$burned_fraction.10+
                        gfed2011ras$burned_fraction.11+
                        gfed2011ras$burned_fraction.12)*gfed_area_km2



#2012 burned fraction
burnedarea2012_km2 <- (gfed2012ras$burned_fraction.1+
                        gfed2012ras$burned_fraction.2+
                        gfed2012ras$burned_fraction.3+
                        gfed2012ras$burned_fraction.4+
                        gfed2012ras$burned_fraction.5+
                        gfed2012ras$burned_fraction.6+
                        gfed2012ras$burned_fraction.7+
                        gfed2012ras$burned_fraction.8+
                        gfed2012ras$burned_fraction.9+
                        gfed2012ras$burned_fraction.10+
                        gfed2012ras$burned_fraction.11+
                        gfed2012ras$burned_fraction.12)*gfed_area_km2



#2013 burned fraction
burnedarea2013_km2 <- (gfed2013ras$burned_fraction.1+
                        gfed2013ras$burned_fraction.2+
                        gfed2013ras$burned_fraction.3+
                        gfed2013ras$burned_fraction.4+
                        gfed2013ras$burned_fraction.5+
                        gfed2013ras$burned_fraction.6+
                        gfed2013ras$burned_fraction.7+
                        gfed2013ras$burned_fraction.8+
                        gfed2013ras$burned_fraction.9+
                        gfed2013ras$burned_fraction.10+
                        gfed2013ras$burned_fraction.11+
                        gfed2013ras$burned_fraction.12)*gfed_area_km2



#2014 burned fraction
burnedarea2014_km2 <- (gfed2014ras$burned_fraction.1+
                        gfed2014ras$burned_fraction.2+
                        gfed2014ras$burned_fraction.3+
                        gfed2014ras$burned_fraction.4+
                        gfed2014ras$burned_fraction.5+
                        gfed2014ras$burned_fraction.6+
                        gfed2014ras$burned_fraction.7+
                        gfed2014ras$burned_fraction.8+
                        gfed2014ras$burned_fraction.9+
                        gfed2014ras$burned_fraction.10+
                        gfed2014ras$burned_fraction.11+
                        gfed2014ras$burned_fraction.12)*gfed_area_km2


#2015 burned fraction
burnedarea2015_km2 <- (gfed2015ras$burned_fraction.1+
                        gfed2015ras$burned_fraction.2+
                        gfed2015ras$burned_fraction.3+
                        gfed2015ras$burned_fraction.4+
                        gfed2015ras$burned_fraction.5+
                        gfed2015ras$burned_fraction.6+
                        gfed2015ras$burned_fraction.7+
                        gfed2015ras$burned_fraction.8+
                        gfed2015ras$burned_fraction.9+
                        gfed2015ras$burned_fraction.10+
                        gfed2015ras$burned_fraction.11+
                        gfed2015ras$burned_fraction.12)*gfed_area_km2


#2016 burned fraction
burnedarea2016_km2 <- (gfed2016ras$burned_fraction.1+
                        gfed2016ras$burned_fraction.2+
                        gfed2016ras$burned_fraction.3+
                        gfed2016ras$burned_fraction.4+
                        gfed2016ras$burned_fraction.5+
                        gfed2016ras$burned_fraction.6+
                        gfed2016ras$burned_fraction.7+
                        gfed2016ras$burned_fraction.8+
                        gfed2016ras$burned_fraction.9+
                        gfed2016ras$burned_fraction.10+
                        gfed2016ras$burned_fraction.11+
                        gfed2016ras$burned_fraction.12)*gfed_area_km2

})

#Create raster brick of burned area
burnedbrick_km2 <- brick(burnedarea1997_km2,
                     burnedarea1998_km2,
                     burnedarea1999_km2,
                     burnedarea2000_km2,
                     burnedarea2001_km2,
                     burnedarea2002_km2,
                     burnedarea2003_km2,
                     burnedarea2004_km2,
                     burnedarea2005_km2,
                     burnedarea2006_km2,
                     burnedarea2007_km2,
                     burnedarea2008_km2,
                     burnedarea2009_km2,
                     burnedarea2010_km2,
                     burnedarea2011_km2,
                     burnedarea2012_km2,
                     burnedarea2013_km2,
                     burnedarea2014_km2,
                     burnedarea2015_km2,
                     burnedarea2016_km2)

#Determine mean area burned for each pixel for 1997-2016
burnedarea_km2 <- calc(burnedbrick_km2, fun = mean)

#Load world shapefile
world.shp <- shapefile("/Users/justinmathias/Dropbox/Dual Isotope/Data/Shapefiles/Countries_WGS84/Countries_WGS84.shp")
world.shp.df <- fortify(world.shp) #Convert shapefile to data frame for plotting

#Load biomes raster and rename to simplified biomes
biomes <- vect("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp")
biome.names.old <- unique(biomes$BIOME_NAME) #Identify old biomes to reclassify
lookup.table <- c("Tundra" = "Tundra", #Store these old values in a lookup table with new values assigned.
                  "Tropical & Subtropical Moist Broadleaf Forests" = "Tropical Forests",
                  "Tropical & Subtropical Dry Broadleaf Forests" = "Tropical Forests",
                  "Tropical & Subtropical Coniferous Forests" = "Tropical Forests",
                  "Tropical & Subtropical Grasslands, Savannas & Shrublands" = "Grasslands, Savannas & Shrublands",
                  "Temperate Grasslands, Savannas & Shrublands" = "Grasslands, Savannas & Shrublands",
                  "Montane Grasslands & Shrublands" = "Grasslands, Savannas & Shrublands",
                  "Mediterranean Forests, Woodlands & Scrub" = "Mediterranean",
                  "Deserts & Xeric Shrublands" = "Deserts",
                  "Boreal Forests/Taiga" = "Boreal Forests",
                  "Temperate Conifer Forests" = "Temperate Conifer Forests",
                  "Temperate Broadleaf & Mixed Forests" = "Temperate Broadleaf Forests",
                  "Flooded Grasslands & Savannas" = "N/A",
                  "Mangroves" = "N/A",
                  "N/A" = "N/A")
biomes$BIOME_RENAMED <- lookup.table[biomes$BIOME_NAME] #Create new column for renamed biomes, referencing original biomes

#Subset spatvector based on renamed biome
Tundra <- terra::subset(biomes, biomes$BIOME_RENAMED == "Tundra")
TropicalForests <- terra::subset(biomes, biomes$BIOME_RENAMED == "Tropical Forests")
Mediterranean <- terra::subset(biomes, biomes$BIOME_RENAMED == "Mediterranean")
Deserts <- terra::subset(biomes, biomes$BIOME_RENAMED == "Deserts")
GrasslandsSavannasShrublands <- terra::subset(biomes, biomes$BIOME_RENAMED == "Grasslands, Savannas & Shrublands")
BorealForests <- terra::subset(biomes, biomes$BIOME_RENAMED == "Boreal Forests")
TemperateConiferForests <- terra::subset(biomes, biomes$BIOME_RENAMED == "Temperate Conifer Forests")
TemperateBroadleafForests <- terra::subset(biomes, biomes$BIOME_RENAMED == "Temperate Broadleaf Forests")


#Load aboveground and belowground carbon rasters----
agb <- rast("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Global_Maps_C_Density_2010_1763/data/aboveground_biomass_carbon_2010.tif")
bgb <- rast("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Global_Maps_C_Density_2010_1763/data/belowground_biomass_carbon_2010.tif")

AGB_MgC_ha <- agb*0.1 #Multiply by scale factor (see Spawn et al. 2020, Table 7)
cellarea_ha <- cellSize(AGB_MgC_ha, unit = "ha") #Calculate area of each grid cell in hectares
AGB_MgC <- AGB_MgC_ha*cellarea_ha #Calculate

BGB_MgC_ha <- bgb*0.1 #Multiply by scale factor (see Spawn et al. 2020, Table 7)
cellarea_ha <- cellSize(BGB_MgC_ha, unit = "ha") #Calculate area of each grid cell in hectares
BGB_MgC <- BGB_MgC_ha*cellarea_ha #Calculate

BurnedArea_km2 <- rast(burnedarea_km2) #Convert to SpatRaster
AGB_MgC_resampled <- resample(AGB_MgC, BurnedArea_km2) #Resample to BurnedArea dimensions
BGB_MgC_resampled <- resample(BGB_MgC, BurnedArea_km2) #Resample to BurnedArea dimensions

AGB_MgC_resampled_NAs <- AGB_MgC_resampled
AGB_MgC_resampled_NAs[AGB_MgC_resampled_NAs == 0] <- NA
BGB_MgC_resampled_NAs <- BGB_MgC_resampled
BGB_MgC_resampled_NAs[BGB_MgC_resampled_NAs == 0] <- NA

#Mask each raster by its biome
Tundra_AGB_MgC <- mask(AGB_MgC_resampled_NAs, Tundra)
TropicalForests_AGB_MgC <- mask(AGB_MgC_resampled_NAs, TropicalForests)
Mediterranean_AGB_MgC <- mask(AGB_MgC_resampled_NAs, Mediterranean)
Deserts_AGB_MgC <- mask(AGB_MgC_resampled_NAs, Deserts)
GrasslandsSavannasShrublands_AGB_MgC <- mask(AGB_MgC_resampled_NAs, GrasslandsSavannasShrublands)
BorealForests_AGB_MgC <- mask(AGB_MgC_resampled_NAs, BorealForests)
TemperateConiferForests_AGB_MgC <- mask(AGB_MgC_resampled_NAs, TemperateConiferForests)
TemperateBroadleafForests_AGB_MgC <- mask(AGB_MgC_resampled_NAs, TemperateBroadleafForests)

Tundra_BGB_MgC <- mask(BGB_MgC_resampled_NAs, Tundra)
TropicalForests_BGB_MgC <- mask(BGB_MgC_resampled_NAs, TropicalForests)
Mediterranean_BGB_MgC <- mask(BGB_MgC_resampled_NAs, Mediterranean)
Deserts_BGB_MgC <- mask(BGB_MgC_resampled_NAs, Deserts)
GrasslandsSavannasShrublands_BGB_MgC <- mask(BGB_MgC_resampled_NAs, GrasslandsSavannasShrublands)
BorealForests_BGB_MgC <- mask(BGB_MgC_resampled_NAs, BorealForests)
TemperateConiferForests_BGB_MgC <- mask(BGB_MgC_resampled_NAs, TemperateConiferForests)
TemperateBroadleafForests_BGB_MgC <- mask(BGB_MgC_resampled_NAs, TemperateBroadleafForests)


#Define function to get raster corresponding to quantiles
raster2quantile <- function(rast){
  #Define quantile
  quants <- global(rast, quantile, na.rm = T)

  #Create rasters for each quantile
  rQ1 <- terra::ifel(rast < quants[[2]], 1, NA)
  rQ2 <- terra::ifel(rast > quants[[2]] & rast < quants[[3]], 2, NA)
  rQ3 <- terra::ifel(rast > quants[[3]] & rast < quants[[4]], 3, NA)
  rQ4 <- terra::ifel(rast > quants[[4]] & rast < quants[[5]], 4, NA)

  rQs <- terra::mosaic(rQ1,rQ2,rQ3,rQ4)
  rQs
}

#Create rasters of each biome based on Quantile
Tundra_AGB_MgC_Qtl <- raster2quantile(Tundra_AGB_MgC)
TropicalForests_AGB_MgC_Qtl <- raster2quantile(TropicalForests_AGB_MgC)
Mediterranean_AGB_MgC_Qtl <- raster2quantile(Mediterranean_AGB_MgC)
Deserts_AGB_MgC_Qtl <- raster2quantile(Deserts_AGB_MgC)
GrasslandsSavannasShrublands_AGB_MgC_Qtl <- raster2quantile(GrasslandsSavannasShrublands_AGB_MgC)
BorealForests_AGB_MgC_Qtl <- raster2quantile(BorealForests_AGB_MgC)
TemperateConiferForests_AGB_MgC_Qtl <- raster2quantile(TemperateConiferForests_AGB_MgC)
TemperateBroadleafForests_AGB_MgC_Qtl <- raster2quantile(TemperateBroadleafForests_AGB_MgC)
BiomeAgnostic_AGB_MgC_Qtl <- raster2quantile(AGB_MgC_resampled_NAs)


AGBBiomesQtlCombined <- terra::mosaic(Tundra_AGB_MgC_Qtl,
                                   TropicalForests_AGB_MgC_Qtl,
                                   Mediterranean_AGB_MgC_Qtl,
                                   Deserts_AGB_MgC_Qtl,
                                   GrasslandsSavannasShrublands_AGB_MgC_Qtl,
                                   BorealForests_AGB_MgC_Qtl,
                                   TemperateConiferForests_AGB_MgC_Qtl,
                                   TemperateBroadleafForests_AGB_MgC_Qtl,
                                   fun=max)





Tundra_BGB_MgC_Qtl <- raster2quantile(Tundra_BGB_MgC) #repeat for belowground
TropicalForests_BGB_MgC_Qtl <- raster2quantile(TropicalForests_BGB_MgC)
Mediterranean_BGB_MgC_Qtl <- raster2quantile(Mediterranean_BGB_MgC)
Deserts_BGB_MgC_Qtl <- raster2quantile(Deserts_BGB_MgC)
GrasslandsSavannasShrublands_BGB_MgC_Qtl <- raster2quantile(GrasslandsSavannasShrublands_BGB_MgC)
BorealForests_BGB_MgC_Qtl <- raster2quantile(BorealForests_BGB_MgC)
TemperateConiferForests_BGB_MgC_Qtl <- raster2quantile(TemperateConiferForests_BGB_MgC)
TemperateBroadleafForests_BGB_MgC_Qtl <- raster2quantile(TemperateBroadleafForests_BGB_MgC)
BiomeAgnostic_BGB_MgC_Qtl <- raster2quantile(BGB_MgC_resampled_NAs)


BGBBiomesQtlCombined <- terra::mosaic(Tundra_BGB_MgC_Qtl,
                                      TropicalForests_BGB_MgC_Qtl,
                                      Mediterranean_BGB_MgC_Qtl,
                                      Deserts_BGB_MgC_Qtl,
                                      GrasslandsSavannasShrublands_BGB_MgC_Qtl,
                                      BorealForests_BGB_MgC_Qtl,
                                      TemperateConiferForests_BGB_MgC_Qtl,
                                      TemperateBroadleafForests_BGB_MgC_Qtl,
                                      fun=max)




#Create a raster where only grid cells are those that have burned
BurnedArea_km2_NAs <- BurnedArea_km2
BurnedArea_km2_NAs[BurnedArea_km2_NAs == 0] <- NA
BurnedArea_m2_NAs <- conv_unit(BurnedArea_km2_NAs, from = "km2", to = "m2")

#Reclassify burned area raster in quartiles by biome.
Tundra_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, Tundra)
TropicalForests_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, TropicalForests)
Mediterranean_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, Mediterranean)
Deserts_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, Deserts)
GrasslandsSavannasShrublands_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, GrasslandsSavannasShrublands)
BorealForests_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, BorealForests)
TemperateConiferForests_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, TemperateConiferForests)
TemperateBroadleafForests_BurnedArea_km2 <- mask(BurnedArea_km2_NAs, TemperateBroadleafForests)

Tundra_BurnedArea_km2_Qtl <- raster2quantile(Tundra_BurnedArea_km2)
TropicalForests_BurnedArea_km2_Qtl <- raster2quantile(TropicalForests_BurnedArea_km2)
Mediterranean_BurnedArea_km2_Qtl <- raster2quantile(Mediterranean_BurnedArea_km2)
Deserts_BurnedArea_km2_Qtl <- raster2quantile(Deserts_BurnedArea_km2)
GrasslandsSavannasShrublands_BurnedArea_km2_Qtl <- raster2quantile(GrasslandsSavannasShrublands_BurnedArea_km2)
BorealForests_BurnedArea_km2_Qtl <- raster2quantile(BorealForests_BurnedArea_km2)
TemperateConiferForests_BurnedArea_km2_Qtl <- raster2quantile(TemperateConiferForests_BurnedArea_km2)
TemperateBroadleafForests_BurnedArea_km2_Qtl <- raster2quantile(TemperateBroadleafForests_BurnedArea_km2)

BurnedBiomesQtlCombined <- terra::mosaic(Tundra_BurnedArea_km2_Qtl,
                                   TropicalForests_BurnedArea_km2_Qtl,
                                   Mediterranean_BurnedArea_km2_Qtl,
                                   Deserts_BurnedArea_km2_Qtl,
                                   GrasslandsSavannasShrublands_BurnedArea_km2_Qtl,
                                   BorealForests_BurnedArea_km2_Qtl,
                                   TemperateConiferForests_BurnedArea_km2_Qtl,
                                   TemperateBroadleafForests_BurnedArea_km2_Qtl,
                                   fun=max)

BiomeAgnostic_BurnedArea_km2_Qtl <- raster2quantile(BurnedArea_km2_NAs)


#Final plots
#PANEL C
ggplot() +
  geom_spatraster(data = BiomeAgnostic_AGB_MgC_Qtl*BiomeAgnostic_BurnedArea_km2_Qtl)+
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  scale_fill_whitebox_c(
    palette = "muted",
    na.value = "white",
  ) +
  # coord_sf(crs = st_crs("ESRI:54009")) +
  theme_map() +
  theme(
    legend.position = c(0.08,0.08),
    plot.tag = element_text(size = 16)
  ) +
  ylim(c(-60,90))

#Map color to biome, alpha to value
#Layer the two rasters into one multi-band raster for easier manipulation





#Create a raster from the biomes map at the resolution of burned area
BIOMES <- vect("/Users/justinmathias/Library/CloudStorage/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp")
lookup.table <- c("Tundra" = "Tundra", #Store these old values in a lookup table with new values assigned.
                  "Tropical & Subtropical Moist Broadleaf Forests" = "Tropical Forests",
                  "Tropical & Subtropical Dry Broadleaf Forests" = "Tropical Forests",
                  "Tropical & Subtropical Coniferous Forests" = "Tropical Forests",
                  "Tropical & Subtropical Grasslands, Savannas & Shrublands" = "Grasslands, Savannas & Shrublands",
                  "Temperate Grasslands, Savannas & Shrublands" = "Grasslands, Savannas & Shrublands",
                  "Montane Grasslands & Shrublands" = "Grasslands, Savannas & Shrublands",
                  "Mediterranean Forests, Woodlands & Scrub" = "Mediterranean",
                  "Deserts & Xeric Shrublands" = "Deserts",
                  "Boreal Forests/Taiga" = "Boreal Forests",
                  "Temperate Conifer Forests" = "Temperate Conifer Forests",
                  "Temperate Broadleaf & Mixed Forests" = "Temperate Broadleaf Forests",
                  "Flooded Grasslands & Savannas" = "N/A",
                  "Mangroves" = "N/A",
                  "N/A" = "N/A")
BIOMES$BIOME_RENAMED <- lookup.table[BIOMES$BIOME_NAME] #Create new column for renamed biomes, referencing original biomes
BiomesRaster <- terra::rasterize(BIOMES, BurnedBiomesQtlCombined, "BIOME_RENAMED")





#Define function to get values for each cell
getValuesXY <- function(rast) {

  rastXY <- data.frame(xyFromCell(rast, 1:ncell(rast))) #Determine xy coords from raster and put into data frame, but only for non-NA values

  extractedValues <- terra::extract(rast, rastXY) #Extract values for each cell given xy coords

  rastXY$ID <- 1:length(rastXY$x) #Add ID column for merging in subsequent step

  rastValues <- list(rastXY, extractedValues) %>% reduce(left_join, by = "ID") %>% dplyr::select(-ID) #Join dataframes
  return(rastValues)

}




#Convert raster to df, then merge together and rename
AGBBiomesQtlCombined_vals <- getValuesXY(AGBBiomesQtlCombined) %>% rename(AGB_BiomeQuantile = aboveground_biomass_carbon_2010)
BGBBiomesQtlCombined_vals <- getValuesXY(BGBBiomesQtlCombined) %>% rename(BGB_BiomeQuantile = belowground_biomass_carbon_2010)
BurnedBiomesQtlCombined_vals <- getValuesXY(BurnedBiomesQtlCombined) %>% rename(BurnedBiome_Qtl = layer)
BiomeAgnostic_AGB_MgC_Qtl_vals <- getValuesXY(BiomeAgnostic_AGB_MgC_Qtl) %>% rename(AGB_BiomeAgnosticQuantile = aboveground_biomass_carbon_2010)
BiomeAgnostic_BGB_MgC_Qtl_vals <- getValuesXY(BiomeAgnostic_BGB_MgC_Qtl) %>% rename(BGB_BiomeAgnosticQuantile = belowground_biomass_carbon_2010)
BiomeAgnostic_BurnedArea_km2_Qtl_vals <- getValuesXY(BiomeAgnostic_BurnedArea_km2_Qtl) %>% rename(BurnedBiomeAgnostic_Qtl = layer)
BiomeNames <- getValuesXY(BiomesRaster) %>% rename(Biome = BIOME_RENAMED)



merged <- list(AGBBiomesQtlCombined_vals,
               BGBBiomesQtlCombined_vals,
               BurnedBiomesQtlCombined_vals,
               BiomeAgnostic_AGB_MgC_Qtl_vals,
               BiomeAgnostic_BGB_MgC_Qtl_vals,
               BiomeAgnostic_BurnedArea_km2_Qtl_vals,
               BiomeNames) %>% reduce(left_join)

Merged <- merged %>% drop_na(AGB_BiomeQuantile) %>%
  filter(Biome != "NA",
         Biome != "N/A")



##Code for figure 2A----
AGB_PgC <- conv_unit(AGB_MgC_ha*cellarea_ha, from = "Mg", to = "Pg") #Calculate total C in Megagrams per grid cell, then convert to Petagrams
BGB_PgC <- conv_unit(BGB_MgC_ha*cellarea_ha, from = "Mg", to = "Pg") #Calculate total C in Megagrams per grid cell, then convert to Petagrams

#Rasterize biomes SpatVector to same resolution as AGB_PgC and BGB_PgC
Biomes <- rasterize(biomes, AGB_PgC, "BIOME_RENAMED")

#Calculate sum of C for each biome in Pg
AGB_PgC_Biomes <- zonal(AGB_PgC, Biomes, "sum", na.rm = TRUE)
BGB_PgC_Biomes <- zonal(BGB_PgC, Biomes, "sum", na.rm = TRUE)
#Calculate total area (i.e., sum) for each biome
area_Biomes <- zonal(cellarea_ha, Biomes, "sum", na.rm = TRUE)


#Create dataframe of above- and belowground carbon
BiomeCarbon <- list(AGB_PgC_Biomes, BGB_PgC_Biomes, area_Biomes) %>% reduce(left_join, by = "BIOME_RENAMED") %>% #Join zonal summaries
  mutate(AGBtoBGB = aboveground_biomass_carbon_2010/belowground_biomass_carbon_2010) %>% #Create column for ratio of above- to belowground biomass
  rename(Biome = BIOME_RENAMED, AGB_PgC = aboveground_biomass_carbon_2010, BGB_PgC = belowground_biomass_carbon_2010, Area_ha = area) %>% #Rename columns for readability
  mutate(area_Sum = sum(Area_ha)) %>% #Calculate sum of total land area before removing mangroves, rock and ice
  filter(Biome != "N/A") %>% #Remove mangroves and rock and ice
  mutate(AGB_MgC_ha = (conv_unit(AGB_PgC, from = "Pg", to = "Mg")/Area_ha), #Convert back to Mg from Pg
         BGB_MgC_ha = (conv_unit(BGB_PgC, from = "Pg", to = "Mg")/Area_ha), #Convert back to Mg from Pg
         Total_PgC = AGB_PgC + BGB_PgC, #Calculate total C, sum of above and belowground
         Total_MgC_ha = (conv_unit(Total_PgC, from = "Pg", to = "Mg")/Area_ha), #Calculate total C per ha
         BGB_PgC_below = BGB_PgC*-1, #Create negative values for BGB for certain plots for data visualization
         BGB_MgC_ha_below = BGB_MgC_ha*-1,#Create negative values for BGB for certain plots for data visualization
         area_Percent = Area_ha/area_Sum*100,#Calculate percent land area of Earth covered
         AGB_percentC = AGB_PgC/sum(AGB_PgC)*100, #Calculate percent of AGB C in each biome
         BGB_percentC = BGB_PgC/sum(BGB_PgC)*100)  #Calculate percent of BGB C in each biome

##Create Figures!
lookup.table2 <- c("Tundra" = "TUND", #Store these old values in a lookup table with new values assigned.
                  "Tropical Forests" = "TROP",
                  "Grasslands, Savannas & Shrublands" = "GRAS",
                  "Mediterranean" = "MED",
                  "Deserts" = "DSRT",
                  "Boreal Forests" = "BORF",
                  "Temperate Conifer Forests" = "TCF",
                  "Temperate Broadleaf Forests" = "TBF"
                  )
BiomeCarbon$Biome2 <- lookup.table2[BiomeCarbon$Biome] #Create new column for renamed biomes, referencing original biomes



Fig2A <-
BiomeCarbon %>%
  ggplot(aes(x = reorder(Biome2, Total_MgC_ha, mean))) +
  geom_segment(aes(y = Total_MgC_ha, xend = Biome2, yend = 0), linewidth = 0.9, alpha = 0.7) +
  geom_segment(aes(y = BGB_MgC_ha_below, xend = Biome2, yend = 0), linewidth = 0.9, alpha = 0.7) +
  geom_point(aes(y = BGB_MgC_ha_below, size = area_Percent, fill = Biome), pch = 21) + #Belowground carbon data
  geom_point(aes(y = Total_MgC_ha, size = area_Percent, fill = Biome), pch = 21) +
  geom_hline(yintercept = 0, color = "black", linetype = "dashed") +
  scale_fill_manual(values = brewer.pal(8, "Dark2"))+
  # coord_flip() +
  xlab("") +
  ylab(expression("Carbon density (Mg C ha"^{-1}*")")) +
  theme_article()+
  theme(
    legend.position = c(0.2,0.7),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    panel.border = element_rect(color = "black"),
    text = element_text(color = "black"),
    plot.tag = element_text(face = "bold", size = 14),
    axis.text.x = element_text(angle = 30, vjust = 0.6)
  ) +
  labs(size = "Area (%)") +
  ylim(c(-30,85)) +
  labs(tag = "a") +
  guides(fill = "none")



#Fig 2B Aboveground biomass biome agnostic quartile * biome agnostic burned area quartile
Fig2B <- ggplot(data=Merged) +
  theme_article() +
  # geom_tile(aes(x=x, y=y, fill=AGB_BiomeAgnosticQuantile*BurnedBiomeAgnostic_Qtl)) +
  geom_raster(aes(x=x, y=y, fill=AGB_BiomeAgnosticQuantile*BurnedBiomeAgnostic_Qtl)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  scale_alpha_continuous(guide = "none")+
  scale_x_continuous(expand=c(0.01,0.01)) +
  ylim(-60,90) +
  theme(
    legend.position = "right",
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14)
  ) +
  # scale_fill_manual(values = brewer.pal(8, "Dark2"))+
  scale_fill_viridis(option = "G", na.value="white", direction = -1) + #Direction reversed the color ramp
  xlab("Longitude") +
  ylab("Latitude") +
  labs(tag = "b", fill = "AGB") #Fill AGB is legend name

#Fig 2C Belowground biomass biome agnostic quartile * biome agnostic burned area quartile
Fig2C <- ggplot(data=Merged) +
  theme_article() +
  # geom_tile(aes(x=x, y=y, fill=BGB_BiomeAgnosticQuantile*BurnedBiomeAgnostic_Qtl)) +
  geom_raster(aes(x=x, y=y, fill=BGB_BiomeAgnosticQuantile*BurnedBiomeAgnostic_Qtl)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  scale_alpha_continuous(guide = "none")+
  scale_x_continuous(expand=c(0.01,0.01)) +
  ylim(-60,90) +
  theme(
    legend.position = "right",
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14)
  ) +
  # scale_fill_manual(values = brewer.pal(8, "Dark2"))+
  scale_fill_viridis(option = "B", na.value="white", direction = -1) + #Direction reversed the color ramp
  xlab("Longitude") +
  ylab("Latitude") +
  labs(tag = "c", fill = "BGB") #Fill BGB is legend name

plot_design <- "
AAA
BBB
CCC
DDD
"

Fig2A + plot_spacer() + Fig2B  + Fig2C +
  plot_layout(design = plot_design,#, guides = "collect"
              heights = c(2.67, -0.5, 2.67, 2.66)) #Used plot spacer here to bring Panels A and B closer together

setwd("/Users/justinmathias/Desktop/Working NCC/Figures")
ggsave("Figure2.png", units = c("in"), width = 4.75, height = 8, dpi = 350)








#Supplemental Figure!
ggplot(data=Merged) +
  theme_article() +
  #geom_tile(aes(x=x, y=y, fill=AGB_BiomeQuantile*BurnedBiome_Qtl)) +
  geom_raster(aes(x=x, y=y, fill=AGB_BiomeQuantile*BurnedBiome_Qtl)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray50', fill = NA, size = 0.02) +
  scale_alpha_continuous(guide = "none")+
  scale_x_continuous(expand=c(0.01,0.01)) +
  ylim(-60,90) +
  theme(
    legend.position = "right",
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black"),
    plot.tag = element_text(face = "bold"),
    strip.text = element_text(face = "bold")
  ) +
  scale_fill_viridis(option = "G", na.value="white", direction = -1) + #Direction reversed the color ramp
  xlab("Longitude") +
  ylab("Latitude") +
  labs(fill = "AGB") +#Fill AGB is legend name
  facet_wrap(~Biome, ncol = 2)


ggsave("AGB_BiomesQtl.png", units = c("in"), dpi = 350, width = 6, height = 7)
ggsave("AGB_BiomesQtl.pdf", units = c("in"), dpi = 350, width = 6, height = 7)



ggplot(data=Merged) +
  theme_article() +
  #geom_tile(aes(x=x, y=y, fill=BGB_BiomeQuantile*BurnedBiome_Qtl)) +
  geom_raster(aes(x=x, y=y, fill=BGB_BiomeQuantile*BurnedBiome_Qtl)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray50', fill = NA, size = 0.02) +
  scale_alpha_continuous(guide = "none")+
  scale_x_continuous(expand=c(0.01,0.01)) +
  ylim(-60,90) +
  theme(
    legend.position = "right",
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black"),
    plot.tag = element_text(face = "bold"),
    strip.text = element_text(face = "bold")
  ) +
  scale_fill_viridis(option = "B", na.value="white", direction = -1) + #Direction reversed the color ramp
  xlab("Longitude") +
  ylab("Latitude") +
  labs(fill = "BGB") +#Fill BGB is legend name
  facet_wrap(~Biome, ncol = 2)

ggsave("BGB_BiomesQtl.png", units = c("in"), dpi = 350, width = 6, height = 7)
ggsave("BGB_BiomesQtl.pdf", units = c("in"), dpi = 350, width = 6, height = 7)



##Supplemental AGB, BGB, and Burned Area maps
#Aboveground biomass
tst <- getValuesXY(AGB_MgC_resampled_NAs) %>% drop_na()

FigSXA <- ggplot(data=tst) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= aboveground_biomass_carbon_2010)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_gradientn(colors = c("white","#aedab0","#4dac53","#206226","#163117"),
                       values = c(0, 0.1, 0.4, 1),
                       name = expression("AGB (Mg C)")) +
  labs(tag = "a")


#AGB quartile biome agnostic
tst2 <- BiomeAgnostic_AGB_MgC_Qtl_vals %>% drop_na()
tst2$AGB_BiomeAgnosticQuantile <- as.character(tst2$AGB_BiomeAgnosticQuantile)

FigSXB <- ggplot(data=tst2) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= AGB_BiomeAgnosticQuantile)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_manual(values = pal_npg(alpha = 0.8)(4),
                    name = expression("AGB \n Quartile")) +
  labs(tag = "b")

#AGB quartile by biome
tst3 <- AGBBiomesQtlCombined_vals %>% drop_na()
tst3$AGB_BiomeQuantile <- as.character(tst3$AGB_BiomeQuantile)

FigSXC <- ggplot(data=tst3) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= AGB_BiomeQuantile)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_manual(values = pal_npg(alpha = 0.8)(4),
                    name = expression("AGB \n Quartile")) +
  labs(tag = "c")



#Belowground biomass
tst4 <- getValuesXY(BGB_MgC_resampled_NAs) %>% drop_na()

FigSXD <- ggplot(data=tst4) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= belowground_biomass_carbon_2010)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_gradientn(colors = c("white","#dbc8bc","#8b6248","#2a1e16"),
                       values = c(0, 0.1, 0.4, 1),
                       name = expression("BGB (Mg C)")) +
  labs(tag = "d")


#BGB quartile biome agnostic
tst5 <- BiomeAgnostic_BGB_MgC_Qtl_vals %>% drop_na()
tst5$BGB_BiomeAgnosticQuantile <- as.character(tst5$BGB_BiomeAgnosticQuantile)

FigSXE <- ggplot(data=tst5) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= BGB_BiomeAgnosticQuantile)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_manual(values = pal_npg(alpha = 0.8)(4),
                    name = expression("BGB \n Quartile")) +
  labs(tag = "e")

#BGB quartile by biome
tst6 <- BGBBiomesQtlCombined_vals %>% drop_na()
tst6$BGB_BiomeQuantile <- as.character(tst6$BGB_BiomeQuantile)

FigSXF <- ggplot(data=tst6) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= BGB_BiomeQuantile)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_manual(values = pal_npg(alpha = 0.8)(4),
                    name = expression("BGB \n Quartile")) +
  labs(tag = "f")





#Burned area
tst7 <- getValuesXY(BurnedArea_km2_NAs) %>% drop_na()

FigSXG <- ggplot(data=tst7) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= layer)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_gradientn(colors = c("white","orange","red", "purple","blue"),
                       values = c(0, 0.075, 0.2, 0.5, 1), #This changes the map scale for burned area
                       name = expression("Burned \n Area (km"^2*")")) +
  labs(tag = "g")



#Burned area biome agnostic
tst8 <- BiomeAgnostic_BurnedArea_km2_Qtl_vals %>% drop_na()
tst8$BurnedBiomeAgnostic_Qtl <- as.character(tst8$BurnedBiomeAgnostic_Qtl)


FigSXH <- ggplot(data=tst8) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= BurnedBiomeAgnostic_Qtl)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_manual(values = pal_npg(alpha = 0.8)(4),
                    name = expression("Burned \n Quartile")) +
  labs(tag = "h")

#Burned biome quartile
tst9 <- BurnedBiomesQtlCombined_vals %>% drop_na()
tst9$BurnedBiome_Qtl <- as.character(tst9$BurnedBiome_Qtl)

FigSXI <- ggplot(data=tst9) +
  theme_article() +
  geom_raster(aes(x=x, y=y, fill= BurnedBiome_Qtl)) +
  geom_polygon(data = world.shp, aes(x = long, y = lat, group = group), color = 'gray20', fill = NA, size = 0.08) +
  ylim(-55,87) +
  theme(
    legend.position = c(0.15,0.25),
    panel.border = element_rect(color = "black", fill = NA),
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(size = 12),
    plot.tag = element_text(face = "bold", size = 14),
    legend.background = element_blank()
  ) +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_manual(values = pal_npg(alpha = 0.8)(4),
                    name = expression("Burned \n Quartile")) +
  labs(tag = "h")


plot_design <- "
AAABBBCCC
AAABBBCCC
DDDEEEFFF
DDDEEEFFF
GGGHHHIII
GGGHHHIII
"

FigSXA + FigSXB  + FigSXC + FigSXD + FigSXE + FigSXF  + FigSXG + FigSXH + FigSXI +
  plot_layout(design = plot_design#, guides = "collect"
  )
setwd("/Users/justinmathias/Desktop/Working NCC/Figures")
ggsave("FigureSX.png", units = c("in"), width = 11.5, height = 8.25, dpi = 350)





