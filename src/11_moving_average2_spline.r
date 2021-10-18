d <- data.frame(x1,y1)
f1 <- splinefun(x1, m1)
f2 <- splinefun(x1, m2)
f3 <- splinefun(x1, m3)
# d <- data.frame(x=1:n, y=rnorm(n))

# PLOT: Insert Source Points "black"
p1 <- ggplot(d, aes(x=x1, y=y1)) + geom_point()    
p1 <- p1 + stat_function(fun = f1, aes(x=x1, y = m1, col = "mean1"))   
p1 <- p1 + stat_function(fun = f2, aes(x=x1, y = m2, col = "mean2"))    
p1 <- p1 + stat_function(fun = f3,aes(x=x1, y = m3, col = "mean3"))
data_xy <- data.frame(x1, y1)
# Insert Linear Interpolation Source "violet"
p1 <- p1 + geom_line(data = data_xy, colour = "violet", 
             mapping = aes(x = x1, y = y1, col = "source"))
  
p1
