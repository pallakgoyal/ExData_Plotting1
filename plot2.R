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
##change class of Global active power
Irving_ML_feb1$Global_active_power <- as.numeric(Irving_ML_feb1$Global_active_power)
##create new variable datetime
datetime <- paste(as.Date(Irving_ML_feb1$Date), Irving_ML_feb1$Time)
##add the newly created variable to subset of data
Irving_ML_feb1$DateTime <- as.POSIXct(datetime)
##open png file
png("./plot2.png")
##draw plot
with(Irving_ML_feb1, plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active POwer (kilowatts)", xlab = ""))
##closing the graphic 
dev.off()