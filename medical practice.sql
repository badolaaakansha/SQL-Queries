use practice;
-- Clean DataSet
alter table medical modify age int;


-- Select all columns for all patients
select * from medical;

-- Display the average claim amount for patients in each region
select region,avg(charges)as claim_amount from medical group by region; 

-- Select max and min BMI values from the table
select min(Bmi) as MIN_BIM, max(bmi) as MAX_BMI from medical;

-- Select the PatientId,age and BMI for patients with a BMI between 40 and 50
select age,BMI from medical where BMI between 40 and 50;

-- Select the number of smokers in each region
select region,count(smoker) from medical group by region;

-- What is average claim amount for patients who are both diabetic and smoker
select avg(charges) from medical where smoker="yes";

-- Retrive all patients who have a BMI greater than average BMI of patients who are smokers
select * from medical where BMI > (select avg(BMI) from medical where SMoker="YEs");
select avg(BMI) from medical where SMoker="YEs";

-- select average charges for patients in each age groups
select age , avg(charges) from medical group by age;

-- what is average age of policyholders
select avg(age) as Age from medical;

-- how many males and females in dataset
select sex as Gender,count(sex) as GenderCount from medical group by sex;

-- What is the avg bmi 
select avg(bmi) from medical;

-- how many are smokers
select count(smoker) from medical where smoker="yes";

-- what are different regions in dataset
select distinct region from medical;

-- What is the distribution of policyholder based on no. of children they have
select children as Number_of_Children,count(*) as ParentCount, case
when children=0 then "They have no Child"
when children=5 then "They have 5 childrens"
when children<5 then "They have less than 5 childrens"
else "They have more than 5 childrens"
end as ChildDistribution 
from medical group by children 
order by children asc;

select children,count(*)as Number_of_Childrens from medical group by children order by children;

-- What is the average insurance charges for smokers vs non-smoker
select smoker,avg(charges) as Insurance_Charge from medical group by smoker;

-- How do insurance charges vary by age group
select count(charges),avg(charges) as Charge,
case
when age < 20 then "0-20"
when age between 20 and 40 then "20-40"
when age between  40 and 60 then "40-60"
else "More than 60"
end as Age_Group
from medical group by Age_Group order by Age_Group asc;

-- Query to count the number of policyholders in each regions who have more than 2 childrens
select region,count(children) from medical group by region having count(children)>2;

-- Query to find avg insurance charges for smokers and non-smokers,but only show results for smokers with charges above a certain threshold
select smoker,avg(charges),
case
when avg(charges) between 0 and 1000 then "0-1000"
 when avg(charges) between 1000 and 10000 then "1000-10000"
when avg(charges) between 10000 and 20000 then "10000-20000"
else "More than 20000"
end as Count_Charges
from medical group by smoker having avg(charges) > 20000;

select smoker,avg(charges) from medical group by smoker having smoker ="YES" and avg(charges)>20000;

-- Query to find the average BMI for policyholders based on their age group and only showing results for AG with avg BMI 
select avg(BMI),
case
when age between 0 and 20 then "0-20"
when age between 20 and 40 then "20-40"
when age between 40 and 60 then "40-60"
else "More than 60" 
end as Age_Group
from medical group by Age_Group having avg(BMI) > 30;

-- Query to count no. of policyholders by their agegroup,but only showing results for age groups where no. of policyholders>certain threshold
select count(*) as Number_Of_PolicyHolders,
case
when age between 0 and 20 then "0-20"
when age between 20 and 40 then "20-40"
when age between 40 and 60 then "40-60"
else "More than 60" 
end as Age_Group
from medical group by Age_Group having count(*)>1000;

-- Query to find the regions where % of smokers > overall average % of smokers in dataset
select region from medical group by smoker having ((count(smoker)*0.01 and smoker="yes") > (avg(smoker) and  smoker="yes"));

SELECT region 
FROM medical 
WHERE smoker = 'yes' 
GROUP BY region 
HAVING (COUNT(*) * 0.01) > (SELECT AVG(smoker_percentage) 
                              FROM (SELECT COUNT(*) * 0.01 AS smoker_percentage 
                                    FROM medical 
                                    WHERE smoker = 'yes' 
                                    GROUP BY region) AS subquery);


select count(smoker)*0.01 from medical where smoker="yes";