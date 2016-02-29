x = read.table("household_power_consumption.txt", header = TRUE, sep = ';')
x$Date <- as.Date(x$Date, "%d/%m/%Y")
x <- with(x,x[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

par(mfrow = c(2,2))

png(filename = "Plot 4.png", width = 480, height = 480)

par(mfrow = c(2,2))
#Plot 1
hist(as.numeric(x$Global_active_power), col = "red", main = "Global Active Power", xlab = " Global Active Power (kilowatts)")

#Plot 2
x$TimeDate <- as.POSIXct(paste(x$Date, x$Time), format = "%Y-%m-%d %H:%M:%S")
plot(x$TimeDate, x$Global_active_power, pch = '.', col = "white", xlab = "Date/Time", ylab = "Global Active Power (kilowatts)")
lines(x$TimeDate, x$Global_active_power)

#Plot 3
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)
plot(x$TimeDate, x$Sub_metering_1,pch = '.', col = "black", xlab = "Date/Time", ylab = "Energy sub metering")
lines(x$TimeDate, x$Sub_metering_1,col = "black")
lines(x$TimeDate, x$Sub_metering_2,col = "red")
lines(x$TimeDate, x$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1            ", "Sub_metering_2", "Sub_metering_3"), cex = 1, pt.cex = 1,lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red","blue"))

#Plot 4
plot(x$TimeDate, x$Global_reactive_power, pch = '.', xlab = "Date/Time", ylab = "Global Reactive Power")
lines(x$TimeDate, x$Global_reactive_power)

dev.off

##I somehow got this to work...not sure how exactly. Having issues with saving it as a .png
