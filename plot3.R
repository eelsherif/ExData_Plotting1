library(data.table)
electrical <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
electrical$Date <- as.Date(electrical$Date, format="%d/%m/%Y")

electrical_ss <- electrical[electrical$Date=="2007-02-01" | electrical$Date=="2007-02-02",]

electrical_ss <- data.frame(electrical_ss)

electrical_ss$Date_Time <- paste(electrical_ss$Date, electrical_ss$Time)
electrical_ss$Date_Time <- strptime(electrical_ss$Date_Time, format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(electrical_ss$Date_Time, electrical_ss$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(electrical_ss$Date_Time, electrical_ss$Sub_metering_1, col = "black", type = "S")
lines(electrical_ss$Date_Time, electrical_ss$Sub_metering_2, col = "black", type = "S")
lines(electrical_ss$Date_Time, electrical_ss$Sub_metering_3, col = "black", type = "S")
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()