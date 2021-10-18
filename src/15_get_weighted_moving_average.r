get_moving_average_shift_col <- function (pdata,pxout,pgas,pyear,pdepth,plocation,prange,pshift) {
  callprint(paste("get_moving_average_shift_col(",pgas,",",pyear,",",pdepth,",",plocation,",",prange,",",pshift,")",sep=""))
  # pxout: vector of x-values of the moving average
  # pdata: contains the loaded data in the data.frame
  # pyear: selected year of data
  # pdepth: selected depth of data
  #data_select <- get_data_select(pdata,pgas,pyear,pdepth,plocation)
  # prange: is the smoothing factor e.g. prange= 0.6 
  # pshift: shifts the x-values with pshift
  dat_xy <- get_data_shift_xy(pdata,pgas,pyear,pdepth,plocation,pshift)
  #y_data <- pdata[[pgas]][data_select]
  #x_data <- pdata[["x_day"]][data_select]
  x_data <- dat_xy[["x"]]
  y_data <- dat_xy[["y"]]
  debugprint(paste("y_data for moving average length",length(y_data)))
  # calculate the moving average for all s_ranges
  if (length(y_data) > 0) {
    wma1 <- weighted_moving_average (x=x_data,y=y_data, xout=pxout, s=prange)
    #wma1 <- weighted_moving_average(x_data,y_data, pxout, s_range[1])
    #wma2 <- weighted_moving_average(x_data,y_data, pxout, s_range[2])
    #wma3 <- weighted_moving_average(x_data,y_data, pxout, s_range[3])
    # normalize the column
    wma <- wma1
    wma <- normalize_column(pcol=wma1)
    debugprint("DONE: get_moving_average_shift_col() - normalize_column(wma1) done")
  } else {
    warnprint("no y_data for calculation of moving average ",plevel=1)
    wma <- numeric(default_length)
  }
  # return moving average
  wma
}

get_moving_average_col <- function (pdata,pxout,pgas,pyear,pdepth,plocation,prange) {
  callprint(paste("get_moving_average_col(",pgas,",",pyear,",",pdepth,",",plocation,",",prange,")",sep=""))
  # pxout: vector of x-values of the moving average
  # pdata: contains the loaded data in the data.frame
  # pyear: selected year of data
  # pdepth: selected depth of data
  #data_select <- get_data_select(pdata,pgas,pyear,pdepth,plocation)
  # prange: is the smoothing factor e.g. prange= 0.6 
  data_xy <- get_moving_average_shift_col(pdata,pxout,pgas,pyear,pdepth,plocation,prange,pshift=0.0)
}

# test function
# ycol <- get_moving_average_col(pdata=gas_data,pxout=xout,pgas="H2",pyear=2006,pdepth=5,plocation="Hainich 1",prange=0.6)
