df <- structure(list(Datechar = c("2013-03-01", "2013-03-06", "2013-03-07", 
    "2013-03-12", "2013-03-13", "2013-03-15", "2013-04-11", "2013-04-09"), Kg = c(271L, 374L, 
    51L, 210L, 698L, 328L,34L,56L)), .Names = c("Datechar", "Kg"), class = "data.frame", row.names = c("1", 
    "2", "3", "4", "5", "6","7","8"))
# convert character to date
df$Date <- as.Date(df$Datechar)

# calculate mean kg for each week
library(lubridate)
df_week <- tapply(df$Kg, week(df$Date), mean)
df_month <- tapply(df$Kg, month(df$Date), mean)


tapply2dataframe <- function (pvec,pcolnames) {
  max_vec <- as.integer(length(pvec))
  print(paste("Length tapply vector",max_vec))
  vx <- as.integer(names(pvec))
  vy <- pvec
  for (i in 1:length(pvec)) {
    print(paste("x=",vx[i]," y=",vy[i]))
  }
  vdf <- data.frame(x=vx,y=vy)
  colnames(vdf) <- pcolnames 
  ### return vdf
  vdf
}

df_w <- tapply2dataframe(df_week,c("Week No", "Average Value"))
# colnames(df_week) <- c("Week No", "Average Value")
df_m <- tapply2dataframe(df_month,c("Month No", "Average Value"))
# colnames(df_month) <- c("Month No", "Average Value")


kable(df_week, format = "markdown",  table.attr = "border=1, cellpadding = 3,", longtable=TRUE, escape=FALSE)
kable(df_month, format = "markdown",  table.attr = "border=1, cellpadding = 3,", longtable=TRUE, escape=FALSE)
names(df_week)
