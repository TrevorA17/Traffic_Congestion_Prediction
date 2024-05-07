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

