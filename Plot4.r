
# set working directory to where you downloaded the file
setwd(dir = "C:/Users/Daniela/Documents/R Coursera")
# read file
AllData <- read.table('C:/Users/Daniela/Documents/R Coursera/household_power_consumption.txt', sep = ';', nrows = 2075259, header = TRUE, quote = " ", stringsAsFactors = FALSE, strip.white = TRUE, na.strings = "?")
# check to see if it was downloaded properly
head(AllData)
# subset data from 1/2/2007 and 2/2/2007
Feb2007 <- subset(AllData, (AllData$Date == "1/2/2007" | AllData$Date == "2/2/2007"))
# change characters to dates
Feb2007$Date <- as.Date(Feb2007$Date, format = "%d/%m/%Y")
# create variable Date + Time
DateTime <- paste(as.Date(Feb2007$Date), Feb2007$Time)
Feb2007$DateTime <- as.POSIXct(DateTime)
# open PNG
png("Plot4.png", width = 480, height = 480)
# set 4x4
par(mfcol = c(2,2))
# make 1st plot, top left
plot(Feb2007$DateTime, Feb2007$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ")
# make 2nd plot, bottom left
plot(Feb2007$DateTime, Feb2007$Sub_metering_1, type = "l", ylab = "Enegy sub metering", xlab = " ")
lines(Feb2007$DateTime, Feb2007$Sub_metering_2, type = "l", col = "red")
lines(Feb2007$DateTime, Feb2007$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
# make 3rd plot, top right
plot(Feb2007$DateTime, Feb2007$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# make 4th plot, bottom right
plot(Feb2007$DateTime, Feb2007$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
# close device
dev.off()
