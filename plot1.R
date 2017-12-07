





  
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  df1 <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep =";", na.strings = "?")
  unlink(temp)
  
  df2 <- na.omit(df1)
  df2$Date <- as.Date(df2$Date, format = "%d/%m/%Y")
  df3 <- subset(df2, Date=="2007-02-01" | Date=="2007-02-02")
  
  png("plot1.png", width = 480, height = 480)
  hist(df3$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)")
  dev.off()  
  
  
  
  
  




