setwd('C:\\Sai\\Trainings\\Coursera\\DS_Course4_EDA\\week1_Project')
par(mfrow=c(1,1))

#Plot 1
#Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power)
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
nrow(power)
ncol(power)

subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

png("plot1.png", width=480, height=480)

#calling the histogram function
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")

dev.off()
