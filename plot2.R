# Name:  Mark Pauley
# Exploratory Data Analysis, Course Project 1
# This script creates a plot of DateTime vs. Global active power from the
# supplied data file

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

# Save plot to the file "plot2.png"
png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px")

# Plot DateTime vs. Global active power
plot(x = data$DateTime,
     y = data$Global_active_power,
     type = "l",
     xlab = NA,
     ylab = "Global Active Power (kilowatts)")

# Close the file
dev.off()

