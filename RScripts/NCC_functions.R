##Created on 9/26/2022 by Justin Mathias ##
##This script will serve as a central hub for commonly utilized functions for ##
##the NCC Fire Review.

#First, load all packages
library("easypackages")
libraries(c("openxlsx", "measurements", "stringi", "tidyverse"))


# Functions added by justin ----------------------------------------------------------
##Working with lat/lon----
#Let's start by creating functions that we will then wrap into a single function
#We will build out complexity later to deal with formatting
dms.to.dd <- function(dms, dms2 = NULL) {
  if (is.null(dms2) != TRUE) {
  dd <- round(as.numeric(conv_unit(dms, from = "deg_min_sec", to = "dec_deg")), 4)
  dd2 <- round(as.numeric(conv_unit(dms2, from = "deg_min_sec", to = "dec_deg")), 4)
  paste(dd, dd2, sep = ",")
  } else if (is.null(dms2) == TRUE) {
    dd <- round(as.numeric(conv_unit(dms, from = "deg_min_sec", to = "dec_deg")), 4)
    dd
  }
}
dd.to.dms <- function(dd, dd2) {
  dms <- conv_unit(dd, from = "dec_deg", to = "deg_min_sec")
  return(dms)
}

coord.convert <- function(coord, fn){
  fns <- c("dms.to.dd", "dd.to.dms") #First list all possible functions
  if(!fn %in% fns){
    stop(paste0("Specified function must be one of:"), paste(fns, " ")) #Write error message if fn isn't listed
  }
  if(fn == "dms.to.dd"){ #Function for dms to dd
    dd <- dms.to.dd(coord)
    return(round(as.numeric(dd), 6))
  } else if (fn == "dd.to.dms") { #Function for dd to dms
      dms <- dd.to.dms(coord)
      return(dms)
    }
  }

# #Tests
# coord.convert("21 35 45", "dms.to.dd") #It works!


#Parsing out data (works for parentheses and plus/minus)----
sep.data <- function(dat, in_col, return = "Value") {
  if (return == "Both"){
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat %>% separate({{in_col}}, into = c("Value", "StdErr"), sep = "\\(|\\±|\\)", convert = TRUE)
    sep$Value <- as.numeric(sep$Value)
    sep$StdErr <- as.numeric(sep$StdErr)
    return(sep)
  } else if (return == "Value") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat %>% separate({{in_col}}, into = c("Value", "StdErr"), sep = "\\(|\\±|\\)", convert = TRUE)
    options(warn = defaultW)
    sep$Value <- as.numeric(sep$Value)
    return(sep$Value)
  } else if (return == "StdErr") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat %>% separate({{in_col}}, into = c("Value", "StdErr"), sep = "\\(|\\±|\\)", convert = TRUE)
    options(warn = defaultW)
    sep$StdErr <- as.numeric(sep$StdErr)
    return(sep$StdErr)
  } else {
    return("Must be Both, Value, or StdErr")
  }
}

# x <- data.frame(Value = #Create test data frame
#                   c("5(78)",
#                     "4 (56)",
#                     "4 ± 56",
#                     "4±56"))

# sep.data(x, in_col = Value) #Test! Works on parentheses and plus/minus!

#Parsing out lat/lon----
sep.coords <- function(dat, in_col, return = "LatLon") {
  if (return == "LatLon"){
    defaultW <- getOption("warn")
    options(warn = -1)
    dat %>% separate({{in_col}}, into = c("Lat", "Lon"), sep = "\\/|\\,", convert = TRUE) #Separate can only handle one argument. Use regex to do the job
  } else if (return == "Lat") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat %>% separate({{in_col}}, into = c("Lat", "Lon"), sep = "\\/|\\,", convert = TRUE)
    options(warn = defaultW)
    return(sep$Lat)
  } else if (return == "Lon") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat %>% separate({{in_col}}, into = c("Lat", "Lon"), sep = "\\/|\\,", convert = TRUE)
    options(warn = defaultW)
    return(sep$Lon)
  } else {
    return("Must be LatLon, Lat, or Lon")
  }
}

# x <- data.frame("latlon" =
#                   c("43.5/-67.9",
#                     "43.5,-67.9",
#                     "43.5, -67.9",
#                     "43.5 /-67.9"))
# sep.coords(x, in_col = "latlon") #It works!



# Dealing with units ------------------------------------------------------
#We will rely on the 'measurements' package to do the heavy lifting
convertSoilC <- function(val, from, to) {
  #We want all units to be in terms of carbon
  if (grepl("molC", from) == TRUE) { #If units are in MOLES convert dimensions
    from1 <- stri_replace_all_regex(from, #First remove the C and convert to moles
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    denominator <- sub('.*_per_', '', from) #Snag the denominator for unit conversion
    molC <- conv_multiunit(x = val, from = from1, to = paste0("mol / ",denominator)) #Convert given units to molC
    gC <- molC*12.01 #Convert moles of carbon to grams of carbon
    to1 <- stri_replace_all_regex(to, #Define to units in correct format
                                  pattern=c('_per_'), #Values to remove
                                  replacement=c(' / '), #Values to replace with
                                  vectorize=FALSE)
    out <- conv_multiunit(gC, paste0("g / ",denominator), to1) #Use function from measurements package for conversion
    out

  } else if (grepl("C", from) == TRUE) { #If the units are already in terms of CARBON, then do simple conversion
    from1 <- stri_replace_all_regex(from,
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    to1 <- stri_replace_all_regex(to,
                                  pattern=c('_per_'), #Values to remove
                                  replacement=c(' / '), #Values to replace with
                                  vectorize=FALSE)
    out <- conv_multiunit(val, from1, to1) #Use function from measurements package for conversion
    out
  } else  {
    val1 <- val #NEED TO PUT MODIFIER HERE
    from1 <- stri_replace_all_regex(from, #Otherwise
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    to1 <- stri_replace_all_regex(to,
                                  pattern=c('_per_'), #Values to remove
                                  replacement=c(' / '), #Values to replace with
                                  vectorize=FALSE)
    out <- conv_multiunit(val1, from1, to1) #Use function from measurements package for conversion
    out
  }
}

# convertSoilC(1, "kg_per_m2", "g / m2")


convertTreeC <- function(val, from, to) {
  #We want all units to be in terms of carbon
  if (from == "percent" && to == "g / g") {#This chunk allows us to work with percents
    val/100
  } else if (grepl("molC", from) == TRUE) { #If units are in MOLES convert to mass dimensions
    from1 <- stri_replace_all_regex(from, #First remove the C and convert to moles
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    denominator <- sub('.*_per_', '', from) #Snag the denominator for unit conversion
    molC <- conv_multiunit(x = val, from = from1, to = paste0("mol / ",denominator)) #Convert given units to molC
    gC <- molC*12.01 #Convert moles of carbon to grams of carbon
    to1 <- stri_replace_all_regex(to, #Define to units in correct format
                                  pattern=c('_per_'), #Values to remove
                                  replacement=c(' / '), #Values to replace with
                                  vectorize=FALSE)
    out <- conv_multiunit(gC, paste0("g / ",denominator), to1) #Use function from measurements package for conversion
    out

  } else if (grepl("C", from) == TRUE) { #If the units are already in terms of CARBON, then do simple conversion
    from1 <- stri_replace_all_regex(from,
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    to1 <- stri_replace_all_regex(to,
                                  pattern=c('_per_'), #Values to remove
                                  replacement=c(' / '), #Values to replace with
                                  vectorize=FALSE)
    out <- conv_multiunit(val, from1, to1) #Use function from measurements package for conversion
    out
  } else  {
    val1 <- val*0.48 #If values in terms of BIOMASS, convert to carbon assuming 48% carbon in biomass
    from1 <- stri_replace_all_regex(from,
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    to1 <- stri_replace_all_regex(to,
                                  pattern=c('_per_'), #Values to remove
                                  replacement=c(' / '), #Values to replace with
                                  vectorize=FALSE)
    out <- conv_multiunit(val1, from1, to1) #Use function from measurements package for conversion
    out
  }
}


# Calculate organic carbon stock in Mg ha-1 from SoilGrids database ------------------
#Uses data returned from fetchSoilGrids using the soilDB package
calc_soilC <- function(bdod, soc, hzdept, hzdepb) {
  #bdod: Bulk density of the fine earth fraction in cg/cm^3, need to convert to g/cm^3 first.
  #soc: Soil organic content in the fine earth fraction in dg/kg, need to convert to g/g first.
  bdod1 <- bdod*0.01 #g soil per cubic cm
  soc1 <- soc*0.1/1000 #g C per g soil
  ocd <- bdod1*soc1 #organic carbon density, g C per cubic cm
  #hzdept is the soil horizon top depth in cm
  #hzdepb is the soil horizon bottom depth in cm
  #Output organic carbon stocks in MgC per ha for the depth layer provided
  out <- ocd*0.000001*(hzdepb-hzdept)*0.00000001 #MgC per ha
  out
}


convertTreeCflux <- function(val, from, to) { #Inherits duration from "from"
  #We want all units to be in terms of carbon
  if (grepl("molC", from) == TRUE) { #If units are in MOLES convert to mass dimensions
    from1 <- stri_replace_all_regex(from, #First remove the C and convert to moles
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    middleTerm <- str_match(from, "_per_(.*?)_per_")[,2] #Extract area term. Note this only works when units before/after
    duration <- sub('.*_per_', '', from) #Snag the duration to inherit for output
    molC <- conv_multiunit(x = val, from = from1, to = paste0("mol / ",middleTerm, " / " ,denominator)) #Convert given units to molC
    gC <- molC*12.01 #Convert moles of carbon to grams of carbon
    to1 <- paste0(stri_replace_all_regex(to, #Define to units in correct format
                                         pattern=c('_per_'), #Values to remove
                                         replacement=c(' / '), #Values to replace with
                                         vectorize=FALSE), " / ", duration)
    out <- conv_multiunit(gC, paste0("g / ", middleTerm, " / ", denominator), to1) #Use function from measurements package for conversion
    out

  } else if (grepl("C", from) == TRUE) { #If the units are already in terms of CARBON, then do simple conversion
    duration <- sub('.*_per_', '', from) #Snag the duration to inherit for output
    from1 <- stri_replace_all_regex(from,
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    to1 <- paste0(stri_replace_all_regex(to,
                                         pattern=c('_per_'), #Values to remove
                                         replacement=c(' / '), #Values to replace with
                                         vectorize=FALSE), " / ", duration) #Inherit original time frame
    out <- conv_multiunit(val, from1, to1) #Use function from measurements package for conversion
    out
  } else  {
    val1 <- val*0.48 #If values in terms of BIOMASS, convert to carbon assuming 48% carbon in biomass
    duration <- sub('.*_per_', '', from) #Snag the duration to inherit for output
    from1 <- stri_replace_all_regex(from,
                                    pattern=c('C', '_per_'), #Values to remove
                                    replacement=c('', ' / '), #Values to replace with
                                    vectorize=FALSE)
    to1 <- paste0(stri_replace_all_regex(to,
                                         pattern=c('_per_'), #Values to remove
                                         replacement=c(' / '), #Values to replace with
                                         vectorize=FALSE), " / ", duration) #Inherit original time frame
    out <- conv_multiunit(val1, from1, to1) #Use function from measurements package for conversion
    out
  }
}


# Scaling soil C depth ------------------------------------------------------
scale.depth <- function(inValue, inDepth_cm, outDepth_cm = 5) { #This function will linearly scale soil C content on an areas basis given depth. Defaults to 0-5cm output
  c <- 0.275595 #Fit via a three parameter asymptotic regression model "AR.3()" using drc R package
  d <- 0.966278
  e <- 29.836626
  y1 <- c + (d-c)*(1-exp(-inDepth_cm/e))
  y2 <- c + (d-c)*(1-exp(-outDepth_cm/e))
  scaledValue <- inValue*(y2/y1)
  scaledValue
}

# Create function to deal with NA values in sum ------------------------------------------------------
na.sum <- function(...) {
  sum(..., na.rm = TRUE)
}

# Percent change ------------------------------------------------------
percentchange<-function(FinalValue,InitialValue){
  (FinalValue-InitialValue)/InitialValue*100
}









