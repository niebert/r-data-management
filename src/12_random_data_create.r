get_random_y <-function (px,pstep) {
  ## generate uniform random numbers for every value in the vector px
  y_deriv <- 2 * pstep * runif(length(px)) - pstep
  #y_deriv
  ## create a discrete antiderivative from the random numbers.
  y_antideriv <- numeric(length(px))
  y_antideriv[1] <- y_deriv[1] * (px[2]-px[1])
  kmax <- length(px)
  for (k in 2:kmax) {
    y_antideriv[k] <- y_antideriv[k-1] + 
                         (px[k]-px[k-1]) * 
                         y_deriv[k]
  }
  ### return 
  y_antideriv
  #y_deriv
}

y0 <- get_random_y(px=xout,pstep=10.0)
plot(x=xout, y=y0, main = "Random Plot",type="l")
