use practice;

-- Show all the columns and rows in the table
SELECT * FROM salaries;

-- Show only the EmployeeName and JobTitle columns
select EmployeeName,JobTitle from salaries;

-- Show the number of employees in the table
select count(*) from salaries;

-- show the unique job titles in the table
select distinct JobTitle from salaries;

-- Show the job title and overtime pay for all the employees with overtime pay>50000
select JobTitle,OverTimePay from salaries where overtimepay>50000;

-- Show the average base pay for all employees
select avg(BasePay) as BasePayAverage from salaries;

-- Show top 10 highest paid employees
select EmployeeName,TotalPay as HighestPAy from salaries order by TotalPay desc limit 10 ;

-- Show the average of Basepay,overtimepay and otherpay for each employees
select EmployeeName,(BasePay+OverTimePay+OtherPay)/3 as Average_Pay from salaries;

-- Show all employees who have the word "Manager" in job title
select EmployeeName,JobTitle from salaries where JobTitle like "%Manager%";

-- Show all employees with a job title not equal to manager 
select EmployeeName,JobTitle from salaries where JobTitle not like "%Manager%";
select EmployeeName,JobTitle from salaries where JobTitle <> "Manager";

-- Show all Employees with a totalpay between 50000 and 75000
select * from salaries where TotalPay >= 50000 and TotalPay <= 75000;
select EmployeeName,TotalPay from salaries where (TotalPay between 50000 and 75000);

-- Show all Employees with a basepay < 50000 
select EmployeeName,BasePay from salaries where BasePay <50000;

-- Show all Employees with a basepay < 50000 or totalpay >100000
select EmployeeNAMe,BAsePay,TotalPay from salaries where BasePay < 50000 or TotalPay > 100000;

-- Show all employees with a totlpay benefits values b/w 125000 and 150000 and a job title containing word director
select EmployeeName,TotalPayBenefits,JobTitle from salaries where (TotalPayBenefits between 125000 and 150000) and JobTitle like "%Director%";

-- Show all employees ordered by their totalpay benefits in descending order
Select * from salaries order by TotalPayBenefits desc;

-- Show all jobtitles with an avg basepay of atleast 100000 and order them by avg basepay in descending order
select JobTitle, avg(BasePay) as AverageBasePay from salaries group by JobTitle having avg(BasePay) >=100000 order by AverageBasePay desc ;

-- Delete the column
alter table salaries drop column notes;

-- Update the basepay of all employees with jobtitle containing "Manager" by incresing it 10%
update salaries set BasePay=BasePay * 1.1 where JobTitle like "%Manager%"; 

-- Delete all employees with no basepay
delete from salaries where BasePay=0 or BasePay is null; 

-- Delete all employees who have no overtime pay
delete from salaries where OverTimePay=0 or OverTimePay is null; 