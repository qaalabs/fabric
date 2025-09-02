# 04 ~ Ingest Data with a Pipeline in Microsoft Fabric

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Step 1: Signing in to Microsoft Fabric

In this lab, you will sign in to Microsoft Fabric using the email and password from the QA Platform.

1. Using an **incognito/private mode browser tab** navigate to the [Fabric portal](https://app.fabric.microsoft.com/) at: https://fabric.microsoft.com

2. Follow the prompts, and sign in with the user credentials from the QA Platform:
    - Email
    - Password

    After signing in, you will be redirected to the Fabric home page:

    !!! quote ""
        ![Fabric home page](../img/qa-fabric-home.png)

## Step 2: Create a workspace

Before working with data in Fabric, you need to create a workspace with the Fabric trial enabled.

1. Navigate to the [Microsoft Fabric home page](https://app.fabric.microsoft.com/home?experience=fabric) in an incognito/private mode browser tab browser, and sign in with the Fabric credentials from the QA Platform.

2. In the menu bar on the left, select Workspaces (the icon looks similar to 🗇).

3. Create a **New workspace**:

    - Give it a name of your choice. For example: `fab_workspace`
    - Leave all other options as the default values
    - Click **Apply**

4. When your new workspace opens, it should be empty.

    !!! quote ""
        ![Screenshot of an empty workspace in Fabric.](../img/new-workspace.png)

## Step 3: Create a lakehouse

Now that you have a workspace, it's time to create a data lakehouse into which you'll ingest data.

1. On the menu bar on the left, select **Create**. In the New page, under the *Data Engineering* section, select **Lakehouse**.
    - Give it a uniquename of your choice. For example: `fab_lakehouse`

    !!! tip "If the **Create** option is not pinned to the sidebar, you need to select the ellipsis (…) option first."

    After a minute or so, a new lakehouse with no **Tables** or **Files** will be created.

    !!! quote ""
        ![New lakehouse.](../img/new-lakehouse.png)

2. On the **Explorer** pane on the left, in the **...** menu for the **Files** node, select **New subfolder** and create a subfolder named **new_data**

## Step 4: Create a pipeline

A simple way to ingest data is to use a **Copy Data** activity in a pipeline to extract the data from a source and copy it to a file in the lakehouse.

1. On the **Home** page for your lakehouse, select **Get data** and then select **New data pipeline**, and create a new data pipeline named `Ingest Sales Data`

2. If the **Copy Data** wizard doesn't open automatically, select **Copy Data > Use copy assistant** in the pipeline editor page.

3. In the **Copy Data** wizard, on the **Choose data source page**, type HTTP in the search bar and then select **HTTP** in the **New sources** section.

    !!! quote ""
        ![Screenshot of the Choose data source page.](../img/04-choose-data-source.png)

4. In the **Connect to data source** pane, enter the following settings for the connection to your data source:

    - **URL**: https://raw.githubusercontent.com/MicrosoftLearning/dp-data/main/sales.csv
    - **Connection**: Create new connection
    - **Connection name**: *Specify a unique name*
    - **Data gateway**: (none)
    - **Authentication kind**: Anonymous

5. Select **Next**. Then ensure the following settings are selected:

    - **Relative URL**: *Leave blank*
    - **Request method**: GET
    - **Additional headers**: *Leave blank*
    - **Binary copy**: <u>Un</u>selected
    - **Request timeout**: *Leave blank*
    - **Max concurrent connections**: *Leave blank*

6. Select **Next**, and wait for the data to be sampled and then ensure that the following settings are selected:

    - **File format**: DelimitedText
    - **Column delimiter**: Comma (,)
    - **Row delimiter**: Line feed (\n)
    - **First row as header**: Selected
    - **Compression type**: None

7. Select **Preview data** to see a sample of the data that will be ingested. Then close the data preview and select **Next**.

8. On the **Connect to data destination** page, set the following data destination options, and then select **Next**:

    - **Root folder**: Files
    - **Folder path name**: new_data
    - **File name**: sales.csv
    - **Copy behavior**: None

9. Set the following file format options and then select **Next**:

    - **File format**: DelimitedText
    - **Column delimiter**: Comma (,)
    - **Row delimiter**: Line feed (\n)
    - **Add header to file**: Selected
    - **Compression type**: None

10. On the **Copy summary** page, review the details of your copy operation and then select **Save + Run**.

    A new pipeline containing a **Copy Data** activity is created, as shown here:

    !!! quote ""
        ![Screenshot of a pipeline with a Copy Data activity.](../img/04-copy-data-pipeline.png)

11. When the pipeline starts to run, you can monitor its status in the **Output** pane under the pipeline designer. Use the :material-refresh: (*Refresh*) icon to refresh the status, and wait until it has succeeeded.

12. In the menu bar on the left, select your lakehouse.

13. On the **Home** page, in the **Explorer** pane, expand **Files** and select the **new_data** folder to verify that the **sales.csv** file has been copied.

## Step 5: Create a notebook

1. On the **Home** page for your lakehouse, in the **Open notebook** menu, select **New notebook**.

    After a few seconds, a new notebook containing a single *cell* will open. Notebooks are made up of one or more cells that can contain *code* or *markdown* (formatted text).

2. Select the existing cell in the notebook, which contains some simple code, and then replace the default code with the following variable declaration.

    ```python
    table_name = "sales"
    ```

3. In the **...** menu for the cell (at its top-right) select **Toggle parameter cell**. This configures the cell so that the variables declared in it are treated as parameters when running the notebook from a pipeline.

4. Under the parameters cell, use the **+ Code** button to add a new code cell. Then add the following code to it:

    ```python
    from pyspark.sql.functions import *

    # Read the new sales data
    df = spark.read.format("csv").option("header","true").load("Files/new_data/*.csv")

    ## Add month and year columns
    df = df.withColumn("Year", year(col("OrderDate"))).withColumn("Month", month(col("OrderDate")))

    # Derive FirstName and LastName columns
    df = df.withColumn("FirstName", split(col("CustomerName"), " ").getItem(0)).withColumn("LastName", split(col("CustomerName"), " ").getItem(1))

    # Filter and reorder columns
    df = df["SalesOrderNumber", "SalesOrderLineNumber", "OrderDate", "Year", "Month", "FirstName", "LastName", "EmailAddress", "Item", "Quantity", "UnitPrice", "TaxAmount"]

    # Load the data into a table
    df.write.format("delta").mode("append").saveAsTable(table_name)
    ```

    This code loads the data from the sales.csv file that was ingested by the **Copy Data** activity, applies some transformation logic, and saves the transformed data as a table - appending the data if the table already exists.

5. Verify that your notebooks looks similar to this, and then use the :material-play: **Run all** button on the toolbar to run all of the cells it contains.

    !!! quote ""
        ![Screenshot of a notebook with a parameters cell and code to transform data.](../img/04-notebook.png)

    !!! note
        - Since this is the first time you've run any Spark code in this session, the Spark pool must be started.
        - This means that the first cell can take a minute or so to complete.

6. When the notebook run has completed, in the **Explorer** pane on the left, in the **...** menu for **Tables** select **Refresh** and verify that a **sales** table has been created.

7. In the notebook menu bar, use the ⚙️ **Settings** icon to view the notebook settings. Then set the **Name** of the notebook to `Load Sales` and close the settings pane.

8. In the hub menu bar on the left, select your lakehouse.

9. In the **Explorer** pane, refresh the view. Then expand **Tables**, and select the **sales** table to see a preview of the data it contains.

## Step 6: Modify the pipeline

Now that you've implemented a notebook to transform data and load it into a table, you can incorporate the notebook into a pipeline to create a reusable ETL process.

1. In the hub menu bar on the left select the **Ingest Sales Data** pipeline you created previously.

2. On the **Activities** tab, in the **All activities** list, select **Delete data**. Then position the new **Delete data** activity to the left of the **Copy data** activity and connect its **On completion** output to the **Copy data** activity, as shown here:

    !!! quote ""
        ![Screenshot of a pipeline with Delete data and Copy data activities.](../img/04-delete-data-activity.png)

3. Select the **Delete data** activity, and in the pane below the design canvas, set the following properties:

    - **General**:
        - **Name**: `Delete old files`

    - **Source**:
        - **Connection**: *Your lakehouse*
        - **File path type**: Wildcard file path
        - **Folder path**: Files / **new_data**
        - **Wildcard file name**: `*.csv`
        - **Recursively**: Selected

    - **Logging settings**:
        - **Enable logging**: *<u>Un</u>selected*

    These settings will ensure that any existing .csv files are deleted before copying the **sales.csv** file.

4. In the pipeline designer, on the **Activities** tab, select **Notebook** to add a **Notebook** activity to the pipeline.

5. Select the **Copy data** activity and then connect its **On Completion** output to the **Notebook** activity as shown here:

    ![Screenshot of a pipeline with Copy Data and Notebook activities.](../img/04-pipeline.png)

6. Select the **Notebook** activity, and then in the pane below the design canvas, set the following properties:

    - **General**:
        - **Name**: `Load Sales notebook`

    - **Settings**:
        - **Notebook**: Load Sales
        - **Base parameters**: *Add a new parameter with the following properties:*

        | Name      | Type  | Value    |
        |-----------|-------|----------|
        | table_name| String| new_sales|

    The **table_name** parameter will be passed to the notebook and override the default value assigned to the **table_name** variable in the parameters cell.

7. On the **Home** tab, use the :material-content-save: (*Save*) icon to save the pipeline. Then use the :material-play: **Run** button to run the pipeline, and wait for all of the activities to complete.

    ![Screenshot of a pipeline with a Dataflow activity.](../img/04-pipeline-run.png)

    !!! warning "If you see an error message"
        - In case you receive the error message:
            - *Spark SQL queries are only possible in the context of a lakehouse. Please attach a lakehouse to proceed:*
        - Open your notebook, select the lakehouse you created on the left pane,
        - select **Remove all Lakehouses** and then add it again.
        - Go back to the pipeline designer and select :material-play: **Run**.

8. In the hub menu bar on the left edge of the portal, select your lakehouse.

9. In the **Explorer** pane, expand **Tables** and select the **new_sales** table to see a preview of the data it contains. This table was created by the notebook when it was run by the pipeline.

In this exercise, you implemented a data ingestion solution that uses a pipeline to copy data to your lakehouse from an external source, and then uses a Spark notebook to transform the data and load it into a table.

---

## Clean up resources

Once you've finished exploring your pipeline, you should delete the workspace you created for this exercise.

1. Navigate to Microsoft Fabric in your browser.

2. In the bar on the left, select the icon for your workspace to view all of the items it contains.

3. Select **Workspace settings** and in the **General** section, scroll down and select **Remove this workspace**.

4. Select **Delete** to delete the workspace.

---
<small><b>Source:
https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/04-ingest-pipeline.html
</b></small>
