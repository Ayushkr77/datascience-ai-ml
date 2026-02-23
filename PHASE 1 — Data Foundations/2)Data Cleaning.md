# Step 2 — Data Cleaning (Lesson 2)

This is where real analysts are made.

---

## 1️⃣ What is Data Cleaning?

Real-world datasets are messy because:

- Humans enter data  
- Systems break  
- Formats change  
- Integrations fail  
- Logging is inconsistent  

### Common Problems

| Problem              | Example                    |
|----------------------|----------------------------|
| Missing values       | age = NaN                  |
| Duplicate rows       | Same transaction twice     |
| Inconsistent text    | "Delhi", "delhi ", " DELHI" |
| Wrong data types     | salary stored as string    |
| Outliers             | salary = 9999999           |
| Impossible values    | age = -5                   |

Cleaning means:

Converting raw data into reliable analytical input.

If garbage goes in, garbage comes out.

---

## 2️⃣ Loading & Inspecting a Real Dataset

Most real datasets come as CSV.

```python
import pandas as pd

df = pd.read_csv("data.csv")
df.head()
```

Before touching anything, inspect:

```python
df.shape
df.info()
df.isnull().sum()
```

### Why this order?

- `shape` → How big is it?  
- `info()` → Data types + missing values  
- `isnull()` → Which columns are broken?  

Never clean blindly.

---

## 3️⃣ Handling Missing Values

Missing data is unavoidable.

### Step 1 — Detect

```python
df.isnull().sum()
```

---

### Option A — Remove Rows

```python
df = df.dropna()
```

Use only if:

- Very few missing rows  
- Missing data is random  

---

### Option B — Fill Numeric Values

```python
df["age"] = df["age"].fillna(df["age"].mean())
```

Why mean?

- Preserves dataset size  
- Reasonable central estimate  

Sometimes median is better (if outliers exist).

---

### Option C — Fill Categorical Values

```python
df["city"] = df["city"].fillna("Unknown")
```

Or:

```python
df["city"] = df["city"].fillna(df["city"].mode()[0])
```

---

### Option D — Drop Entire Column

If 70% missing:

```python
df = df.drop(columns=["old_column"])
```

Cleaning requires judgment, not memorization.

---

## 4️⃣ Removing Duplicates

Duplicates distort:

- Counts  
- Averages  
- Model training  

Check:

```python
df.duplicated().sum()
```

Remove:

```python
df = df.drop_duplicates()
```

Always check early.

---

## 5️⃣ Fixing Data Types

Wrong types cause silent errors.

Check:

```python
df.dtypes
```

### Convert Numeric

```python
df["age"] = df["age"].astype(int)
df["salary"] = df["salary"].astype(float)
```

If salary is object:

- `mean()` will not work properly  
- Sorting behaves incorrectly  

---

### Convert Dates

```python
df["date"] = pd.to_datetime(df["date"])
```

Now you can extract:

```python
df["year"] = df["date"].dt.year
```

Dates become powerful once parsed.

---

## 6️⃣ Cleaning Text Data

Real-world text is chaotic.

Example problem:

- "Delhi"  
- " delhi "  
- "DELHI"  

All represent the same category but will group separately.

Fix:

```python
df["city"] = df["city"].str.strip()
df["city"] = df["city"].str.lower()
```

Or combined:

```python
df["city"] = df["city"].str.strip().str.lower()
```

Now grouping works correctly.

---

## 7️⃣ Detecting Outliers

Outliers distort statistics.

Example:

If salary is mostly 30k–80k  
But one value is 9,999,999  

That destroys the mean.

---

### Visual Detection

```python
import seaborn as sns
sns.boxplot(x=df["salary"])
```

Boxplots show extreme values clearly.

---

### Statistical Method (IQR)

```python
Q1 = df["salary"].quantile(0.25)
Q3 = df["salary"].quantile(0.75)
IQR = Q3 - Q1

lower = Q1 - 1.5 * IQR
upper = Q3 + 1.5 * IQR

df = df[(df["salary"] >= lower) & (df["salary"] <= upper)]
```

```
Min    Q1      Median      Q3       Max      Outlier (can be on left also, beyond min)
 |------|=========|=========|--------|          ●
```

Always ask:

Is it an error?  
Or is it rare but real?

Cleaning is analytical thinking.

---

## 🧠 Realistic Cleaning Workflow

This pattern appears everywhere:

```python
df = pd.read_csv("data.csv")

df.drop_duplicates(inplace=True)

df.columns = df.columns.str.lower()

df["city"] = df["city"].str.strip().str.lower()

df["age"] = df["age"].fillna(df["age"].mean())
```

This is professional-level baseline cleaning.


## Final Mindset

Data cleaning is not about syntax.

It is about asking:

- Does this value make sense?
- Is this realistic?
- Will this break my model?
- Am I biasing the dataset?

If you master cleaning,  
you are ahead of most beginners.