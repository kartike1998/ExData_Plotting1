# Data cleaning
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data <- data[data[, "Date"] %in% c("1/2/2007", "2/2/2007"), ]
data$Date <- paste(data$Date, data$Time)
names(data)[1] <- "Date/Time"
data <- data[, -2]
data$`Date/Time` <- as.POSIXct(data$`Date/Time`, format = "%d/%m/%Y %H:%M:%OS")

# Plotting
png("plot3.png")
plot(data$`Date/Time`, data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
points(data$`Date/Time`, data$Sub_metering_2, type = "l", col = "red")
points(data$`Date/Time`, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()