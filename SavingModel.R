# Saving the classification model
saveRDS(classification_model, "./models/saved_classification_model.rds")

# Load the saved model
loaded_classification_model <- readRDS("./models/saved_classification_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Time = "1:00:00 AM",
  Date = 10,
  Day_of_the_week = "Tuesday",
  CarCount = 40,
  BikeCount = 5,
  BusCount = 2,
  TruckCount = 2,
  Total = 10
)
# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_classification_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
