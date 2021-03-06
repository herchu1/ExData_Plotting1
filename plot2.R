# This script assumes that the data file household_power_consumption.txt is
# in the current working directory.
# This scripts writes the file plot1.png in the current working directory.

# Reads the data file, filters rows and converts datetime column.
sdf <- read.csv('household_power_consumption.txt',
                stringsAsFactors=F, sep=';', na.strings='?')
sdf <- sdf[sdf$Date=='1/2/2007' | sdf$Date=='2/2/2007', ]
sdf$datetime <- as.POSIXct(paste(sdf$Date, sdf$Time), format="%d/%m/%Y %H:%M:%S")

# open the device
png(filename="plot2.png")

# the plot
plot(sdf$datetime, sdf$Global_active_power,
     type="l",
     xlab="",
     ylab="Global active power (kilowatts)")

# close the device
dev.off()
