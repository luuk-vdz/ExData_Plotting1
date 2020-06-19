# Coursera - Data Science Specialization - Exploratory Data Analysis
# Week 1 - Course Project 1
# Plot 1 - Histogram: Household global minute-averaged active power (in kilowatt)

# Ensure that the working directory is set to the folder that contains the .file "household_power_consumption.txt". This file can be found in this zip file: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read the data using read.table function and store as variable
FullData <- read.table("household_power_consumption.txt", sep = ";", nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Create a subset of FullData for the dates 2007-02-01 and 2007-02-02
SubData <- subset(FullData, FullData$Date == "1/2/2007" | FullData$Date== "2/2/2007")

# Create the histogram and specify the width and height of the PNG graphic device
png("plot1.png", width=480, height= 480)
hist(SubData$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()