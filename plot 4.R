# download and unzip data from website


setwd("D:/Personal/Coursera/Exploratory Data Analysis")

if(!file.exists('data')) dir.create('data')

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

destfile <- "D:/Personal/Coursera/Exploratory Data Analysis/data/household_power_consumption.zip"

download.file(url, destfile)

unzip('./data/household_power_consumption.zip', exdir = './data')



## prepare plot 4


datetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
 
Global_active_power <- as.numeric(subsetted$Global_active_power)

Golbal_reactive_power <- as.numeric(subsetted$Global_reactive_power)
voltage <- as.numeric(subsetted$Voltage)

sub_metering1 <- as.numeric(subsetted$Sub_metering_1)
sub_metering2 <- as.numeric(subsetted$Sub_metering_2)
sub_metering3 <- as.numeric(subsetted$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Golbal_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()