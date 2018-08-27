# shiny_mean
This repo is for a small shiny app that takes a vector of digits and returns:

  * Mean
  * Median
  * Range

Instead of using `fivenum` function, the three measures are called seperately, due to testing purposes. Speaking of testing, this will break if numbers are entered without space as a seperator. Pulling out digits by regex is the next step, as is calculating the mode.
