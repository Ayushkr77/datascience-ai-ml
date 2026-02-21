# PHASE 1 — Data Foundations

---

## 1. What Python Is Used for in Data Science

Python sits at the center of modern data workflows. Almost every Data Science or Machine Learning pipeline uses Python at some stage.

### The Real Pipeline (How Companies Use It)

In practice, a data scientist typically follows this workflow:

### Step 1 — Load Data

Data sources include:

- CSV files  
- Excel sheets  
- Databases  
- APIs  
- Logs  
- Cloud storage  

Python can read all of these.

```python
import pandas as pd
df = pd.read_csv("sales.csv")
```

---

### Step 2 — Clean Messy Data

Real-world data often contains:

- Missing values  
- Wrong formats  
- Duplicates  
- Broken timestamps  
- Inconsistent categories  

Cleaning typically takes 70–80% of the total effort.

```python
df = df.dropna()
df["price"] = df["price"].astype(float)
```

---

### Step 3 — Transform Data

Data must often be reshaped or engineered before analysis.

Common transformations:

- Create new columns  
- Group by categories  
- Aggregate statistics  
- Merge tables  

```python
df["profit"] = df["revenue"] - df["cost"]
```

---

### Step 4 — Analyze Patterns

Typical analytical questions:

- What sells most?  
- Which customers churn?  
- What trends exist over time?  

```python
df.groupby("region")["sales"].mean()
```

---

### Step 5 — Visualize Insights

Visualization helps communicate insights clearly.

Common visualizations:

- Trends  
- Distributions  
- Correlations  
- Comparisons  

```python
df["sales"].hist()
```

---

### Step 6 — Build Models

Machine learning comes after proper cleaning and analysis.

```python
from sklearn.linear_model import LinearRegression

model = LinearRegression()
model.fit(X, y)
```

### Important Mindset

- Machine Learning is the final 20%  
- Data preparation is the real work  

---

### Core Tools You Will Use Daily

- **NumPy** — Fast numerical arrays  
- **Pandas** — Table manipulation  
- **Matplotlib / Seaborn** — Visualization  
- **Jupyter Notebook** — Interactive experimentation  

Pandas is used almost every day in Data Science.

---

## 2. Python Data Types (The Atoms of Data)

Data science involves manipulating values at scale. These are the fundamental building blocks.

---

### Integers and Floats

- `int` → Counts (users, clicks)  
- `float` → Measurements (price, temperature)  

```python
users = 100
price = 19.99
```

In datasets:

- Integers represent discrete data  
- Floats represent continuous data  

This distinction becomes important in statistics.

---

### Strings

Used for text data such as:

- Names  
- Emails  
- Product categories  
- Timestamps (before parsing)  

```python
name = "Ayush"
city = "Delhi"

name.lower()
name.strip()
```

String cleaning is a critical data skill.

---

### Lists — Ordered Collections

Lists resemble raw columns of data.

```python
scores = [90, 85, 88]
```

Conceptually:

```
score
90
85
88
```

Lists allow:

- Iteration  
- Filtering  
- Transformations  

---

### Dictionaries — Structured Records

A dictionary represents one structured row.

```python
person = {
    "name": "Ayush",
    "age": 22
}
```

Conceptually:

```
name   age
Ayush  22
```

Multiple dictionaries form datasets:

```python
people = [
    {"name": "A", "age": 20},
    {"name": "B", "age": 25}
]
```

These are later converted into DataFrames.

---

## 3. Lists — Columns of Data

This is where programming transitions into data thinking.

---

### Indexing

```python
numbers = [10, 20, 30, 40]
print(numbers[0])
```

Data science connection:

- Accessing a row  
- Accessing a column value  

---

### Length

```python
len(numbers)
```

Represents dataset size.

You frequently check:

- Number of rows  
- Number of samples  

---

### Looping — Applying Transformations

```python
for n in numbers:
    print(n * 2)
```

Represents:

- Feature engineering  
- Scaling values  
- Applying functions  

Equivalent Pandas logic:

“Apply a function to a column.”

---

### Filtering

```python
even = [n for n in numbers if n % 2 == 0]
```

Equivalent in Pandas:

```python
df[df["number"] % 2 == 0]
```

This is foundational DataFrame logic.

---

## 4. Functions — Data Machines

A function represents a transformation unit.

```python
def double(x):
    return x * 2

print(double(5))
```

Pipeline thinking:

```
input → transformation → output
```

---

### Why Functions Matter

Machine Learning consists of layered transformations:

```
Raw Data
↓
Clean Data
↓
Feature Engineering
↓
Model Training
↓
Predictions
```

Each step is implemented as a function.

---

### Example — Cleaning Function

```python
def clean_salary(x):
    return float(x.replace(",", ""))
```

---

### Example — Feature Engineering Function

```python
def income_category(salary):
    if salary > 60000:
        return "High"
    else:
        return "Medium"
```

---

### Pure Functions

A well-designed data function:

- Takes input  
- Returns output  
- Does not rely on hidden variables  

This ensures pipeline reliability.

---

### Functions in ML Libraries

Common examples:

- `model.fit()`  
- `model.predict()`  
- `df.groupby()`  
- `np.mean()`  

Data science workflows are chains of function calls.

---

## 5. NumPy — Fast Numerical Arrays

Python lists are flexible. NumPy arrays are optimized for speed and mathematical operations.

---

### Why NumPy Exists

Python lists:

- Store mixed data  
- Slower for large-scale math  

NumPy arrays:

- Fixed data type  
- Stored in contiguous memory  
- Optimized internally in C  

---

### Creating an Array

```python
import numpy as np

arr = np.array([1, 2, 3, 4])
```

---

### Vectorized Operations

```python
print(arr * 2)
```

Output:

```
[2 4 6 8]
```

No loop required. This is vectorization.

Instead of:

```python
for x in arr:
    print(x * 2)
```

NumPy applies operations to the entire array efficiently.

---

### Statistical Operations

```python
arr.mean()
arr.sum()
arr.std()
arr.min()
arr.max()
```

Forms the base of:

- Statistics  
- ML algorithms  
- Neural networks  
- Linear algebra  

---

### Why NumPy Scales

For datasets with:

- 1 million rows  
- 100 features  

Vectorized operations remain fast while loops slow down.

Libraries like TensorFlow and PyTorch are conceptually advanced numerical engines built on similar principles.

---

## 6. Pandas — Tables in Python

Pandas is the primary tool for structured data manipulation.

---

### DataFrame — Structured Data

```python
import pandas as pd

data = {
    "name": ["A", "B", "C"],
    "age": [23, 25, 22],
    "salary": [50000, 60000, 45000]
}

df = pd.DataFrame(data)
print(df)
```

Conceptually:

```
name   age   salary
A      23    50000
B      25    60000
C      22    45000
```

---

### Core Concepts

1. **DataFrame** — 2D table (rows and columns)  
2. **Series** — Single column of a DataFrame  

```python
df["age"]
```

---

### Selecting Data

```python
df["salary"]
df[df["age"] > 23]
```

Used for:

- Analysis  
- Cleaning  
- Transformation  

---

### Creating New Columns

```python
df["bonus"] = df["salary"] * 0.1
```

Feature engineering starts here.

---

### Aggregation

```python
df["salary"].mean()
df.groupby("age")["salary"].mean()
```

Used for extracting business insights.

---

## 7. Basic DataFrame Operations (Core Analyst Toolkit)

Assume a DataFrame named `df` already exists.

---

### Inspecting Data

```python
df.head()
df.head(10)

df.tail()
df.tail(10)

df.sample(5)
```

Purpose:

- Inspect structure  
- Verify data loading  
- Detect formatting issues  

---

### Statistical Summary

```python
df.describe()
```

Returns:

- count  
- mean  
- std  
- min  
- max  
- quartiles  

Used to:

- Detect outliers  
- Understand scale  
- Analyze distributions  

---

### Selecting Columns

```python
df["age"]
```

Returns a Series.

---

### Aggregations

```python
df["salary"].mean()
df["salary"].sum()
df["salary"].max()
df["salary"].min()
```

Foundational analytics operations.

---

### Adding Columns

```python
df["bonus"] = df["salary"] * 0.1
```

This is feature engineering.

---

### Filtering Rows

```python
df[df["age"] > 23]
```

Equivalent SQL:

```sql
SELECT * FROM table WHERE age > 23;
```

---

## Big Picture

- Functions → Transformations  
- NumPy → Mathematical engine  
- Pandas → Structured data engine  
- Lists → Columns  
- Dictionaries → Rows  
- Vectorization → Performance  

---

## Mental Model

- Python → Control logic  
- NumPy → Math engine  
- Pandas → Data structure engine  
- Matplotlib → Visualization engine  
- Scikit-learn → Modeling engine  

This forms the foundation of most AI and Data Science projects.