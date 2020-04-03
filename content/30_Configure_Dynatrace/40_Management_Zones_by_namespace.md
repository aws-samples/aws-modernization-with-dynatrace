+++
title = "Management Zones"
chapter = true
weight = 40
+++

## Create Management Zones

Lets add a <b>Management Zone</b> to distinguish the different namespaces of the Sock Shop application.

- <b>Hint #1</b> : Namespaces are Kubernetes properties captured automatically by Dynatrace
- <b>Hint #2</b> : Your <b>Management Zones</b> will need 2 conditions
- <b>Hint #3</b> : You need to define 2 <b>Management Zones</b>

In the end, you should have the following <b>Management Zones</b> defined:

![management_zones](/images/management_zones.png)

## Management Zone rule


### Extending Management Zone rule

The Management Zone rule can be extended to underlying <b>Hosts</b> (nodes) and to <b>Services</b> associated to the <b>Process Groups</b>.

- To extend to <b>Hosts</b> and <b>Services</b>, tick the associated check boxes 

You <b>Management Zone</b> rule should look like this (for <b>production</b> namespace):

![management_zone_rule_namespace](/images/management_zone_rule_namespace.png)

## Validate Management Zones

![services_filtered_by_management_zone](/images/services_filtered_by_management_zone.png)

{{% children showhidden="false" %}}