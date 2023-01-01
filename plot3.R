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
##change class of Date
Irving_ML_feb1$Date <- as.Date(Irving_ML_feb1$Date, format = "%d/%m/%Y")
##create new variable datetime
datetime <- paste(as.Date(Irving_ML_feb1$Date), Irving_ML_feb1$Time)
##add the newly created variable to subset of data
Irving_ML_feb1$DateTime <- as.POSIXct(datetime)
##change class of sub metering 
Irving_ML_feb1$Sub_metering_1 <- as.numeric(Irving_ML_feb1$Sub_metering_1)
Irving_ML_feb1$Sub_metering_2 <- as.numeric(Irving_ML_feb1$Sub_metering_2)
Irving_ML_feb1$Sub_metering_3 <- as.numeric(Irving_ML_feb1$Sub_metering_3)
##create png file
png("./plot3.png")
with(Irving_ML_feb1, plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(Irving_ML_feb1, lines(Sub_metering_2 ~ DateTime, col = "red"))
with(Irving_ML_feb1, lines(Sub_metering_3 ~ DateTime, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()