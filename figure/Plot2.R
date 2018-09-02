setwd("C:\\Coursera\\Course_4\\Assignment_1")
library(data.table)
powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2075260, na.strings = "?", stringsAsFactors = FALSE)
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02", ]
powerdata <- powerdata[complete.cases(powerdata$Global_active_power), ]
datetime <-as.POSIXct(paste(powerdata$Date, powerdata$Time), format = "%Y-%m-%d %H:%M:%S")

plot(datetime, powerdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.copy(png, file = "Plot2.png")
dev.off()