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

# Measures of Distribution

# Range for numerical variables
car_range <- range(traffic_data$CarCount)
bike_range <- range(traffic_data$BikeCount)
bus_range <- range(traffic_data$BusCount)
truck_range <- range(traffic_data$TruckCount)
total_range <- range(traffic_data$Total)

print("Range for numerical variables:")
print(paste("CarCount:", paste(car_range, collapse = " - ")))
print(paste("BikeCount:", paste(bike_range, collapse = " - ")))
print(paste("BusCount:", paste(bus_range, collapse = " - ")))
print(paste("TruckCount:", paste(truck_range, collapse = " - ")))
print(paste("Total:", paste(total_range, collapse = " - ")))

# Variance for numerical variables
car_var <- var(traffic_data$CarCount)
bike_var <- var(traffic_data$BikeCount)
bus_var <- var(traffic_data$BusCount)
truck_var <- var(traffic_data$TruckCount)
total_var <- var(traffic_data$Total)

print("Variance for numerical variables:")
print(paste("CarCount:", car_var))
print(paste("BikeCount:", bike_var))
print(paste("BusCount:", bus_var))
print(paste("TruckCount:", truck_var))
print(paste("Total:", total_var))

# Standard deviation for numerical variables
car_sd <- sd(traffic_data$CarCount)
bike_sd <- sd(traffic_data$BikeCount)
bus_sd <- sd(traffic_data$BusCount)
truck_sd <- sd(traffic_data$TruckCount)
total_sd <- sd(traffic_data$Total)

print("Standard deviation for numerical variables:")
print(paste("CarCount:", car_sd))
print(paste("BikeCount:", bike_sd))
print(paste("BusCount:", bus_sd))
print(paste("TruckCount:", truck_sd))
print(paste("Total:", total_sd))

# Measures of Relationship

# Correlation matrix for numerical variables
correlation_matrix <- cor(traffic_data[c("CarCount", "BikeCount", "BusCount", "TruckCount", "Total")])

print("Correlation matrix for numerical variables:")
print(correlation_matrix)

# Contingency table for Day_of_the_week vs. TrafficSituation
contingency_table <- table(traffic_data$Day_of_the_week, traffic_data$TrafficSituation)

print("Contingency table for Day_of_the_week vs. TrafficSituation:")
print(contingency_table)

# ANOVA (Analysis of Variance) Test

# Perform ANOVA for CarCount vs. Day_of_the_week
car_anova <- aov(CarCount ~ Day_of_the_week, data = traffic_data)
print("ANOVA for CarCount vs. Day_of_the_week:")
print(summary(car_anova))

# Perform ANOVA for BikeCount vs. Day_of_the_week
bike_anova <- aov(BikeCount ~ Day_of_the_week, data = traffic_data)
print("ANOVA for BikeCount vs. Day_of_the_week:")
print(summary(bike_anova))

# Perform ANOVA for BusCount vs. Day_of_the_week
bus_anova <- aov(BusCount ~ Day_of_the_week, data = traffic_data)
print("ANOVA for BusCount vs. Day_of_the_week:")
print(summary(bus_anova))

# Perform ANOVA for TruckCount vs. Day_of_the_week
truck_anova <- aov(TruckCount ~ Day_of_the_week, data = traffic_data)
print("ANOVA for TruckCount vs. Day_of_the_week:")
print(summary(truck_anova))

# Perform ANOVA for Total vs. Day_of_the_week
total_anova <- aov(Total ~ Day_of_the_week, data = traffic_data)
print("ANOVA for Total vs. Day_of_the_week:")
print(summary(total_anova))

# Univariate Plots

# Histogram for CarCount
hist(traffic_data$CarCount, main = "Histogram of CarCount", xlab = "CarCount", col = "skyblue")

# Density plot for BikeCount
plot(density(traffic_data$BikeCount), main = "Density Plot of BikeCount", xlab = "BikeCount", col = "green")

# Bar plot for Day_of_the_week
barplot(table(traffic_data$Day_of_the_week), main = "Bar Plot of Day_of_the_week", xlab = "Day_of_the_week", ylab = "Frequency", col = "orange")

# Bar plot for TrafficSituation
barplot(table(traffic_data$TrafficSituation), main = "Bar Plot of TrafficSituation", xlab = "TrafficSituation", ylab = "Frequency", col = "purple")
