get_data_density_shift <- function (pdata,pxout,pgas,pyear,pdepth,plocation,prange,pshift) {
  callprint("get_data_density_shift()")
  debugprint(paste("CALL:get_data_density_shift(pgas=",pgas," pyear=",pyear," pdepth=",pdepth," plocation=",plocation," prange=",prange,"pshift=",pshift,")",sep=""))
  dat_xy <- get_data_shift_xy(pdata,pgas,pyear,pdepth,plocation,pshift)
  # dat_xy <- get_data_xy(pdata,pgas,pyear,pdepth,plocation)
  if (nrow(dat_xy) >= min_y_count) {
    #print(kable(dat_xy, format = "markdown",  table.attr = "border=1, cellpadding = 3,", longtable=TRUE, escape=FALSE))
    
  }
  # set data density to zero line
  dat_dens <- numeric(length(xout))
  px_all <- dat_xy$x
  py_all <- dat_xy$y
  px <- px_all[!is.na(py_all) ]
  py <- py_all[!is.na(py_all) ]
  ## call_title will be used if an error occurs with warnprint(...) 
  ## to identify errors or inconsistency in parameters
  call_title <- paste("get_data_density_shift(",pgas,") year=",pyear," depth=",pdepth," pxout=",length(pxout)," rows=",nrow(dat_xy)," px=",length(px)," py=",length(py)," prange=",prange,sep="")
  debugprint(paste("CALL: ",call_title,sep=""))
  if (length(py) >= min_y_count) {
    # debugprint(py)
    dat_dens <- data_density(px, pxout, psd=prange,pceps=0.0)
    # dat_dens_norm <- normalize_column(dat_dens)
  } else {
    if (length(py)>0) {
      warnprint(paste("y-value vector length is ",length(py),"<",min_y_count," in call: ",call_title,plevel=0),plevel=1)
    } else {
      warnprint(paste("dat_dens is a zero-line in call: ",call_title),plevel=0)
    }
  }
  # return dat_dens y-values
  dat_dens
}

get_data_density <- function (pdata,pxout,pgas,pyear,pdepth,plocation,prange) {
  callprint("get_data_density()")
  dat_dens <- get_data_density_shift(pdata,pxout,pgas,pyear,pdepth,plocation,prange,pshift=0.0)
  ## return dat
  dat_dens
}

get_data_density_shift_aggregated4depth <- function (pdata,pxout,pgas,pyear,plocation,prange,pshift) {
  callprint(paste("get_data_density_shift_aggregated4depth(pgas=",pgas," pyear=",pyear," plocation=",plocation," prange=",prange," pshift=",pshift,")",sep=""))
  ## Strange error message: prange not used in this function
  prange <- prange + 0.0
  dat_dens5  <- get_data_density_shift (pdata,pxout,pgas,pyear,pdepth=5,plocation,prange,pshift)
  dat_dens10 <- get_data_density_shift (pdata,pxout,pgas,pyear,pdepth=10,plocation,prange,pshift)
  dat_dens20 <- get_data_density_shift (pdata,pxout,pgas,pyear,pdepth=20,plocation,prange,pshift)
  dat_dens <- dat_dens5 + dat_dens10 + dat_dens20
  # return dat_dens y-values
  dat_dens
}

get_data_density_aggregated4depth <- function (pdata,pxout,pgas,pyear,plocation,prange) {
  callprint(paste("get_data_density_aggregated4depth(pgas=",pgas," pyear=",pyear," plocation=",plocation," prange=",prange,")",sep=""))
  dens_col <- get_data_density_shift_aggregated4depth (pdata,pxout,pgas,pyear,plocation,prange,pshift=0.0)
  # return dens_col
  dens_col
}
