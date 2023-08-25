---
title: "Custom Metrics Events"
chapter: false
weight: 3
---
## Custom Metrics Events

Dynatrace Davis automatically analyzes abnormal situations within your IT infrastructure and attempts to identify any relevant impact and root cause. Davis relies on a wide spectrum of information sources, such as a transactional view of your services and applications, as well as all on events raised on individual nodes within your Smartscape topology.

There are two main sources for single events in Dynatrace:

* Metric-based events (events that are triggered by a series of measurements)
* Events that are independent of any metric (for example, process crashes, deployment changes, and VM motion events)

Custom metric events are configured in the global settings of your environment and are visible to all Dynatrace users in your environment.

### 1. Setup Custom metric alerting for AWS

1 . To add custom alerts, navigate to `Settings --> Anomaly Detection --> Metric events` menu. 

2 . Click the `Add metric events` button.

![image](/images/aws-lab4-role_addmetricevent.png)

3 . Fill in the below information on the `Add metric event` template
1.  Summary:  `CPU % percentage`
2.  Type:  `Metric key` from dropdown
3.  Metric key `EC2 CPU usage %` from dropdown
4.  Agregation `Average` from dropdown
5.  Management zone `dt-orders-monolith`
6.  under entities click on `>` to see `Dimension key of entity type` and select `EC2 instance` from dropdown

![image](/images/aws-lab4-role_dimensionkey.png)

7.  Dymension filter click on `Add dimension filter` and select as shown below.

![image](/images/aws-lab4-role_adddimensionfilter.png)

8.  under Monitoring strategy section select as shown.

![image](/images/aws-lab4-role_monotoringstrategy.png)

9.  select the `>` next to `Advanced model properties` and input as shown.

![image](/images/aws-lab4-role_advancedmodelproperties.png)

10. In the `Event template` section add:
    1. Title:  `CPU CUSTOM ALERT`
    2. Event type from dropdown:  `Custom alert`
    3. Dimension key of entity for events select `EC2 instance` from dropdown

![image](/images/aws-lab4-role_keydimensionofentity.png)

11. click on `Save Changes`

4 . Add another rule, with everything the same, except for the `Event Description` to have the `title` as `CPU Resource Alert` and `Event type` = `RESOURCE` as shown below. 
  1. toggle the `Alert on missing data` to `off`

![image](/images/aws-lab4-role_eventtemplate.png)

5 . Save your changes and the list should look as shown below.

![image](/images/aws-lab4-role_savedmetricevents.png)

