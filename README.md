# the-INF6027-project-page-

Steps to Run the Code for Building the Clustering Model

1.	Install Necessary Packages
Install the required R packages (readxl, dplyr, factoextra, ggplot2) to handle data processing, clustering, and visualisation. This ensures that all functions used in the code are available.

2.	Load Libraries
Load the libraries into the R session to enable their functionality:
o	readxl: For reading Excel files.
o	dplyr: For data manipulation.
o	factoextra: For clustering evaluation and visualisation.
o	ggplot2: For creating plots.
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
o	data_scaled: The standardised dataset.
o	centers = 3: Specifies the number of clusters (k).
o	nstart = 25: Runs the algorithm with 25 random initialisations for robustness. Assign the resulting cluster labels to a new column (Cluster) in the data_features dataset.
13.	Cluster Analysis
Summarise the characteristics of each cluster by calculating the mean of all variables for each cluster using group_by() and summarise(). Save the summary in cluster_summary which Provides the mean values of each feature for every cluster.

14.	Dimensionality Reduction
Use Principal Component Analysis (PCA) to reduce the dimensions of the dataset for visualisation. Extract the first two principal components and store them in pca_data.

15.	Visualise Clusters with PCA
Create a scatter plot using ggplot2 to visualise the clusters in a reduced 2D space (PC1 and PC2) with different colours representing different clusters to show the separation of clusters in reduced dimensions.


