
# Calculate rough amount of memory required (megabytes)
# round((2075259*9) * 8/2^{20},2) 
# ~ 142.5 MB

# Read in data
setwd("~/DataScienceCoursera")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset and format data
subs <- subset(data,  Date == "1/2/2007" | Date == "2/2/2007")
subs$datetime <- strptime(paste(subs$Date, subs$Time), format = "%d/%m/%Y %H:%M:%S")

# Create and save plot
png(filename = "plot3.png", width = 480, height = 480)
plot(subs$datetime, 
     as.numeric(as.character(subs$Sub_metering_1)), 
     type = "l",
     xlab = "", 
     ylab = "Energy sub metering"
)
lines(subs$datetime, as.numeric(as.character(subs$Sub_metering_2)), col = "red")
lines(subs$datetime, as.numeric(as.character(subs$Sub_metering_3)), col = "blue")
legend("topright",  c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, col = c("black", "red", "blue"))
dev.off()