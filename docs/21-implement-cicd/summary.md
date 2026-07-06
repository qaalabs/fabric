# Lab 21 - Implement deployment pipelines in Microsoft Fabric

Deployment pipelines in Microsoft Fabric let you automate the process of copying   changes made to the content in Fabric items between environments like development, test, and production. You can use deployment pipelines to develop and test content before it reaches end users. In this exercise, you create a deployment pipeline, and assign stages to the pipeline. Then you create some content in a development workspace and use deployment pipelines to deploy it between the Development, Test and Production pipeline stages.

This lab takes approximately **20** minutes to complete.

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Overview

### Step 1: Signing in to Microsoft Fabric

- In this lab, you will sign in to Microsoft Fabric using the email and password from the QA Platform.

### Step 2: Create a workspace

- Create three workspaces with the Fabric trial enabled.

### Step 3: Create a deployment pipeline

- Next, create a deployment pipeline.

### Step 4: Assign workspaces to stages of a deployment pipeline

- Assign workspaces to the stages of the deployment pipeline.

### Step 5: Create content

- Fabric items haven’t been created in your workspaces yet. Next, create a lakehouse in the development workspace.

### Step 6: Review your pipeline

- Review the pipeline.

### Step 7: Deploy content from Development to Test

- Deploy the lakehouse from the Development to Test.

## Step 8: Deploy content from Test to Production

- Deploy the lakehouse from the Test to Production.

## Step 9: Confirm the deployment

Using deployment pipelines creates the same Fabric artefacts in each deployment stage. Let's confirm.

---

## Clean up resources

In this exercise, you created a deployment pipeline, and assigned stages to the pipeline. Then you created content in a development workspace and deployed it between pipeline stages using deployment pipelines.

If you've finished exploring your database, you can delete the pipeline, and the three workspaces you created for this exercise.
