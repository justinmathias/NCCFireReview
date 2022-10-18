##Created on 9/26/2022 by Justin Mathias ##
##This script will serve as a central hub for commonly utilized functions for ##
##the NCC Fire Review.

#First, load all packages
library("easypackages")
libraries(c("tidyverse", "openxlsx", "measurements", "stringi"))


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

#Tests
coord.convert("21 35 45", "dms.to.dd") #It works!


#Parsing out data (works for parentheses and plus/minus)----
sep.data <- function(dat, in_col, return = "Both") {
  if (return == "Both"){
    defaultW <- getOption("warn")
    options(warn = -1)
    dat %>% separate({{in_col}}, into = c("Value", "StdErr"), convert = TRUE)
  } else if (return == "Value") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat %>% separate({{in_col}}, into = c("Value", "StdErr"), convert = TRUE)
    options(warn = defaultW)
    return(sep$Value)
  } else if (return == "StdErr") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat %>% separate({{in_col}}, into = c("Value", "StdErr"), convert = TRUE)
    options(warn = defaultW)
    return(sep$StdErr)
  } else {
    return("Must be Both, Value, or StdErr")
  }
}

x <- data.frame(Value = #Create test data frame
                  c("5(78)",
                    "4 (56)",
                    "4 ± 56",
                    "4±56"))

sep.data(x, in_col = Value) #Test! Works on parentheses and plus/minus!

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

x <- data.frame("latlon" =
                  c("43.5/-67.9",
                    "43.5,-67.9",
                    "43.5, -67.9",
                    "43.5 /-67.9"))
dat <- sep.coords(x, in_col = "latlon")
dat #It works!



# Dealing with units ------------------------------------------------------
#We will rely on the 'measurements' package to do the heavy lifting


convertSoilC <- function(val, from, to) {
  #We want all units to be in terms of carbon
  if (grepl("C", from) == TRUE) { #If the units are already in terms of carbon, then do simple conversion
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
  } else {
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

convertSoilC(1, "kgC_per_m2", "g / m2")

# Scaling soil C depth ------------------------------------------------------
scale.depth <- function(inValue, inDepth_cm, outDepth_cm = 5) { #This function will linearly scale soil C content on an areas basis given depth. Defaults to 0-5cm output
  scaledValue <- inValue*(outDepth_cm/inDepth_cm)
  scaledValue
}
scale.depth(inValue = 5, inDepth_cm = 1, outDepth_cm = 5)


