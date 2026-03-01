# Step 9 — Exploratory Data Analysis (EDA)

EDA is structured investigation — not random plotting.

---

## 1️⃣ What is EDA?

EDA helps you answer:

- What does the dataset look like?
- What patterns exist?
- What relationships are strong?
- What looks suspicious?
- What might affect predictions?

EDA = curiosity + structure + validation.

You are building intuition about the data.

---

# Example Dataset — House Price Prediction

```python
import pandas as pd

df = pd.read_csv("house_prices.csv")
```

Assume dataset:

| Id | Area | Bedrooms | Age | Location | Price |
|----|------|----------|-----|----------|-------|

Target column = **Price**

Now we follow the structured workflow.

---

# 2️⃣ Structured EDA Workflow (Follow This Always)

---

## 🔹 Step 1 — Structural Understanding

This is NOT analysis yet.  
This is orientation.

You are asking:

What kind of object am I dealing with?

---

### 1️⃣ Dataset Size

```python
df.shape
```

Example output:

```
(5000, 6)
```

Meaning:

- 5000 rows
- 6 columns

Analyst Thinking:

- Is 5000 large enough?
- For linear regression → yes
- For deep learning → maybe small
- If only 50 rows → risk of overfitting
- If 5 million rows → memory optimization needed

Always connect dataset size to modeling strategy.

---

### 2️⃣ Column Names

```python
df.columns
```

Example:

```
['Id', 'Area', 'Bedrooms', 'Age', 'Location', 'Price']
```

Check:

- Is target column present? (Price)
- Any weird names?
- Any leakage columns?

Red flag example:

```
['Id', 'Area', 'Bedrooms', 'Final_Price', 'Price']
```

Why is `Final_Price` there?  
Possible data leakage.

---

### 3️⃣ First Look

```python
df.head()
```

Check:

- Strange values?
- Negative area?
- Text in numeric column?

Example problem:

Area  
1200  
1500  
"unknown"  
800  

Cleaning required.

---

### 4️⃣ Data Types & Missing Values

```python
df.info()
```

Example:

```
Bedrooms   4980 non-null
```

Dataset has 5000 rows → 20 missing values.

Ask:

- Is missing random?
- Should we impute?

Check data types:

If:

```
Bedrooms → object
```

Maybe values like:

"3BHK"

Needs cleaning.

Structural issues to detect:

- ID should not be used for modeling
- Datetime stored as object
- Numeric stored as string
- Column with 80% missing → consider dropping

---

## 🔹 Step 2 — Missing Values

```python
df.isnull().sum()
```

Ask:

- Which column has most missing?
- Is it systematic?
- Drop or fill?

Missing handling affects model reliability.

---

## 🔹 Step 3 — Univariate Analysis

### 📌 Numeric Variable

```python
df["Price"].describe()
```

Look at:

- mean
- median
- std
- min / max
- quartiles

Plot:

```python
import seaborn as sns
sns.histplot(df["Price"])
```

Ask:

- Is it skewed?
- Are there extreme values?
- Does it look normal?

---

### 📌 Categorical Variable

```python
df["Location"].value_counts()
```

Ask:

- Is dataset balanced?
- Any dominant category?
- Rare categories?

Imbalance affects ML.

---

## 🔹 Step 4 — Bivariate Analysis (Two Variables)

This step answers:

Does X influence Y?

Is it strong? Linear? Clustered?

---

### Example: Experience vs Salary

```python
sns.scatterplot(x="experience", y="salary", data=df)
```

Each dot = one employee.

Ask:

- Is relationship linear?
- Strong or weak?
- Are there outliers?
- Are there clusters?
- Is variance increasing? (heteroscedasticity)

---

### Group Comparison (Categorical vs Numeric)

```python
df.groupby("department")["salary"].mean()
```

Example:

| Department | Mean Salary |
|------------|-------------|
| IT         | 750000      |
| Sales      | 600000      |
| HR         | 500000      |

Ask:

- Which group earns highest?
- Is difference meaningful?

Better visualization:

```python
sns.boxplot(x="department", y="salary", data=df)
```

Shows:

- Median
- Spread
- Outliers

---

## 🔹 Step 5 — Correlation Analysis

### What is Correlation?

Measures strength & direction of linear relationship.

Range:

- +1 → Perfect positive
- 0 → No linear relation
- -1 → Perfect negative

Think of correlation as:

“How tightly do two variables move together in a straight line?”

---

### Positive Correlation

Example:

Experience vs Salary  
Correlation = 0.85 → strong positive.

---

### Negative Correlation

Example:

Price vs Demand  
Correlation = -0.80 → strong negative.

---

### Zero Correlation

Random scatter.  
No linear relationship.

Important:

Correlation only measures linear relationships.

---

### Correlation Heatmap

```python
sns.heatmap(df.corr(), annot=True)
```

Example:

|       | exp | salary | age |
|-------|-----|--------|-----|
| exp   | 1   | 0.85   | 0.60|
| salary|0.85 | 1      | 0.50|
| age   |0.60 | 0.50   | 1   |

Interpretation:

- `> 0.7` → strong positive  
- `< -0.7` → strong negative  
- `≈ 0` → weak

---

### 🚨 Multicollinearity (Important)

If:

experience & age correlation = 0.95

They carry almost same information.

In linear regression:

- Unstable coefficients
- Inflated variance

Drop one feature.

---

### Why Correlation Helps

1️⃣ Feature selection  
2️⃣ Multicollinearity detection  
3️⃣ Model choice  

If strong & linear → Linear Regression works.  
If curved → Tree-based or non-linear models.

---

### ⚠ Limitation

Correlation ≠ causation.

Ice cream sales and drowning deaths are correlated.  
Both increase in summer.

Correlation does NOT mean one causes the other.

---

## 🔹 Step 6 — Outlier Detection

```python
sns.boxplot(x=df["Price"])
```

Ask:

- Are extreme values realistic?
- Do they distort mean?
- Should we cap/remove?

Never remove blindly.

---

# 3️⃣ Writing Insights (Critical Skill)

Code is not the goal.  
Insights are the goal.

Good insights:

- Salary increases steadily with experience.
- Price distribution is right-skewed.
- Urban properties have higher median prices.
- Experience strongly correlates with salary (0.85).
- Most houses are located in Urban areas.

Bad insight:

❌ “Graph plotted successfully.”

---

# 🧠 Professional EDA Mindset

When you see numbers, ask:

- Does this make business sense?
- What explains this pattern?
- Could this bias the model?
- Is this leakage?
- Is this imbalance harmful?

---

# Why EDA Matters Before ML

If you skip EDA:

- You choose wrong algorithm  
- You miss leakage  
- You ignore imbalance  
- You misinterpret performance  

EDA reduces modeling mistakes.

Always:

Describe  
Visualize  
Question  
Then model.  

---

## Why EDA Matters Before ML (Detailed Understanding)

Machine learning models are pattern detectors.

If your data has problems, your model will learn those problems.

Garbage in → garbage out.

EDA protects you from that.

---

## 1️⃣ If You Skip EDA → You Choose the Wrong Algorithm

### Example

Suppose you are predicting salary from experience.

You assume it’s linear and use Linear Regression.

But after plotting:

```python
sns.scatterplot(x="experience", y="salary", data=df)
```

You see:

- Salary grows slowly for first 5 years  
- Then grows very sharply  

That’s non-linear.

If you skip EDA:  
You assume linearity → poor model.

If you do EDA:  
You see curvature → choose:

- Polynomial regression  
- Tree-based model (Random Forest)  
- Gradient Boosting  

EDA guides model choice.

---

## 2️⃣ If You Skip EDA → You Miss Data Leakage

Suppose you're predicting customer churn.

Columns:

- tenure  
- monthly charges  
- cancellation date  

If you don’t inspect:

```python
df.columns
df.head()
```

You might include `cancellation date`.

Model becomes 98% accurate.

In production?  
Fails.

EDA helps you ask:

“Would this column exist before churn?”

Without EDA → fake performance.

---

## 3️⃣ If You Skip EDA → You Ignore Class Imbalance

Suppose you're predicting fraud.

Data:

- 99% non-fraud  
- 1% fraud  

If you don’t check:

```python
df["fraud"].value_counts()
```

You may build a model that predicts:

"Always non-fraud"

Accuracy = 99%.

Looks amazing.

But model is useless.

EDA reveals imbalance.

Then you apply:

- SMOTE  
- Class weights  
- Precision/Recall evaluation  

Without EDA → misleading metrics.

---

## 4️⃣ If You Skip EDA → You Misinterpret Performance

Suppose your regression model has:

MAE = ₹100,000

Is that good or bad?

You need context.

If average salary = ₹200,000  
→ MAE is huge.

If average salary = ₹10,000,000  
→ MAE is small.

EDA tells you:

- Mean  
- Spread  
- Scale  
- Distribution  

Without EDA → numbers mean nothing.

---

## 5️⃣ If You Skip EDA → You Ignore Outliers

Suppose 2 houses have price:

₹50,000,000  

Rest are around ₹500,000.

If you don’t check boxplot or percentiles:

Your model may distort heavily.

EDA helps you:

- Detect outliers  
- Decide whether to remove or transform  

---

# 🔥 The Real Role of EDA

EDA is not just plotting charts.

It answers:

- Is the data clean?
- Is the data realistic?
- Is the data biased?
- Is the distribution skewed?
- Are features redundant?
- Are assumptions valid?

---

# 🧠 EDA Reduces Modeling Mistakes

Think of it like this:

Modeling is surgery.  
EDA is diagnosis.

You don’t operate without diagnosis.

---

## 🔹 Always Follow This Order

### 1️⃣ Describe

Use:

```python
df.shape
df.info()
df.describe()
```

Understand structure and scale.

---

### 2️⃣ Visualize

Use:

- Histograms  
- Boxplots  
- Scatter plots  
- Heatmaps  

See patterns, skewness, clusters.

---

### 3️⃣ Question

Ask:

- Does this make business sense?
- Why is this correlation high?
- Could this be leakage?
- Is data balanced?
- Are there missing values?

Question everything.

---

### 4️⃣ Then Model

Only after you understand:

- Distribution  
- Relationships  
- Data quality  
- Feature behavior  

Now modeling becomes informed decision, not guesswork.

---

# 🚨 What Happens Without EDA (Industry Reality)

- Teams celebrate high accuracy  
- Model fails in production  
- Stakeholders lose trust  
- Weeks spent debugging  

Most failures come from data issues — not algorithm choice.