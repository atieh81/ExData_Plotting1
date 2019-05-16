

read_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- subset(read_data, Date == "1/2/2007" | Date == "2/2/2007" )

with(df, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()
