y1 <- rnorm(x_count, mean=50, sd=10)
# compute a MA(2)
m1 <- moving_fun(y1, -1, 1, mean)

# compute moving mean window from i-2 to i+2 
#m2 <- moving_fun(y1, -2, 2, mean)
# compute moving mean window from i-1 to i+1 on w1
m2 <- moving_fun(m1, -1, 1, mean)

# compute moving window from i-3 to i+3 
#m3 <- moving_fun(y1, -3, 3, mean)
# compute moving mean window from i-1 to i+1 on w2
m3 <- moving_fun(m2, -1, 1, mean)
