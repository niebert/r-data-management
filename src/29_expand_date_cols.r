library(lubridate)

expand_date_cols_xy <- function (pdata,pid) {
  callprint("expand_date_cols_xy()")
  # date column of loaded data in data.frame "pdata"
  datecol <- pdata[[pid]] 
  # max index for iteration and 
  imax <- length(datecol)
  year <- numeric(imax)
  month <- numeric(imax)
  # create datetime vector from source column
  datetimes <- strptime(datecol, format = "%d.%m.%Y") 
  # pdata[["year"]]: add a year column in data frame pdata
  #pdata$year <- format(as.Date(datetimes,  format="%Y-%m-%d"),"%Y")
  pdata$year <- format(datetimes,"%Y")
  pdata$month <- format(datetimes,"%m")
  #print(paste("Month in pdata",pdata$month))
  # pdata[["date"]]: 
  # Create a data frame column with standard date time format
  # i.e. 24.4.2003 will be converted into 2003-04-24
  pdata$date <- datetimes
  pdata$datestart <- format(as.Date(datetimes,  format="%Y-%m-%d"),"%Y-01-01")
  #LOOP: vectors that are populated with the following for-loop
  days <- numeric(imax)
  for(i in 1:imax) {
    if (is.na(datecol[i])) {
      days[i] <- NA
    } else {
      date_strings = c(pdata$date[i], pdata$datestart[i])
      # convert to datetime objects
      datepair <- strptime(date_strings, format = "%Y-%m-%d") 
      # calculated the difference in days between 01/01/Y and sampling date
      diff_in_days <- difftime(datepair[1], datepair[2], units = "days") 
      days[i] <- as.numeric(diff_in_days)
      # convert the year string in column "year" into an integer value
      # Call strtoi() for i-th line in column year - "string to integer"
      year[i] <- as.numeric(strtoi(pdata$year[i]))
      # convert the month string in column "month" into an integer value
      # Call strtoi() for i-th line in column month - "string to integer"
      month[i] <- as.numeric(strtoi(pdata$month[i]))
      # type of year[i] and month[i] is "double"
      #if (i<=10) {
      # debugprint(paste( year[i],typeof( year[i])))
      #}
    }
  }
  # populate the dataframe column "days" in "pdata" 
  pdata$days <- days
  # populate the dataframe column "year" in "pdata" 
  pdata$year <- year
  # populate the dataframe column "month" in "pdata" 
  pdata$month <- month
  # set the x-value for the day with 12*days[i]/366 + 1
  x_day <- 12*days/366 + 1
  pdata$x_day <- x_day
  # days/366 creates a value between 0 and 1
  # 12*days/366 creates a value between 0 and 12
  # 12*days/366 creates a value between 1 (=January 1st) and 13 (=January 1st next year) 
  # 12.5 is approx middle of december
  
  # return pdata
  pdata
}
