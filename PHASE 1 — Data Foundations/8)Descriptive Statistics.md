# Step 8 — Descriptive Statistics (Lesson 8)

Before ML, before models, before fancy algorithms:

Understand the distribution.

---

# 1️⃣ What is Descriptive Statistics?

Descriptive statistics is the process of summarizing raw data into interpretable information.

Imagine you have 10,000 salary records.

Instead of reading every number, you ask:

- What is a typical salary?  It tells you what a “normal” or “average” value looks like. Mean (average), Median (middle value), Mode (most frequent value)
- How much do salaries vary?  This means how much the data varies. Are values close together or very different? Range (max − min), Variance, Standard deviation
- Are there extreme earners?  This checks for outliers — unusually high or low values.
- Is the distribution balanced? Balanced (symmetric), Right-skewed, Left-skewed

That summarization process = descriptive statistics.

It does **not** make predictions.  
It only describes what already exists.

---

## What Descriptive Statistics Helps You Understand

- Typical value
- Spread / variability
- Extreme values
- Distribution shape
- Skewness
- Percentile structure

This is your statistical foundation.

---

# 2️⃣ Mean, Median, Mode — Understanding “Typical”

Let’s use:

```python
import numpy as np
import pandas as pd

data = [10, 20, 30, 40, 100]
```

Notice:
100 is much larger. That is intentional.

---

## 🔹 Mean (Average)

Formula:

Mean = (Σx) / n

```python
np.mean(data)
```

For our data:

(10 + 20 + 30 + 40 + 100) / 5 = 40

### What does mean represent?

The balance point of the data.

Think of it like a see-saw.  
The mean is where it balances.

⚠ Important Insight:

Mean is sensitive to outliers.

If 100 becomes 1000:

New mean = 220

One extreme value pulls the average upward.

---

## 🔹 Median (Middle Value)

Median = middle number after sorting.

Sorted:

10, 20, 30, 40, 100

Median = 30

```python
np.median(data)
```

### What does median represent?

The true center of the distribution.

If 100 becomes 1000:

Median = still 30

Median is resistant to extreme values.

This is why median salary is more meaningful in income analysis.

---

## 🔹 Mode

Mode = most frequent value.

```python
pd.Series(data).mode()
```

Useful for:

- Categorical data
- Repeated discrete values

Example:

[1, 2, 2, 3, 4]  
Mode = 2

For continuous data, mode is less useful.

---

## 🧠 Analyst Thinking

Compare mean and median:

- Mean > Median → likely right-skewed
- Mean < Median → likely left-skewed
- Mean ≈ Median → symmetric

This comparison tells you about distribution shape.

---

# 3️⃣ Variance & Standard Deviation — Measuring Spread

Knowing the center is not enough.

Two datasets can have same mean but very different spread.

Dataset A:

48, 49, 50, 51, 52

Dataset B:

10, 20, 50, 80, 90

Both have mean = 50.

But B is more spread out.

---

## 🔹 Variance

Formula:

Variance = Σ(x − μ)² / n

```python
np.var(data)
```

Intuitive meaning:

- Subtract mean
- Square difference
- Average those squared differences

Large variance → high spread  
Small variance → tightly clustered

Why square?

- Prevent negatives canceling positives
- Penalize large deviations


### 🔹 Variance (Optional — Population vs Sample)

Variance measures how spread out data is from the mean.


#### 1️⃣ Population Variance (σ²)

Used when you have **all data points**:

σ² = Σ (xi − μ)² / N  

- μ = population mean  
- N = total number of points  


```python
np.var(data)
```



#### 2️⃣ Sample Variance (s²)

Used when you only have a **sample**:

s² = Σ (xi − x̄)² / (n − 1)

- x̄ = sample mean  
- n = sample size  
- (n − 1) = Bessel’s correction (prevents underestimation)


```python
np.var(data, ddof=1)
```

(`ddof=1` applies Bessel’s correction)

In real-world data science:

- Most datasets are samples  
- So sample variance is usually more appropriate  



---

#### In Python

Population variance:

```python
np.var(data)
```

Sample variance:

```python
np.var(data, ddof=1)
```

---

## 🔹 Standard Deviation

Std = √Variance

```python
np.std(data)
```

Why square root?

Variance is in squared units.

If salary is in rupees,  
variance is rupees² (not intuitive).

Standard deviation returns to original units.

Interpretation:

- Low std → stable values
- High std → volatile values

In ML:

High variance features can dominate unless scaled.

### 🔹 Standard Deviation (Optional — Population vs Sample)

Standard deviation measures spread in the **same units as the data**.  
It is the square root of variance.

---

#### 1️⃣ Population Standard Deviation (σ)

Used when you have **all data points**:

σ = √[ Σ (xi − μ)² / N ]

- μ = population mean  
- N = total number of points  


#### 2️⃣ Sample Standard Deviation (s)

Used when you only have a **sample**:

s = √[ Σ (xi − x̄)² / (n − 1) ]

- x̄ = sample mean  
- n = sample size  
- (n − 1) = Bessel’s correction  

#### In Python

Population standard deviation:

```python
np.std(data)
```

Sample standard deviation:

```python
np.std(data, ddof=1)
```

---

# 4️⃣ Range & Percentiles

---

## 🔹 Range

Range = Max − Min

```python
np.min(data)
np.max(data)
```

Very simple.

But extremely sensitive to outliers.

---

## 🔹 Percentiles

```python
np.percentile(data, 25)
np.percentile(data, 75)
```

25th percentile (Q1) → bottom 25%  
50th percentile → median  
75th percentile (Q3) → bottom 75%

---

## 🔹 Interquartile Range (IQR)

IQR = Q3 − Q1

Measures spread of middle 50% of data.

Why important?

Because IQR ignores extreme tails.


```
Min    Q1      Median      Q3       Max      Outlier (can be on left also, beyond min)
 |------|=========|=========|--------|          ●
```

Outlier rule:

x < Q1 − 1.5(IQR)  
or  
x > Q3 + 1.5(IQR)

More robust than range.

---

# 5️⃣ Distribution Shape & Skewness

Visualization helps here.

See figures of all three distributions(google it) and see how mean, median and mode are marked in that figures.

```python
import seaborn as sns
sns.histplot(data)
```

---

## 🔹 1️⃣ Symmetric Distribution (Normal)

Characteristics:

- Bell-shaped
- Mean ≈ Median ≈ Mode
- Balanced left and right

Common in:

- Natural measurements
- Biological traits

Good for:

- Linear regression
- Parametric tests

---

## 🔹 2️⃣ Positively Skewed (Right Skewed)

Characteristics:

- Long tail on right
- Mean > Median
- Few large extreme values

Common in:

- Salary
- Wealth
- House prices

---

## 🔹 3️⃣ Negatively Skewed (Left Skewed)

Characteristics:

- Long tail on left
- Mean < Median
- Few small extreme values

Example:

Easy exam where most students scored high.

---

## 🔹 Measuring Skewness Numerically

```python
pd.Series(data).skew()
```

Interpretation:

- `> 0` → Right skew
- `< 0` → Left skew
- `≈ 0` → Symmetric

Why skewness matters in ML?

Many models assume normality.

Skewed data can:
- Break linear regression assumptions
- Affect clustering
- Affect distance-based models

If heavily skewed:

- Apply log transform
- Use robust scaling
- Use non-linear models

---

# 6️⃣ df.describe() — Statistical Snapshot

For real datasets:

```python
df.describe()
```

Returns:

- count
- mean
- std
- min
- 25%
- 50%
- 75%
- max

This tells you:

- Are there missing values? (count mismatch)
- Is distribution wide? (std large?)
- Is there skew? (mean far from median?)
- Are extremes suspicious? (min/max too far?)

This is your first diagnostic step.

---

# 🧠 Thinking Like a Real Analyst

When you compute stats, ask:

1. Is mean far from median?  
   → Possible skew or outliers.

2. Is std large relative to mean?  
   → High variability.

3. Is range extreme?  
   → Data entry issue?

4. Are Q1 and Q3 close?  
   → Stable distribution.

5. Does histogram look normal?  
   → Safe for linear assumptions.

---

# ⚠ Important Realization

Descriptive statistics are not just numbers.

They are:

- Data quality checks
- Distribution diagnostics
- Model readiness checks
- Outlier detection tools
- Business insight indicators

Before ML, always:

Describe  
Visualize  
Question  
Then model.