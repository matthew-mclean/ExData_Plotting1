setwd("~/Data Science/Exploratory Data Analysis/Project1/Proj1Repo")
pc_full <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

pc_min_int <- pc_full[powerconsump$Date %in% c("1/2/2007","2/2/2007"), ] #We only want the data for these 2 days

pc <- cbind(datetime = strptime(paste(pc_min_int$Date,pc_min_int$Time),"%d/%m/%Y %H:%M:%S","CET"), #Combine the Date and Time columns and convert to a proper DateTime
            pc_min_int[c(-1,-2)])

png(file = "plot4.png", width = 480 , height = 480)
par(mfrow = c(2, 2))
with(pc, {
  plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(datetime, Voltage, type = "l")
  plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_1, col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(pc)[6:8], bty = "n")
  plot(datetime, Global_reactive_power, type = "l")
})
dev.off()
