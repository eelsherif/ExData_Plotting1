library(data.table)
electrical <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
electrical$Date <- as.Date(electrical$Date, format="%d/%m/%Y")

electrical_ss <- electrical[electrical$Date=="2007-02-01" | electrical$Date=="2007-02-02",]

electrical_ss <- data.frame(electrical_ss)

electrical_ss$Date_Time <- paste(electrical_ss$Date, electrical_ss$Time)
electrical_ss$Date_Time <- strptime(electrical_ss$Date_Time, format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

plot(electrical_ss$Date_Time, electrical_ss$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(electrical_ss$Date_Time, electrical_ss$Global_active_power, type="S")
dev.off()