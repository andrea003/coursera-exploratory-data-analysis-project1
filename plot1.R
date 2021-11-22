# read the data
sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";")

# check structure of dataset
str(data)

# copy of dataset in workspace if we need to reset changes
data_copy <- data
data <- data_copy

# change Date column to date-format and select the two dates
data <- data %>%
        mutate(Date = dmy(Date)) %>%
        filter(Date >= "2007-02-01" & Date <= "2007-02-02")


# plot 1
# change column from character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = " Global Active Power (kilowatts")
dev.off()
