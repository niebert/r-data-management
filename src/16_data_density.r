data_density <- function (px,pxout,psd,pceps) {
  callprint("data_density()")
  # px: parameter is vector of x-values for which the 
  # pxout: vector of (in general equidistant) x-values for which
  #    the information density will be calculated and plotted 
  # psd: used as standard deviation of inverse distance function
  # pceps: epsilon environment around center xc=px[i] - peak plateau
  if (is.na(pceps)) {
    pceps <- 0.0
  }
  dat_dens <- numeric(length(pxout))
  # integral over density function should be normalized over interval [pxout_min,pxout_max] 
  pxout_min <- min(pxout)
  pxout_max <- max(pxout)
  # x_range is needed to normalize the information density.
  pxout_span <- pxout_max - pxout_min
  debugprint(paste("CALL: data_density() length(px)=",length(px),"length(pxout)=",length(pxout)," length(dat_dens)=",length(dat_dens)))
  
  imax <- length(px)
  kmax <- length(pxout)
  for (i in 1:imax) {
    # calculate the inverse distance for px[i] with psd
    x_dens <- inverse_dist(x=pxout,xc=px[i],s=psd,ceps = 0.0)
    # x_dens <- inverse_dist(x=pxout,xc=px[i],s=psd,ceps = pceps)
    dat_dens <- dat_dens + x_dens
   
    # incorporate density contribution at xc=px[i] to dat_dens
    for (k in 1:kmax) {
      # set component k to maximum of 
      #  a) current information density dat_dens[k] 
      #  b) information density calculated for xc=px[i]
      #dat_dens[k] <- max(dat_dens[k],x_dens[k])
      #dat_dens[k] <- dat_dens[k] + x_dens[k]
    }
  }
  ## calculate the discrete interval for interval [pxout_min,pxout_max]
  debugprint(paste("CALL: data_density() - for discrete_integral calculation"))
  discrete_integral <- 0.0
  for (k in 2:kmax) {
    discrete_integral <- discrete_integral + 
                         (pxout[k]-pxout[k-1]) * 
                         (dat_dens[k]+dat_dens[k-1])*0.5
  }
  # normalize integral: dat_dens/discrete_integral -> intgral = 1
  # pxout_span * dat_dens/discrete_integral -> mean height is 1
  # length(px) * dat_dens/discrete_integral -> integral over pxout = number of input values
  if (discrete_integral > 0.0) {
    dat_dens <- length(px) * dat_dens/discrete_integral
  }
  #dat_dens <- inverse_dist(x=pxout,xc=5,s=0.1,ceps = pceps)
  debugprint("RETURN data_density() dat_dens")
  # return dat_dens
  dat_dens
}
