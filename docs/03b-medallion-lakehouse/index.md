# Lab 03b - Create a medallion architecture in a Microsoft Fabric lakehouse

In this exercise you will build out a medallion architecture in a Fabric lakehouse using notebooks. You will create a workspace, create a lakehouse, upload data to the bronze layer, transform the data and load it to the silver Delta table, transform the data further and load it to the gold Delta tables, and then explore the semantic model and create relationships.

This exercise should take approximately **45** minutes to complete

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Overview

### Step 1: Signing in to Microsoft Fabric

For this lab, you must sign in to Microsoft Fabric using the email and password from the QA Platform.

### Step 2: Create a workspace

Before working with data in Fabric, create a workspace with the Fabric trial enabled.

### Step 3: Create a lakehouse and upload data to bronze layer

Now that you have a workspace, it’s time to create a data lakehouse for the data you’re going to analyze.

### Step 4: Transform data and load to silver Delta table

Now that you have some data in the bronze layer of your lakehouse, you can use a notebook to transform the data and load it to a delta table in the silver layer.

### Step 5: Explore data in the silver layer using the SQL endpoint

Now that you have data in your silver layer, you can use the SQL analytics endpoint to explore the data and perform some basic analysis.

### Step 6: Transform data for gold layer

You have successfully taken data from your bronze layer, transformed it, and loaded it into a silver Delta table. Now you’ll use a new notebook to transform the data further, model it into a star schema, and load it into gold Delta tables.

### Step 7: (OPTIONAL) Create a semantic model

In your workspace, you can now use the gold layer to create a report and analyze the data. You can access the semantic model directly in your workspace to create relationships and measures for reporting.

---

## Clean up resources

In this exercise, you’ve learned how to create a medallion architecture in a Microsoft Fabric lakehouse.

If you’ve finished exploring your lakehouse, you can delete the workspace you created for this exercise.

---
