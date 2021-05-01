# Name:  Mark Pauley
# Exploratory Data Analysis, Course Project 1
# This script creates four plots from the supplied data file: 1) DateTime vs. 
# Global Active Power; 2) DateTime vs. Submetering 1, 2, and 3; 3) DateTime vs.
# Voltage; and 4) DateTime vs. Global reactive power

# Load packages
library(tidyverse)
library(lubridate)
library(data.table)

# Read the data into a dataframe. Per the assignment description, only data from 
# 1 and 2 February 2007 will be examined and "?" represents NA; Date and Time
# are combined into a single column.
data <-
    fread(input = unzip("./exdata_data_household_power_consumption.zip"),
          sep = ";",
          na.strings = c("?")) %>%
    filter((Date == "1/2/2007") | (Date == "2/2/2007")) %>%
    mutate(DateTime = as.POSIXct(paste(Date, Time),
                                 format = "%d/%m/%Y %H:%M:%S"))

# Save plot to the file "plot4.png"
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Going to put four plots on the page
par(mfcol = c(2, 2))

# Plot 1: DateTime vs. Global Active Power
plot(x = data$DateTime,
     y = data$Global_active_power,
     type = "l",
     xlab = NA,
     ylab = "Global Active Power")

# Plot 2: DateTime vs. Submetering 1, 2 and 3
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
       lwd = 1,
       bty = "n")

# Plot 3: DateTime vs. Voltage
plot(x = data$DateTime,
     y = data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# PLot 4: DateTime vs. Global reactive power
plot(x = data$DateTime,
     y = data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Close the file
dev.off()