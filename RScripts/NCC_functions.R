#####################Created on 9/26/2022 by Justin Mathias#####################
##This script will serve as a central hub for commonly utilized functions for ##
##the NCC Fire Review.

#First, load all packages
library("easypackages")
libraries(c("tidyverse", "openxlsx", "measurements"))

#Let's start by creating functions that we will then wrap into a single function for working with lat/lon
#We will build out complexity later to deal with formatting
dms.to.dd <- function(dms) {
  dd <- conv_unit(dms, from = "deg_min_sec", to = "dec_deg")
  }
dd.to.dms <- function(dd) {
  dms <- conv_unit(dd, from = "dec_deg", to = "deg_min_sec")
}

coord.convert <- function(coord, fn){
  fns <- c("dms.to.dd", "dd.to.dms") #First list all possible functions
  if(!fn %in% fns){
    stop(paste0("Specified function must be one of:\n"), paste(fns, " ")) #Write error message if fn isn't listed
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




