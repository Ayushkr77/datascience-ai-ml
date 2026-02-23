# Step 5 — Data Visualization

Visualization is not decoration.  
It is a thinking tool.

You use charts to:

- Detect patterns  
- Spot outliers  
- Compare groups  
- Understand distributions  
- Communicate findings  

---

## 1️⃣ Why Visualization Matters

Humans understand patterns visually faster than tables.

A chart can reveal:

- Skewed distributions  
- Strong correlations  
- Seasonality  
- Extreme values  

Before modeling → visualize.


Explanation of above:

1️⃣ Detect Patterns
What it means:
Patterns are trends or relationships in your data that may not be obvious from raw numbers.
How visualization helps:
Line charts → see trends over time
Scatter plots → see correlation between two variables
Example:
A line chart of sales over 12 months may show a seasonal increase in December. You spot the trend instantly, instead of looking at 12 numbers.

2️⃣ Spot Outliers
What it means:
Outliers are data points that are very different from the rest. They can indicate errors, anomalies, or special cases.
How visualization helps:
Boxplots → easily show values far from the median
Scatter plots → reveal points that are way off the main cluster
Example:
In a boxplot of employee salaries, one person earning 10x the median salary stands out. You notice it immediately, rather than calculating deviations manually.

3️⃣ Compare Groups
What it means:
You often need to see differences or similarities between categories.
How visualization helps:
Bar charts → compare totals or averages for different groups
Side-by-side boxplots → compare distributions
Example:
Compare average sales for 3 regions. A bar chart shows Region B is performing much better than Region A. You can make business decisions visually.

4️⃣ Understand Distributions
What it means:
You need to know how data is spread — is it skewed? symmetric? clustered? These 3 are explained later.
How visualization helps:
Histograms → show frequency of values
Density plots → show smooth distribution
Example:
Exam scores histogram shows most students scored between 60–80, but few scored below 40. You immediately understand where most data lies.

5️⃣ Communicate Findings
What it means:
Numbers alone are hard for humans to interpret. A visualization tells a story.
How visualization helps:
A simple chart can replace hundreds of numbers
Highlights key insights for colleagues or clients
Example:
A CEO sees a pie chart of market share by company — immediately understands the biggest competitors without reading tables.


Explanation of skewed, symmetric, clustered

1️⃣ Symmetric Distribution
🔹 What it means
The left side and right side are almost mirror images.
Mean ≈ Median
No heavy tail on either side
Balanced shape
🔹 Example
Height of adults
IQ scores
Measurement errors
🔹 Intuition
Most values are around the center.
Extremes are rare.
This is often called a bell curve shape.

2️⃣ Skewed Distribution
Skewed means the data leans to one side.
There are two types:
🔹 Right-Skewed (Positive Skew)
Long tail on the right
Mean > Median
Example:
Income distribution
House prices
Most people earn moderate income
Few people earn extremely high income → pulls tail right
🔹 Left-Skewed (Negative Skew)
Long tail on the left
Mean < Median
Example:
Easy exam scores (most students score high, few very low)

3️⃣ Clustered (Multimodal Distribution)
🔹 What it means
Data forms multiple peaks (groups).
Instead of one central peak, you see:
Two peaks (bimodal)
Three or more peaks (multimodal)
🔹 Example
Heights of:
Adults and children combined
Male and female populations together
You see two clusters.

---

## 2️⃣ Core Plot Types You Must Master

---

### Line Plot — Trends Over Time

```python
import matplotlib.pyplot as plt

months = [1, 2, 3, 4, 5]
sales = [100, 150, 200, 180, 220]

plt.plot(months, sales)
plt.title("Monthly Sales")
plt.xlabel("Month")
plt.ylabel("Sales")
plt.show()
```

Use for:

- Time series  
- Growth analysis  

---

### Bar Chart — Compare Categories

```python
categories = ["IT", "HR", "Finance"]
avg_salary = [70000, 50000, 65000]

plt.bar(categories, avg_salary)
plt.title("Average Salary by Department")
plt.show()
```

Use for:

- Category comparisons  
- Grouped data  

---

### Histogram — Distribution

```python
import numpy as np

data = np.random.normal(50000, 8000, 1000)

plt.hist(data, bins=20)
plt.title("Salary Distribution")
plt.show()
```

Use for:

- Understanding spread  
- Skew detection  
- Outlier detection  

---

### Scatter Plot — Relationships

```python
import seaborn as sns
import pandas as pd

df = pd.DataFrame({
    "experience": [1, 2, 3, 4, 5],
    "salary": [30000, 40000, 50000, 60000, 75000]
})

sns.scatterplot(x="experience", y="salary", data=df)
plt.show()
```

Use for:

- Correlation  
- Predictive relationships  

---

## 3️⃣ Boxplot — Outlier Detection

```python
sns.boxplot(x=df["salary"])
plt.show()
```

Quickly shows:

- Median  
- Spread  
- Extreme values  

Very important in cleaning and machine learning.

---

## 4️⃣ Correlation Heatmap

```python
sns.heatmap(df.corr(), annot=True)
plt.show()
```

Shows strength of relationships.

Helps in feature selection later.

---

## Visualization Thinking Framework

When you plot something, ask:

- What pattern do I see?
- Is there skew?
- Are there clusters?
- Are there extreme values?
- Is the relationship linear?

Never just plot. Interpret.