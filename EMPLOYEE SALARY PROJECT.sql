create database emp_salaries;
# 1 Retrieve All data
select * from datascience_salaries_2024;
# 2 Retrieve the first 10 rows of the dataset. 
select * from datascience_salaries_2024
Limit 10;
# 3.Retrieve a list of distinct job_title values. 
select distinct(job_title) from datascience_salaries_2024;
# 4. Count how many unique employee locations (employee_residence) are present in the dataset.
select distinct(count(employee_residence)) from datascience_salaries_2024;
# 5 Retrieve the job title and average salary for each job title, ordered from highest to lowest.
select job_title, avg(salary) from datascience_salaries_2024
group by job_title
order by job_title DESC;
# 6 Get the top 5 highest paying job titles.
 Select job_title from datascience_salaries_2024
 Limit 5;
 # 7 Calculate the average salary for employees in different countries (company_location), filtering only countries with at least 10 employees.
 SELECT company_location, AVG(salary) AS avg_salary
FROM datascience_salaries_2024
GROUP BY company_location
HAVING COUNT(company_size) >= 10;
# 8 Calculate the average salary based on the experience_level of employees. 
select experience_level, avg(salary) from datascience_salaries_2024
Group by experience_level;
# 9 Find the average salary for employees who work fully remotely (remote_ratio = 100). 
select avg(salary) from datascience_salaries_2024
where remote_ratio = 100;
# 9 Compare the average salary of employees who work fully remotely versus those who don’t (remote ratio less than 100). 
SELECT 
    CASE 
        WHEN remote_ratio = 100 THEN 'Fully Remote' 
        ELSE 'Not Fully Remote' 
    END AS work_type,
    AVG(salary) AS avg_salary
FROM datascience_salaries_2024
GROUP BY 
    CASE 
        WHEN remote_ratio = 100 THEN 'Fully Remote' 
        ELSE 'Not Fully Remote' 
    END;
# 10 Find the number of employees hired per year, grouped by experience_level.
SELECT experience_level, AVG(work_year) AS average_work_year
FROM datascience_salaries_2024
GROUP BY experience_level;
# 11 Get the highest, lowest, and average salary for each year.
select max(salary), min(salary), avg(salary) ,work_year from datascience_salaries_2024
group by work_year;
# 12 Retrieve the details of employees who live in the US and earn more than $150,000.
select * from datascience_salaries_2024 
where employee_residence = 'US' AND salary_in_usd >=15000;
#13 Find all employees who work in Germany or have a salary below $80,000.
select * from datascience_salaries_2024
where employee_residence = 'GE' OR salary_in_usd <80000;
#14 Retrieve employees who either work remotely or have an experience level of SE (Senior). 
select * from datascience_salaries_2024
where remote_ratio = 100 or experience_level = 'SE';
# 15 Increase the salary by 10% for all employees who have the job title 'Data Scientist'. 
UPDATE datascience_salaries_2024
SET salary = salary * 1.10
WHERE job_title = 'Data Scientist';
# 16 Change the job_title to 'Senior Data Analyst' for employees with more than 10 years of experience (experience_level = 'SE'). 
UPDATE datascience_salaries_2024
SET job_title = 'Senior Data Analyst'
WHERE experience_level = 'SE';




