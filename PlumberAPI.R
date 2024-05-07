# Load the saved classification model
loaded_classification_model <- readRDS("./models/saved_classification_model.rds")

#* @apiTitle Traffic Situation Prediction Model API
#* @apiDescription Used to predict traffic situation.

#* @param Time Time of observation (e.g., "1:00:00 AM")
#* @param Date Date of observation
#* @param Day_of_the_week Day of the week (e.g., "Tuesday")
#* @param CarCount Number of cars
#* @param BikeCount Number of bikes
#* @param BusCount Number of buses
#* @param TruckCount Number of trucks
#* @param Total Total count of all vehicles

#* @get /predict_traffic_situation

predict_traffic_situation <- function(Time, Date, Day_of_the_week, CarCount, BikeCount, BusCount, TruckCount, Total) {
  
  # Create a data frame using the arguments
  new_data <- data.frame(
    Time = as.character(Time),
    Date = as.integer(Date),
    Day_of_the_week = as.factor(Day_of_the_week),
    CarCount = as.integer(CarCount),
    BikeCount = as.integer(BikeCount),
    BusCount = as.integer(BusCount),
    TruckCount = as.integer(TruckCount),
    Total = as.integer(Total)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_classification_model, newdata = new_data)
  
  # Return the prediction
  return(prediction)
}
