# Lab 05 - Create and use Dataflows (Gen2) in Microsoft Fabric

In Microsoft Fabric, Dataflows (Gen2) connect to various data sources and perform transformations in Power Query Online. They can then be used in Data Pipelines to ingest data into a lakehouse or other analytical store, or to define a dataset for a Power BI report.

This lab is designed to introduce the different elements of Dataflows (Gen2), and not create a complex solution that may exist in an enterprise. This lab takes **approximately 30 minutes** to complete.

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Overview

### Step 1: Signing in to Microsoft Fabric

In this lab, you will sign in to Microsoft Fabric using the email and password from the QA Platform.

### Step 2: Create a workspace

- Before working with data in Fabric, you need to create a workspace with the Fabric trial enabled.
- When your new workspace opens, it will be empty.

### Step 3: Create a lakehouse

Now that you have a workspace, it's time to create a data lakehouse into which you'll ingest data.

### Step 4: Create a Dataflow (Gen2) to ingest data

Now that you have a lakehouse, you need to ingest some data into it. One way to do this is to define a dataflow that encapsulates an *extract, transform, and load* (ETL) process.

### Step 5: Transform the data using Power Query

You can now transform the data. In this lab we will add a column using a custom formula.

### Step 6: Add data destination for Dataflow

The next step is to define a destination for your transformed data. This will be the lakehouse you created in Step 3.

### Step 7: Add a dataflow to a pipeline

You can include a dataflow as an activity in a pipeline. Pipelines are used to orchestrate data ingestion and processing activities, enabling you to combine dataflows with other kinds of operation in a single, scheduled process. Pipelines can be created in a few different experiences, including Data Factory experience.

---

## Clean up resources

Once you've finished exploring dataflows in Microsoft Fabric, you should delete the workspace you created for this exercise.

---
