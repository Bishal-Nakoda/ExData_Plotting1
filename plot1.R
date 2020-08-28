file <- read.csv2("household_power_consumption.txt")
data <- subset(file,Date %in% c("1/2/2007","2/2/2007"))

globalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()