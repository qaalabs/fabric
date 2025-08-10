# Lab: Secure Data Access in Microsoft Fabric

Microsoft Fabric has a multi-layer security model for managing data access. Security can be set for an entire workspace, for individual items, or through granular permissions in each Fabric engine. In this exercise, you secure data using workspace, and item access controls and OneLake data access roles.

This lab takes approximately **45** minutes to complete.

## Create a workspace

1. Navigate to the [Microsoft Fabric home page](https://app.fabric.microsoft.com/home?experience=fabric) in an incognito/private mode browser tab browser, and sign in with the Fabric credentials from the QA Platform.

2. In the menu bar on the left, select Workspaces (the icon looks similar to 🗇).

3. Create a **New workspace**:

    - Give it a name of your choice. For example: `fab_workspace`
    - Leave all other options as the default values
    - Click **Apply**

4. When your new workspace opens, it should be empty.

    ![Screenshot of an empty workspace in Fabric.](../img/new-workspace.png)

!!! note "When you create a workspace, you automatically become a member of the Workspace Admin role."

## Create a data warehouse

Next, create a data warehouse in the workspace you created:

1. Click **+ New Item**. On the *New item* page, under the *Store Data* section, select **Sample warehouse** and create a new data warehouse with a name of your choice.

    After a minute or so, a new warehouse will be created:

    ![Screenshot of a new warehouse.](../img/19-new-sample-warehouse.png)

## Create a lakehouse

Next, create a lakehouse in the workspace you created.

1. On the menu bar on the left, select **Create**. In the New page, under the *Data Engineering* section, select **Lakehouse**.
    - Give it a name of your choice. For example: `fab_lakehouse`

    !!! tip "If the **Create** option is not pinned to the sidebar, you need to select the ellipsis (…) option first."

    After a minute or so, a new empty lakehouse will be created.

    ![New lakehouse.](../img/new-lakehouse.png)

2. Select the **Start with sample data** tile and then select the **Public holidays** sample. After a minute or so, the lakehouse will be populated with data.

## Apply workspace access controls

!!! note "To continue this lab ... use the MS Learn instructions"

<mark>https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/19-secure-data-access.html</mark>
