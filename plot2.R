df <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?")# skip=66636, nrows=2880)

df$DateTime <- strptime( paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")

start <- as.Date("2007-02-01")

end <- as.Date("2007-02-02")

subset <- df[(df$Date %in% c(start, end)), ]

plot(subset$DateTime, subset$Global_active_power, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="", ylab='Global Active Power (kilowatts)')

dev.copy(png,filename="plot2.png",height=480, width=480)

dev.off()