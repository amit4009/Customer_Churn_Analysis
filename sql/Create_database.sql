create database bd_churn;
use bd_churn;
select * from Stg_churn;

select count(*) from Stg_churn
where Customer_Status ='Joined';