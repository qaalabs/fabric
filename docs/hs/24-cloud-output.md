# Build the Trusted Output

## What you are doing

Your cleaned Sales data is now a Delta table in the lakehouse.
Flatten the Product catalogue, join it to Sales, and save the trusted output
as a second Delta table - then answer the revenue question using SQL.

Open the notebook: **`day2_output.ipynb`**

---

## Reading from a Delta table

Instead of loading `cleaned_sales.csv` from a file path, you read the Delta table
saved by the previous notebook:

```python
sales = spark.read.table('cleaned_sales').toPandas()
```

The data is the same - the difference is where it came from. Reading from a Delta table
means you are always reading the latest version, and the lineage is tracked automatically.

---

## The SQL magic command

Fabric notebooks support `%%sql` - a magic command that runs a SQL query in a cell
directly against your lakehouse tables:

```sql
%%sql
SELECT category, ROUND(SUM(line_value), 2) AS total_revenue
FROM sales_trusted
GROUP BY category
ORDER BY total_revenue DESC
```

This is the same question you answered with `groupby` in Python on Day 1.
The answer should match.

---

## The SQL analytics endpoint

After saving `sales_trusted`, switch to the **SQL analytics endpoint** in your lakehouse
and run the region breakdown query from the notebook.

This is SQL running against a live Delta table - no Python, no notebook, no file download.
Any analyst in the workspace can run this query.

---

## Discussion

- On Day 1 the output was a CSV on your VM. Today it is a Delta table in OneLake. What is the practical difference for someone who wants to use this data?
- You answered the revenue question in Python on Day 1 and in SQL today. Which felt more natural for this kind of question?
- What would break if `sales_raw.csv` arrived tomorrow with a new column added?
