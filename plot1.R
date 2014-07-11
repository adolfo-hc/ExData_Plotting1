#Reading the data file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings = "?",
                 colClasses = c(rep("character", 2), rep("numeric", 7)))
#Substracting February 1 and 2, 2007
df2 <- df[((df$Date == "1/2/2007") | (df$Date == "2/2/2007")), ]
df2$newDate <- strptime(paste(df2$Date, df2$Time), "%d/%m/%Y %H:%M:%S",
                        tz = "GMT")

#Plot 1
png(file = "plot1.png", bg = "transparent", width = 480, height = 480, units = "px")

with(df2, hist(Global_active_power, col = "red",
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)"))

dev.off()