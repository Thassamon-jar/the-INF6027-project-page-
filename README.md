### The INF6027 Project

## Overview
The purpose of these research questions is to identify the primary target based on demographic factors to develop data-driven strategies for improving public engagement with online services.



## Research Questions
RQ1: How do demographic factors influence the probability of using online services?

RQ2: How accurately can a logistic regression model predict users' probability of online service adoption based on these demographic factors?

RQ3: Which user group is the primary target that uses online services the most and should be prioritised for promoting online services to maximise adoption rates?


## Key Findings

1.The age group has no significant effect on online service access.

2.Males are significantly more likely to access online services than females.

3.Married and single individuals have higher odds of online service use than the reference group.

4.The model shows strong predictive ability, with 89% accuracy.

5.Odds ratio analysis highlights demographic differences in engagement, informing digital inclusion policies.



## Visualizations to Provide Insights
<img src="./Access Method by Cluster_Bar Chart.png" width="100%" height="100%">

A bar chart illustrates the p-values of demographic predictors, with the red dashed line marking the significance threshold (0.05).

•	Age Group 
The figure demonstrates that all age group predictors exceed the 0.05 threshold, confirming that age does not significantly influence online service adoption. 

•	Gender
The figure highlights Gender (Male) as a statistically significant predictor (P = 0.02), as indicated by the bar falling to the left of the red significance threshold. This aligns with the findings that males are 7.3 times more likely to use online services than females.

•	Marital Status
The significance of Married (P = 0.04), Single (P = 0.05), and Prefer not to say (P = 0.04) categories is evident in the figure, as these variables have bars that fall within the significance threshold. This reinforces the conclusion that marital status plays a crucial role in predicting online service usage, with single and married individuals showing the highest likelihood of engagement.
These findings suggest that gender and marital status play a crucial role in determining online service usage, while age differences are not a major factor.



<img src="./Odd Ratios.png" width="100%" height="100%">
A bar chart illustrates the odds ratios of key demographic groups with higher engagement in digital services.



## Steps to Run the Code for Building the Clustering Model

Download the cleaning_opendatarelease.xlsx file before running the code.


#### 1. Installing and Loading Packages

Required packages: readxl, dplyr, caret, lattice for data import, preprocessing, and modelling.


#### 2. Importing the Dataset

Used read_excel() to import survey data on online service access patterns.


#### 3. Data Cleaning

Handled optional survey responses that resulted in blanks.
Re-coded Access_Online into binary values:
1 = Yes (Online Access)
0 = No (No Online Access)


#### 4. Data Transformation

Converted categorical variables (Access_Online, Gender, Age_Group, Marital_Status) into factors to ensure compatibility with logistic regression.


#### 5. Training and Testing Split

Split dataset into:
70% training set (for model fitting)
30% testing set (for performance evaluation)


#### 6. Model Training

Applied logistic regression using glm() to predict online access based on demographic factors.
Used the logit link function to transform probabilities into log-odds.


#### 7. Model Specification

The logistic regression model in this study examines how demographic factors, including age group, gender, and marital status, influence the likelihood of accessing online services. The model estimates the probability that an individual has online access based on these characteristics. Each demographic factor is assigned a coefficient, which reflects the strength and direction of its relationship with online access. By analysing these coefficients, the model provides valuable insights into which groups are more or less likely to engage with online services, helping inform policies to promote digital inclusion.


#### 8. Model Parameters

Regression type: Binomial logistic regression (binary outcome: Yes/No).
Estimation method: Fisher Scoring Algorithm (default in glm()).
Classification threshold:
Probability ≥ 0.5 = Online User (1)
Probability < 0.5 = Non-Online User (0)


#### 9. Model Evaluation

Accuracy was the main metric to assess how well the model’s predictions matched actual data in the test set.
Higher accuracy indicates better performance, supporting the model’s use in policy development for digital service adoption.


