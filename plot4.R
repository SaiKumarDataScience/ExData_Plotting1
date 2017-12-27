setwd('C:\\Sai\\Trainings\\Coursera\\DS_Course4_EDA\\week1_Project')

#Reading, subsetting power consumption data
powerdata <- read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors=FALSE,dec = ".")
names(powerdata)
nrow(powerdata)
ncol(powerdata)

powerdata_subset <- subset(powerdata,powerdata$Date %in% c("1/2/2007","2/2/2007"))
powerdata_subset <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

nrow(powerdata_subset)

datetime <- strptime(paste(powerdata_subset$Date, powerdata_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower   <- as.numeric(powerdata_subset$Global_active_power)
globalReactivePower <- as.numeric(powerdata_subset$Global_reactive_power)
voltage             <- as.numeric(powerdata_subset$Voltage)
subMetering1 <- as.numeric(powerdata_subset$Sub_metering_1)
subMetering2 <- as.numeric(powerdata_subset$Sub_metering_2)
subMetering3 <- as.numeric(powerdata_subset$Sub_metering_3)

png("plot4_1.png", width=480, height=480)
par(mfrow=c(2,2))

#Global Active Power
plot(datetime, globalActivePower, type="l",ylab = "Global Active Power", xlab="",cex=0.2)

#Voltage
plot(datetime, voltage, type="l",ylab = "Voltage", xlab="datetime")

#Energy Sub metering
plot(datetime, subMetering1, type="l", ylab="Energy Sub Metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Global Reactive Power
plot(datetime, globalReactivePower, type="l",ylab = "Global Rective Power", xlab="datetime")


dev.off()

