
#Read the txt file only to approx. 2/3/2007

data <- read.delim("household_power_consumption.txt", sep=";", nrows=70000)

#Transform date and time to standard forms
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
data <- transform(data, Time = strptime(Time, "%H:%M:%S"))

data <- transform(data, Global_active_power = as.double(Global_active_power))
data <- transform(data, Sub_metering_1 = as.double(Sub_metering_1))
data <- transform(data, Sub_metering_2 = as.double(Sub_metering_2))
data <- transform(data, Sub_metering_3 = as.double(Sub_metering_3))
data <- transform(data, Global_reactive_power = as.double(Global_reactive_power))

#Subset the appropriate timeframe
day1 <- data[data$Date == as.Date("2007-02-01"), ]
day2 <- data[data$Date == as.Date("2007-02-02"), ]

period <- rbind(day1, day2)

#plot 3
png(filename = "plot3.png")
plot(period$Sub_metering_1, period$time, main = "", ylab = "Energy sub metering", type = 'l')
lines(period$Sub_metering_2, period$time, main = "", ylab = "Energy sub metering", type = 'l', col = "red")
lines(period$Sub_metering_3, period$time, main = "", ylab = "Energy sub metering", type = 'l', col = "blue")
dev.off()





