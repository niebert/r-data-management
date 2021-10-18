save_location_select <- function (pdata,plocation) {
  callprint("save_location_select()")
  data_select <- get_location_select(pdata,plocation)
  filename <- paste(plocation,".csv",sep="")
  # replace " " by underscore "_"
  filename <- gsub(" ","_",filename)
  debugprint(paste("CALL: save_location_select() - filename:",filename))
  write.csv(data_select,file=filename)
}

save_csv <- function (pfilename,pdataframe) {
  callprint("save_csv()")
  debugprint(paste("CALL: save_csv() - filename:",pfilename))
  write.csv(pdataframe,file=pfilename)
}

for (i in 1:length(location_list)) {
  save_location_select(gas_data,location_list[i]) 
}
