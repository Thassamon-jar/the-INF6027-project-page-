### The INF6027 Project

## Overview
This project analyses data from the City of York Council to explore ways to enhance digital platforms and improve public engagement. By focusing on user age groups, the study aims to develop effective strategies for increasing online service adoption and leveraging user feedback to improve service delivery and engagement.


## Research Questions
1. What is the most popular method that citizens prefer to use to access services?
2. What age group of users should be considered as a main target for promoting the council’s online service?
3. What strategies should the council plan for an online service to build engagement from users?


## Key Findings

<img src="./PCA Cluster Scatter Plot.png" width="100%" height="100%">

1.	Key Finding 1: Online access is the most popular method, especially for Clusters 2 and 3.
2.	Key finding 2: Cluster 3 is the primary target group due to their high engagement in activities like information searching, issue reporting, service requests, and payments, reflecting their heavy reliance on online access and active participation.
3.	Key finding 3:
    Cluster 1: Raise awareness and highlight the benefits of online services to encourage digital adoption.
    Cluster 2: Enhance online service efficiency and convenience, focusing on features like improved UX/UI, payment gateways, and encouraging use of additional activities such as payments or feedback.
    Cluster 3: Prioritize accessibility and support for comments and issue reporting, leveraging their feedback to improve services and maintain engagement by showing their voices are valued.

## Visualizations to Provide Insights
<img src="./Access Method by Cluster_Bar Chart.png" width="100%" height="100%">

A bar chart illustrates that Clusters 2 and 3 exhibit a preference for online access. While Cluster 1 exhibits a preference for conventional access channels, such as in-person interactions and telephone communication, so highlighting the necessity of ensuring inclusivity.

<img src="./Clustered Activities_Bar Chart.png" width="100%" height="100%">
Cluster 1 exhibits minimal interest in the available services. In contrast, Clusters 2 and 3 demonstrate greater levels of engagement, with Cluster 3 standing out as highly engaged users who actively utilise the services.


## Steps to Run the Code for Building the Clustering Model

Download the cleaning_opendatarelease.xlsx file before running the code.


1.	Install Necessary Packages
Install the required R packages (readxl, dplyr, factoextra, ggplot2) to handle data processing, clustering, and visualisation. This ensures that all functions used in the code are available.

2.	Load Libraries
Load the libraries into the R session to enable their functionality:
  - readxl: For reading Excel files.
  - dplyr: For data manipulation.
  - factoextra: For clustering evaluation and visualisation.
  - ggplot2: For creating plots.
3.	Import the Dataset
Read the Excel file using the read_excel() function and store it in the data variable. Adjust the file_path to the actual location of your file.

4.	Inspect the Data
Use str(data) and head(data) to check the structure and preview the first few rows of the dataset to understand its format and content.

5.	Select Columns for Clustering
Define the variables to be used for clustering by creating a list of column names in columns_for_clustering. Extract these columns from the dataset and store them in data_features.

6.	Handle Missing Data
Replace missing values (NA) with 0 in data_features using is.na() and assignment.

7.	Transform Categorical Data
Convert 'YES' and 'NO' in columns starting with "Access" and "Activity" into numerical values (1 for 'YES' and 0 for 'NO') using mutate() and ifelse().

8.	Convert Age Groups to Numeric Values
Transform the Age_Group variable into numeric values corresponding to specific age ranges using mutate() and case_when().

9.	Data Summary
Use summary(data_features) to verify that the data cleaning and transformations have been applied correctly.

10.	Data Scaling
To standardise the dataset and ensure comparability across features, continuous variables were scaled using the scale() function by scaling them to have a mean of 0 and a standard deviation of 1 using scale(data_features). This step prevents variables with larger scales, such as age groups, from dominating the clustering process.

11.	Determine Optimal Number of Clusters
To identify the optimal number of clusters, the Elbow Method was applied using the fviz_nbclust() function (Kassambara, 2017). Use the fviz_nbclust() function with the "Elbow Method" to evaluate the within-cluster sum of squares for different numbers of clusters. Identify the "elbow point" in the plot to determine the optimal number of clusters (k). Elbow Method Plot visualises the optimal number of clusters. 

12.	Perform K-Means Clustering
Clustering was performed using the k-means algorithm, a partitioning technique that iteratively adjusts cluster centroids to minimise intra-cluster variance (Hartigan & Wong, 1979). Use the kmeans() function to apply the k-means clustering algorithm:
  - data_scaled: The standardised dataset.
  - centers = 3: Specifies the number of clusters (k).
  - nstart = 25: Runs the algorithm with 25 random initialisations for robustness. Assign the resulting cluster labels to a new column (Cluster) in the data_features dataset.
    
13.	Cluster Analysis
Summarise the characteristics of each cluster by calculating the mean of all variables for each cluster using group_by() and summarise(). Save the summary in cluster_summary which Provides the mean values of each feature for every cluster.

14.	Dimensionality Reduction
Use Principal Component Analysis (PCA) to reduce the dimensions of the dataset for visualisation. Extract the first two principal components and store them in pca_data.

15.	Visualise Clusters with PCA
Create a scatter plot using ggplot2 to visualise the clusters in a reduced 2D space (PC1 and PC2) with different colours representing different clusters to show the separation of clusters in reduced dimensions.


