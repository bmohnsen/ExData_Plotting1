
dat <- read.csv("household_power_consumption.txt", 
                sep = ";", 
                header = T, 
                na.strings ="?", 
                colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 



dat1 <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]

rm(dat)

dat1$DateTime <- strptime(paste(dat1$Date, dat1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height = 480)

par(mfrow=c(2,2))


## 1
plot(dat1$DateTime, dat1$Global_active_power,type="l", xlab="",ylab="Global Active Power")

## 2
plot(dat1$DateTime, dat1$Voltage, type="l", xlab="datetime", ylab="Voltage")


## 3
plot(dat1$DateTime, dat1$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(dat1$DateTime, dat1$Sub_metering_2, col="red")
lines(dat1$DateTime, dat1$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,box.lwd=0)


## 4
plot(dat1$DateTime, dat1$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(dat1$DateTime, dat1$Global_reactive_power)

dev.off()
