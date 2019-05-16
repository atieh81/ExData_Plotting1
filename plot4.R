

read_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- subset(read_data, Date == "1/2/2007" | Date == "2/2/2007" )
df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

png('plot4.png', width = 480, height = 480)

par(mfrow = c(2,2))

#Plot 1
with(df, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#Plot 2
with(df, plot(datetime, Voltage, type = "l"))

#Plot 3
with(df, plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(df, lines(datetime, Sub_metering_2, col = "red"))
with(df, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1)

#Plot 4
with(df, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

