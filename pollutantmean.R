# Intall and load data.table...
# install.packages("data.table")

# Presume the data.table package has already been installed. If not has to install it 
# using  -- install.packages("data.table")
library(datasets)
library(data.table)

# ++++++++++++++++++++++++++++++++++++++++++++++++ Part-1 Function ++++++++++++
pollutantmean <- function(dirName, pollutant, id = 1:332) {
  
  
  filenames <- sprintf("%03d.csv", id)
  filenames <- paste(dirName, filenames, sep="/")
  ldf <- lapply(filenames, read.csv)
  
  # Converting the Data Frame to Data Table to transform multiple DFs to a data table
  tDT <- rbindlist(ldf)
  
  #mean(tDT[c(pollutant)], na.rm = TRUE,trim = 0.001)
  mean(tDT[[pollutant]], na.rm = TRUE,trim = 0)
}
