## repeated commands on the top of every file in project
# reading data file
source <- "household_power_consumption.txt"
data <- read.table(source, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# subsetting data for mentioned date
dateddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plotting
# histogram for plot3

datetime <- strptime(paste(dateddata$Date, dateddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering_1 <- as.numeric(dateddata$Sub_metering_1)
submetering_2 <- as.numeric(dateddata$Sub_metering_2)
submetering_3 <- as.numeric(dateddata$Sub_metering_3)
png("plot3.png")
plot(datetime, submetering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, submetering_2, type="l", col="red")
lines(datetime, submetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


