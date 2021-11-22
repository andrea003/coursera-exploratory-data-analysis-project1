# read the data
sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";")

# check structure of dataset
str(data)

# copy of dataset in workspace if we need to reset changes
data_copy <- data
data <- data_copy

# filter the two dates
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# change date and time
data$Date_time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)


# plot 2
png("plot2.png")
plot(data$Date_time, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts")
dev.off()
