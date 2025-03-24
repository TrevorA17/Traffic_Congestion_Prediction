# Load dataset
traffic_data <- read.csv("data/traffic.csv", colClasses = c(
  Time = "character",
  Date = "integer",
  Day_of_the_week = "factor",
  CarCount = "integer",
  BikeCount = "integer",
  BusCount = "integer",
  TruckCount = "integer",
  Total = "integer",
  TrafficSituation = "factor"
))

# Display the structure of the dataset
str(traffic_data)

# View the first few rows of the dataset
head(traffic_data)

# View the dataset in a separate viewer window
View(traffic_data)

# Count missing values in each column
missing_values <- colSums(is.na(traffic_data))

# Display columns with missing values
print("Columns with Missing Values:")
print(names(missing_values[missing_values > 0]))

# Display total number of missing values
print("Total Number of Missing Values:")
print(sum(missing_values))

# Load the lubridate library for handling dates and times
library(lubridate)

# Convert the time column to POSIXct format
traffic_data$Time <- as.POSIXct(traffic_data$Time, format = "%I:%M:%S %p")

# Now the "Time" column will be in POSIXct format, which allows for easier manipulation of dates and times
