library(dplyr)

setwd("D:/Lakshit/Courses/Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

data_file <- "./household_power_consumption.txt"

data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


subset_data <- data %>% 
  dplyr::filter(Date %in% c("12/2007","2/2/2007"))


datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subset_data$Global_active_power)

globalReactivePower <- as.numeric(subset_data$Global_reactive_power)

voltage <- as.numeric(subset_data$Voltage)


subMetering1 <- as.numeric(subset_data$Sub_metering_1)

subMetering2 <- as.numeric(subset_data$Sub_metering_2)

subMetering3 <- as.numeric(subset_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()