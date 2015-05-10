## Plot 1 -- histogram of Global Active Power
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Output to plot1.png
library(dplyr)
setwd("ExData_Plotting1")

## Note that in this dataset missing values are coded as ?.
# Read in the data, using the correct separator for the file and telling read.table about the file header
data <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?')

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
dataSubest <- subset(data, data$Date =='1/2/2007' | data$Date == '2/2/2007')

## Make histogram with red bars, correct xlabel and title
hist(dataSubset$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main="Global Active Power")

hist(dataSubset$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main="Global Active Power", cex.axis=0.8, cex.lab=0.8, cex.main=0.9)
## Save output to .png file
dev.copy(png, file = "plot1.png", width=480, height=480, units='px')

## Close the output device
dev.off()

