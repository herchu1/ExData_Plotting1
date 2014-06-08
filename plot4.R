# This script assumes that the data file household_power_consumption.txt is
# in the current working directory.
# This scripts writes the file plot1.png in the current working directory.

# Reads the data file, filters rows and converts datetime column.
sdf <- read.csv('household_power_consumption.txt',
                stringsAsFactors=F, sep=';', na.strings='?')
sdf <- sdf[sdf$Date=='1/2/2007' | sdf$Date=='2/2/2007', ]
sdf$datetime <- as.POSIXct(paste(sdf$Date, sdf$Time), format="%d/%m/%Y %H:%M:%S")

# open the device
png(filename="plot4.png")

# defines a 2 by 2 layout
par(mfcol=c(2,2))

# the four plots
plot(sdf$datetime, sdf$Global_active_power,
     type="l",
     xlab="",
     ylab="Global active power (kilowatts)")

plot(sdf$datetime, sdf$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(sdf$datetime, sdf$Sub_metering_2,
      col="red")
lines(sdf$datetime, sdf$Sub_metering_3,
      col="blue")
legend("topright",
       lwd=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")

with(sdf, plot(datetime, Voltage, type="l"))

with(sdf, plot(datetime, Global_reactive_power, type="l"))

# close the device
dev.off()
