
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

#Plot histogram for Global_active_power
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

#Save the plot to plo1.png file
dev.copy(png, file="plot1.png")

dev.off()
