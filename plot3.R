sdf <- read.csv('household_power_consumption.txt', stringsAsFactors=F, sep=';', na.strings='?')
sdf <- sdf[sdf$Date=='1/2/2007' | sdf$Date=='2/2/2007', ]
sdf$datetime <- as.POSIXct(paste(sdf$Date, sdf$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png")

plot(sdf$datetime, sdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sdf$datetime, sdf$Sub_metering_2, col="red")
lines(sdf$datetime, sdf$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
