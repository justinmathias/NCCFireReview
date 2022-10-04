##Created on 9/26/2022 by Justin Mathias ##
##This script will serve as a central hub for commonly utilized functions for ##
##the NCC Fire Review.

#First, load all packages
library("easypackages")
libraries(c("tidyverse", "openxlsx", "measurements"))


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
coord.convert("21 35 45", "dms.to.dd")
coord.convert("21 35 45", "dm.to.dd") #Should throw an error


#Parsing out data (works for parentheses and plus/minus)----
sep.data <- function(dat, in_col, return = "Both") {
  if (return == "Both"){
    defaultW <- getOption("warn")
    options(warn = -1)
    dat |> separate({{in_col}}, into = c("Value", "StdErr"), convert = TRUE)
  } else if (return == "Value") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat |> separate({{in_col}}, into = c("Value", "StdErr"), convert = TRUE)
    options(warn = defaultW)
    return(sep$Value)
  } else if (return == "StdErr") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat |> separate({{in_col}}, into = c("Value", "StdErr"), convert = TRUE)
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
    dat |> separate({{in_col}}, into = c("Lat", "Lon"), sep = "\\/|\\,", convert = TRUE) #Separate can only handle one argument. Use regex to do the job
  } else if (return == "Lat") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat |> separate({{in_col}}, into = c("Lat", "Lon"), sep = "\\/|\\,", convert = TRUE)
    options(warn = defaultW)
    sep$Lat <- as.numeric(sep$Lat)
    sep$Lon <- as.numeric(sep$Lon)
    return(sep$Lat)
  } else if (return == "Lon") {
    defaultW <- getOption("warn")
    options(warn = -1)
    sep <- dat |> separate({{in_col}}, into = c("Lat", "Lon"), sep = "\\/|\\,", convert = TRUE)
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
str(dat)




