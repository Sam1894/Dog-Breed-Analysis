# 🐶 Dog Breed Analysis Dashboard

## Project Overview

This project focuses on cleaning and analyzing a dataset of dog breed characteristics to understand the relationships between various traits. The data, initially a raw CSV file, was processed in Google BigQuery to handle inconsistencies and then visualized in a Tableau Public dashboard.

The final interactive dashboard explores the connections between factors like popularity, intelligence, lifetime, and cost, providing a clean and insightful view of the data.

### Data Source

The original data is from a CSV file containing various attributes of dog breeds (original data is from http://www.informationisbeautiful.net).

***

### Methodology

The data cleaning and preparation process was performed using **BigQuery SQL**. This was a multi-step process to ensure data integrity and create a new, permanently clean table for efficient querying.

The key steps in the SQL workflow were:

* **Step 1: Initial Table Creation**
    A table named `dogs_breed` was created in Google BigQuery from the raw CSV file. The initial schema had inconsistencies, with many numeric fields incorrectly stored as `STRING` types.

* **Step 2: Data Cleaning and Type Casting**
    A new table, `dogs_breed_cleaned_final`, was created to store a clean version of the data.
    * **Handling Missing Values:** The `REPLACE` and `NULLIF` functions were used to convert the string `'no data'` into `NULL` values, which are essential for mathematical operations.
    * **Correcting Data Types:** The `SAFE_CAST` function was used to convert string columns to the `FLOAT64` data type, which can handle decimals, without throwing errors for non-numeric values.
    * **Renaming Columns:** Column names were converted to snake case for clarity and consistency (e.g., `Dog breed` was renamed to `dog_breed`).

* **Step 3: Finalizing the Clean Table**
    The final query included a `WHERE` clause to filter out blank rows. An `ORDER BY` clause was added to permanently sort the `dogs_breed_cleaned_final` table alphabetically by `dog_breed`.

***

### Final Dashboard

The cleaned data was then connected to **Tableau Public** to create a dashboard with the following visualizations:

* **Intelligence vs. Popularity:** A scatter plot showing the relationship between these two rankings. The data was disaggregated, and `category` was used for both color and shape to add visual context.
* **Lifetime vs. Cost:** Another scatter plot analyzing the relationship between `life_expectancy` and `average_price`, with `food_per_lifetime` represented by the size of the data points.
* **Average Price by Size Category:** A bar chart comparing the average price across different size categories.

***

### Interactive Dashboard Link

The final dashboard is interactive, allowing users to filter one chart by clicking on another. You can view and interact with the complete dashboard here:

[https://public.tableau.com/views/DogBreedAnalysisDashboard/DogBreedAnalysisDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link](https://public.tableau.com/views/DogBreedAnalysisDashboard/DogBreedAnalysisDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
