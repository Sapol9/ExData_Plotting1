x = read.table("household_power_consumption.txt", header = TRUE, sep = ';')
x$Date <- as.Date(x$Date, "%d/%m/%Y")
x <- with(x,x[(Date >= "2007-02-01" & Date <= "2007-02-02"),])
x$TimeDate <- as.POSIXct(paste(x$Date, x$Time), format = "%Y-%m-%d %H:%M:%S")
png(filename = "Plot 2.png", width = 480, height = 480)
plot(x$TimeDate, x$Global_active_power, pch = '.', col = "white", xlab = "Date/Time", ylab = "Global Active Power (kilowatts)")
lines(x$TimeDate, x$Global_active_power)
dev.off()
