min_plot <- 0
max_plot <- 1

normalize_column_min_max <- function (pcol,pmin,pmax) {
  callprint("normalize_column_min_max()")
  norm_col <- normalize_column(pcol)
  norm_col <- (pmax - pmin) * norm_col + pmin
  # return norm_col
  norm_col
}

normalize_column_global <- function (pcol,pglobalcol) {
  callprint("normalize_column_global()")
  #norm_col <- normalize_column_min_max(pcol)
  pmin <- 0.0
  pmax <- 1.0
  min_global <- min(pglobalcol)
  max_global <- max(pglobalcol)
  min_col <- min(pcol)
  max_col <- max(pcol)
  error_count <- 0
  if (is.na(min_global)) {
    print("ERROR: min_global is not defined")
    min_global <- 0.0
    error_count <- error_count + 1
  }
  if (is.na(max_global)) {
    print("ERROR: max_global is not defined")
    max_global <- 1.0
    error_count <- error_count + 1
  }
  if (is.na(min_col)) {
    print("ERROR: min_col is not defined")
    min_col <- 0.0
    error_count <- error_count + 1
  }
  if (is.na(max_col)) {
    print("ERROR: max_col is not defined")
    max_col <- 1.0
    error_count <- error_count + 1
  }
  if (error_count > 0) {
    print ("WARNING: normalize without global settings")
  } else {
    delta_global <- max_global - min_global
    if (delta_global > 0) {
      pmin <- (min_col - min_global)/delta_global
      pmax <- (max_col - min_global)/delta_global
    }
  }
  norm_col <- normalize_column_min_max(pcol,pmin,pmax)
  # return norm_col
  norm_col
}

# test_col <- c(-10,100,30,400,300)
# test_global <- c(-200,-10,100,30,400,300,1000)

# normalize_column_global(pcol=test_col,pglobalcol = test_global)
