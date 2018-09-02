setwd("C:\\Coursera\\Course_4\\Assignment_1")
library(data.table)
powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2075260, na.strings = "?", stringsAsFactors = FALSE)
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02", ]
powerdata <- powerdata[complete.cases(powerdata$Global_active_power), ]
datetime <-as.POSIXct(paste(powerdata$Date, powerdata$Time), format = "%Y-%m-%d %H:%M:%S")

par(mfcol = c(2,2))
plot(datetime, powerdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

plot(datetime, powerdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, powerdata$Sub_metering_2, col = "red")
lines(datetime, powerdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex =0.85, lty=c(1,1,1), bty = "n")


plot(datetime, powerdata$Voltage, type = "l", ylab = "Voltage")
plot(datetime, powerdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

dev.copy(png, file = "Plot4.png")
dev.off()