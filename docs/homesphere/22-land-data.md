# Land the HomeSphere Data

## What you are doing

Before you can run the pipeline in Fabric, the raw source files need to be in your lakehouse.
Upload them now so they are ready for the notebooks.

---

## Step 1: Create a data subfolder

1. In the **Lakehouse Explorer** pane, find the **Files** folder
2. Select **...** > **New subfolder**
3. Name it `data`

---

## Step 2: Upload the files

1. Select **...** on the `data` folder > **Upload** > **Upload files**
2. Upload both files from your VM:
    - `sales_raw.csv`
    - `products_raw.json`
3. After uploading, select the `data` folder and confirm both files are visible

---

## Step 3: Preview the data

Select `sales_raw.csv` in the Explorer - Fabric will show a preview of the contents.

Check it looks familiar. This is the same file you worked with locally on Day 1.

---

## What just happened

The files are now stored in **OneLake** - Microsoft Fabric's unified storage layer.
Any notebook or workload in this workspace can read them from the path:

```
/lakehouse/default/Files/data/
```

On Day 1 you read from your local VM filesystem. Today you read from the same path structure, but the files live in the cloud.
