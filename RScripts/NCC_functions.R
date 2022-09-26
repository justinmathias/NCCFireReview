#####################Created on 9/26/2022 by Justin Mathias#####################
##This script will serve as a central hub for commonly utilized functions for ##
##the NCC Fire Review.

#First, load all packages
library("easypackages")
libraries(c("tidyverse", "openxlsx", "measurements"))

#Let's start by creating functions that we will then wrap into a single function for working with lat/lon
dms.to.dd <- function(dms) {
  dd <- conv_unit(dms, from = "deg_min_sec", to = "dec_deg")
  }

coord.convert <- function(coord, fn){

  if(fn == "dms.to.dd"){
    dd <- dms.to.dd(coord)
    return(round(as.numeric(dd), 6))
  }

}


coord.convert("21 35 45", "dms.to.dd")
