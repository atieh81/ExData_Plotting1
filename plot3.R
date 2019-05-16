

read_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- subset(read_data, Date == "1/2/2007" | Date == "2/2/2007" )

df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

png('plot3.png', width = 480, height = 480)
with(df, plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(df, lines(datetime, Sub_metering_2, col = "red"))
with(df, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()











