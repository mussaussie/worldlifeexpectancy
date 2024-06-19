# World Life Expectancy Project Part 1 (Data Cleaning)

This project focuses on data cleaning and exploratory data analysis (EDA) on the World Life Expectancy dataset using SQL. The steps include removing duplicates, handling missing values, and performing EDA to gain insights into the data.

## Steps

### Step 1: Initial Data Glance
Get an overview of the dataset.

### Step 2: Remove Duplicates
Identify and remove duplicate records using window functions.

#### Check for Duplicates
Identify records with duplicate country and year combinations.

#### Identify Duplicate Rows
Use window functions to mark duplicate rows for removal.

#### Remove Duplicate Rows
Delete the identified duplicate rows from the dataset.

### Step 3: Handle Missing Values

#### Check for Null Values in Status
Identify records with missing status values.

#### Update Missing Status Values
Fill in missing status values based on other records for the same country.

#### Check for Null Values in Life Expectancy
Identify records with missing life expectancy values.

#### Update Missing Life Expectancy Values
Estimate and fill in missing life expectancy values using neighboring year data.

### Step 4: Exploratory Data Analysis (EDA)

#### Life Expectancy Increase by Country
Analyze the increase in life expectancy for each country over time.

#### Average Life Expectancy by Year
Calculate the average life expectancy for each year.

#### Comparison Between Life Expectancy and GDP
Analyze the relationship between life expectancy and GDP for each country.

#### GDP and Life Expectancy
Compare life expectancy for countries with high and low GDP.

#### Average Life Expectancy by Status
Calculate the average life expectancy for developed and developing countries.

## Conclusion
This project demonstrates the steps to clean and analyze a dataset using SQL. By removing duplicates, handling missing values, and performing exploratory data analysis, we can gain meaningful insights from the data.


## Contact
For any questions or further information, please contact me at mussaussie@gmail.com.

---
Abdul Mussavir
