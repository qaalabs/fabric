# Lab 09 ~ Ingest real-time data with Eventstream in Fabric

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Step 1: Signing in to Microsoft Fabric

In this lab, you will sign in to Microsoft Fabric using the email and password from the QA Platform.

1. Using an **incognito/private mode browser tab** navigate to the [Fabric portal](https://app.fabric.microsoft.com/) at: https://fabric.microsoft.com

2. Follow the prompts, and sign in with the user credentials from the QA Platform:
    - Email
    - Password

3. After signing in, you will be redirected to the Fabric home page:

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
        ![Empty workspace in Fabric.](../img/new-workspace.png)

## Step 3: Create an eventhouse

Now that you have a workspace, you can start creating the Fabric items you'll need for your real-time intelligence solution. we'll start by creating an eventhouse.

1. In the workspace you just created, select **+ New item**. In the *New item* pane, select **Eventhouse**, giving it a unique name of your choice.

2. Close any tips or prompts that are displayed until you see your new empty eventhouse.

    ![Create eventhouse](../img/09-create-eventhouse.png)

3. In the pane on the left, note that your eventhouse contains a KQL database with the same name as the eventhouse.

4. Select the KQL database to view it.

    !!! note "Note: Currently there are no tables in the database."
        In the rest of this exercise you'll use an eventstream to load data from a real-time source into a table.

## Step 4: Create an Eventstream

1. In the main page of your KQL database, select **Get data**.

2. For the data source, select **Eventstream** > **New eventstream**. Name the Eventstream `Bicycle-data`.

    The creation of your new event stream in the workspace will be completed in just a few moments. Once established, you will be automatically redirected to the primary editor, ready to begin integrating sources into your event stream.

    !!! quote ""
        ![Empty eventstream.](../img/09-empty-eventstream.png)

## Step 5: Add a source

1. In the Eventstream canvas, select **Use sample data**.

2. Name the source `Bicycles`, and select the **Bicycles** sample data.

    Your stream will be mapped and you will be automatically displayed on the **eventstream canvas**.

    !!! quote ""
        ![Review the eventstream canvas](../img/09-real-time-intelligence-eventstream-sourced.png)

## Step 6: Add a destination

1. Select the **Transform events or add destination** tile and search for **Eventhouse**.

2. In the **Eventhouse** pane, configure the following setup options.
   - **Data ingestion mode:**: Event processing before ingestion
   - **Destination name:** `bikes-table`
   - **Workspace:** *Select the workspace you created at the beginning of this exercise*
   - **Eventhouse**: *Select your eventhouse*
   - **KQL database:** *Select your KQL database*
   - **Destination table:** Create a new table named `bikes`
   - **Input data format:** JSON

    !!! quote ""
        ![Eventstream destination settings.](../img/09-kql-database-event-processing-before-ingestion.png)

3. In the **Eventhouse** pane, select **Save**. 

4. On the toolbar, select **Publish**.

5. Wait a minute or so for the data destination to become active. Then select the **bikes-table** node in the design canvas and view the **Data preview** pane underneath to see the latest data that has been ingested:

    !!! quote ""
        ![A destination table in an eventstream.](../img/09-stream-data-preview.png)

6. Wait a few minutes and then use the **Refresh** button to refresh the **Data preview** pane. The stream is running perpetually, so new data may have been added to the table.

7. Beneath the eventstream design canvas, view the **Data insights** tab to see details of the data events that have been captured.

## Step 7: Query captured data

The eventstream you have created takes data from the sample source of bicycle data and loads it into the database in your eventhouse. You can analyze the captured data by querying the table in the database.

1. In the menu bar on the left, select your KQL database.

2. On the **database** tab, in the toolbar for your KQL database, use the **Refresh** button to refresh the view until you see the **bikes** table under the database. Then select the **bikes** table.

    !!! quote ""
        ![A table in a KQL database.](../img/09-kql-table.png)

3. In the **...** menu for the **bikes** table, select **Query table** > **Records ingested in the last 24 hours**.

4. In the query pane, note that the following query has been generated and run, with the results shown beneath:

    ```kql
    // See the most recent data - records ingested in the last 24 hours.
    bikes
    | where ingestion_time() between (now(-1d) .. now())
    ```

5. Select the query code and run it to see 24 hours of data from the table.

    !!! quote ""
        ![KQL query.](../img/09-kql-query.png)

## Step 8: Transform event data

The data you've captured is unaltered from the source. In many scenarios, you may want to transform the data in the event stream before loading it into a destination.

1. In the menu bar on the left, select the **Bicycle-data** eventstream.

2. On the toolbar, select **Edit** to edit the eventstream.

3. In the **Transform events** menu, select **Group by** to add a new **Group by** node to the eventstream.

4. Drag a connection from the output of the **Bicycle-data** node to the input of the new **Group by** node Then use the *pencil* icon in the **Group by** node to edit it.

    !!! quote ""
        ![Add group by to the transformation event.](../img/09-eventstream-add-aggregates.png)

5. Configure out the properties of the **Group by** settings section:
    - **Operation name:** GroupByStreet
    - **Aggregate type:** *Select* Sum
    - **Field:** *select* No_Bikes. *Then select **Add** to create the function* SUM of No_Bikes
    - **Group aggregations by (optional):** Street
    - **Time window**: Tumbling
    - **Duration**: 5 seconds
    - **Offset**: 0 seconds

    !!! note "This configuration will cause the eventstream to calculate the total number of bicycles in each street every 5 seconds."

6. Save the configuration and return to the eventstream canvas, where an error is indicated (because you need to store the output from the transformation somewhere!).

7. Use the **+** icon to the right of the **GroupByStreet** node to add a new **Eventhouse** node.

8. Configure the new eventhouse node with the following options:
   - **Data ingestion mode:**: Event processing before ingestion
   - **Destination name:** `bikes-by-street-table`
   - **Workspace:** *Select the workspace you created at the beginning of this exercise*
   - **Eventhouse**: *Select your eventhouse*
   - **KQL database:** *Select your KQL database*
   - **Destination table:** Create a new table named `bikes-by-street`
   - **Input data format:** JSON

    !!! quote ""
        ![Table for grouped data.](../img/09-group-by-table.png)

9. In the **Eventhouse** pane, select **Save**. 

10. On the toolbar, select **Publish**.

11. Wait a minute or so for the changes to become active.

12. In the design canvas, select the **bikes-by-street-table** node, and view the **data preview** pane beneath the canvas.

    !!! quote ""
        ![Table for grouped data.](../img/09-stream-table-with-windows.png)

    Note that the trasformed data includes the grouping field you specified (**Street**), the aggregation you specified (**SUM_no_Bikes**), and a timestamp field indicating the end of the 5 second tumbling window in which the event occurred (**Window_End_Time**).

## Step 9: Query the transformed data

Now you can query the bicycle data that has been transformed and loaded into a table by your eventstream

1. In the menu bar on the left, select your KQL database.

2. On the **database** tab, in the toolbar for your KQL database, use the **Refresh** button to refresh the view until you see the **bikes-by-street** table under the database.

3. In the **...** menu for the **bikes-by-street** table, select **Query data** > **Show any 100 records**.

4. In the query pane, note that the following query is generated and run:

    ```kql
    ['bikes-by-street']
    | take 100
    ```

5. Modify the KQL query to retrieve the total number of bikes per street within each 5 second window:

    ```kql
    ['bikes-by-street']
    | summarize TotalBikes = sum(tolong(SUM_No_Bikes)) by Window_End_Time, Street
    | sort by Window_End_Time desc , Street asc
    ```

6. Select the modified query and run it.

    The results show the number of bikes observed in each street within each 5 second time period.

    !!! quote ""
        ![Query returning grouped data.](../img/09-kql-group-query.png)

---

## Clean up resources

In this exercise, you have created an eventhouse and populated tables in its database by using an eventstream.

When you've finished exploring your KQL database, you can delete the workspace you created for this exercise.

1. Navigate to Microsoft Fabric in your browser.

2. In the bar on the left, select the icon for your workspace to view all of the items it contains.

3. Select **Workspace settings** and in the **General** section, scroll down and select **Remove this workspace**.

4. Select **Delete** to delete the workspace.

---
<small><b>Source:
https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/09-real-time-analytics-eventstream.html
</b></small>
