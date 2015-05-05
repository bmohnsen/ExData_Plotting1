dat <- read.csv("household_power_consumption.txt", 
                sep = ";", 
                header = T, 
                na.strings ="?", 
                colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 


                                                                                                                 
dat1 <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]
                                                                                                                 
png(filename = "plot1.png", width=480, height = 480)

                                                                                                                 
hist(dat1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
                                                                                                                 
dev.off()
