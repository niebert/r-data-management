x_min <- 1
x_max <- 7
x_span <- x_max - x_min
x_delta <- runif(x_count,x_min,x_max)

x2 <- vector("numeric", length=x_count)   # Definition of vector with length x_count
x2[1] <- x_delta[1] + 0.05

for (k in 2:x_count ) {
  x2[k] <- x2[k-1] + x_delta[k]
}

# normalize x2 with values between 1 and 12
x_norm <- 1.0 
# calculate the normalize value x_norm
if (max(x2)-min(x2) > 0) {
  x_norm <- max(x2)-min(x2)
}
# normalize x2 so that the values are between 1 and 12
x2 <- 1+11*(x2-min(x2))/x_norm
zero2 <- numeric(length(x2))
ggplot(data.frame(x2,y1,zero2),aes(x=x2, y=y2)) + geom_point() + geom_line(colour="violet")  + geom_line(aes(x=x2, y=zero2),colour="grey") + geom_point(aes(x=x2, y=zero2))
