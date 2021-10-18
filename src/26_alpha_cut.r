alpha_cut <- function (py,palpha) {
  callprint("alpha_cut()")
  # py : parameter contains the vector of y-values
  # palpha : parameter that defines the alpha-threshold
  yalpha <- length(py)
  if (length(py) > 0) {
     for (i in 1:length(py)) {
       if (py[i] > palpha) {
         yalpha[i] <- palpha
       } else {
         yalpha[i] <-  py[i]
       }
     }    
  }
  # return yalpha
  yalpha
}

