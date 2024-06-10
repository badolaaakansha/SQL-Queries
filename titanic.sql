SELECT * FROM titanic;
use practice;
-- Show the first 10 rows of the dataset
select * from titanic limit 10;

-- Find the no. of passengers who survived
select count(*) from titanic where survived=1;

-- Find average age of all passengers
select avg(age) from titanic;

-- Find no. of passengers in each class
select pclass,count(pclass) as numpassenger from titanic group by pclass;

-- Find the first 10 rows of dataset sorted by passenger class in desc order
select * from titanic order by pclass desc limit 10;

-- Find no. of passengers in each class sorted in asc order
select pclass,count(pclass) from titanic group by pclass order by pclass asc;

-- Find average fare paid by passengers in each class
select pclass,avg(fare) as Average_Fare from titanic group by pclass;

-- Find the name of passenger with highest fare
select name,fare as highest_fare from titanic order by fare desc limit 1;
select name,fare from titanic where fare=(select max(fare) from titanic);

-- Find the name of passenger who had the highest age among the survivors
select name,age from titanic where survived=1 order by age desc;
select name,age from titanic where age=(select max(age) from titanic where survived=1);

-- Find the no. of passengers who paid more than the average fare
select count(*)as no_of_passengers_who_paid_more_than_the_average_fare from titanic where fare > (select avg(fare) from titanic);

-- Find the name of passenger who had the most parents or childrens on board
select name,parch from titanic where parch=(select max(parch) from titanic);

-- Find number of male and female passengers who survived and order the result by sex in asc order
select sex,count(*) as Gender from titanic where survived=1 group by sex order by sex asc;

-- Find the name,age and fare of oldest passenger who survived
select name,age,fare from titanic where age=(select max(age) from titanic) and survived=1;

-- Find the name and age of the youngest female passenger who survived in third class
select name,age from titanic where sex="female" and survived=1 and pclass=3 and age=(select min(age) from titanic where sex="female" and survived=1 and pclass=3);
select min(age) from titanic where sex="female";
select name,age from titanic where age=(select min(age) from titanic where sex="female" and survived=1 and pclass=3);

-- Find the number of male and female passengers
select sex,count(*) from titanic group by sex;
-- We can also use case here
select count(sex) as Gender_Count,
case
when sex="male" then "Male"
else "Female"
end as Gender
from titanic
group by Gender;

-- Select all passengers who travelled in a cabin that was not shared by other passengers
select * from titanic where cabin not in (select cabin from titanic group by cabin having count(*) > 1);
