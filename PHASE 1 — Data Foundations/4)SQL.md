# Step 4 — SQL

SQL = Structured Query Language  
It is how you talk to databases.

Almost every company stores data in databases.

---

## 1️⃣ What is a Database?

A database contains tables.

Each table:

- Rows → Records  
- Columns → Features  

### Example

Employees table

| id | name  | city   | salary |
|----|-------|--------|--------|

Departments table

| id | department |
|----|------------|

SQL allows you to query and combine them.

---

## 2️⃣ Basic SELECT

Get everything:

```sql
SELECT * FROM employees;
```

Select specific columns:

```sql
SELECT name, salary FROM employees;
```

Filtering:

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

This is the foundation.

---

## 3️⃣ Aggregations (Very Important)

```sql
SELECT AVG(salary) FROM employees;
SELECT COUNT(*) FROM employees;
SELECT MAX(salary) FROM employees;
```

### Group By

```sql
SELECT city, AVG(salary)
FROM employees
GROUP BY city;
```

This is analytics logic.

---

## 4️⃣ Sorting

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

Highest salary first.

---

## 5️⃣ HAVING (Advanced Filtering on Groups)

```sql
SELECT city, AVG(salary)
FROM employees
GROUP BY city
HAVING AVG(salary) > 60000;
```

- `WHERE` filters rows.  
- `HAVING` filters groups.  

Important difference.

---

## 6️⃣ Joins (Critical Skill)

Example:

```sql
SELECT e.name, d.department
FROM employees e
JOIN departments d
ON e.dept_id = d.id;
```

### Types of Joins

- INNER JOIN → Matching rows only  
- LEFT JOIN → All left + matches  
- RIGHT JOIN → All right + matches  

Joins power data warehouses.

---

## 7️⃣ Subqueries

```sql
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
```

This finds employees above average.

Used often in analytics.

---

## 8️⃣ Window Functions (Advanced but Important)

```sql
SELECT name,
       salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
FROM employees;
```

This ranks employees.

Very common in real jobs.