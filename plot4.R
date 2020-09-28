# Data cleaning
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data <- data[data[, "Date"] %in% c("1/2/2007", "2/2/2007"), ]
data$Date <- paste(data$Date, data$Time)
names(data)[1] <- "Date/Time"
data <- data[, -2]
data$`Date/Time` <- as.POSIXct(data$`Date/Time`, format = "%d/%m/%Y %H:%M:%OS")

# Plotting
png("plot4.png")
par(mfrow = c(2, 2))

# Plot 1
plot(data$`Date/Time`, data$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

# Plot 2
plot(data$`Date/Time`, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Plot 3
plot(data$`Date/Time`, data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
points(data$`Date/Time`, data$Sub_metering_2, type = "l", col = "red")
points(data$`Date/Time`, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Plot 4
plot(data$`Date/Time`, data$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()