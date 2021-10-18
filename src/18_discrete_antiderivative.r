discrete_antiderivative <- function(px,py) {
  callprint("discrete_antiderivative()")
  antideriv <- numeric(length(px))
  antideriv[1] <- 0.0
  kmax <- length(px)
  for (k in 2:kmax) {
    antideriv[k] <- antideriv[k-1] + 
                         (px[k]-px[k-1]) * py[k]
  }
  # print(paste("antiderivative: (",antideriv,")",sep=""))
  ### return antiderivative
  antideriv
}
