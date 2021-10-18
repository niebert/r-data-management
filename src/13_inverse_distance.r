
inverse_dist <- function (x, xc, s, ceps, ...) {
  # callprint("inverse_dist()")
  # x:  a vector of x-values of real numbers
  # xc: a real x-value as center for which the invers distance is calculated
  # s:  positive real number, that works like 
  #     standard deviation in normal distribution
  # ceps: epsilon environment around center xc - peak plateau - ceps=0 > single point peak 
  # ------
  # w: vector of same length of x with the returned weights
  w <- numeric(length(x))   # Definition of vector with length x_count
  if (is.na(xc) == TRUE) {
    warnprint("ERROR: inverse distance xc undefined",plevel=1)
  } else {
    if (length(x) == 0) {
      warnprint(paste("ERROR inverse distance length(x)=0"," xc:",xc," ceps:",ceps," s:",s),plevel=1)
    } else {
      for (k in 1:(length(x))) {
        if (x[k] >= xc+ceps) {
          w[k] <- 1/(1+(x[k]-(xc+ceps))^2/s)
        } else if (x[k]<= xc-ceps) {
          w[k] <- 1/(1+(x[k]-(xc-ceps))^2/s)
        } else {
          w[k] <- 1
        }
      }
    }
  }
  # return the vector with weights 
  w
}
