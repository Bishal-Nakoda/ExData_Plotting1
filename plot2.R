file <- read.csv2("household_power_consumption.txt")
data <- subset(file,Date %in% c("1/2/2007","2/2/2007"))

globalActivePower <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower,ylab="Global Active Power (kilowatts)",type="l")
dev.off()
