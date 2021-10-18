min_plot <- 0
max_plot <- 1

normalize_column_min_max <- function (pcol,pmin,pmax) {
  callprint("normalize_column_min_max()")
  norm_col <- normalize_column(pcol)
  norm_col <- (pmax - pmin) * norm_col + pmin
  # return norm_col
  norm_col
}
