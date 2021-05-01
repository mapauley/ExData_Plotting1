# Name:  Mark Pauley
# Exploratory Data Analysis, Course Project 1
# This script creates a plot of DateTime vs. Submetering 1, 2, and 3 from the
# supplied data file

# Load packages
library(tidyverse)
library(lubridate)
library(data.table)

# Read the data into a dataframe. Per the assignment description, only data from 
# 1 and 2 February 2007 will be examined and "?" represents NA; Date and Time
data <-
    fread(input = unzip("./exdata_data_household_power_consumption.zip"),
          sep = ";",
          na.strings = c("?")) %>%
    filter((Date == "1/2/2007") | (Date == "2/2/2007")) %>%
    mutate(DateTime = as.POSIXct(paste(Date, Time),
                                 format = "%d/%m/%Y %H:%M:%S"))

# Save plot to the file "plot3.png"
png(filename = "plot3.png",
    width = 480,
    height = 480,
    units = "px")

# Plot DateTime vs. Submetering 1, 2, and 3
plot(x = data$DateTime,
     y = data$Sub_metering_1,
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering")
lines(x = data$DateTime,
      y = data$Sub_metering_2,
      col = "red")
lines(x = data$DateTime,
      y = data$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lwd = 1)

# Close the file
dev.off()