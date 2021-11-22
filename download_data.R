library(tidyverse)

### DOWNLOAD AND UNZIP THE DATA

filename <- "Electric power consumption.zip"

# download dataset and unzip files
if (!file.exists(filename)) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, filename, method = "curl")
}

# unzip file
if (!file.exists("Electric power consumption")) {
    unzip(filename)
}


### LOAD THE DATASET

# calculate the proximate memory usage using number of rows and columns 

# bytes 2,075,259 rows, 9 columns, 8 bytes
2075259*9*8
# 149,418,648

# bytes/MG
2075259*9*8/2^(20)

# MB
round(2075259*9*8/2^(20), 2)

# GB
round(2075259*9*8/2^(20)/1024, 2)


# read the data
sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";")

# copy of dataset in workspace if we need to reset changes
data_copy <- data
data <- data_copy
