---
title: "Backend service problem"
chapter: false
weight: 03
---

Now we are going to set the `backend` service version that will cause high response time for all backend requests.

To automate the version change, a unix script is provided that will do the following:
* Call the `backend/setversion` URL set the backend version
* Send a Dynatrace `CUSTOM_DEPLOYMENT` event indicating the change

After a minute or so, you should expect to see high Response time for all requests.

![image](/images/lab3-backend-problem-usecase.png)

## 1. Enable the problem pattern

From the AWS CLoudShell, run these commands to set the backend service to version 2

```
cd ~/aws-modernization-dt-orders-setup/learner-scripts/
./set-version.sh backend 2
```

Review the output to ensure the change was made successfully. I should look like this with numerical values at the end for Response Data: `storedEventIds:`

```
Retrieving dt-orders-monolith Public IP
=================================================================
Setting Service Version
SERVICE         = backend
NEW_VERSION     = 2
SET_VERSION_URL = http://1.1.1.1/backend/setversion/2
=================================================================
Set backend to 2 was successful
=================================================================
Sending Dynatrace Deployment event
DT_API_URL                 = https://xxx.live.dynatrace.com/api/v1/events
DEPLOYMENT_NAME            = Set backend to version 2
DEPLOYMENT_VERSION         = 2
DEPLOYMENT_PROJECT         = dt-orders
CI_BACK_LINK               = http://1.1.1.1
=================================================================
Push Event POST_DATA
{ "eventType" : "CUSTOM_DEPLOYMENT", "source" : "Custom Unix Shell Script" , "deploymentName" : "Set backend to version 2", "deploymentVersion" : "2" , "deploymentProject" :"dt-orders" , "ciBackLink" : "http://1.1.1.1", "customProperties": { "Example Custom Property 1" : "Example Custom Value 1", "Example Custom Property 2" : "Example Custom Value 2", "Example Custom Property 3" : "Example Custom Value 3" }, "attachRules" : { "tagRule" : [ { "meTypes":["PROCESS_GROUP_INSTANCE"], "tags": [ { "context": "CONTEXTLESS", "key": "service", "value": "backend" }, { "context": "CONTEXTLESS", "key": "project", "value": "dt-orders" }, { "context": "CONTEXTLESS", "key": "stage", "value": "production" } ]} ]} } }

Response Data
{"storedEventIds":[8663164135574257870,-5988376401319068441],"storedIds":["8663164135574257870_1628095127627","-5988376401319068441_1628095127627"],"storedCorrelationIds":[]}
```
<!--
## 2. View change in Dynatrace

From the left side menu, navigate to the `Releases` page.  Here you will see the how Dynatrace detected the versions.  It may take a minute, but you will see the version change in the `Real-time inventory` section and a new event in the `Release events` section.

**NOTE** Be sure to adjust the management zone to `dt-orders-monolith`

![image](/images/lab3-release-backend-list.png)

-->

## 2. View app in browser

The event has the URL back to the sample application, so just click that if you don't have the sample app up already.  You should see `version 2` for the customer app now too.

![image](/images/lab3-app-backend-version-2.png)

## 3. Review problem in Dynatrace

The problem may take a minute to show up, but this is what the problem will look like once it does. 

To view Dynatrace problem cards, from the Dynatrace left side menu just navigate to `Problems`.

**NOTE: Be sure that your management zone is NOT filtered!**

![image](/images/lab1-mz-filter-off.png)

You may see two problems that eventually get merged into one as Dynatrace is performing the problem analysis.

1. Impact Summary - Multiple services affected
1. Root cause

![image](/images/lab3-backend-problem.png)

## 4. Analyze problem - top findings

Click on the `Analyze Response Time Degradation` button to view the real issue with the request. To open the top findings page.

Here you can see how Dynatrace automatically analyzes the problem and lets you know whether the problem is related to code, waiting, or other services and queues.

Click in the `active wait time` line with the top findings to open the execution time breakdown detail.

![image](/images/lab3-backend-analysis.png)

## 5. Analyze problem - execution time breakdown

Dynatrace automatically show the breakdown of the execution time.  To see more, click the `View method hotspots` button.

![image](/images/lab3-backend-hotspots.png)

## 6. Analyze problem - hot spots

Here the code call breakdown is shown and by expanding this tree, you can locate the method where the slow down is occurring.  **NOTE: You will need to expand several stack frames to get to method causing the slow down.**

![image](/images/lab3-backend-analysis-trace.png)

## 7. Analyze problem impact

From the breadcrumb menu, click on the `backend` to open the service page.

![image](/images/lab3-backend-breadcrumb.png)

Then click on the response time box to open the service details page.  You can see exactly when the problem started.

![image](/images/lab3-backend-problem-details.png)

## 8. Disable the problem pattern

Run these commands to set the backend to version 1

```
cd ~/aws-modernization-dt-orders-setup/learner-scripts/
./set-version.sh backend 1
```

## 💥 **TECHNICAL NOTE**

**Why does the problem card say 'Custom Threshold'?**

The Dynatrace AI engine is evaluating metrics and dependencies for daily and weekly traffic patterns.  Since we just setup our sample application, there is not a lot of history to review we setup a fixed threshold as a global service setting.

To review this setting, on the left side menu, click `settings`, click `Anomaly Detection` and the the `Services` setting.

![image](/images/lab3-global-anomoly-rules.png)

Learn more about how How problems are detected and analyzed in the <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/problem-detection-and-analysis/problem-detection/automated-multi-dimensional-baselining/" target="_blank">Dynatrace Docs</a>

