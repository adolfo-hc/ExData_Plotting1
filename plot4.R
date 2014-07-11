#Reading the data file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings = "?",
                 colClasses = c(rep("character", 2), rep("numeric", 7)))
#Substracting February 1 and 2, 2007
df2 <- df[((df$Date == "1/2/2007") | (df$Date == "2/2/2007")), ]
df2$newDate <- strptime(paste(df2$Date, df2$Time), "%d/%m/%Y %H:%M:%S",
                        tz = "GMT")

#Plot 4
png(file = "plot4.png", bg = "transparent", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(5, 4, 1, 2), oma = c(0, 1, 0, 0))
with(df2, {
  plot(newDate, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(newDate, Voltage, type = "l", ylab = "Voltage")
  plot(newDate, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    points(newDate, Sub_metering_2, type = "l", col = "red")
    points(newDate, Sub_metering_3, type = "l", col = "blue")
    legend("topright", pch = 151, col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), bty = "n")
  plot(newDate, Global_reactive_power, type = "l", ylab = "Global reactive power")
})

dev.off()