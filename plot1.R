# Name:  Mark Pauley
# Exploratory Data Analysis, Course Project 1
# This script creates a histogram of Global active power from the supplied
# data file

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

# Save plot to the file "plot1.png"
png(filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px")

# Create a histogram of Global active power
hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Close the file
dev.off()