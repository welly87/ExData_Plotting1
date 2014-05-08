df <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?")# skip=66636, nrows=2880)

df$DateTime <- strptime( paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")

start <- as.Date("2007-02-01")

end <- as.Date("2007-02-02")

subset <- df[(df$Date %in% c(start, end)), ]

png(filename="plot4.png",width=480, height=480, bg="white")

par(mfrow = c(2, 2))

# chart global active power

plot(subset$DateTime, subset$Global_active_power, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="", ylab='Global Active Power')

# chart voltage

plot(subset$DateTime, subset$Voltage, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="datetime", ylab='Voltage')

# chart energy sub metering     

plot(subset$DateTime, subset$Sub_metering_1, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="", ylab='Energy sub Metering')

lines(subset$DateTime, subset$Sub_metering_2, type="l", lwd=1.5, col="red")

lines(subset$DateTime, subset$Sub_metering_3, type="l", lwd=1.5, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2),col=c("black","red", "blue"))

# chart global reactive power

plot(subset$DateTime, subset$Global_reactive_power, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="datetime", ylab='Global_reactive_power')


dev.off()