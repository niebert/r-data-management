discrete_integral <- function (px,py,pxmin,pxmax) {
  callprint(paste("discrete_integral(px,py,pxmin=",pxmin,",pxmax=",pxmax,")", sep=""))
  x_max <- max(px)
  x_min <- min(px)
  if (pxmin < x_min) {
    warnprint(paste("discrete_integral(): pxmin<",x_min,"- pxmin := min(px)"),plevel=1)
    pxmin <- x_min
  }
  if (pxmax < x_max) {
    warnprint(paste("discrete_integral(): pxmax>",x_max,"- pxmax := max(px)"),plevel=1)
    pxmax <- x_max
  }
  ## determine the index i_min for pxmin
  i_min <- 1
  while ((i_min < length(px)) & (px[i_min] < pxmin)) {
    i_min <- i_min + 1
  }
  ## determine the index i_max for pxmax
  i_max <- i_min
  while ((i_max < (length(px)+1)) & (px[i_max] < pxmax)) {
    i_max <- i_max + 1
  }
  debugprint(paste("Min/Max Indices: i_min=",i_min," for pxmin=",pxmin," i_max=",i_max," for pxmax=",pxmax,sep=""))
  ## Calculate the discrete integral
  int_value <- 0.0  # & (length(px) = length(py))
  if ((length(px)>0) & (length(py)>0)) {
    if ((pxmin<pxmax) & (i_max < (length(px)+1))) {
      ## calculate the discrete interval 
      ## for interval [pxout_min,pxout_max]
      i_min <- i_min + 1
      for (k in i_min:i_max) {
        int_value <- int_value + (px[k]-px[k-1]) * (py[k]+py[k-1])*0.5
      }
    } else {
      print(paste("ERROR (calc integral): pxmin=",pxmin,
                  " pxmax=",pxmax,sep=""))
      
    }
  } else {
      print(paste("ERROR (calc integral): length(px)=",length(px), 
                  " length(py)=",length(py),pxmax,sep=""))
  }
  
  ## return calculation of discrete integral
  int_value
}
