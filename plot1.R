
# Calculate rough amount of memory required (megabytes)
# round((2075259*9) * 8/2^{20},2) 
# ~ 142.5 MB

# Read in data
setwd("~/DataScienceCoursera")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset and format data
subs <- subset(data,  Date == "1/2/2007" | Date == "2/2/2007")
subs$Global_active_power <- as.numeric(as.character(subs$Global_active_power))

# Create and save plot
png(filename = "plot1.png", width = 480, height = 480)
hist(subs$Global_active_power,
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )
dev.off()