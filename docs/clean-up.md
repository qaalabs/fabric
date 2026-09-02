# Clean up resources

The QA Platform playground is automatically removed around 7 hours after it starts, so in most cases there's nothing you need to do - your workspace and everything in it will be cleaned up for you.

If you want to delete a workspace before then (for example, to free up capacity for another lab), you can do so manually.

1. Navigate to Microsoft Fabric in your browser.

2. In the bar on the left, select the icon for your workspace to view all of the items it contains.

3. Select **Workspace settings** and in the **General** section, scroll down and select **Remove this workspace**.

4. Select **Delete** to delete the workspace.

!!! note "Some labs create more than one workspace (for example, Lab 21 - Deployment Pipelines uses Dev, Test, and Production workspaces)."
    - Repeat the steps above for each workspace.
    - If a lab created other Fabric items outside a workspace, such as a deployment pipeline, delete those first from their own settings menu.
