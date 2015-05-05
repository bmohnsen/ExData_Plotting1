dat <- read.csv("household_power_consumption.txt", 
                sep = ";", 
                header = T, 
                na.strings ="?", 
                colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 

     
dat1 <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]

rm(dat)
dat1$DateTime <- strptime(paste(dat1$Date, dat1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", 480, height = 480)

plot(dat1$DateTime, dat1$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
     
dev.off()