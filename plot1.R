library(dplyr)

setwd("D:/Lakshit/Courses/Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

raw <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = F)


subset_data <- raw %>% 
  dplyr::filter(Date %in% c("12/2007","2/2/2007")) %>% 
  dplyr::mutate(Global_active_power = as.numeric(Global_active_power))


globalActivePower <- as.numeric(subset_data$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off() 
