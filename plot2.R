# Data cleaning
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data <- data[data[, "Date"] %in% c("1/2/2007", "2/2/2007"), ]
data$Date <- paste(data$Date, data$Time)
names(data)[1] <- "Date/Time"
data <- data[, -2]
data$`Date/Time` <- as.POSIXct(data$`Date/Time`, format = "%d/%m/%Y %H:%M:%OS")

# Plotting
png("plot2.png")
plot(data$`Date/Time`, data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()