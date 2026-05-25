# Lab 2.3 ~ Clean the Sales Data in Fabric

## What you are doing

The same cleaning pipeline you built on Day 1 - but running in a Fabric notebook,
reading from OneLake, and saving to a Delta table instead of a CSV file.

Open the notebook in MS Fabric: **`cloud_clean.ipynb`**

---

## What is different today

| | Day 1 | Day 2 |
|---|---|---|
| Where files live | Local VM filesystem | OneLake (`/lakehouse/default/Files/data/`) |
| How you load data | `pd.read_csv('sales_raw.csv')` | `pd.read_csv('/lakehouse/default/Files/data/sales_raw.csv')` |
| Where output goes | `cleaned_sales.csv` on VM | `cleaned_sales` Delta table in lakehouse |
| Who can access output | Just you | Anyone in the workspace |

Everything in between - the nine cleaning steps - is identical pandas code.

---

## The new part: saving as a Delta table

At the end of the notebook you convert your pandas DataFrame to a Spark DataFrame
and write it as a managed Delta table:

```python
spark_df = spark.createDataFrame(df)
spark_df.write.mode('overwrite').saveAsTable('cleaned_sales')
```

`spark` is available automatically in every Fabric notebook - you do not need to import it.

Once saved, the table appears in the **Tables** section of your Lakehouse Explorer
and is immediately queryable via the SQL analytics endpoint.

---

## Discussion

- What changed? What stayed the same?

The output is now a Delta table instead of a CSV

- What does that enable that a CSV cannot do?
