---
title: "View SLO Dashboard"
chapter: false
weight: 2
---
## View SLO Dashboard

From the left side menu in Dynatrace, pick the `dashboard` menu.

Click the `Cloud Migration Success` to open the dashboard

You should now see the dashboard

![image](/images/aws-lab3_lab2-dashboard-view.png)

### Edit Dashboard

Now you need to edit the dashboard and adjust the tiles with the SLOs and databases in your environment.

On the top right of the page, click the `edit` button and then follow these steps:

### Edit Dynamic requests tile

1. Click on the title of the Dynamic requests tile to open the Service properties window on the right side 
1. On the Service properties window, pick the monolith `frontend (monolith-frontend)` service
1. Click the `Done` button

![image](/images/aws-lab3_lab2-dashboard-edit-tile.png)

### Edit remaining tiles

1. Repeat the same steps above for the Cloud services tile, but pick the `frontend (dev-frontend)` in the Service properties window
1. Repeat for the two SLO tiles, but pick the associated SLO from the drop down list in the SLO properties window
1. Repeat for the two database tiles. For Cloud services application there are 3 databases, so just pick one of the database of a demo.
1. Click the `Done` button to save the dashboard

