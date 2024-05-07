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

# Load the caret package for cross-validation
library(caret)

# Set the seed for reproducibility
set.seed(123)

# Define the control parameters for cross-validation
cv_control <- trainControl(method = "cv", number = 10)  # Basic cross-validation with 10 folds

# Define the training model (example: linear regression)
model <- train(Total ~ ., data = traffic_data, method = "lm", trControl = cv_control)

# Print the model
print(model)

# Load the caret package for classification model training
library(caret)

# Set the seed for reproducibility
set.seed(123)


# Define the control parameters for model training
train_control <- trainControl(method = "cv", number = 10)  # Basic cross-validation with 10 folds

# Train a classification model (example: Random Forest)
classification_model <- train(TrafficSituation ~ ., 
                              data = traffic_data, 
                              method = "rf", 
                              trControl = train_control)

# Print the classification model
print(classification_model)

# Load the caret package for model training
library(caret)

# Set the seed for reproducibility
set.seed(123)

# Define the control parameters for model training
train_control <- trainControl(method = "cv", number = 10)  # Basic cross-validation with 10 folds

# Train a regression model (example: Linear Regression)
regression_model <- train(Total ~ ., 
                          data = traffic_data, 
                          method = "lm", 
                          trControl = train_control)

# Print the regression model
print(regression_model)

##Performance Comparison with resamples
# Load the caret package for model training and evaluation
library(caret)

# Set the seed for reproducibility
set.seed(123)


# Define the control parameters for model training and evaluation
train_control <- trainControl(method = "cv", number = 10)  # Basic cross-validation with 10 folds

# Train multiple regression models (e.g., Linear Regression, Random Forest, etc.)
models <- list(
  LM = train(Total ~ ., data = traffic_data, method = "lm", trControl = train_control),
  RF = train(Total ~ ., data = traffic_data, method = "rf", trControl = train_control)
)

# Compare model performance using resamples
results <- resamples(models)

# Summarize and print model performance metrics (e.g., RMSE)
summary_results <- summary(results)
print(summary_results)
