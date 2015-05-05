dat <- read.csv("household_power_consumption.txt", 
                sep = ";", 
                header = T, 
                na.strings ="?", 
                colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 


dat1 <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]
rm(dat)
dat1$DateTime <- strptime(paste(dat1$Date, dat1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height = 480)


plot(dat1$DateTime, dat1$Sub_metering_1, type = "l", col="black", xlab = "", ylab = "Energy sub metering")
lines(dat1$DateTime, dat1$Sub_metering_2, col = "red")
lines(dat1$DateTime, dat1$Sub_metering_3, col = "blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()