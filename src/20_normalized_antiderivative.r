normalized_antiderivative <- function(px,py) {
  callprint("normalized_antiderivative()")
  antideriv <- discrete_antiderivative(px,py)
  norm_antiderivative <- normalize_column(antideriv)
  ### return norm_antiderivative
  norm_antiderivative
}

y0 <- get_random_y(px=xout,pstep=10.0)
y1 <- normalized_antiderivative(px=xout,py=y0)
plot(x=xout, y=y0, main = "Random Derivative Plot",type="l")
plot(x=xout, y=y1, main = "Normalized Antiderivative Plot",type="l")
