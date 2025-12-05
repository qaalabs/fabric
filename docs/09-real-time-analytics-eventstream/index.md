# Lab 09 - Ingest real-time data with Eventstream in Fabric

Eventstream is a feature in Microsoft Fabric that captures, transforms, and routes real-time events to various destinations. You can add event data sources, destinations, and transformations to the eventstream.

In this exercise, you'll ingest data from a sample data source that emits a stream of events related to observations of bicycle collection points in a bike-share system in which people can rent bikes within a city.

This lab will take approximately **30** minutes to complete.

## Overview

### Step 1: Signing in to Microsoft Fabric

In this lab, you will sign in to Microsoft Fabric using the email and password from the QA Platform.

### Step 2: Create a workspace

Before working with data in Fabric, you need to create a workspace with the Fabric trial enabled.

### Step 3: Create an eventhouse

Now that you have a workspace, you can start creating the Fabric items you’ll need for your real-time intelligence solution. we’ll start by creating an eventhouse.

### Step 4: Create an Eventstream

In this step you create a new event stream in your workspace. Once established, you will be automatically redirected to the primary editor, ready to begin integrating sources into your event stream.

### Step 5: Add a source

### Step 6: Add a destination

### Step 7: Query captured data

The eventstream you have created takes data from the sample source of bicycle data and loads it into the database in your eventhouse. You can analyze the captured data by querying the table in the database.

### Step 8: Transform event data

The data you’ve captured is unaltered from the source. In many scenarios, you may want to transform the data in the event stream before loading it into a destination.

### Step 9: Query the transformed data

Now you can query the bicycle data that has been transformed and loaded into a table by your eventstream

---

## Clean up resources

In this exercise, you have created an eventhouse and pipulated tables in its database by using an eventstream.

When you’ve finished exploring your KQL database, you can delete the workspace you created for this exercise.
