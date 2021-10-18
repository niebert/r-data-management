{r def_get_gas_color_vector}

get_gas_color_vector <- function (pgas) {
  callprint("get_gas_color_vector()")
  # pgas: H2, CO2, d13C, N2O
  # plevel: color level 1,2,3 - higher levels create brighter colors
  colorname <- "black"
  vcolor_vector <- wma_color_black
  if (pgas == "H2") {
    vcolor_vector <- wma_color_blue
    colorname <- "blue"
  }
  if (pgas == "CO2") {
    vcolor_vector <- wma_color_red
    colorname <- "red"
  }
  if (pgas == "N2O") {
    vcolor_vector <- wma_color_yellow
    colorname <- "yellow"
  }
  if (pgas == "d13C") {
    vcolor_vector <- wma_color_green
    colorname <- "green"
  }
  debugprint(paste("get_gas_colo_vector(",pgas,")=",colorname,sep="") )
  ### return the color with different brightness
  vcolor_vector
}


get_gas_color <- function (pgas,plevel) {
  callprint("get_gas_color()")
  # pgas: H2, CO2, d13C, N2O
  # plevel: color level 1,2,3 - higher levels create brighter colors
  colorlevel <- 1
  if (is.na(pgas)) {
    debugprint("Color level is set to default color, i.e. plevel=1")
  } else {
    colorlevel <- plevel
  }
  if (colorlevel > 3) {
    debugprint("CALL: get_gas_color() - Color level undefined")
    colorlevel <- 1
  }
  vcolor <- "black"
  vcolorvector <- get_gas_color_vector(pgas)
  ### use colorlevel+1 to make the color brighter, 0 is the darkest color
  vcolor <- vcolorvector[colorlevel+1]
  debugprint(paste("get_gas_color(",pgas,",",colorlevel,")=",vcolor,sep="") )
  ### return the color in the selected color level (i.e. brightness)
  vcolor
}
