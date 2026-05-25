# Lab 22 ~ Set Up the HomeSphere Environment

!!! info "For this lab, you will access the QA Platform and sign in using the credentials provided."

!!! warning "You must use an incognito or private browser window to avoid conflicts with any work or personal Microsoft accounts you may already be signed in to."


## Step 1: Access Microsoft Fabric

In this lab, you will access Microsoft Fabric using a temporary lab account provided by the QA Platform.

!!! note
    The QA Platform opens the Azure portal by default. This is expected. Microsoft Fabric is a separate portal, even though it uses the same Microsoft account.

1. In the QA Platform, wait until the lab status shows **Ready**.

2. Then right-click **Open** and choose **Open in a private browsing window** (InPrivate in Edge, Incognito in Chrome).

3. When prompted, sign in using:

    - **Username** from the QA Platform (used as the email address)
    - **Password** from the QA Platform (used as a Temporary Access Pass)

    - If prompted to "Stay signed in?", select **No**. This ensures the session ends when the private window is closed.

    !!! success "You are now signed in to the **Azure portal**. This confirms your lab account is active."

4. In the same private browsing window, **open a new tab**.

5. Navigate to the [Microsoft Fabric home page](https://app.fabric.microsoft.com/home?experience=fabric-developer) at: https://app.fabric.microsoft.com/home?experience=fabric-developer

6. If prompted, **re-enter your email address** to confirm access to Microsoft Fabric. This check verifies that a Fabric licence has been assigned to your lab account.

7. After confirmation, you should be redirected to the **Microsoft Fabric home page**:

    !!! quote ""
        ![Fabric home page](../../img/qa-fabric-home.png)


## Step 2: Create a workspace

Before working with data in Fabric, you need to create a workspace.

1. In the navigation pane on the left, select **Workspaces** (the icon looks similar to &#128455;).

2. Select **+ New workspace**, then create a workspace using the naming format below:

    - Start the name with `fab_workspace`
    - Add random numbers to make it unique (for example, `fab_workspace123`)
    - Leave all other options as the default values
    - Click **Apply**

3. Your workspace should be empty, and look similar to this:

    !!! quote ""
        ![Empty workspace in Fabric.](../../img/new-workspace.png)


## Step 3: Create a lakehouse

Now that you have a workspace, it's time to create a lakehouse for the HomeSphere data.

1. On the menu bar on the left, select **Create**. In the *New* page, under the *Data Engineering* section, select **Lakehouse**.

    - Name the lakehouse `HomeSphere`
    - Leave **Lakehouse schemas** selected.

    !!! tip "If the **Create** option is not pinned to the sidebar, you need to select the ellipsis (…) option first."

    After a minute or so, a new empty lakehouse will be created.

    !!! quote ""
        ![New lakehouse.](../../img/new-lakehouse.png)


## Step 4: Upload the HomeSphere data files

With the lakehouse created, you can now upload the HomeSphere source data files.

1. In the **Explorer** pane of the lakehouse, click the **...** menu for the **Files** folder and select **New subfolder**.

    - Name the new subfolder: `data`
    - Click **Create**

2. Locate the following files in the `files` directory on your Virtual Machine:

    - `sales_raw.csv`
    - `products_raw.json`

    If you are not using a VM, or the files are not there, download them from:

    - https://raw.githubusercontent.com/QAADE5/HomeSphere/refs/heads/main/data/sales_raw.csv
    - https://raw.githubusercontent.com/QAADE5/HomeSphere/refs/heads/main/data/products_raw.json

    !!! note
        - To download each file, open a new tab in the browser and paste in the URL.
        - Right click anywhere on the page and select **Save as** to save the file.
        - Make sure `products_raw.json` is saved with the `.json` extension and not `.txt`.

3. In the **...** menu for the `data` folder, select **Upload** and **Upload files**.

    - Upload both `sales_raw.csv` and `products_raw.json`.

4. Select the `data` folder and confirm both files are visible.

    !!! tip "If the files do not automatically appear, in the **...** menu for the `data` folder, select **Refresh**."


## Step 5: Import the notebooks

The HomeSphere notebooks contain the code for cleaning and transforming the data. You will import them into your workspace now, ready for the next lab.

1. In the left navigation bar, select your workspace name to return to the workspace view.

2. On the toolbar, select **Import** and choose **Notebook**.

    - Browse to the `files` directory on your Virtual Machine and select `cloud_clean.ipynb`.
    - Click **Open** to import it.

3. Repeat the import for `cloud_output.ipynb`.

    !!! tip "If you cannot find the notebook files on your VM, ask your instructor."

    !!! success "Both notebooks should now appear as items in your workspace."


## Step 6: Attach the lakehouse to the notebooks

Opening each notebook from within the lakehouse connects it to the HomeSphere data automatically.

1. In the left navigation bar, return to your lakehouse `HomeSphere`.

2. On the **Home** tab, select **Open notebook** > **Existing notebook**, and choose `cloud_clean`.

3. In the **Notebook Explorer** on the left, select **Data Items**.

    !!! success "**HomeSphere** should be listed under **OneLake** — the lakehouse is now attached to this notebook."

4. Return to the lakehouse and repeat for `cloud_output` — select **Open notebook** > **Existing notebook** and choose `cloud_output`.

5. Select **Data Items** in the Notebook Explorer and confirm that **HomeSphere** appears under **OneLake**.

    !!! success "Both notebooks are now connected to the HomeSphere lakehouse and ready for the next lab."


---

## Keep your workspace

In this exercise, you have created the HomeSphere lakehouse, uploaded the source data files, and imported the notebooks.

**Do not delete your workspace** — you will continue working in it in the next lab.

---
<small><b>Source: HomeSphere DE5M3 Module 3</b></small>
