get_wma <- function (pdata,pgas,pyear,pdepth,plocation) {
  callprint("get_wma()")
  # extract a weighted moving average for pgas,pyear,pdepth,plocation from pdata
  dat_xy <- get_data_xy(pdata,pgas,pyear,pdepth,plocation)
  if (nrow(dat_xy)>0) {
    #print(kable(dat_xy, format = "markdown",  table.attr = "border=1, cellpadding = 3,", longtable=TRUE, escape=FALSE))
    
  }
  wma_norm <- numeric(length(xout))
  px_all <- dat_xy$x
  py_all <- dat_xy$y
  px <- px_all[!is.na(py_all) ]
  py <- py_all[!is.na(py_all) ]
  debugprint(paste("CALL: get_wma(",pgas,",year=",pyear,",depth=",pdepth," ,rows=",nrow(dat_xy),",px=",length(px),",py=",length(py),sep=""))
  if (length(py)>0) {
    # debugprint(py)
    wma <- weighted_moving_average (x=px,y=py, xout=xout, s=s_range[1])
    wma_norm <- normalize_column(pcol=wma)
  } else {
    wma_norm
  }
  # return wma_norm
  wma_norm
}
