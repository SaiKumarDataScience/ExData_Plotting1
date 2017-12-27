setwd('C:\\Sai\\Trainings\\Coursera\\DS_Course4_EDA\\week1_Project')

#Plot 2
#Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec = ".")
names(power)
nrow(power)
ncol(power)

subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
nrow(subpower)

datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subpower$Global_active_power)

png("plot2.png", width=480, height=480)

#calling the basic plot function
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# annotating graph
title(main="Global Active Power")

dev.off()
