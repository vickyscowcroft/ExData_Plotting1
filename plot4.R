## Plot 4 -- 4 plot array with plot 2 and plot 3 in left hand column, voltage vs. datetime in topright, global_reactive_power vs. datetime in bottomright
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Output to plot3.png
library(dplyr)
library(lubridate)

## Note that in this dataset missing values are coded as ?.
# Read in the data, using the correct separator for the file and telling read.table about the file header
data <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?')

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
dataSubset <- subset(data, data$Date =='1/2/2007' | data$Date == '2/2/2007')

## Conmbine the date and time columns to one dateTime variable
dateTime = strptime(paste(dataSubset$Date, dataSubset$Time), format="%d/%m/%Y %H:%M:%S")

## Set up the 2x2 lattice
par(mfrow = c(2, 2))
plot(dateTime, dataSubset$Global_active_power, type='l', ylab="Global Active Power", xlab="")
plot(dateTime, dataSubset$Voltage, type='l', ylab="Voltage", xlab="datetime")
plot(dateTime, dataSubset$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="", col='black')
points(dateTime, dataSubset$Sub_metering_2, type='l', col='red')
points(dateTime, dataSubset$Sub_metering_3, type='l', col='blue')
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "),bty='n')
plot(dateTime, dataSubset$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")


## Save to plot4.png
dev.copy(png, file = "plot4.png", width=480, height=480, units='px')

## Close the output device
dev.off()

