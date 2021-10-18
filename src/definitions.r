# Years: plot range defined by year_min year_max
year_min <- 2004 # 2004
year_max <- 2015 # 2015
#year_max <- 2006
# define the gas_list
gas_list <- c("H2","CO2","N2O","d13C")
# define the location list i.e. "SAMPLE1" values in gas_data
location_list <- c("Hainich 1","Hainich 2","Hainich 3","Hainich 4")
# define the depth of sensors
depth_list <- c(5,10,20)

# Location of Plot - SAMPLE1
location <- "Hainich 1"
# x_count: number of random x-value
x_count <- 24
# x1: generated x-values
x1 <- seq(1:x_count)*0.5
# xout: equidistant x-value from 0 to 14 with delta-x=0.1
xout_default <- seq(from=0,to=14, by=0.1)
xout <- seq(from=0,to=14, by=0.1)
default_length <- length(xout)
# x_idf: x domain values for plotting inverse distance function
x_idf <- seq(from=0,to=14, by=0.1)
# inverse distance function default = 0 - see idf plot
# idf_width: width of epsilon environment of plateau around xc
idf_width <- 1.0
# used as parameter for function search_peak(px,py,px_start,px_stop)
x_indicator_min <- 3.1 # px_start
x_indicator_max <- 8.5 # px_stop
# s_spring: standard deviation inverse distance function for spring detection
s_spring <- 2.6
# x-value for the centre of spring - used in inverse_dist()-function as example
xc_spring <- 3.0
# s span for the inverse distance function - vector of positive real numbers
s_range  <- c(0.2,0.6,2)
range_default <- s_range[2]
# y2 sample data generated
y2 <- rnorm(x_count, mean=50, sd=10)
# threshold for the peak indicator 0.95 means peak indicator 1 
# if 95% of value range is exceeded 
thres_y <- 0.95

# calculation of average_data_density needs pxmin=average_xmin,pxmax=average_xmax
average_xmin <- 3.0
average_xmax <- 10.0
average_threshold      <- 0.8
average_threshold_d13C <- 0.3
average_alpha_cut <- 1.0
# minimum data quality im terms of y-value count
min_y_count <- 6

# Temperature Peak in x-month
temp_peak <- 7.5

# Perform moisture_transformation on y-value of moisture estimator
hum_trans <- TRUE

# Color setting
wma_color_black <- c("#000000","#595959","#b3b3b3","#e6e6e6") # black/greyscale
wma_color_green <- c("#004d00","#006600","#00cc00","#66ff66") # green
wma_color_red <- c("#800000","#cc0000","red","#ffb3b3") # red
wma_color_yellow <- c("#999900","#cccc00","#e6e600","#ffff00") # yellow
wma_color_blue <- c("#000066","#0000b3","#0000ff","#9999ff") # blue
wma_color <- wma_color_red
