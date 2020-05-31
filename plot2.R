library(dplyr)

setwd("D:/Lakshit/Courses/Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

data_file <- "./household_power_consumption.txt"

data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


subset_data <- data %>% 
  dplyr::filter(Date %in% c("12/2007","2/2/2007"))


datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subset_data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(x = datetime
     , y = globalActivePower
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()


