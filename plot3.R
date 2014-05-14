
# Set the working directory to where the data file is stored and plot will be generated.
setwd("C:\\Data Science\\4. Exploratory Data Analysis\\Course Project 1")

# read the data set
data <- read.table("./household_power_consumption.txt", header=TRUE, colClasses="character", sep=";")

#convert the first column to date type
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")

# Convert rest of the columns to numeric data type
data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])
data[,5] <- as.numeric(data[,5])
data[,6] <- as.numeric(data[,6])
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])


# Create a data subset for 2007-02-01 and 2007-02-02 date
subData <- data[(data[,1]=="2007-02-01" | data[,1] == "2007-02-02"),]


plot(subData[,7] , type = "l", ylim=c(0,40), axes = F, xlab="", ylab="Energy sub metering")

sizeData <- length(subData[,1])
axis(1, at=c(1,sizeData/2,sizeData), lab=c("Thu", "Fri", "Sat"))

lines(subData$Sub_metering_2, col = "red")
lines(subData$Sub_metering_3, col = "blue")

axis(2, at=c(0,10,20,30), lab=c(0,10,20,30))

box()

legend("topright", lty=1,   border="black", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png")

dev.off()

