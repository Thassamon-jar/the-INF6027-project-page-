#Install packages
install.packages("readxl")
install.packages("dplyr")
install.packages("factoextra")
install.packages("ggplot2")

library(readxl)
library(dplyr)
library(factoextra)
library(ggplot2)

#Load data from an Excel file into a data frame
file_path <- "cleaning_opendatarelease.xlsx" # Change to your path

#Read the Excel file into a data frame
data <- read_excel(file_path)

#Display the structure of the data
str(data)

#Show the first few rows of the data for a quick preview
head(data)

#Select specific columns for clustering analysis
columns_for_clustering <- c("Access_Online", "Access_Telephone", "Access_Email", 
                            "Access_ByPost", "Access_InPerson", "Age_Group", "Activity_Look_Info", "Activity_Watch webcasts", "Activity_Report_Issues", "Activity_Pay_Services", "Activity_Request_Services", "Activity_Send_Comments")

#Extract the selected columns into a new data frame for clustering analysis
data_features <- data[columns_for_clustering]

# View selected data examples
head(data_features)

# Replace missing values (NA) with 0
data_features[is.na(data_features)] <- 0

# Convert 'YES' and 'NO' to 1 and 0
data_features <- data_features %>%
  mutate(across(starts_with("Access"), ~ ifelse(. == "YES", 1, 0))) %>%
  mutate(across(starts_with("Activity"), ~ ifelse(. == "YES", 1, 0)))

# Convert the age variable (Age_Group) into numeric values
data_features <- data_features %>%
  mutate(Age_Group = case_when(
    Age_Group == "16 to 24" ~ 1,
    Age_Group == "25 to 39" ~ 2,
    Age_Group == "40 to 55" ~ 3,
    Age_Group == "56 to 59" ~ 4,
    Age_Group == "60 to 64" ~ 5,
    Age_Group == "65" ~ 6,
    TRUE ~ 0
  ))

# Review the cleaned data
summary(data_features)

# Standardize the data
data_scaled <- scale(data_features)

# Verify the standardized data
summary(data_scaled)

#Use the Elbow Method to determine the optimal number of clusters for K-Means clustering and visualize the results
fviz_nbclust(data_scaled, kmeans, method = "wss") +
  labs(title = "Elbow Method for Optimal Clusters")

# Perform K-Means Clustering
set.seed(42) # To ensure consistent results
kmeans_result <- kmeans(data_scaled, centers = 3, nstart = 25)

# Add the cluster results back into the data
data_features$Cluster <- as.factor(kmeans_result$cluster)

# Check the number of members in each cluster
table(data_features$Cluster)

# Calculate the average for each cluster
cluster_summary <- data_features %>%
  group_by(Cluster) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

# Display the results
print(cluster_summary)

# Reduce dimensionality using PCA
pca_result <- prcomp(data_scaled)
pca_data <- data.frame(pca_result$x[, 1:2], Cluster = data_features$Cluster)

#Create a scatter plot of clusters using PCA to visualize the data distribution across the first two principal components
ggplot(pca_data, aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "PCA Scatter Plot of Clusters", x = "Principal Component 1", y = "Principal Component 2") +
  theme_minimal()

#Print the complete cluster summary without truncation
print(cluster_summary, n = Inf)

#Open the cluster summary in a spreadsheet-like viewer for easier exploration
View(cluster_summary)


#-----End------





