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
