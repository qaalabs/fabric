# Lab 06 - Analyse data in a data warehouse

In Microsoft Fabric, a data warehouse provides a relational database for large-scale analytics. Unlike the default read-only SQL endpoint for tables defined in a lakehouse, a data warehouse provides full SQL semantics; including the ability to insert, update, and delete data in the tables.

This lab will take approximately **30** minutes to complete.

## Overview

### Step 1: Signing in to Microsoft Fabric

In this lab, you will sign in to Microsoft Fabric using the email and password from the QA Platform.

### Step 2: Create a workspace

Before working with data in Fabric, you need to create a workspace with the Fabric trial enabled.

### Step 3: Create a data warehouse

Now that you have a workspace, it’s time to create a data warehouse.

### Step 4: Create tables and insert data

A warehouse is a relational database in which you can define tables and other objects.

### Step 5: Query data warehouse tables

Since the data warehouse is a relational database, you can use SQL to query its tables.

### Step 6: Create a view

A data warehouse in Microsoft Fabric has many of the same capabilities you may be used to in relational databases. For example, you can create database objects like *views* and *stored procedures* to encapsulate SQL logic.

### Step 7: Create a visual query

Instead of writing SQL code, you can use the graphical query designer to query the tables in your data warehouse. This experience is similar to Power Query online, where you can create data transformation steps with no code.

### Step 8: (OPTIONAL) Define a data model

A relational data warehouse typically consists of *fact* and *dimension* tables. The fact tables contain numeric measures you can aggregate to analyse business performance (for example, sales revenue), and the dimension tables contain attributes of the entities by which you can aggregate the data (for example, product, customer, or time). In a Microsoft Fabric data warehouse, you can use these keys to define a data model that encapsulates the relationships between the tables.

---

## Clean up resources

If you’ve finished exploring your data warehouse, you should delete the workspace you created for this exercise.
