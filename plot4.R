# Coursera - Data Science Specialization - Exploratory Data Analysis
# Week 1 - Course Project 1
# Plot 4 - Plot: Combination of 4 plots

# Ensure that the working directory is set to the folder that contains the .file "household_power_consumption.txt". This file can be found in this zip file: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read the data using read.table function and store as variable
FullData <- read.table("household_power_consumption.txt", sep = ";", nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Create a subset of FullData for the dates 2007-02-01 and 2007-02-02
SubData <- subset(FullData, FullData$Date == "1/2/2007" | FullData$Date== "2/2/2007")

# Convert the date and time formats
SubData$Date <- as.Date(SubData$Date, format = "%d/%m/%Y")
SubData$timetemp <- paste(SubData$Date, SubData$Time)
SubData$Time <- strptime(SubData$timetemp, format = "%Y-%m-%d %H:%M:%S")

# Create the plot and specify the width and height of the PNG graphic device
png("plot4.png", width=480, height= 480)
par(mfrow = c(2, 2))
plot(x = SubData$Time, y = SubData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") # Add first plot
plot(x = SubData$Time, y = SubData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage") #Add second plot
plot(x = SubData$Time, y = SubData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") # Add third plot
lines(x = SubData$Time, y = SubData$Sub_metering_2, type = "l", col = "red")
lines(x = SubData$Time, y = SubData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))
plot(x = SubData$Time, y = SubData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")  # Add fourth plot
dev.off()