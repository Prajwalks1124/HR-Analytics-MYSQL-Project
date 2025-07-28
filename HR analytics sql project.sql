create database hr;
use hr;
show tables;
select * from hr_analytics;
desc hr_analytics;
alter table hr_analytics change column ï»¿EmpID Empid text;  ## converted column name

select  distinct age,count(age) from hr_analytics group by age;  ## unique ages

select count(*) from hr_analytics;  ## total number of rows

select distinct AgeGroup from hr_analytics;  ## unique Age Group
select * from hr_analytics;

SELECT Empid, Department, MAX(MonthlyIncome) AS Highest_Income      ## Top 10 Monthly Income 
FROM hr_analytics GROUP BY Empid , Department
ORDER BY Highest_Income DESC LIMIT 10;
  
## Does overtime impact attrition?
SELECT OverTime, Attrition, COUNT(*) AS total FROM hr_analytics GROUP BY OverTime, Attrition;

select * from hr_analytics;

## How many employees are ther in the Dataset?
select count(Empid) as Total_Employees from hr_analytics;  

## List all unique job role in the company
select * from hr_analytics;
select distinct JobRole from hr_analytics;

## Find the number of employees in each department
select Department,count(Empid) from hr_analytics group by Department;

## Find the average Monthly Income of Employees grouped by job role
select * from hr_analytics;
select JobRole,round(avg(MonthlyIncome)) as Average_income from hr_analytics 
group by JobRole order by Average_income desc;

## List the Top 5 Higest_paid employees showing their Empid,JobRole and Monthly income

select * from hr_analytics;
select Empid,JobRole,max(MonthlyIncome) as Highest_paid_emp from hr_analytics
group by Empid,JobRole order by Highest_paid_emp desc limit 5;


## How many employees work overtime and have a job satisfaction score of 4?
select * from hr_analytics;
select count(Empid),OverTime,JobSatisfaction from hr_analytics where OverTime="Yes"and JobSatisfaction=4;
                                 ## OR
select count(Empid) as Total_employees from hr_analytics where OverTime="Yes" and JobSatisfaction=4;

## Correlation-like check: Years at company vs. salary
SELECT YearsAtCompany, ROUND(AVG(MonthlyIncome)) AS Avg_Salary
FROM hr_analytics GROUP BY YearsAtCompany ORDER BY YearsAtCompany;

## Which department has the highest average monthly income
select * from hr_analytics;
select Department,round(avg(MonthlyIncome)) as Average_income from hr_analytics group by Department
order by Average_income desc ; 

## Find the Total number of employees who have more than 5 years at the company and have never been promoted
select * from hr_analytics;
select count(Empid) from hr_analytics where YearsSinceLastPromotion=0 and YearsAtCompany>5;

## Find the Top 3 Job roles with the highest attrition rate
select * from hr_analytics;
select JobRole,round(count(case when Attrition="Yes" then 1 end) * 100/count(*)) as attrition_rate 
from hr_analytics group by JobRole order by attrition_rate desc limit 3;

## List each employee's Empid,Jobrole,Monthlyincome and their income rank within their department

select * from hr_analytics;
select Empid,Department,JobRole,MonthlyIncome,rank() over(partition by Department order by MonthlyIncome desc)
as income_rank from hr_analytics order by income_rank;