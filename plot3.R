## Plot 3 -- Time vs. energy sub metering

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Output to plot3.png
library(dplyr)
library(lubridate)

setwd("ExData_Plotting1")

## Note that in this dataset missing values are coded as ?.
# Read in the data, using the correct separator for the file and telling read.table about the file header
data <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?')

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
dataSubset <- subset(data, data$Date =='1/2/2007' | data$Date == '2/2/2007')

## Conmbine the date and time columns to one dateTime variable
dateTime = strptime(paste(dataSubset$Date, dataSubset$Time), format="%d/%m/%Y %H:%M:%S")

## Plot dateTime vs. submetering
plot(dateTime, dataSubset$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="", col='black')
points(dateTime, dataSubset$Sub_metering_2, type='l', col='red')
points(dateTime, dataSubset$Sub_metering_3, type='l', col='blue')
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "))

## Save to plot3.png
dev.copy(png, file = "plot3.png", width=480, height=480, units='px')

## Close the output device
dev.off()

