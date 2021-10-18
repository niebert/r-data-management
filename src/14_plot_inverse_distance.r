plot_inverse_distance <- function (pxc,pceps) {
  callprint("plot_inverse_distance()")
  # idf1,... are vectors with length(x_idf) entries
  idf1 <- inverse_dist(x=x_idf,xc=pxc,s=s_range[1],ceps=pceps)
  idf2 <- inverse_dist(x=x_idf,xc=pxc,s=s_range[2],ceps=pceps)
  idf3 <- inverse_dist(x=x_idf,xc=pxc,s=s_range[3],ceps=pceps)
  xy_idf1 <- data.frame(x_idf, idf1)
  f_idf1 <- splinefun(x_idf, idf1)
  f_idf2 <- splinefun(x_idf, idf2)
  f_idf3 <- splinefun(x_idf, idf3)
  # c1 <- cbind("weighted mean s=",s_range[1])
  # d <- data.frame(x=1:n, y=rnorm(n))
  col_name <- paste("weighted mean s=",s_range)
  Legend <- paste("weighted mean s=",s_range[1])
  p2 <- ggplot(xy_idf1, aes(x=x_idf, y="Invers Distance")) 
  p2 <- p2 + stat_function(fun = f_idf1, aes(x=x_idf, y = idf1, col = Legend)) 
  p2 <- p2 + stat_function(fun = f_idf2, aes(x=x_idf, y = idf2, col = col_name[2]))
  p2 <- p2 + stat_function(fun = f_idf3, aes(x=x_idf, y = idf3, col = col_name[3]))
  p2 <- p2 + geom_vline(xintercept=c(pxc), linetype="dashed")
  # return p2
  p2
  
}

# test function
# x_center <- 4.0
# plot_inverse_distance(pxc=x_center,0)

# pxc (parameter) is the center of the plateau
# pceps (parameter) is epsilon value for center of plateau
#  plot_inverse_distance(pxc=9,pceps=0)
