df <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?")# skip=66636, nrows=2880)

#df$Date <- strptime(df$Date, "%d/%m/%Y")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")

df$Time <- strptime(df$Time, "%H:%M:%S")

start <- as.Date("2007-02-01")

end <- as.Date("2007-02-02")

subset <- df[(df$Date %in% c(start, end)), ]

#png("plot1.png", width = 480, height = 480)

hist(subset$Global_active_power, col="red", main = "Histogram of Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png,filename="plot1.png",height=480, width=480)

dev.off()