average_data_density <- function (px,py,pxmin,pxmax) {
  callprint("average_data_density()")
  debugprint(paste("CALL: data_quality_index(px,,py,pxmin=",pxmin,",pxmax=",pxmax,")", sep=""))
  x_max <- max(px)
  x_min <- min(px)
  if (pxmin < x_min) {
    debugprint(paste("WARNING: pxmin=",pxmin,"<",x_min,"- pxmin := min(px)"))
    pxmin <- x_min
  }
  if (pxmax > x_max) {
    debugprint(paste("WARNING: pxmax=",pxmax,">",x_max,"- pxmax := max(px)"))
    pxmax <- x_max
  }
  ## calculate the span 
  x_span <- pxmax-pxmin
  dis_int <- discrete_integral(px,py,pxmin,pxmax)
  if (x_span > 0) {
    av_dat_dens <- dis_int/(pxmax-pxmin)    
  } else {
    av_dat_dens <- dis_int
    print("ERROR: Call of average_data_density() - Problem: x_span < 0 ")
  }
  
  ## return average data density
  av_dat_dens
}
