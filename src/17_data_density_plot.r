data_density_plot4range <- function (px,pxout,s_range,pt) {
  callprint("data_density_plot4range()")
  # px: vector of x-values from the input data
  # pxout: vector of x-values of the moving average
  # s_range: vector of different standard deviations, ranges for the inverse distance function
  # pt: threshold parameter
  
  y_zero <- numeric(length(px))
  
  #call: data_density(px,pxout,psd,pceps)
  # with 3 ranges and 0 as epsilon environment for center ceps
  # visible with 3 different graphs 
  dat_dens1 <- data_density(px, pxout, psd=s_range[1],pceps=0.0)
  # dat_dens1
  dat_dens2 <- data_density(px, pxout, psd=s_range[2],pceps=0.0)
  dat_dens3 <- data_density(px, pxout, psd=s_range[3],pceps=0.0)
  
  debugprint(paste("l.927 length(pxout)=",length(pxout)," length(dat_dens1)=",length(dat_dens1)))
 
  data_dens_xy <- data.frame(pxout, dat_dens1,dat_dens2,dat_dens3)
  col_name <- paste("Info Density with  s=",s_range)
  # PLOT Functions and Data
  p <- ggplot(data_dens_xy, aes(x=pxout, y="Information Density") ) 
  p <- p+ scale_fill_discrete(name="Info Density")
  Legend <- paste("Info Density with s=",s_range[1])
  p <- p + geom_line(data = data_dens_xy, colour = "red", 
             mapping = aes(x = pxout, y = dat_dens1))
  p <- p + geom_line(data = data_dens_xy, colour = "#009E73", 
             mapping = aes(x = pxout, y = dat_dens2))  # green
  p <- p + geom_line(data = data_dens_xy, colour = "blue", 
             mapping = aes(x = pxout, y = dat_dens3))
 
  data_xy <- data.frame(px,y_zero)
  # Insert Source Points "black"
  p <- p + geom_point(data = data_xy, 
             mapping = aes(x = px, y = y_zero))
  
  # return the plot the functions with ggplot
  p
}
