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

# Measures of Frequency

# Frequency table for Day_of_the_week
day_freq <- table(traffic_data$Day_of_the_week)
print("Frequency table for Day_of_the_week:")
print(day_freq)

# Proportion table for Day_of_the_week
day_prop <- prop.table(day_freq)
print("Proportion table for Day_of_the_week:")
print(day_prop)

# Frequency table for TrafficSituation
situation_freq <- table(traffic_data$TrafficSituation)
print("Frequency table for TrafficSituation:")
print(situation_freq)

# Proportion table for TrafficSituation
situation_prop <- prop.table(situation_freq)
print("Proportion table for TrafficSituation:")
print(situation_prop)

# Measures of Central Tendency

# Mean for numerical variables
car_mean <- mean(traffic_data$CarCount)
bike_mean <- mean(traffic_data$BikeCount)
bus_mean <- mean(traffic_data$BusCount)
truck_mean <- mean(traffic_data$TruckCount)
total_mean <- mean(traffic_data$Total)

print("Mean for numerical variables:")
print(paste("CarCount:", car_mean))
print(paste("BikeCount:", bike_mean))
print(paste("BusCount:", bus_mean))
print(paste("TruckCount:", truck_mean))
print(paste("Total:", total_mean))

# Median for numerical variables
car_median <- median(traffic_data$CarCount)
bike_median <- median(traffic_data$BikeCount)
bus_median <- median(traffic_data$BusCount)
truck_median <- median(traffic_data$TruckCount)
total_median <- median(traffic_data$Total)

print("Median for numerical variables:")
print(paste("CarCount:", car_median))
print(paste("BikeCount:", bike_median))
print(paste("BusCount:", bus_median))
print(paste("TruckCount:", truck_median))
print(paste("Total:", total_median))

# Mode for numerical variables (using a custom function)
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

car_mode <- get_mode(traffic_data$CarCount)
bike_mode <- get_mode(traffic_data$BikeCount)
bus_mode <- get_mode(traffic_data$BusCount)
truck_mode <- get_mode(traffic_data$TruckCount)
total_mode <- get_mode(traffic_data$Total)

print("Mode for numerical variables:")
print(paste("CarCount:", car_mode))
print(paste("BikeCount:", bike_mode))
print(paste("BusCount:", bus_mode))
print(paste("TruckCount:", truck_mode))
print(paste("Total:", total_mode))

