# 05 Get started with Real-Time Intelligence in MS Fabric

Microsoft Fabric provides Real-Time Intelligence, enabling you to create analytical solutions for real-time data streams. In this exercise, you’ll use the Real-Time Intelligence capabilities in Microsoft Fabric to ingest, analyze, and visualize a real-time stream of stock market data.

This lab takes approximately **30** minutes to complete.

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Overview

### Step 1: Signing in to Microsoft Fabric

Sign in to Microsoft Fabric using the email and password from the QA Platform.

### Step 2: Create a workspace

Before working with data in Fabric, you need to create a workspace.

### Step 3: Create an eventstream

Now you’re ready to find and ingest real-time data from a streaming source. To do this, you’ll start in the Fabric Real-Time Hub. The real-time hub provides an easy way to find and manage sources of streaming data.

### Step 4: Create an eventhouse

The eventstream ingests the real-time stock data, but doesn’t currently do anything with it. Let’s create an eventhouse where we can store the captured data in a table.

### Step 5: Query the captured data

The eventstream captures real-time stock market data and loads it into a table in your KQL database. You can query this table to see the captured data.

### Step 6: Create a real-time dashboard

Now that you have a table that is being populated by stream of data, you can use a real-time dashboard to visualize the data.

### Step 7: Create an alert

Real-Time Intelligence in Microsoft Fabric includes a technology named Activator, which can trigger actions based on real-time events. Let’s use it to alert you when the average stock price increases by a specific amount.

---

## Clean up resources

In this exercise, you have create an eventhouse, ingested real-time data using an eventstream, queried the ingested data in a KQL database table, created a real-time dashboard to visualize the real-time data, and configured an alert using Activator.

Once you’ve finished exploring Real-Time Intelligence in Fabric, you can should the workspace you created for this exercise.
