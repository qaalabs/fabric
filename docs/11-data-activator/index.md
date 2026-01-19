# Lab 11 - Use Activator in Fabric

Activator in Microsoft Fabric takes action based on what’s happening in your data. An Activator lets you monitor your data and create triggers to react to your data changes.

This lab takes approximately **30** minutes to complete.

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

## Scenario

In this scenario, you’re a data analyst for a company that sells and ships a range of products. You’re responsible for the data of all shipments and sales to the city of Redmond. You want to create an alert rule that monitors the packages that are out for delivery. One category of products you ship is medical prescriptions that need to be refrigerated at a particular temperature during transit. You want to create an alert that sends an email to the shipping department if the temperature of a package containing a prescription is higher or lower than a certain threshold. The ideal temperature should be between 33 degrees and 41 degrees. Since the Activator events already contain a similar trigger, you create one specifically for the packages shipped to the city of Redmond. 


