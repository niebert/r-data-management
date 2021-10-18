

moving_fun <- function(x, lb, ub, fun, ...) {
  # w is calculated window width plus 1 because the index is inclusive with the middle index 'i'
 w <- ub-lb + 1
  # x: a vector of real numbers
  # lb: lower bound of the window
  # ub: upper bound of the window
  # fun: a function that takes a vector and return a summarized/aggregated value, e.g., mean, sum, etc.
  # Given a double type vector apply a FUN over a moving window from left to the right, 
  #    when a window boundary is not a legal section, i.e. lower_bound and i (upper bound) 
  #    are not contained in the length of the vector, return a NA_real_
  output <- x
  for (i in 1:length(x)) {
     # 'lb' is a negative integer, i.e. moving averages starts with 'lb' values before index 'i'
    lower_bound <- i + lb
    upper_bound <- i + ub
    # Check lower bound
    if (lower_bound < 1) {
      # output[i] <- NA_real_
      lower_bound <- 1
    }
    # check upper bound
    if (upper_bound > length(x)) {
      upper_bound <- length(x)
    }
    # check symmetry of lower and upper bound distance to i 
       # calculate minimal distance from bounds to center i
    m <- min(i-lower_bound, upper_bound -i)
    # set lower bound with minimal distance of bounds to i
    #lower_bound <- i-m
    # set upper bound with minimal distance of bounds to i
    #upper_bound <- i+m
 
    # calculate the moving average
    output[i] <- fun(x[lower_bound:upper_bound, ...])
    
  }
  # return the populated vector "output"
  output
}


