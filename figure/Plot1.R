setwd("C:\\Coursera\\Course_4\\Assignment_1")
library(data.table)

powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2075260, na.strings = "?", stringsAsFactors = FALSE)
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02", ]
hist(powerdata$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "Plot1.png") 
dev.off()