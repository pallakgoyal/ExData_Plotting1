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
##create png file
png(file = "./plot1.png")
hist(Irving_ML_feb1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()