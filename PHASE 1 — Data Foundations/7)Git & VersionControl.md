# Step 7 — Git & Version Control

Git tracks changes in your code and notebooks.

It answers:

- What changed?
- Who changed it?
- When?
- Can we go back?

Without Git → Chaos.  
With Git → Control.

---

## 1️⃣ What is Version Control?

Imagine:

You edit a notebook today.  
Tomorrow you break something.

Git lets you go back to yesterday’s version.

It tracks snapshots of your project.

---

## 2️⃣ Installing Git

Download from:

```
https://git-scm.com
```

Check installation:

```bash
git --version
```

---

## 3️⃣ Basic Git Workflow

Initialize repository:

```bash
git init
```

Add files:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Initial commit"
```

You just created a saved checkpoint.

---

## 4️⃣ Understanding Commits

A commit is:

📸 Snapshot of your project at a moment.

Good commit message example:

```bash
git commit -m "Added salary distribution analysis"
```

Bad example:

```bash
git commit -m "changes"
```

Be descriptive.

---

## 5️⃣ Connecting to GitHub

Create repository on GitHub.

Then:

```bash
git remote add origin <repo_link>
git branch -M main
git push -u origin main
```

Now your project is online.

---

## 6️⃣ Why Git Matters in Data Science

Used for:

- Versioning notebooks  
- Collaborating with teams  
- Tracking experiments  
- Managing ML pipelines  
- Building portfolio  

Companies expect Git knowledge.

---

## 7️⃣ Git for Notebooks (Important Tip)

Before committing notebooks:

Clear output cells to reduce file size.

Or use:

```bash
nbstripout
```

Keeps repository clean.