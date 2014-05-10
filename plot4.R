setwd("C:\\Data Science\\4. Exploratory Data Analysis\\Course Project 1")

data = read.table("./household_power_consumption.txt", header=TRUE, colClasses="character", sep=";")

data[,1] = as.Date(data[,1],format="%d/%m/%Y")
data[,3] = as.numeric(data[,3])
data[,4] = as.numeric(data[,4])
data[,5] = as.numeric(data[,5])
data[,6] = as.numeric(data[,6])
data[,7] = as.numeric(data[,7])
data[,8] = as.numeric(data[,8])
data[,9] = as.numeric(data[,9])

subData = data[(data[,1]=="2007-02-01" | data[,1] == "2007-02-02"),]

subData = cbind(weekdays(subData[,1],abbreviate=TRUE), subData)

names(subData)[1] = "Day"

subData = cbind(paste(subData$Date, subData$Time), subData)
names(subData)[1] = "DateTime"

# Set the plots dimensions and margin
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))

# First Plot - Global Active Power
plot(subData[,5], type = "l", ylim=c(0,8), axes = F, xlab="", ylab="Global Active Power")
sizeData = length(subData[,1])
axis(1, at=c(1,sizeData/2,sizeData), lab=c("Thu", "Fri", "Sat"))
axis(2, at=c(0,2,4,6), lab=c(0,2,4,6))
box()

# 2nd Plot - Voltage
minVoltage = min(subData[,7])
maxVoltage = max(subData[,7])

plot(subData[,7], type = "l", ylim=c(minVoltage,maxVoltage), axes = F, xlab="", ylab="Voltage")
sizeData = length(subData[,1])
axis(1, at=c(1,sizeData/2,sizeData), lab=c("Thu", "Fri", "Sat"))
axis(2, at=c(234,238,242,246), lab=c(234,238,242,246))
box()

# 3rd Plot
plot(subData[,9] , type = "l", ylim=c(0,40), axes = F, xlab="", ylab="Energy sub metering")
sizeData = length(subData[,1])
axis(1, at=c(1,sizeData/2,sizeData), lab=c("Thu", "Fri", "Sat"))
lines(subData$Sub_metering_2, col = "red")
lines(subData$Sub_metering_3, col = "blue")
axis(2, at=c(0,10,20,30), lab=c(0,10,20,30))
box()
legend("topright", border= "none", lty=1, bty='n', xjust = 0.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4th plot- Global reactivepower
plot(subData[,6], type = "l", ylim=c(0,0.5), axes = F, xlab="datetime", ylab=names(subData)[6])
sizeData = length(subData[,1])
axis(1, at=c(1,sizeData/2,sizeData), lab=c("Thu", "Fri", "Sat"))
axis(2, at=c(0.1,0.2,0.3,0.4,0.5), lab=c(0.1,0.2,0.3,0.4,0.5))
box()

#
dev.copy(png, file="plot4.png")
dev.off()
