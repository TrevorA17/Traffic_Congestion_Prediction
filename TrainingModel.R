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

# Load the caret package for data splitting
library(caret)

# Set the seed for reproducibility
set.seed(123)

# Assuming your dataset is named "traffic_data"

# Create an index for splitting the data
train_index <- createDataPartition(traffic_data$TrafficSituation, p = 0.8, list = FALSE)

# Split the data into training and testing sets
train_data <- traffic_data[train_index, ]
test_data <- traffic_data[-train_index, ]

# Print the dimensions of the training and testing sets
print("Dimensions of the training set:")
print(dim(train_data))
print("Dimensions of the testing set:")
print(dim(test_data))
