
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

hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

dev.copy(png, file="plot1.png")

dev.off()
