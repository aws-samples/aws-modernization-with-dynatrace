---
title: "Create Dashboard"
chapter: false
weight: 20
---

From the left side menu in Dynatrace, pick the `dashboard` menu.

On the dashboard page, click the `new dashboard` button.

![image](/images/lab2-dashboard.png)

Provide a dashboard name like `Cloud Migration Success`

On the blank dashboard page, click the settings.  Then click the `advanced settings` link to open then settings page

![image](/images/lab2-dashboard-settings.png)

Referring to this picture, follow these steps:

1. On the settings page, click the `dashboard JSON` menu.
1. Copy and paste the following Json content from this file into your dashboard JSON, replacing the existing JSON in the process:
    * <a href="https://raw.githubusercontent.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/main/learner-scripts/cloud-modernization-dashboard.json" target="_blank">https://raw.githubusercontent.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/main/learner-scripts/cloud-modernization-dashboard.json</a>
1. You **MUST** replace the `owner` field to be the email that you logged into Dynatrace with or you will not be able to view it. 

![image](/images/lab2-dashboard-json.png)

After you edit the email, then click the `Revert Dashboard ID` button.  After you click the `Revert Dashboard ID` button, click the `Save changes` button.

![image](/images/lab3-save-dashboard.png)

## View Dashboard

Click the `Cloud Migration Success` bread crumb menu to go back to the dashboard page

![image](/images/lab2-dashboard-bread.png)

You should now see the dashboard

![image](/images/lab2-dashboard-view.png)

## Edit Dashboard

Now you need to edit the dashboard and adjust the tiles with the SLOs and databases in your environment.

On the top right of the page, click the `edit` button and then follow these steps:

### Edit Dynamic requests tile

1. Click on the title of the Dynamic requests tile to open the Service properties window on the right side 
1. On the Service properties window, pick the monolith `frontend (monolith-frontend)` service
1. Click the `Done` button

![image](/images/lab2-dashboard-edit-tile.png)

### Edit remaining tiles

1. Repeat the same steps above for the Cloud services tile, but pick the `frontend (dev-frontend)` in the Service properties window
1. Repeat for the two SLO tiles, but pick the associated SLO from the drop down list in the SLO properties window
1. Repeat for the two database tiles. For Cloud services application there are 3 databases, so just pick one of the database of a demo.
1. Click the `Done` button to save the dashboard


