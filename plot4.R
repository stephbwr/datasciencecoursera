
# Calculate rough amount of memory required (megabytes)
# round((2075259*9) * 8/2^{20},2) 
# ~ 142.5 MB

# Read in data
setwd("~/DataScienceCoursera")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset and format data
subs <- subset(data,  Date == "1/2/2007" | Date == "2/2/2007")
subs$datetime <- strptime(paste(subs$Date, subs$Time), format = "%d/%m/%Y %H:%M:%S")

# Create and save plots
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(x = subs$datetime, 
     y = as.numeric(as.character(subs$Global_active_power)), 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power"
)

plot(x = subs$datetime, 
     y = as.numeric(as.character(subs$Voltage)), 
     type = "l",
     xlab = "datetime", 
     ylab = "Voltage"
)

plot(subs$datetime, 
     as.numeric(as.character(subs$Sub_metering_1)), 
     type = "l",
     xlab = "", 
     ylab = "Energy sub metering"
)
lines(subs$datetime, as.numeric(as.character(subs$Sub_metering_2)), col = "red")
lines(subs$datetime, as.numeric(as.character(subs$Sub_metering_3)), col = "blue")
legend("topright",  c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, bty = "n", col = c("black", "red", "blue"))

plot(x = subs$datetime, 
     y = as.numeric(as.character(subs$Global_reactive_power)), 
     type = "l",
     xlab = "datetime", 
     ylab = "Global_reactive_power"
)

dev.off()