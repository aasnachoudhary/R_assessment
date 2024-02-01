# R assessment - Aasna Choudhary

Bike rental prediction using random forest algorithm

Overview:

This R code aims to predict the total number of bikes rented based on various features using the random forest algorithm. The dataset used for this analysis is loaded from an Excel file (data.xlsx). The code covers data exploration, data type conversion, missing value analysis, and the creation of a random forest model for prediction.


Libraries Used:

readxl: For reading Excel files.

ggplot2: For data visualization.

caTools: For splitting the dataset into training and testing sets.

randomForest: For building the random forest model.

dplyr: For data manipulation.


Loading the Dataset:

The read_excel function is used to load the dataset from the specified Excel file.
head() is employed to check the initial rows of the dataset.


Data Type Conversion:

The transform function is used to convert the data types of specific attributes, ensuring they are appropriate for analysis.


Missing Value Analysis:

The code checks for missing or null values using is.na() and which(is.na()).
No missing values are found in the dataset.


Data Visualization:

Monthly and yearly distributions of bike rentals are visualized using histograms.
A boxplot is created to analyze outliers in temperature, apparent temperature, humidity, and windspeed.


Train-Test Split:

The dataset is split into training (70%) and testing (30%) sets using the sample.split function.


Random Forest Model:

A random forest model is created using the randomForest function with 1000 trees.
The features used for training the model include season, weekday, workingday, weathersit, temp, hum, and windspeed.


Model Prediction:

The trained model is used to predict bike rentals on the test dataset.


Usage Instructions:

Ensure that the required libraries are installed in your R environment.
Place the dataset (data.xlsx) in the specified file path.
Run the code sequentially, checking the outputs and visualizations at each step.
Review the model's performance on the test dataset.
Feel free to customize the code for further analysis or use it as a template for similar prediction tasks.

Note:
It's recommended to have a basic understanding of R and the mentioned libraries to interpret and modify the code accordingly.
For additional details on functions and parameters, refer to the documentation of each library used.
