file <- read.csv2("household_power_consumption.txt")
data <- subset(file,Date %in% c("1/2/2007","2/2/2007"))

globalActivePower <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

voltage <- as.numeric(data$Voltage)

globalReactivePower <- as.numeric(data$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(datetime,globalActivePower,ylab="Global Active Power (kilowatts)",type="l")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime,voltage,ylab="Voltage",xlab="datetime",type="l")

plot(datetime,globalReactivePower,ylab="Global Reactive Power",xlab="datetime",type="l")

dev.off()

