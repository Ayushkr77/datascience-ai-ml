-- Hands-On Practice

-- Create:
-- employees table
-- departments table

-- Then solve:
-- average salary per department
-- employees earning above average
-- rank employees by salary
-- top 2 earners per department (use window function)
-- join employees with departments
-- count employees per city


create database db;
use db;

-- STEP 1 — Create Tables

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
-- Insert data:
INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    city VARCHAR(50),
    salary INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
-- Insert data:
INSERT INTO employees VALUES
(101, 'Ayush', 1, 'Delhi', 65000),
(102, 'Riya', 2, 'Mumbai', 48000),
(103, 'Kabir', 1, 'Delhi', 72000),
(104, 'Neha', 3, 'Bangalore', 90000),
(105, 'Simran', 2, 'Mumbai', 52000),
(106, 'Rohan', 3, 'Delhi', 85000);



-- Average Salary per Department
select d.department_name, avg(e.salary) as avg_sal
from employees e join departments d
on e.department_id=d.department_id
group by d.department_name;



-- Employees Earning Above Average
select * from employees
where salary>(select avg(salary) from employees);



-- Rank Employees by Salary (Highest First)
select * from employees order by salary desc;

-- using window func
select name, salary,
dense_rank() over (order by salary desc) as sal_rank
from employees;




-- Top 2 Earners per Department (Window Function)
SELECT *
FROM (
    SELECT e.name,
           d.department_name,
           e.salary,
           RANK() OVER (
               PARTITION BY e.department_id
               ORDER BY e.salary DESC
           ) AS dept_rank
    FROM employees e
    JOIN departments d
      ON e.department_id = d.department_id
) ranked
WHERE dept_rank <= 2;



-- Join Employees with Departments
SELECT e.employee_id,
       e.name,
       d.department_name,
       e.city,
       e.salary
FROM employees e
JOIN departments d
  ON e.department_id = d.department_id;



-- Count Employees per City
select city, count(*) as cnt
from employees group by city;





-- Bonus Advanced Practice

-- Department with highest total salary
select d.department_name, sum(e.salary) as tot_sal
from employees e
join departments d
on e.department_id=d.department_id
group by d.department_name
order by tot_sal desc
limit 1;


-- Employees earning above department average
select e.name, d.department_name, e.salary
from employees e
join departments d
on e.department_id=d.department_id
where e.salary>(select avg(e2.salary) from employees e2 where department_id = e.department_id);