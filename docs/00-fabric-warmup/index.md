# Lab ~ Fabric Warmup: Create a Workspace and then create Lakehouse

!!! info "For this lab, you will access the QA Platform and sign in using the credentials provided."

!!! warning "You must use an incognito or private browser window to avoid conflicts with any work or personal Microsoft accounts you may already be signed in to."


## Step 1: Create a workspace

Before working with data in Fabric, you need to create a workspace.

1. In the navigation pane on the left, select **Workspaces** (the icon looks similar to &#128455;).

2. Select **+ New workspace**, then create a workspace using the naming format below:

    - Start the name with `fab_workspace`
    - Add random numbers to make it unique (for example, `fab_workspace123`)
    - Leave all other options as the default values
    - Click **Apply**

3. Your workspace should be empty, and look similar to this:

    !!! abstract ""
        ![Empty workspace in Fabric.](../img/new-workspace.png)


## Step 2: Create a lakehouse

Now that you have a workspace, it's time to create a data lakehouse into which you'll ingest data.

1. On the menu bar on the left, select **Create**. In the *New* page, under the *Data Engineering* section, select **Lakehouse**.

    - Name the lakehouse `fab_lakehouse`
    - Leave the **Lakehouse schemas** checkbox selected.

    !!! tip "If the **Create** option is not pinned to the sidebar, you need to select the ellipsis (…) option first."

    After a minute or so, a new empty lakehouse will be created.

    !!! abstract ""
        ![New lakehouse.](../img/new-lakehouse.png)

2. View the new lakehouse, and note that the **Lakehouse explorer** pane on the left enables you to browse tables and files in the lakehouse:

    - The **Tables** folder contains tables that you can query using SQL semantics. Tables in a Microsoft Fabric lakehouse are based on the open source *Delta Lake* file format, commonly used in Apache Spark.

    - The **Files** folder contains data files in the OneLake storage for the lakehouse that aren't associated with managed delta tables.

Currently, there are no tables or files in this lakehouse.


## Step 3: Upload a file

Fabric provides multiple ways to load data into the lakehouse, including built-in support for pipelines that copy data from external sources and data flows (Gen 2) that you can define using visual tools based on Power Query. However one of the simplest ways to ingest small amounts of data is to upload files or folders from your local computer (or lab VM if applicable).

1. In the **Explorer** pane of the lakehouse, click the **...** menu for the **Files** folder and select **New subfolder**.

    - Name the new subfolder: `data`
    - Click **Create**

2. Locate the `sales.csv` file in the `day1` directory on your Virtual Machine.

    - If you are not using a VM, or the file is not there, download it from: https://raw.githubusercontent.com/qaalabs/fabric/refs/heads/main/data/sales.csv

    !!! note
        - To download the file, open a new tab in the browser and paste in the URL.
        - Right click anywhere on the page containing the data and select "Save as" to save the data as a CSV file.

3. In the **...** menu for the new **data** folder, select **Upload** and **Upload files**.

    - Then upload the **sales.csv** file from your local computer (or lab VM if applicable).

4. After the file has been uploaded, select the **Files/data** folder and verify that the **sales.csv** file has been uploaded, as shown here:

    !!! abstract ""
        ![Uploaded sales.csv file in a lakehouse.](../img/01-uploaded-sales-file.png)

5. Select the **sales.csv** file to see a preview of its contents.

    !!! tip "If the **sales.csv** file does not automatically appear, in the **...** menu for the **data** folder, select **Refresh**."


## Step 4: Load file data into a table

The sales data you uploaded is in a file. In many scenarios you'll want to load the data from the file into a table so that you can query it using SQL.

1. In the **Explorer** pane, select the **Files/data** folder so you can see the **sales.csv** file it contains.

2. In the **...** menu for the **sales.csv** file, select **Load to Tables** > **New table**.

    !!! abstract ""
        ![Load to tables - New table.](../img/qa-01-load-to-tables.png)

3. In **Load to table** dialog box:

    - Make sure that the new table name is : `sales`
    - Column header should be selected, and seperator should be a comma.
    - Click **Load**.

    Wait for the table to be created and loaded.

    !!! tip "If the `sales` table does not automatically appear, in the **...** menu for the **Tables** folder, select **Refresh**."

4. In the **Explorer** pane, select the `sales` table that has been created to view the data:

    !!! abstract ""
        ![Screenshot of a table preview.](../img/qa-01-table-preview.png)


## Step 5: Use SQL to query tables

When you create a lakehouse and define tables in it, a SQL endpoint is automatically created through which the tables can be queried using SQL `SELECT` statements.

1. At the top-right of the Lakehouse page, select **Analyze data with** and choose **SQL analytics endpoint**.

    - Then wait a short time until the SQL analytics endpoint for your lakehouse opens in a visual interface from which you can query its tables.

2. Use the **New SQL query** button to open a new query editor, and enter the following SQL query:

    ```sql
    SELECT Item, SUM(Quantity * UnitPrice) AS Revenue
    FROM sales
    GROUP BY Item
    ORDER BY Revenue DESC;
    ```

3. Use the :material-play: **Run** button to run the query and view the results, which should show the total revenue for each product.

    !!! abstract ""
        ![SQL query with results.](../img/qa-01-sql-query.png)

---

## Clean up resources

In this warmup exercise, you created a lakehouse, uploaded a file, loaded it into a table, and queried it with SQL. This is the basic Fabric workflow you'll build on for the rest of the day.

Once you've finished exploring your lakehouse, you should delete the workspace you created for this exercise.

1. Navigate to Microsoft Fabric in your browser.

2. In the bar on the left, select the icon for your workspace to view all of the items it contains.

3. Select **Workspace settings** and in the **General** section, scroll down and select **Remove this workspace**.

4. Select **Delete** to delete the workspace.

---
