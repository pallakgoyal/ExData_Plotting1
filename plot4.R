##saving url for downloading data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##downloading data
download.file(url, destfile = "./UCI Irving Machine Learning Repository.zip")
##unzipping the data
unzip("./UCI Irving Machine Learning Repository.zip")
##reading data into R
Irving_ML <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
##subset data for two dates
Irving_ML_feb1 <- subset(Irving_ML, Irving_ML$Date == "1/2/2007" | Irving_ML$Date == "2/2/2007")
##turn the Global active power numeric
Irving_ML_feb1$Global_active_power <- as.numeric(Irving_ML_feb1$Global_active_power)
##create new variable datetime
datetime <- paste(as.Date(Irving_ML_feb1$Date), Irving_ML_feb1$Time)
##add the newly created variable to subset of data
Irving_ML_feb1$DateTime <- as.POSIXct(datetime)
##set par to display 4 graphs
par(mfcol = c(2, 2))
##plot Global active power
with(Irving_ML_feb1, plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
##plot energy sub metering
with(Irving_ML_feb1, plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(Irving_ML_feb1, lines(Sub_metering_2 ~ DateTime, col = "red"))
with(Irving_ML_feb1, lines(Sub_metering_3 ~ DateTime, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
##plot voltage
Irving_ML_feb1$Voltage <- as.numeric(Irving_ML_feb1$Voltage)
with(Irving_ML_feb1, plot(Voltage ~ DateTime, xlab = "datetime", type = "l"))
##plot Global reactive power
Irving_ML_feb1$Global_reactive_power <- as.numeric(Irving_ML_feb1$Global_reactive_power)
with(Irving_ML_feb1, plot(Global_reactive_power ~ DateTime, xlab = "datetime", type = "l"))
##save to png
dev.copy(png, file = "./plot4.png", height = 480, width = 480)
dev.off()