library(dplyr)

setwd("D:/Lakshit/Courses/Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

data_file <- "./household_power_consumption.txt"

data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


subset_data <- data %>% 
  dplyr::filter(Date %in% c("12/2007","2/2/2007"))


datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subset_data$Global_active_power)


subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subMetering3 <- as.numeric(subset_data$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")

lines(datetime, subMetering2,col="red")

lines(datetime, subMetering3,col="blue")

legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

