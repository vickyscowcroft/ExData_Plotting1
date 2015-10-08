## Oct 8 2015
## Plot 1 -- histogram of Global Active Power
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Output to plot1.png
library(dplyr)

## Note that in this dataset missing values are coded as ?.
# Read in the data, using the correct separator for the file and telling read.table about the file header
data <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?')

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
dataSubset <- subset(data, data$Date =='1/2/2007' | data$Date == '2/2/2007')

## Save output to .png file
png(file = "plot1.png", width=480, height=480, units='px')
## Make histogram with red bars, correct xlabel and title
## cex changes the font size
hist(dataSubset$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main="Global Active Power")

## Close the output device
dev.off()

