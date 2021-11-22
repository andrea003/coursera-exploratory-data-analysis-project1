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


# plot3
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png("plot3.png")
plot(data$Date_time, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data$Date_time, data$Sub_metering_2, col = "red")
lines(data$Date_time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 3, col = c("black", "red", "blue"))
dev.off()
