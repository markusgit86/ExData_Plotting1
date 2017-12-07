temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
df1 <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep =";", na.strings = "?")
unlink(temp)

df2 <- na.omit(df1)

df2$datetime <- paste(df2$Date, " ", df2$Time)
df2$Date <- as.Date(df2$Date, format = "%d/%m/%Y")

df2$datetime <- as.POSIXct(df2$datetime, format="%d/%m/%Y %H:%M:%S")

df3 <- subset(df2, Date=="2007-02-01" | Date=="2007-02-02")

png("plot4.png", width = 480, height = 480)


par(mfrow = c(2, 2))
with(df3, {
  plot(df3$datetime, df3$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(df3$datetime, df3$Voltage, type ="l", ylab = "Voltage", xlab = "")
  plot(df3$datetime, df3$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "")
  lines(df3$datetime, df3$Sub_metering_2, type = "l", col="red")
  lines(df3$datetime, df3$Sub_metering_3, type = "l", col="blue")
  
  legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
  plot(df3$datetime, df3$Global_reactive_power, type ="l", ylab = "Global Reactive Power (kilowatts)", xlab = "")
  
})

dev.off()  
