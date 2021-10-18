wma_plot <- function (px,py,pxout,s_range,pt) {
  callprint("wma_plot()")
  # px: vector of x-values from the input data
  # py: vector of y-values from the input data
  # pxout: vector of x-values of the moving average
  # s_range: vector of different standard deviations, ranges for the inverse distance function
  # pt: threshold parameter
  wma1 <- weighted_moving_average(px,py, pxout, s_range[1])
  wma2 <- weighted_moving_average(px,py, pxout, s_range[2])
  wma3 <- weighted_moving_average(px,py, pxout, s_range[3])
  
  # Call: fct_threshold(py,pt)
  t_indicator <- fct_threshold(py=wma1,pt)
  # Call: max_min_indicator(pindicator,py)
  debugprint("Call:wma4 <- max_min_indicator(pindicator,py)")
  wma4 <- max_min_indicator(pindicator=t_indicator,py=wma1)
  
  #debugprint("Call: Before Splines Calculated")
  f_wma1 <- splinefun(pxout, wma1)
  f_wma2 <- splinefun(pxout, wma2)
  f_wma3 <- splinefun(pxout, wma3)
  #debugprint("Call: After Splines Calculated")
  
  xy_wma1 <- data.frame(pxout, wma1)
  xy_t1 <- data.frame(pxout,wma4)
  col_name <- paste("weighted MA s=",s_range)
  # PLOT Functions and Data
  p <- ggplot(xy_wma1, aes(x=pxout, y="Weighted Moving Average") ) 
  p <- p+ scale_fill_discrete(name="Spline Interpolation")
  Legend <- paste("weighted MA s=",s_range[1])
  p <- p + stat_function(fun = f_wma1, aes(x=pxout, y = wma1, col = Legend)) 
  p <- p + stat_function(fun = f_wma2, aes(x=pxout, y = wma2, col = paste("weighted MA s=",s_range[2])))
  p <- p + stat_function(fun = f_wma3,aes(x=pxout, y = wma3, col = paste("weighted MA s=",s_range[3])))
  data_xy <- data.frame(px, py)
  # Insert Source Points "black"
  p <- p + geom_point(data = data_xy, 
             mapping = aes(x = px, y = py))
  # Insert Linear Interpolation Source "violet"
  p <- p + geom_line(data = data_xy, colour = "violet", 
             mapping = aes(x = px, y = py))
  # Insert red indicator function
  p <- p + geom_line(data = xy_t1, colour = "red", linetype = "dashed", 
             mapping = aes(x = pxout, y = wma4))
  
  # return the plot the functions with ggplot
  p
}
