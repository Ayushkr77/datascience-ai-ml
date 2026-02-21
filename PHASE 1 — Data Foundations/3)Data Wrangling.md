# Step 3 — Data Wrangling (Lesson 3)

Cleaning makes data usable.  
Wrangling makes it meaningful.

---

## 1️⃣ What is Data Wrangling?

Data wrangling = transforming structured data into answers.

Think of it like this:

```
Raw Data
   ↓
Clean Data
   ↓
Grouped / Aggregated / Reshaped Data
   ↓
Business Insight
```

It answers questions like:

- Which department spends most?
- Which city generates highest revenue?
- Who performs above average?
- What pattern exists over time?

Wrangling = summarizing + restructuring + comparing.

---

## 2️⃣ Grouping Data (Most Important Skill)

Let’s use this dataset:

```python
import pandas as pd

data = {
    "department": ["IT", "IT", "HR", "HR", "Finance", "Finance"],
    "salary": [60000, 70000, 40000, 45000, 80000, 75000]
}

df = pd.DataFrame(data)
print(df)
```

### 🔹 Basic Grouping

```python
df.groupby("department")["salary"].mean()
```

Output:

```
department   mean_salary
Finance      77500
HR           42500
IT           65000
```

This answers:

What is the average salary per department?

---

### 🔹 Other Aggregations

```python
df.groupby("department")["salary"].sum()
df.groupby("department")["salary"].max()
df.groupby("department")["salary"].count()
df.groupby("department").size()  # No need to pick specific col
```

Grouping = business intelligence engine.

---

## 3️⃣ Multiple Aggregations

Instead of running separate commands:

```python
df.groupby("department")["salary"].agg(["mean", "max", "min", "count"])
```

This builds mini-report tables.

This is how dashboards are generated.

---

## 4️⃣ Filtering Data

Filtering extracts specific slices.

### 🔹 Basic Filter

```python
df[df["salary"] > 50000]
```

### 🔹 Multiple Conditions

```python
df[(df["salary"] > 50000) & (df["department"] == "IT")]
```

Important operators:

- `&` → AND  
- `|` → OR  
- `~` → NOT  

Filtering is daily analyst work.

---

## 5️⃣ Sorting

Sorting helps rank and prioritize.

```python
df.sort_values("salary", ascending=False)
```

Top earners first.

Sort by multiple columns:

```python
df.sort_values(["department", "salary"], ascending=[True, False])  # True for department → A → Z (alphabetical order), False for salary → largest → smallest
```

Common in reporting.

---

## 6️⃣ Creating New Features

Feature engineering = intelligent transformation.

### 🔹 Tax Calculation

```python
df["tax"] = df["salary"] * 0.2
```

### 🔹 Boolean Feature

```python
df["high_income"] = df["salary"] > 65000
```

Later in ML, features determine model performance.

---

### 🔹 Above Department Average (Advanced Thinking)

```python
dept_avg = df.groupby("department")["salary"].transform("mean")   # .transform() is perfect here because it broadcasts the group-level value back to each row, unlike .agg() which returns one value per group.
df["above_dept_avg"] = df["salary"] > dept_avg
```

This compares each row to its group.

Strong analytical thinking.

---

## 7️⃣ Merging Tables (SQL JOIN in Pandas)

Real datasets are multi-table.

### Employees Table

```python
employees = pd.DataFrame({
    "id": [1, 2, 3],
    "name": ["Ayush", "Riya", "Kabir"]
})
```

### Bonus Table

```python
bonus = pd.DataFrame({
    "id": [1, 2, 3],
    "bonus": [5000, 6000, 4000]
})
```

### 🔹 Merge

```python
pd.merge(employees, bonus, on="id")
```

Equivalent SQL:

```sql
SELECT *
FROM employees
JOIN bonus
ON employees.id = bonus.id;
```

---

### 🔹 Merge Types

```python
pd.merge(df1, df2, how="inner")
pd.merge(df1, df2, how="left")
pd.merge(df1, df2, how="right")
pd.merge(df1, df2, how="outer")
```

Understanding joins is critical for analytics and data engineering.

---

## 8️⃣ Reshaping Data (Pivot Tables)

Pivot tables restructure grouped data.

```python
df.pivot_table(
    values="salary",
    index="department",
    aggfunc="mean"
)
# This is the same as groupby("department")["salary"].mean(), but pivot tables allow more complex reshaping.
```

You can also:

```python
df.pivot_table(
    values="salary",
    index="department",
    columns="high_income",
    aggfunc="count"
)
```

This produces cross-tab style summaries.

Pivot tables are heavily used in:

- Reporting  
- Dashboards  
- Exploratory Data Analysis (EDA)  

---

## 🧠 Mental Upgrade

Data Wrangling = asking:

- What dimension?
- What metric?
- What grouping?
- What comparison?
- What ranking?

It is structured thinking.