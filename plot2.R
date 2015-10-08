## Oct 8 2015
## Plot 2 --Time vs Global active power
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Output to plot2.png
library(dplyr)
library(lubridate)

## Note that in this dataset missing values are coded as ?.
# Read in the data, using the correct separator for the file and telling read.table about the file header
data <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?')

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
dataSubset <- subset(data, data$Date =='1/2/2007' | data$Date == '2/2/2007')

## Conmbine the date and time columns to one dateTime variable
dateTime = strptime(paste(dataSubset$Date, dataSubset$Time), format="%d/%m/%Y %H:%M:%S")

## Save to plot2.png
png(file = "plot2.png", width=480, height=480, units='px')
## Plot dateTime vs. global active power
plot(dateTime, dataSubset$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")


## Close the output device
dev.off()
