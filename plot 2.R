# download and unzip data from website


setwd("D:/Personal/Coursera/Exploratory Data Analysis")

if(!file.exists('data')) dir.create('data')

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

destfile <- "D:/Personal/Coursera/Exploratory Data Analysis/data/household_power_consumption.zip"

download.file(url, destfile)

unzip('./data/household_power_consumption.zip', exdir = './data')



# read data in
location <- file('./data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(location),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

## look at data
head(data)

## filter to needed data
subsetted <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



## prepare plot 2

datetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(subsetted$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
