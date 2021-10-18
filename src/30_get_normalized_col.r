
get_normalized_shift_col <- function (pdata,pxout,pgas,pyear,pdepth,plocation,prange,pshift) {
  callprint(paste("get_normalized_shift_col(",pgas,",",pyear,",",pdepth,",",plocation,",",prange,",",pshift,")",sep=""))   
  ycol <- get_moving_average_shift_col(pdata,pxout,pgas,pyear,pdepth,plocation,prange,pshift)
  norm_col <- normalize_column(ycol)
  ### return normalized column norm_col
  norm_col
}

get_normalized_col <- function (pdata,pxout,pgas,pyear,pdepth,plocation,prange) {
  callprint(paste("get_normalized_col(",pgas,",",pyear,",",pdepth,",",plocation,",",prange,")",sep=""))   
  norm_col <- get_normalized_shift_col(pdata,pxout,pgas,pyear,pdepth,plocation,prange,pshift=0.0)
  ### return normalized column norm_col
  norm_col
}

# get_normalized_col(pdata=gas_data,pxout=xout,pgas="H2",pyear=2006,pdepth=5,plocation="Hainich 1",prange=0.6)
# get_normalized_shift_col(pdata=gas_data,pxout=xout,pgas="H2",pyear=2006,pdepth=5,plocation="Hainich 1",prange=0.6,pshift = 1.0)
