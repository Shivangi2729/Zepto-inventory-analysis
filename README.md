# Zepto-inventory-analysis
## Overview of the project

This project is a learning-focused SQL analysis project created to strengthen my practical understanding of data analysis concepts using a real-world–style dataset. While working on this project, I actively explored multiple learning resources and platforms to understand best practices in data cleaning, exploration, and business-focused analysis.

The goal of this project is not only to derive insights from the data but also to learn by doing — applying theoretical concepts in a hands-on manner using MySQL. I am documenting and publishing this work as I learn, allowing me to reflect on my progress, solidify concepts, and continuously improve my analytical thinking.

By analyzing Zepto’s inventory data, this project demonstrates how structured SQL queries can be used to explore datasets, validate data quality, and extract meaningful business insights, even during the learning phase.

## Objectives
 - Understand the structure and quality of the inventory dataset
 - cleaned and validate pricing and inventory-related data
 - perform exploratory analysis to identify trends and anamolies
 - generate actionable insights related to inventory management and pricing strategies

## Dataset Description
The following Dataset the following columns:
 - **category** : product category 
 - **name** : name of the product
 - **mrp** : maximum retail price
 -  **discountPercent** : discount percentage applied on the product
 -  **discountedSellingPrice** : final selling price after discount
 -  **availableQuantity** : current stock available in the inventory
 -  **quantity** : per pack size

## Workflow of the project 
### 1.Database Creation :
      ```create database zepto; ```
### 2.Importing the Database : 
The data was imported into MySQL using the Table Import Wizard for structured and efficient data loading.

### 3.Data Exploration
- Counted the total number of records in the dataset
- Viewed a sample of the dataset to understand structure and content
- Checked for null values across all columns
- Identified distinct product categories available in the dataset
- Compared in-stock vs out-of-stock product counts
- Detected products present multiple times, representing different SKUs

### 4.Data Cleaning
- Identified and removed rows where MRP or discounted selling price was zero
- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability

### 5.Derived metrices
- **discount** : Calculated by subtracting the discounted selling price from the MRP to quantify the absolute discount offered on each product.
- **cost_per_gm : Derived by dividing the product weight (in grams) by the discounted selling price to evaluate value-for-money across products.


### 6.Business Insights
- Found top 10 best-value products based on discount percentage
- Identified high-MRP products that are currently out of stock
- Estimated potential revenue for each product category
- Filtered expensive products (MRP > ₹500) with minimal discount
- Ranked top 5 categories offering highest average discounts
- Calculated price per gram to identify value-for-money products
- Grouped products based on weight into Low, Medium, and Bulk categories
- Measured total inventory weight per product category



## Some Extras
I have also included a document named 'Learnings' in the repository that outlines additional learnings and workflows explored during this project, covering both Excel-based data preparation techniques and GitHub documentation practices.
 
