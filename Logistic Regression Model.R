# 📌 Install and Load Required Libraries
install.packages("lattice")  # Required for visualization in caret
install.packages("dplyr")    # For data manipulation
install.packages("readxl")   # For reading Excel files
install.packages("caret")    # For data partitioning and model evaluation

library(lattice)   # Visualization support in caret
library(dplyr)     # Data wrangling and transformation
library(readxl)    # Reading Excel data files
library(caret)     # Machine learning utilities

# ==========================================
# 📌 Load Dataset
# ==========================================
file_path <- "cleaning_opendatarelease.xlsx"  # Define the path to the dataset
df <- read_excel(file_path, sheet = "Full Dataset")  # Read the dataset from Excel

# ==========================================
# 📌 Data Preprocessing
# ==========================================
df <- df %>%
  mutate(
    Access_Online = ifelse(Access_Online == "YES", 1, 0),  # Convert target variable to binary (1 = Yes, 0 = No)
    Age_Group = as.factor(Age_Group),     # Convert Age_Group to categorical variable
    Gender = as.factor(Gender),           # Convert Gender to categorical variable
    Marital_Status = as.factor(Marital_Status)  # Convert Marital Status to categorical variable
  )

# ==========================================
# 📌 Split Data into Training and Testing Sets
# ==========================================
set.seed(123)  # Set seed for reproducibility
train_index <- createDataPartition(df$Access_Online, p = 0.7, list = FALSE)  # 70% training, 30% testing
train_data <- df[train_index, ]  # Training dataset
test_data <- df[-train_index, ]  # Testing dataset

# ==========================================
# 📌 Build Logistic Regression Model
# ==========================================
model <- glm(Access_Online ~ Age_Group + Gender + Marital_Status, 
             data = train_data, 
             family = binomial(link = "logit"))  # Logistic regression model

# Display model summary
summary(model)

# ==========================================
# 📌 Compute Odds Ratios (Effect Size)
# ==========================================
odds_ratios <- exp(cbind(Odds_Ratio = coef(model), confint(model)))  # Convert log-odds to odds ratios
print(odds_ratios)  # Display the odds ratio table
View(odds_ratios)

# ==========================================
# 📌 Model Predictions on Test Data
# ==========================================
binomial_probabilities <- predict(model, newdata = test_data, type = "response")  # Get predicted probabilities
print(binomial_probabilities)  # Display probabilities

# Convert probabilities to binary predictions (Threshold = 0.5)
binomial_predictions <- ifelse(binomial_probabilities > 0.5, 1, 0)
print(binomial_predictions)  # Display predicted classes

# ==========================================
# 📌 Model Evaluation (Accuracy)
# ==========================================
test_data$Access_Online_Binary <- test_data$Access_Online  # Ensure consistency in binary labels
binomial_classification_error <- mean(binomial_predictions != test_data$Access_Online_Binary)  # Compute error rate
accuracy <- 1 - binomial_classification_error  # Compute accuracy
print(paste("Model Accuracy:", accuracy))  # Display accuracy

# ==========================================
# END OF SCRIPT
# ==========================================





