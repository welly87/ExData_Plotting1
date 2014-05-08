df <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?")# skip=66636, nrows=2880)

df$DateTime <- strptime( paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")

start <- as.Date("2007-02-01")

end <- as.Date("2007-02-02")

subset <- df[(df$Date %in% c(start, end)), ]

png(filename="plot3.png",width=480, height=480, bg="white")

plot(subset$DateTime, subset$Sub_metering_1, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="", ylab='Energy sub Metering')

lines(subset$DateTime, subset$Sub_metering_2, type="l", lwd=1.5, col="red")

lines(subset$DateTime, subset$Sub_metering_3, type="l", lwd=1.5, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2,2,2),col=c("black","red", "blue"))

#dev.copy(png,filename="plot3.png",height=480, width=480)

dev.off()