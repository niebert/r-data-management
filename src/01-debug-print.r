
debugprint <- function(ptext) {
  ## debugprint is defined to set debugging 
  if (BOOL_debugprint == TRUE) {
    print(ptext) ## print ptext
  }
  #t <- ptext ## don't print ptext
}
callprint <- function(ptext) {
  ## callprint is defined to print the function 
  if (BOOL_callprint == TRUE) {
    print(paste("CALL:",ptext)) ## print ptext
  }
  #t <- ptext ## don't print ptext
}
warnprint <- function(ptext,plevel) {
  ## warnprint outputs a warning in the algorithm 
  if (INT_warnlevel <= plevel) {
    print(paste("WARNING Level ",plevel,":",ptext,sep = "")) ## print ptext
  }
  #t <- ptext ## don't print ptext
}

outprint <- function(ptext) {
  ## outprint is defined to set specific output for temporary code analysis 
  if (BOOL_outprint == TRUE) {
    print(ptext) ## print ptext
  }
  #t <- ptext ## don't print ptext
}

print_vector <- function(pvarname,pvector) {
  # vectors are printed depending on BOOL_outprint
  if (BOOL_outprint == TRUE) {
    print(paste(pvarname,"=(",paste(pvector,collapse =","),")",sep = "")) 
  }
}
