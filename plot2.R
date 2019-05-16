

read_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- subset(read_data, Date == "1/2/2007" | Date == "2/2/2007" )

df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

with(df, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()









