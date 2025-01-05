#Graph 1 

#Install package
install.packages("ggplot2")
install.packages("reshape2")

# Load required libraries
library(ggplot2)
library(reshape2)

# Create the dataset
access_data <- data.frame(
  Cluster = c(1, 2, 3),
  Online = c(0.00, 1.00, 1.00),
  Telephone = c(0.49, 0.24, 0.65),
  Email = c(0.23, 0.13, 0.73),
  ByPost = c(0.28, 0.06, 0.21),
  InPerson = c(0.51, 0.13, 0.44)
)

# Reshape the data into long format
access_long <- melt(access_data, id.vars = "Cluster", variable.name = "Access_Method", value.name = "Proportion")

# Create the bar chart with black borders and Legend on top
ggplot(access_long, aes(x = as.factor(Cluster), y = Proportion, fill = Access_Method)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +  # Add black borders
  labs(
    title = "Access Methods by Cluster",
    subtitle = "The bar chart shows the access methods preferred by citizens for each cluster",
    x = "Cluster",
    y = "Proportion",
    fill = "Access Method",
    caption = "Data Source: https://www.data.gov.uk/dataset/9710a9af-b360-4946-8bb2-0edb988bc748/improving-public-engagement-survey-january-2016"
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",  # Move legend to the top
    legend.title = element_text(size = 10),  # Adjust legend title size
    legend.text = element_text(size = 9)    # Adjust legend text size
  ) +
  scale_fill_brewer(palette = "Set3")



#Graph 2

#Install package
install.packages("ggplot2")
install.packages("reshape2")

# Load required libraries
library(ggplot2)
library(reshape2)

# Create the dataset
activity_data <- data.frame(
  Cluster = c(1, 2, 3),
  Looking_for_Information = c(0.23, 0.81, 0.95),
  Watching_webcasts = c(0.04, 0.04, 0.17),
  Reporting_Issues = c(0.13, 0.16, 0.57),
  Paying_Services = c(0.09, 0.55, 0.64),
  Requesting_Services = c(0.11, 0.15, 0.52),
  Sending_Comments = c(0.15, 0.05, 0.58)
)

# Reshape the data into long format
activity_long <- melt(activity_data, id.vars = "Cluster", variable.name = "Activity", value.name = "Proportion")

# Create the bar chart
ggplot(activity_long, aes(x = as.factor(Cluster), y = Proportion, fill = Activity)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +  # Add black borders
  labs(
    title = "Clustered Activities",
    subtitle = "The bar chart illustrates the activities preferred by citizens in each cluster.",
    x = "Cluster",
    y = "Proportion",
    fill = "Activity",
    caption = "Source: https://www.data.gov.uk/dataset/9710a9af-b360-4946-8bb2-0edb988bc748/improving-public-engagement-survey-january-2016"
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",  # Move legend to the top
    legend.title = element_text(size = 10),  # Adjust legend title size
    legend.text = element_text(size = 9),    # Adjust legend text size
    axis.text = element_text(size = 10),     # Adjust axis text size
    axis.title = element_text(size = 12)     # Adjust axis title size
  ) +
  scale_fill_brewer(palette = "Set3")
