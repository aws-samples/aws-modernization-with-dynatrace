---
title: "SLOs"
chapter: false
weight: 1
---
## SLOs

Dynatrace provides all the necessary real-time information that your Site-Reliability Engineering (SRE) teams need to monitor their defined objectives.

An SRE team is responsible for finding good service-level indicators (SLIs) for a given service in order to closely monitor the reliable delivery of that service. SLIs can differ from one service to the other, as not all services are equally critical in terms of time and error constraints.

Dynatrace offers more than 2000 different metrics that are ready for use as dedicated SLIs.

Each SLO definition can be evaluated by following two result metrics:

* **SLO status:** The current evaluation result of the SLO, expressed as a percentage. The semantics of this percentage (for example, 99.3% of all service requests are successful, or 99.99% of all website users are “satisfied” in terms of Apdex rating) and the target defined for this percentage are up to the SRE team.

* **SLO error budget:** The remaining buffer until the defined SLO target is considered as failed. For example, if an SLO defines a 95% target and its current SLO status is evaluated as 98%, the remaining error budget is the difference between the SLO status and the SLO target.
Two SLOs were created for you, so review those.

Here is an example custom dashboard with SLO dashboard tiles.

img/lab2-slo-dashboard.png)

### Review your environment

From the left menu in Dynatrace, click the `SLO` option to review the two SLOs that are already setup.  Edit one of them to review the configuration.

![image](/images/aws-lab3_lab2-slo-list.png) 

### 👍 How this helps

You can review the current health status, error budgets, target and warning, along with the timeframe of all your SLOs on the SLOs overview page.

Davis provides quick notifications on anomalies detected, along with actionable root causes. If your SLO has turned red, this is most likely because Davis has already raised a problem for the underlying metrics, showing you the root cause.

### 💥 **TECHNICAL NOTE** 

<i>See the <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/service-level-objectives/" target="_blank">Dynatrace Docs</a> for more details on SLOs</i>

