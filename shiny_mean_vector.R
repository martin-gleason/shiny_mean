#script for running operations and visualization

library(tidyverse)

string_to_vector <- function(x, pattern = "\\d*", ...){
  x <- x %>% str_extract(pattern = pattern)
  return(as.numeric(x))
}

