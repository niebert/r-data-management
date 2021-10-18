normalize_column <- function (pcol) {
  callprint("normalize_column()")
  norm_col <- numeric(length(xout))
  if (length(pcol) > 0) {
    debugprint("CALL: normalize_column() - pcol is defined")
    # debugprint(pcol)
    if (length(pcol)>0) {
      norm_col <- numeric(length(pcol))
      min_col <- min(pcol)
      max_col <- max(pcol)
      debugprint(paste("CALL: normalize_column() - norm_col will be defined min_col=",min_col," max_col=",max_col,sep=""))
      if (is.na(max_col)) {
        max_col <- 1
        warnprint("ERROR: normalize_column() - max_col not numeric",plevel=3)
      }
      if (is.na(min_col)) {
        min_col <- 0
        warnprint("ERROR: normalize_column() - min_col not numeric",plevel=3)
      }
      if (!is.na(min_col) & !is.na(max_col) & max_col > min_col) {
        norm_col <- (pcol - min_col)
        norm_col <- norm_col/(max_col - min_col)
        debugprint("CALL: normalize_column() - normalization finished")
      } else {
        warnprint("ERROR: normalize_column() - normalization cause errors",plevel=1)
      }
    } else {
      warnprint("WARNING: normalize_column() call - length(pcol)=0 - nothing to normalize!",plevel=1)      
    }
  } else {
    warnprint("ERROR: normalize_column() call - pcol not defined",plevel=3)
  }
  # return norm_col
  norm_col
}
