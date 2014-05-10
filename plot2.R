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

plot(subData[,5], type = "l", ylim=c(0,8), axes = F, xlab="", ylab="Global Active Power (kilowatts)")

sizeData = length(subData[,1])

axis(1, at=c(1,sizeData/2,sizeData), lab=c("Thu", "Fri", "Sat"))

axis(2, at=c(0,2,4,6), lab=c(0,2,4,6))

box()

dev.copy(png, file="plot2.png")

dev.off()

