# Lab 21 ~ Implement deployment pipelines in Microsoft Fabric

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Create workspaces

Create three workspaces with the Fabric trial enabled.

1. Navigate to the [Microsoft Fabric home page](https://app.fabric.microsoft.com/home?experience=fabric) at `https://app.fabric.microsoft.com/home?experience=fabric` in a browser and sign in with your Fabric credentials.

2. In the menu bar on the left, select **Workspaces** (the icon looks similar to &#128455;).

3. Create a new workspace named Development, selecting a licensing mode that includes Fabric capacity (*Trial*, *Premium*, or *Fabric*).

4. Repeat steps 1 & 2, creating two more workspaces named Test, and Production. Your workspaces are: Development, Test, and Production.

5. Select the **Workspaces** icon on the menu bar on the left and confirm that there are three workspaces named:  Development, Test, and Production

!!! note
    If you are prompted to enter a unique name for the workspaces, append one or more random numbers to the words: Development, Test, or Production.

## Create a deployment pipeline

Next, create a deployment pipeline.

1. In the menu bar on the left, select **Workspaces**.

2. Select **Deployment Pipelines**, then **New pipeline**.

3. In the **Add a new deployment pipeline** window, give the pipeline a unique name and select **Next**.

4. In the new pipeline window, select **Create and continue**.

## Assign workspaces to stages of a deployment pipeline

1. On the left menu bar, select the pipeline you created. 

2. In the window that appears, expand the options under **Assign a workspace** on each deployment stage and select the name of the workspace that matches the name of the stage.

3. Select the check mark **Assign** for each deployment stage.

    !!! quote ""
        ![Screenshot of deployment pipeline.](../img/21-deployment-pipeline.png)

## Create content

Fabric items haven't been created in your workspaces yet. Next, create a lakehouse in the development workspace.

1. In the menu bar on the left, select **Workspaces**.

2. Select the **Development** workspace.

3. Select **New Item**.

4. In the window that appears, select **Lakehouse** and in the **New lakehouse window**, name the lakehouse, **LabLakehouse**.

5. Select **Create**.

6. In the Lakehouse Explorer window, select **Start with sample data** to populate the new lakehouse with data.

    !!! quote ""
        ![Screenshot of Lakehouse Explorer.](../img/21-lakehouse-explorer.png)

7. Select the sample **NYCTaxi**.

8. In the menu bar on the left, select the pipeline you created.

9. Select the **Development** stage, and under the deployment pipeline canvas you can see the lakehouse you created as a stage item. In the left edge of the **Test** stage, there's an **X** within a circle. The **X** indicates that the Development and Test stages aren't synchronized.

10. Select the **Test** stage and under the deployment pipeline canvas you can see that the lakehouse you created is only a stage item in the source, which in this case refers to the **Development** stage.  

    !!! quote ""
        ![Deployment pipeline showing content mismatches between stages.](../img/21-lab-pipeline-compare.png)

## Deploy content between stages

Deploy the lakehouse from the **Development** stage to the **Test** and **Production** stages.

1. Select the **Test** stage in the deployment pipeline canvas.

2. Under the deployment pipeline canvas, select the checkbox next to the Lakehouse item. Then select the **Deploy** button to copy the lakehouse in its current state to the **Test** stage.

3. In the **Deploy to next stage** window that appears, select **Deploy**.
 There is now an X in a circle in the Production stage in the deployment pipeline canvas. The lakehouse exists in the Development and Test stages but not yet in the Production stage.

4. Select the **Production** stage in the deployment canvas.

5. Under the deployment pipeline canvas, select the checkbox next to the Lakehouse item. Then select the **Deploy** button to copy the lakehouse in its current state to the **Production** stage.

6. In the **Deploy to next stage** window that appears, select **Deploy**. The green check marks between the stages indicates that all stages in sync and contain the same content.

7. Using deployment pipelines to deploy between stages also updates the content in the workspaces corresponding to the deployment stage. Let's confirm.

8. In the menu bar on the left, select **Workspaces**.

9. Select the **Test** workspace. The lakehouse was copied there.

10. Open the **Production** workspace from the **Workspaces** icon on the left menu. The lakehouse was copied to the Production workspace too.

## Clean up

In this exercise, you created a deployment pipeline, and assigned stages to the pipeline. Then you created content in a development workspace and deployed it between pipeline stages using deployment pipelines.

1. Navigate to Microsoft Fabric in your browser.

2. In the bar on the left, select the icon for your workspace to view all of the items it contains.

3. Select **Workspace settings** and in the **General** section, scroll down and select **Remove this workspace**.

4. Select **Delete** to delete the workspace.

---
<small><b>Source:
https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/20-work-with-database.html
</b></small>
