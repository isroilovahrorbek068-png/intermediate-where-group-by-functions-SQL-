drop database homework_3

create database homework_3

use W3Resource

select * from Hospital.Nurse
select *from HR.Employ

--->problem1 
-- From the following table, write a SQL query to
--find those employees whose salaries are less than 6000. 
--Return full name (first and last name), and salary

--->Solution1
select First_name + ' ' + Last_name as full_name, salary from HR.Employ 
 where salary < 6000

--->Problem2 
--2. From the following table, write a SQL query to
--find those employees whose salary is higher than 8000.
--Return first name, last name and department number and salary.

--->Solution2
select First_name, Last_name, department_id,salary from HR.Employ 
where salary >=8000

---> Problem3 
--From the following table, write a SQL query to find those employees whose last name is "McEwen". 
--Return first name, last name and department ID.

---> Solution3 

select First_name, Last_name, department_id,salary from HR.Employ 
where Last_name = 'McEwen'

---> Problem4 
--From the following table, write a SQL query to 
--identify employees who do not have a department number. 
--Return employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,commission_pct, manager_id and department_id.

---> Solution4
select *from HR.Employ
where department_id is null

---> Problem5 
--find the details of 'Marketing' department. Return all fields.

---> Solution5
select *from Employee.department

select*from Employee.department 
where dep_name='MARKETING'

---> Problem6
--find those employees whose first name does not contain the letter ‘M’. 
--Sort the result-set in ascending order by department ID. 
--Return full name (first and last name together), hire_date, salary and department_id.

---> Solution6 
Select First_name + ' ' + Last_name as Full_name, Hire_date, Salary, department_id from  HR.Employ
where first_name not like '%M%'
order by department_id 

---> Problem7 
--earn a salary between 8000 and 12000 (inclusive) 
--and receive a commission (commission_pct is not null)
--were hired before '2003-06-05' and do not belong to the departments with IDs 40, 120, or 70. 

---> Solution7
select * from HR.Employ
where (salary between 8000 and 12000) or (hire_date < '2003-06-05' and not department_id in (40,120,70))

---> Problem8
-- find those employees who do not earn any commission

---> Solution8 
select First_name + ' ' + Last_name as full_name, salary from HR.Employ
where  commission_pct is NUll

---> Problem9 
--find the employees whose salary is in the range 9000,17000 (Begin and end values are included). 
--Return full name, contact details and salary.

---> Solution9 
select First_name + ' ' + Last_name as full_name, phone_number,email,salary from HR.Employ
where salary between 9000 and 17000 

---> Problem10
--find the employees whose first name ends with the letter ‘m’. 
--Return the first and last name, and salary.

---> Solution10
select First_name, Last_name, salary from HR.Employ
where First_name  like '%m'

---> Problem11 
--find those employees whose salaries are not between 7000 and 15000 (Begin and end values are included). 
--Sort the result-set in ascending order by the full name (first and last). 
--Return full name and salary.

---> Solution11
select First_name + ' ' + Last_name as FUll_name ,salary from HR.Employ
where salary not between 7000 and 15000
order by FUll_name

---> Problem12 
-- find those employees who were hired between November 5th, 2007 and July 5th, 2009. 
--Return full name (first and last), job id and hire date.

---> Solution12

alter table  HR.Employ
ADD Full_name AS (First_name + ' ' + Last_name)

select * from HR.Employ

select Full_name, job_id, hire_date from HR.Employ
where hire_date between '2007-11-05' and '2009-07-05'

---> Problem13 
-- find those employees who work either in department 70 or 90. 
--Return full name (first and last name), department id.

---> Solution13
select Full_name, department_id from HR.Employ
where department_id = 70 or department_id = 90

---> Problem14 
-- find those employees who work under a manager. 
-- Return full name (first and last name), salary, and manager ID.

---> Solution14
select Full_name,salary,Manager_id from HR.Employ
where Manager_id is not NULL 

---> Problem15
-- find the employees who were hired before June 21st, 2002.
-- Return all fields.

---> Solution15
select *from HR.Employ
where hire_date <'2002-06-21'

---> Problem16
--find the employees whose managers hold the ID 120, 103, or 145. 
--Return first name, last name, email, salary and manager ID.

---> Solution16
select Full_name, email, salary,manager_id from HR.Employ
where Manager_id in (120,103,145 )

---> Problem17 
-- find employees whose first names contain the letters D, S, or N. 
-- Sort the result-set in descending order by salary.Return all fields.

---> Solution17

select *from HR.Employ
where First_name like '%d%'
	or First_name like '%s%'
	or First_name like '%n%'
order by salary DESC 

---> Problem18
--find those employees who earn above 11000 or the seventh character in their phone number is 3.
--Sort the result-set in descending order by first name. 
--Return full name (first name and last name), hire date, commission percentage, email, and telephone separated by '-', and salary.

---> Solution18 

select *from HR.Employ 
where salary >= 11000 or phone_number like '______3%'
order by First_name DESC

---> Problem19 

-- find those employees whose first name contains a character 's' in the third position. 
-- Return first name, last name and department id.

---> Solution19 

select Full_name, department_id from HR.Employ
where First_name like '__s%'

---> Problem20

--find those employees work in the departments that are not part of the department 50 or 30 or 80. 
--Return employee_id, first_name,job_id, department_id.

---> Solution20 

select * from HR.Employ
where department_id not in (50,30,80)

---> Problem21 
-- find the employees whose department numbers are included in 30, 40, or 90. 
-- Return employee id, first name, job id, department id.

---> Solution21
select employee_id,first_name,job_id, department_id from HR.Employ
where department_id in(30,40,90)

---> Problem22
-- find those employees who worked more than two jobs in the past. 
--Return employee id

---> Solution22
select employee_id from HR.Job_History
group by employee_id
having count(*) >=2 

---> Problem23
-- count the number of employees, the sum of all salary, and difference between the highest salary 
-- and lowest salaries by each job id. 
-- Return job_id, count, sum, salary_difference

---> Solution23 
select job_id, Max(salary)- Min(salary) as Salary_difference, Sum(salary) from HR.Employ
group by job_id

---> Problem24 
-- find each job ids where two or more employees worked for more than 300 days. 
--Return job id.

---> Solution24 
select job_id from HR.Job_history
where end_date- start_date > 300 
group by job_id 
having count(*) >=2 

---> Problem25
-- count the number of cities in each country. 
-- Return country ID and number of cities.
 
---> Solutions25
select country_id,count(*) from HR.Locations
group by country_id

---> Problem26 
-- count the number of employees worked under each manager. 
-- Return manager ID and number of employees.

---> Solution26
select * from HR.Employ
select *from HR.Job_History

select manager_id, count(*) from hr.Employ
group by manager_id
having count(*) >=2

---> Problem27 
-- find all jobs. Sort the result-set in descending order by job title. Return all fields.

---> Solution27
select * from hr.Jobs

---> Problem28 
-- find all those employees who are either Sales Representatives or Salesmen. 
-- Return first name, last name and hire date.

---> Solution28

select First_name, Last_name,hire_date from hr.Employ
where job_id in ('SA_REP','SA_MAN')

---> Problem29 
-- calculate the average salary of employees who receive a commission percentage for each department. 
--Return department id, average salary.

---> Solution29
select department_id, avg(salary) as averge_salary  from HR.Employ
where commission_pct is not null
group by department_id 

---> Problem30 
--find the departments where any manager manages four or more employees. 
--Return department_id.

---> Solution30 
select department_id from hr.Employ
group  by department_id
having count(*)>=4 

---> Problem31
-- find the departments where more than ten employees receive commissions. 
-- Return department id.

---> Solution31 
select department_id from hr.Employ
where commission_pct is not null
group by department_id
having count(*)>10 

---> Problem32 
-- find those employees who have completed their previous jobs. 
-- Return employee ID, end_date.

---> Solution32 
-- Sorry, I don't know, i tried to solve it but I couldn't 

---> Problem33
--who do not have commission percentage and have salaries between 7000, 12000 (Begin and end values are included.) 
--and who are employed in the department number 50. 
--Return all the fields of employees.

--> Solution33 
select * from hr.Employ
where  commission_pct is NULL 
    and salary between 7000 and 12000 
    and department_id = 50

---> Problem34 
--compute the average salary of each job ID. 
--Exclude those records where average salary is on or lower than 8000.
--Return job ID, average salary.

---> Solution35 
select *from hr.Employ
select job_id,avg(salary) from hr.employ
group by job_id
having avg(salary)<= 8000

---> Problem36 
-- find the employees whose first or last name begins with 'D'. 
-- Return first name, last name.

---> Solution36 
select Full_name from hr.Employ
where first_name like 'd%' or Last_name like 'd%'

---> Problem37 
-- find details of those jobs where the minimum salary exceeds 9000.
-- Return all the fields of jobs.

---> Solution27 
select * from hr.Jobs
WHERE min_salary > 9000

---> Problem38 
-- find those employees who joined after 7th September 1987. 
-- Return all the fields.

---> Solutions 
select *from hr.Employ
where hire_date > '1987-09-07'

-- Finally it has been ended :)








	   
