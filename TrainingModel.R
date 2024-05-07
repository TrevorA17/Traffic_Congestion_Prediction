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

# Load the boot package for bootstrapping
library(boot)

# Define a function to compute the statistic of interest (e.g., mean, median, etc.)
# let's compute the mean of the Total variable
compute_statistic <- function(data, indices) {
  sample_data <- data[indices, , drop = FALSE]  # Ensure we keep the data frame structure
  return(mean(sample_data$Total))
}

# Perform bootstrapping
bootstrap_results <- boot(traffic_data, statistic = compute_statistic, R = 1000)

# Calculate bootstrap confidence intervals
bootstrap_ci <- boot.ci(bootstrap_results, type = "basic")

# Print the bootstrap results and confidence intervals
print("Bootstrap results:")
print(bootstrap_results)
print("Bootstrap confidence intervals:")
print(bootstrap_ci)
