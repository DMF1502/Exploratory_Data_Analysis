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
# open PNG file
png("Plot1.png", width = 480, height = 480)
# create histogram
hist(Feb2007$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
# set device off
dev.off()
