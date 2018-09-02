setwd("C:\\Coursera\\Course_4\\Assignment_1")
library(data.table)
powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2075260, na.strings = "?", stringsAsFactors = FALSE)
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02", ]
powerdata <- powerdata[complete.cases(powerdata$Global_active_power), ]
datetime <-as.POSIXct(paste(powerdata$Date, powerdata$Time), format = "%Y-%m-%d %H:%M:%S")

plot(datetime, powerdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, powerdata$Sub_metering_2, col = "red")
lines(datetime, powerdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1))


dev.copy(png, file = "Plot3.png")
dev.off()