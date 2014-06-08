df <- read.csv('household_power_consumption.txt', stringsAsFactors=F, sep=';', na.strings='?')
sdf <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007', ]
sdf$datetime <- as.POSIXct(paste(sdf$Date, sdf$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot1.png")

hist(sdf$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
