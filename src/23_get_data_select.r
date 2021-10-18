get_data_select <- function (pdata,pgas,pyear,pdepth,plocation) {
  callprint("get_data_select()")
  data_select <- (!is.na(pdata[["x_day"]])) & (!is.na(pdata[[pgas]])) & (as.integer(pdata$year) == pyear) & (as.integer(pdata$depth) == pdepth)
  if (is.na(plocation)) {
    warnprint("REMARK: no plocation for get_data_select()",plevel=1)
  } else {
    data_select <- data_select & (pdata$location == plocation)
  }
  # kable
  #kable(pdata[data_select,], format = "markdown",  table.attr = "border=1, cellpadding = 3,", longtable=TRUE, escape=FALSE)
  # return data_select
  data_select
}

get_month_xy <- function (pdata,pgas,pyear,pmonth,pdepth,plocation) {
  callprint("get_month_xy()")
  if (is.na(pdepth)) {
    print("ERROR: get_month_xy() - pdepth undefined")
    pdepth <- 5
  }
  
  debugprint(paste("get_month_xy(pdata,",pgas,",",pyear,",",pmonth,",",pdepth,",",plocation,")", sep=""))
  syear <- paste(pyear,sep="")
  smonth <- paste(pmonth,sep="")
  sdepth <- paste(pdepth,sep="")
  mydata <- pdata[ 
              which(
                pdata$year==syear
              & pdata$month==smonth 
              & pdata$depth==sdepth 
              & pdata$location==plocation), ]
  dat_xy <- data.frame(x=mydata[["x_day"]], y=mydata[[pgas]])
  ## remove all NA rows in dat_xy
  dat_xy <- na.omit(dat_xy)
  debugprint(paste("CALL: get_month_xy(",pgas,"",pyear,",",pmonth,",",pdepth,",",plocation,")"))
  debugprint(paste("      rows dat_xy=",nrow(dat_xy)," rows with NA=",nrow(mydata)))
  # return selected dataframe dat_xy
  dat_xy
}

get_year_xy <- function (pdata,pgas,pyear,pdepth,plocation) {
  callprint("get_year_xy()")
  syear <- paste(pyear,sep="")
  sdepth <- paste(pdepth,sep="")
  mydata <- pdata[ 
              which(
                pdata$year==syear
              & pdata$depth==sdepth 
              & pdata$location==plocation), ]
  dat_xy <- data.frame(x=mydata[["x_day"]], y=mydata[[pgas]])
  ## remove all NA rows in dat_xy
  dat_xy <- na.omit(dat_xy)
  debugprint(paste("CALL: get_year_xy(",pgas,"",pyear,",",pdepth,",",plocation,")"))
  debugprint(paste("      rows dat_xy=",nrow(dat_xy)," without NA of rows=",nrow(mydata)))
  # return selected dataframe dat_xy
  dat_xy
}

get_data_xy <- function (pdata,pgas,pyear,pdepth,plocation) {
  callprint("get_data_xy()")
  ## e.g. pyear=2007
  year_before <- pyear - 1 # e.g. 2006 with pyear=2007
  year_after  <- pyear + 1 # e.g. 2008 with pyear=2007
  month_before <- get_month_xy(pdata,pgas,pyear=year_before,pmonth=12,pdepth,plocation)
  ## Shift x-value between (December) 12.0 and 13.0 to x-value between 0.0 and 1.0
  #print("Shift x-value between (December) 12.0 and 13.0")
  month_before[["x"]] <- month_before[["x"]] - 12.0
  year_xy      <- get_year_xy(pdata,pgas,pyear,pdepth,plocation)
  month_after  <- get_month_xy(pdata,pgas,pyear=year_after,pmonth=1,pdepth,plocation)
  ## Shift x-value between (January) 1.0 and 2.0 to x-value between 13.0 and 14.0
  month_after[["x"]]=month_after[["x"]] + 12.0
  #### concat dataframes month_before, year_xy, month_after
  debugprint(paste("concat ",pyear," dataframes month 12/",year_before,", year_xy, month 1/",year_after,sep=""))
  dat_xy <- rbind(month_before,year_xy)
  dat_xy <- rbind(dat_xy,month_after)
  #print(tail(dat_xy))
  debugprint(paste("CALL: get_data_xy(",pgas,",",pyear,",",pdepth,",",plocation,")",sep=""))
  debugprint(paste("      12/",year_before," and 01/",year_after," included",sep=""))
  debugprint(paste("      ",pyear," dat_xy=",nrow(dat_xy)," y",year_before,"=",nrow(month_before)," y",year_after,"=",nrow(month_after),sep=""))
  # return selected dataframe dat_xy
  dat_xy

}  

get_data_shift_xy <- function (pdata,pgas,pyear,pdepth,plocation,pshift) {
  callprint("get_data_shift_xy()")
  ## e.g. pyear=2007
  dat_xy <- pdata[FALSE, ]
  year_before <- pyear - 1 # e.g. 2006 with pyear=2007
  year_after  <- pyear + 1 # e.g. 2008 with pyear=2007
  debugprint(paste("CALL: get_shift_data_xy(",pgas,",",pyear,",",pdepth,",",plocation,",",pshift,")",sep=""))
  if (pshift > 0.0) {
    # POSITIVE SHIFT: shifts graph to the right and thus
    # positive pshifts load more previous month e.g. from 2006 for selected 2007
    debugprint(paste("Shifted positive with pshift=",pshift,sep=""))
    #print(paste("Shifted positive with pshift=",pshift,sep=""))
    month_shift <- -floor(-pshift) # if pshift=1.7 then month_shift=2
    ### LOAD FIRST MONTH OF PREVIOUS YEAR with x-values >=12+1-month_shift
    # if month_shift=2 then last_month=13-2=11 in the current year (e.g. 2007)
    
    # PREVIOUS YEAR (e.g. 2006) load all month for the previous year and if
    # pshift is positive, so more month from the previous year must be loaded
    month_start <- 12 - month_shift # if month_shift=2 then month_start=10
    debugprint(paste("Shifted positive with ",year_before,"/",month_start," start month",sep=""))
    for (imonth in month_start:12) {
      # load month imonth from pdata
      month_before <- get_month_xy(pdata,pgas,pyear=year_before,pmonth=imonth,pdepth,plocation)
      # shift x-values for the last month previous year to first month current year
      # if pshift=2.3 month_shift=3 -> 10/11/12 of previous year 2006 are prepended
      # e.g. if x-value=11.2 (2006) and pshift=2.3 new x=11.2 + 2.3 - 12 = 1.5 (2007)
      month_before[["x"]] <- month_before[["x"]] + pshift - 12
      x_vec <- month_before[["x"]]
      debugprint(paste("get_data_shift_xy() x=",(imonth+month_shift-12),".0 Month=",year_before,"/",imonth," shifted 1st x-value=",month_before[["x"]][1]," length(x_vec)=",length(x_vec),sep=""))
      # length(month_before[["x"]])
      dat_xy <- rbind(dat_xy,month_before)
    }
    # APPEND MONTH FOR SELECTED YEAR (e.g.2007)
    # if pshift=2.7 then month_shift=3
    last_month <- 13-month_shift # 11/12 of 2007 are not loaded
    #data_xy <- get_month_xy(pdata,pgas,pyear,pmonth=last_month,pdepth,plocation)
    for (i in 1:last_month) {
      imonth <- month_shift + i
      month_xy <- get_month_xy(pdata,pgas,pyear,pmonth=i,pdepth,plocation)
      # if pshift=2.7 imonth=10 and x=10.9 then shifted x-value is x=13.6
      month_xy[["x"]] <- month_xy[["x"]] + pshift
      # prepend the selected month before dat_xy - higher month index extracted first
      dat_xy <- rbind(dat_xy,month_xy)
      # if month_shift=3 then x=10.2 is shifted to x=13.2 as last month
      x_vec <- month_xy[["x"]]
      debugprint(paste("CALL: get_data_shift_xy() x=",imonth,".0 Month=",pyear,"/",i," shifted x-value=",month_xy[["x"]][1]," length(x_vec)=",length(x_vec),sep=""))
    }  
    # SELECTED YEAR (e.g. 2007) load all month for the previous year
    
  } else {
    if (pshift < 0.0) {
      # NEGATIVE SHIFT: shifts graph to the left and thus negative pshifts
      # load more month from the upcoming year e.g. from 2008 for selected 2007
      debugprint(paste("Shifted negative with pshift=",pshift,sep=""))
      month_shift <- floor(pshift) # if pshift=-1.7 then month_shift=-2
      month_start <- - month_shift # if month_shift=-2 then month_start=10
      ### LOAD MONTH FOR SELECTED YEAR e.g. 2007
      # due to left shift less first month are used for current year 2007.
      # if month_shift is at least -1, data from month 1/January is mapped to 
      # x-values 0 < x <1.
      # load the first month mapped to x-values >= -month_shift (e.g. = 2)
      # if month_shift=-2 then first_month=2 in the current year (e.g. 2007)
      first_month <- -month_shift
      data_xy <- get_month_xy(pdata,pgas,pyear,pmonth=first_month,pdepth,plocation)
      for (i in first_month:12) {
        imonth <- i - first_month
        debugprint(paste("x=",imonth,".0 pshift:",pshift," Year:",pyear," Month:",i," data appended",sep=""))
        month_xy <- get_month_xy(pdata,pgas,pyear,pmonth=i,pdepth,plocation)
        # if month_shift=-2 then x=2.2 is shifted to x=0.2 as first month
        month_xy[["x"]] <- month_xy[["x"]] + pshift
        # append the selected month before dat_xy - higher month index extracted first
        dat_xy <- rbind(dat_xy,month_xy)
        # month_shift is negative, so '+month_shift' shifts the x-values towards 0.
      }
      # NEXT YEAR (e.g. 2008) load all month for the next year and if
      # pshift is negative, more month from the next year must be loaded
      last_month <- - month_shift + 1 # if month_shift=-2 then last_month=2
      debugprint(paste("Shifted negative with last_month=",last_month,sep=""))
      for (imonth in 1:last_month) {
        # load month imonth from pdata
        month_after <- get_month_xy(pdata,pgas,pyear=year_after,pmonth=imonth,pdepth,plocation)
        # shift the x-values for the next year
        # e.g. if x-value=1.7 and pshift=-3 new x=12 + (-3) + 1.7 = 10.7
        month_after[["x"]] <- 12 + pshift + month_after[["x"]] 
        # month_after[["x"]]
        #debug
        debugprint(paste("x=",(12+month_shift+imonth),".0 Month=",year_after,"/",imonth," shifted 1st x-value=",month_after[["x"]][1],sep=""))
        length(month_after[["x"]])
        dat_xy <- rbind(dat_xy,month_after)
      }
   
    } else {
      # NO SHIFT
      # pshift = 0.0 means no shift and call the default get_data_xy(...) 
      debugprint(paste("No shifted applied with pshift=",pshift,sep=""))
      dat_xy <- get_data_xy(pdata,pgas,pyear,pdepth,plocation)
    }
  }
  debugprint(paste("concat ",pyear," dataframes month 12/",year_before,", year_xy, month 1/",year_after,sep=""))
  # return selected dataframe dat_xy
  dat_xy

}  

