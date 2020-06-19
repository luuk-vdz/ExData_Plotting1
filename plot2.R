# Coursera - Data Science Specialization - Exploratory Data Analysis
# Week 1 - Course Project 1
# Plot 2 - Plot: Household global minute-averaged active power (in kilowatt)

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
png("plot2.png", width=480, height= 480)
plot(x = SubData$Time, y = SubData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()