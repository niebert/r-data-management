weighted_moving_average <- function(x,y, xout, s, ...) {
  # x: a vector of x-values of real numbers
  # y: a vector of y-value of real numbers (or vector of vectors in IR^n)
  # xout: a vector of x-values of real numbers for which the weighted moving average is calculated
  # s: smoothing range of inverse distance for moving average
  # invers_dist function a non-negative function with symmetry to y-axis and lim_{x-> +infty} dist_fun(x) = 0
  i_max <- length(xout)
  output <- numeric(i_max)   # Definition of output, has dimension of xout
  w <- numeric(i_max)    # Weights invers distance  
  for (i in 1:i_max) {
     # calculate the weights by invers distance function
    w <- inverse_dist(x,xc=xout[i],s,ceps=0)
    if (length(y) != length(w)) {
      stop("Different length of weight vector and y-values vector")
    }
    w_sum  <- sum(w) 
    if (w_sum != 0) {
      w <- w/w_sum
    }
    output[i] <- sum(w*y)
  }
  # return the populated dataframe
  output
}
