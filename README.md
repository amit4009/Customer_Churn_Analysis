# Customer_Churn_Analysis

# Overview
<br>
This project aims to predict customer churn using a machine learning model. Churn prediction is crucial for businesses to identify customers who are likely to leave and take proactive measures to retain them. This project includes data visualization, data preprocessing, model building, evaluation and prediction of churner profiles.
<br>

# Dataset Description
<br>
 This dataset includes comprehensive information about customer demographics, service usage patterns, and billing details, which are used to predict customer churn. Below is a detailed description of each column in the dataset:
<br>
<b> Columns</b>
<br>
<b>Customer_ID:</b> Unique identifier for each customer.
<br>
<b>Gender: </b>Gender of the customer (e.g., Male, Female).
<br>
<b>Age:</b> Age of the customer.
<br>
<b>Married: </b>Marital status of the customer (e.g., Yes, No).
<br>
<b>State: </b>State where the customer resides.
<br>
<b>Number_of_Referrals:</b> Number of referrals made by the customer.
<br>
<b>Tenure_in_Months: </b>Duration of the customer's subscription in months.
<br>
<b>Value_Deal: </b>Indicates whether the customer is on a value deal (e.g., Yes, No).
<br>
<b>Phone_Service:</b> Indicates if the customer has a phone service (e.g., Yes, No).
<br>
<b>Multiple_Lines:</b> Indicates if the customer has multiple phone lines (e.g., Yes, No).
<br>
<b>Internet_Service: </b>Indicates if the customer has internet service (e.g., Yes, No).
<br>
<b>Internet_Type:</b> Type of internet service (e.g., DSL, Fiber optic, None).
<br>
<b>Online_Security:</b> Indicates if the customer has online security add-on (e.g., Yes, No).
<br>
<b>Online_Backup: </b>Indicates if the customer has online backup add-on (e.g., Yes, No).
<br>
<b>Device_Protection_Plan: </b>Indicates if the customer has a device protection plan (e.g., Yes, No).
<br>
<b>Premium_Support: </b>Indicates if the customer has premium technical support (e.g., Yes, No).
<br>
<b>Streaming_TV:</b> Indicates if the customer has streaming TV service (e.g., Yes, No).
<br>
<b>Streaming_Movies: </b>Indicates if the customer has streaming movies service (e.g., Yes, No).
<br>
<b>Streaming_Music: </b>Indicates if the customer has streaming music service (e.g., Yes, No).
<br>
<b>Unlimited_Data: </b>Indicates if the customer has an unlimited data plan (e.g., Yes, No).
<br>
<b>Contract: </b>Type of contract (e.g., Month-to-Month, One Year, Two Year).
<br>
<b>Paperless_Billing: </b>Indicates if the customer uses paperless billing (e.g., Yes, No).
<br>
<b>Payment_Method:</b> Payment method used by the customer (e.g., Bank transfer, Credit card, Electronic check, Mailed check).
<br>
<b>Total_Charges: </b>Total amount charged to the customer.
<br>
<b>Monthly_Charges: </b>Monthly charges for the customer.
<br>
<b>Total_Revenue: </b>Total revenue generated by the customer.
<br>
<b>Churn_Category: </b>Category of churn reason (e.g., Competitor, Dissatisfaction, Other).
<br>
<b>Churn_Reason: </b>Specific reason for churn (e.g., Competitor offered higher speeds, Price too high).
<br>
<b>Customer_Status: </b>Target variable for prediction(Churned,Stayed,Joined) 
<br>

<b>Target Variable</b><br>
<b>Customer_Status: </b>The target variable for the prediction model. It indicates whether a customer has churned (1) or stayed (0).

# Data Exploration 
<br>
The SQL operations performed on the stg_Churn table for exploratory data analysis, null value handling, data cleaning, and preparing data for visualization. The steps include checking distinct values, identifying nulls, removing nulls, and creating views for use in Machine learning model training.
<br>
<b>Exploratory Data Analysis</b>

```sql
--Gender Distribution

select Gender, count(Gender) as Totalcount,
count(Gender) * 100.00 / ( select count(*) from Stg_churn) as percentage
from Stg_churn
group by Gender;

-- Contract Types Distribution:

select Contract, count(Contract) as Totalcount,
count (Contract) * 100.0 / ( Select count (* ) from Stg_churn) as percentage
from Stg_churn
group by Contract;


-- Customer Status and Revenue Distribution:

select Customer_Status, count(Customer_Status) as totalcount,
sum(Total_Revenue) as Totalrev,
sum(Total_Revenue) * 100.0 / ( Select sum(Total_Revenue) from Stg_churn) as Revpercentage
from Stg_churn
group by Customer_Status;

-- State Distribution:

SELECT State, Count(State) as TotalCount,
Count(State) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from Stg_Churn
Group by State
Order by Percentage desc
```
<br>
<b> the the sql file for complete code</b><br>
* Check Null Values<br>
* Remove Null Values and Insert Clean Data<br>
* Create Views for Power BI<br>

# Churn Analysis Summary (Summary.png)
## DAX Queries

Here are some DAX queries to calculate metrics related to customer churn using the `prod_Churn` dataset.

```dax
Total Customers = Count(prod_Churn[Customer_ID]) 
 
New Joiners = CALCULATE(COUNT(prod_Churn[Customer_ID]), prod_Churn[Customer_Status] = 
"Joined") 
 
Total Churn = SUM(prod_Churn[Churn Status])  
 
Churn Rate = [Total Churn] / [Total Customers] 
```
<br><b>Please check pdf file for all query</b><br>

![alt text](Summary.png)

[Link to PowerBI Dashboard](https://app.powerbi.com/links/pSHktEcXVV?ctid=a8eec281-aaa3-4dae-ac9b-9a398b9215e7&pbi_source=linkShare)
<br>

<b>Churn by Gender:</b> 35.85% of males and 64.15% of females churn.<br>
<b>Churn by Payment Method:</b> Mailed check users have the highest churn rate (37.82%).<br>
<b>Churn by Contract:</b> Month-to-month contract holders have the highest churn rate (46.53%).<br>
<b>Churn by Age Group:</b> Customers aged > 50 have the highest churn rate (31.55%).<br>
<b>Churn by Tenure Group: </b>Customers with tenure of 18-24 months have the highest churn rate (27.50%).<br>
<b>Churn by State: </b>Jammu & Kashmir has the highest churn rate (57.19%).<br>
<b>Churn by Internet Type:</b> Fiber optic users have the highest churn rate (41.10%).<br>
<b>Churn by Services Used:</b> Customers using multiple services and online backup have higher churn rates.<br>

# Model Building
<b>Data Preprocessing</b>
The data preprocessing steps include:
<br>
<b>Loading Data: </b>Reading data from an Excel file.<br>
<b>Dropping Unnecessary Columns: </b>Removing columns that are not needed for prediction.<br>
<b>Label Encoding: </b>Encoding categorical variables.<br>
<b>Scaling: </b>Standardizing the features.<br>

<b>Model Training</b><br>
Two machine learning models were trained:<br>
<b>Logistic Regression: (Accuracy : 79% )</b><br>
Trained with increased iterations and scaled data.<br>
Hyperparameter tuning using GridSearchCV.<br>

<b>Random Forest: (Accuracy: 85% )</b><br>
Trained with default parameters.<br>
Hyperparameter tuning using GridSearchCV.<br>

<b>Evaluation</b>
The models were evaluated using the following metrics:<br>
Confusion Matrix: To visualize the performance of the models.<br>
Classification Report: To get precision, recall, and F1-score.<br>
<br>

# findings from the Dashboards
<b>Predicted Churner Profile (Prediction1.png)</b>

![alt text](Prediction1.png)

[Link to power BI Dashboard](https://app.powerbi.com/links/pSHktEcXVV?ctid=a8eec281-aaa3-4dae-ac9b-9a398b9215e7&pbi_source=linkShare&bookmarkGuid=253bca62-337b-4265-8395-486c45276961)
<br>

<b>Gender: </b>134 males and 245 females are predicted to churn.<br>
<b>Age Group: </b>Most churners are in the 20-35 and 36-50 age groups.<br>
<b>Marital Status: </b>194 married and 185 single customers are predicted to churn.<br>
<b>State: </b>Uttar Pradesh, Maharashtra, and Tamil Nadu have the highest number of predicted churners.<br>
<b>Tenure Group:</b> Most churners have a tenure of 6-12 months or more than 24 months.<br>
<b>Payment Method:</b> Credit card is the most common payment method among predicted churners.<br>
<b>Contract: </b>Month-to-month contracts have the highest churn rate.<br>
<br>

# Conclusion
<br>
The project successfully predicts customer churn and provides valuable insights into the factors contributing to churn. The Random Forest model performed better than the Logistic Regression model. The dashboards offer a comprehensive view of the churn analysis, helping stakeholders make informed decisions to reduce churn.
<br>