# Fabric Warmup: Create a Lakehouse

A short warmup exercise to get comfortable navigating Microsoft Fabric again: create a workspace and a lakehouse, upload a file, load it into a table, and query it with SQL. No dataflows, notebooks, or Power Query - just the core click-through you'll be repeating all day.

This lab takes approximately **20** minutes to complete.

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Overview

### Step 1: Create a workspace

Before working with data in Fabric, you need to create a workspace.

### Step 2: Create a lakehouse

Now that you have a workspace, it's time to create a data lakehouse into which you'll ingest data.

### Step 3: Upload a file

One of the simplest ways to ingest small amounts of data into a lakehouse is to upload files from your local computer (or lab VM).

In this lab we will upload a file ~ `sales.csv`

### Step 4: Load file data into a table

Load the uploaded file into a managed table so it can be queried using SQL.

### Step 5: Use SQL to query tables

When you create a lakehouse and define tables in it, a SQL endpoint is automatically created through which the tables can be queried using SQL `SELECT` statements.

---

## Clean up resources

In this warmup exercise, you created a lakehouse and imported data into it, then queried it with SQL.

Once you've finished exploring your lakehouse, you should delete the workspace you created for this exercise.
