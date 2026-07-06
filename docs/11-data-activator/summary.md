# Lab 11 - Use Activator in Fabric

Activator in Microsoft Fabric takes action based on what’s happening in your data. An Activator lets you monitor your data and create triggers to react to your data changes.

This lab takes approximately **30** minutes to complete.

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Scenario

In this scenario, you’re a data analyst for a company that sells and ships a range of products. You’re responsible for the data of all shipments and sales to the city of Redmond. You want to create an alert rule that monitors the packages that are out for delivery. One category of products you ship is medical prescriptions that need to be refrigerated at a particular temperature during transit. You want to create an alert that sends an email to the shipping department if the temperature of a package containing a prescription is higher or lower than a certain threshold. The ideal temperature should be between 33 degrees and 41 degrees. Since the Activator events already contain a similar trigger, you create one specifically for the packages shipped to the city of Redmond. 

## Overview

### Step 1: Access Microsoft Fabric

- In this lab, you will access Microsoft Fabric using a temporary lab account provided by the QA Platform.

### Step 2: Create a workspace

- Before working with data in Fabric, you need to create a workspace.

### Step 3: Create an Activator

- Next, create an Activator in the workspace you created.

### Step 4: Get familiar with the Activator home screen

- Explore the eventstream data this sample is built on.

### Step 5: Create an object

- Create a new object called *Redmond Packages*.

### Step 6: Create a rule

- Create an alert rule that sends an email to the shipping department if the temperature of a package containing a prescription is higher or lower than a certain threshold.

### Step 7: Add filters to the rule

- Add a couple of filters for a few specific conditions.  

### Step 8: Add an action to the rule

- Add an action to send an email to the shipping department.

---

## Clean up resources

In this exercise, you have created an Activator with an alert rule. You should now be familiar with the Activator interface and how to create objects, properties, and rules.

If you've finished exploring your Activator, you can delete the workspace you created for this exercise.

<small><b>Source:
https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/11-data-activator.html
</b></small>





