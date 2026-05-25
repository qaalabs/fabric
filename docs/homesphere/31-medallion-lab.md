# HomeSphere - Medallion Architecture in Fabric

By the end of this lab you will have restructured the HomeSphere pipeline into three
clearly separated layers: **bronze** (raw), **silver** (cleaned and trusted), and **gold** (business-ready output).

---

## Step 1: Create a workspace and lakehouse

You have done this before. Set up a fresh workspace and lakehouse named `HomeSphere`.

- Workspace: `fab_workspace` + random numbers
- Lakehouse: `HomeSphere`
- Ensure **Lakehouse schemas** is disabled

---

## Step 2: Create the bronze layer

The bronze layer holds raw data exactly as it arrived - no modifications.

1. In the **Files** folder, select **...** > **New subfolder** - name it `bronze`
2. In the **bronze** folder, select **...** > **Upload** > **Upload files**
3. Upload both source files:
    - `sales_raw.csv`
    - `products_raw.json`
4. Confirm both files are visible in `Files/bronze/`

!!! note "Bronze is read-only by convention"
    - Never write transformed data into the bronze folder.
    - If you need to re-run the pipeline from scratch, bronze is your guaranteed clean starting point.

---

## Step 3: Create the silver notebook

Silver is where raw data becomes trusted. You apply cleaning, validation, and standardisation - but you do not yet answer any business question.

1. On the **Home** page of the Lakehouse, select **Open notebook** > **New notebook**

2. Name the notebook `HomeSphere - Bronze to Silver`

### Cell 1 - Clean Sales

Paste the following into the first cell and run it:

```python
import pandas as pd
import json

# Read raw Sales from bronze
df = pd.read_csv('/lakehouse/default/Files/bronze/sales_raw.csv')

print(f'Bronze: {len(df)} rows')

# Clean
df['unit_price'] = df['unit_price'].astype(str).str.replace('£', '', regex=False).astype(float)
df['order_date'] = pd.to_datetime(df['order_date'], dayfirst=True, errors='coerce')
df['quantity'] = pd.to_numeric(df['quantity'], errors='coerce')
df = df.dropna(subset=['quantity'])
df['quantity'] = df['quantity'].astype(int)
df['status'] = df['status'].str.lower().str.strip()
df = df.drop_duplicates()
df = df.dropna(subset=['product_id'])
df['region'] = df['region'].fillna('Unknown')
df = df[df['unit_price'] > 0]
df = df[df['quantity'] > 0]

print(f'Silver: {len(df)} rows')
print(f'Dropped: {30 - len(df)} rows')
```

### Cell 2 - Validate before saving

Add a new code cell. Run basic checks before writing to silver - never save data you have not verified.

```python
# Validation checks
assert df['unit_price'].dtype == float, "unit_price should be float"
assert df['quantity'].dtype == int, "quantity should be int"
assert df['product_id'].isnull().sum() == 0, "product_id should have no nulls"
assert (df['unit_price'] > 0).all(), "all prices should be positive"
assert (df['quantity'] > 0).all(), "all quantities should be positive"

print('All validation checks passed')
print(df.dtypes)
```

### Cell 3 - Write silver_sales

```python
# Write to silver layer as a Delta table
spark.createDataFrame(df).write.mode('overwrite').saveAsTable('silver_sales')

print('Saved: silver_sales (Delta table)')
```

### Cell 4 - Flatten Products

```python
# Read raw Products from bronze
with open('/lakehouse/default/Files/bronze/products_raw.json') as f:
    products_data = json.load(f)

products = pd.json_normalize(products_data['products'])
products = products.rename(columns={
    'specs.rrp': 'rrp',
    'specs.warranty_years': 'warranty_years',
    'specs.colour': 'colour',
    'specs.connectivity': 'connectivity'
})

print(f'Products flattened: {len(products)} rows')
print(products.columns.tolist())
```

### Cell 5 - Write silver_products

```python
spark.createDataFrame(products).write.mode('overwrite').saveAsTable('silver_products')

print('Saved: silver_products (Delta table)')
```

After running all five cells, refresh the **Tables** pane. You should see `silver_sales` and `silver_products` listed.

---

## Step 4: Explore the silver layer

Switch to the **SQL analytics endpoint** and run:

```sql
SELECT status, COUNT(*) AS orders, ROUND(SUM(quantity * unit_price), 2) AS value
FROM silver_sales
GROUP BY status
ORDER BY value DESC
```

```sql
SELECT category, COUNT(*) AS products
FROM silver_products
GROUP BY category
ORDER BY products DESC
```

!!! note "Silver is the trust boundary"
    Anyone querying `silver_sales` knows it has been cleaned and validated.
    They do not need to understand the raw file or the cleaning steps.

---

## Step 5: Create the gold notebook

Gold answers a specific business question. It is built from silver - never from bronze directly.

1. Return to the **Lakehouse** home page
2. Select **Open notebook** > **New notebook**
3. Name it `HomeSphere - Silver to Gold`

### Cell 1 - Join silver tables

```python
import pandas as pd

# Read from silver - not from bronze, not from raw files
sales = spark.read.table('silver_sales').toPandas()
sales['order_date'] = pd.to_datetime(sales['order_date'])

products = spark.read.table('silver_products').toPandas()
products = products[['product_id', 'name', 'category']]

# Join
df = sales.merge(products, on='product_id', how='left')
df['line_value'] = df['quantity'] * df['unit_price']

print(f'Gold dataset: {len(df)} rows')
print(f'Total revenue: £{df["line_value"].sum():,.2f}')
```

### Cell 2 - Write gold_revenue

```python
spark.createDataFrame(df).write.mode('overwrite').saveAsTable('gold_revenue')

print('Saved: gold_revenue (Delta table)')
```

---

## Step 6: Answer the question from gold

Back in the **SQL analytics endpoint**, run:

```sql
SELECT
    category,
    ROUND(SUM(line_value), 2) AS total_revenue,
    COUNT(*) AS order_lines
FROM gold_revenue
GROUP BY category
ORDER BY total_revenue DESC
```

This is the same answer as Day 1 and Day 2 - but now it comes from a clearly labelled gold table
built from trusted silver sources, which in turn came from untouched bronze data.

---

## Discussion

- You now have three layers. What does each one protect you against?
- If `gold_revenue` looked wrong, where would you investigate first?
- If a new analyst joined the team, which table would you point them to first?
- What would need to change if HomeSphere added a new sales region next month?
- How is this different from what you built on Day 2?
