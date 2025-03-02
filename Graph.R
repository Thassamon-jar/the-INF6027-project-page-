#Graph1

install.packages("ggplot2")

# Load required library
library(ggplot2)

# Create a data frame with Odds Ratios
data <- data.frame(
  Variable = c("Gender (Male)", "Marital_Status (Married)", "Marital_Status (Single)", "Marital_Status (Prefer not to say)"),
  Odds_Ratio = c(7.3062, 30.7213, 43.0779, 42.0994)
)

# Define custom colors
custom_colors <- c("#AEC6CF", "#AEC6CF", "#AEC6CF", "#FFB7B2")  # Single in pink, others in blue

# Create the bar chart
ggplot(data, aes(x = reorder(Variable, Odds_Ratio), y = Odds_Ratio, fill = Variable)) +
  geom_bar(stat = "identity", show.legend = FALSE, aes(fill = Variable)) +
  scale_fill_manual(values = custom_colors) +
  coord_flip() +
  labs(
    title = "Odds Ratios of Priority User Groups for Promoting Online Services",
    subtitle = "Key demographic groups with higher odds of engaging in digital services",
    x = "User Group",
    y = "Odds Ratio",
    caption = "Data Source: Logistic Regression Model Analysis"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12),
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12),
    plot.caption = element_text(size = 10, face = "italic")
  )



#Graph2

install.packages("ggplot2")

# Load required library
library(ggplot2)

# Create a data frame with accuracy data
data <- data.frame(
  Category = c("Correct Predictions", "Incorrect Predictions"),
  Percentage = c(89.5, 10.5)
)

# Create the pie chart
ggplot(data, aes(x = "", y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(Percentage, "%")), position = position_stack(vjust = 0.5), color = "black", size = 5) +
  scale_fill_manual(values = c("#AEC6CF", "#FFB7B2")) +  # Pastel blue and pastel pink
  labs(
    title = "Model Accuracy of Logistic Regression",
    subtitle = "Proportion of Correct vs. Incorrect Predictions",
    caption = "Data Source: Logistic Regression Model Analysis"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.title = element_blank(),
    legend.text = element_text(size = 12),
    plot.caption = element_text(size = 10, face = "italic", hjust = 0.5)
  )


#Graph3

# Load required library
library(ggplot2)

# Create a data frame with P-values
data <- data.frame(
  Variable = c("Age_Group (25 to 39)", "Age_Group (40 to 55)", "Age_Group (56 to 59)",
               "Age_Group (60 to 64)", "Age_Group (65+)", "Age_Group (Prefer not to say)", 
               "Gender (Male)", "Gender (Prefer not to say)", "Marital_Status (Divorced)", 
               "Marital_Status (Married)", "Marital_Status (Other)", "Marital_Status (Partner)", 
               "Marital_Status (Separated)", "Marital_Status (Single)", "Marital_Status (Widowed)", 
               "Marital_Status (Prefer not to say)"),
  P_value = c(0.9949, 0.9945, 0.9938, 0.9936, 0.9942, 0.9930, 
              0.0244, 0.3785, 0.0624, 0.0425, 0.8485, 0.0771, 
              0.5165, 0.0473, 0.9891, 0.0392)
)

# Define custom colors
data$Color <- ifelse(data$Variable %in% c("Gender (Male)", "Marital_Status (Married)", 
                                          "Marital_Status (Single)", "Marital_Status (Prefer not to say)"), 
                     "lightcoral", "lightblue")  # Custom color coding

# Reorder variables: Ensure Age_Group (65+) is at the bottom within the age-related variables
data$Variable <- factor(data$Variable, levels = c(
  "Age_Group (25 to 39)", "Age_Group (40 to 55)", "Age_Group (56 to 59)", "Age_Group (60 to 64)", 
  "Age_Group (Prefer not to say)", "Age_Group (65+)",  # Age variables with 65+ at the bottom
  "Marital_Status (Widowed)", "Marital_Status (Other)", "Marital_Status (Separated)",
  "Gender (Prefer not to say)", "Marital_Status (Partner)", "Marital_Status (Divorced)", 
  "Marital_Status (Single)", "Marital_Status (Married)", "Marital_Status (Prefer not to say)",
  "Gender (Male)"  # Ensure key variables remain at the bottom
))

# Create the bar chart with custom colors and reordered variables
ggplot(data, aes(x = P_value, y = Variable, fill = Color)) +
  geom_bar(stat = "identity") +
  scale_fill_identity() +  # Use manually defined colors
  geom_vline(xintercept = 0.05, linetype = "dashed", color = "red", size = 1) +  # Add significance threshold
  labs(
    title = "Statistical Significance of Demographic Predictors in Logistic Regression",
    x = "P-value",
    y = "Variable",
    caption = "Red dashed line represents significance threshold (0.05)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12),
    plot.caption = element_text(size = 10, face = "italic")
  ) +
  annotate("text", x = 0.07, y = nrow(data), label = "Significance Threshold (0.05)", color = "red", hjust = 0, size = 4)
