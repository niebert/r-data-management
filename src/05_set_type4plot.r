
get_line_type4plot <- function (pgas,pshiftgas) {
  callprint("get_line_type4plot()")
  if (pgas == pshiftgas) {
    line_type <- "dotted"
  } else {
    line_type <- ""
  }
  # return line_type
  line_type
}
