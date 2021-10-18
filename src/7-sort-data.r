cH2 <- runif(100)*50+10
cN2O <- runif(100)*10+50
cCO2 <- runif(100)*200-50
cd13C <- runif(100)*1000+50
cYear <- runif(100)*20+1989


measure_df <- data.frame(cYear,cH2,cN2O,cCO2,cd13C)
sorted_df <- measure_df[order(cYear),]
measure_df
sorted_df
