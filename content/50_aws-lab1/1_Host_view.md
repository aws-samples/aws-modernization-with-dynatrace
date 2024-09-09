---
title: "Host view"
chapter: false
weight: 2
---
## Host view

In the next few sections, you will review what the OneAgent automatically discovered for the host, services, processes, and the complete dependency mapping for the sample application.  

### 👍 How this helps

As you plan your migration, each of these views will give insights into accessing the profile, consumption and dependencies to other systems and services.

### Review OneAgent Deployment Status

The host running the sample application were all created using scripts that installed the sample application and to install the Dynatrace OneAgent.  Since we don't have to install the OneAgent now, let's just review its status.

1. Login into Dynatrace

1. Choose the `Deployment status` option from the left side menu to open the OneAgent deployment page.

![image](/images/aws-lab1_lab1-deployment-status.png)

### Review Hosts

From the left-side menu in Dynatrace choose `Hosts` then click on the host with the name `dt-orders-monolith`.

![image](/images/aws-lab1_newHost.png)

On host page, you will see basic infrastructure information for the host.

1. Now expand the `Properties` section to see data about the host:
1. Host resource metrics (CPU, memory)
1. Host availability
1. Discovered processes. The sample app is Node and Java based

![image](/images/aws-lab1_lab1-host-view.png)

### About Smartscape

Enterprises have many hosts, services, and application that are ever changing. The ability to automatically discover and change as the environment changes is a key feature that Smartscape delivers.  

Dynatrace's near real-time environment-topology visualization tool, Smartscape, is where Dynatrace's auto-discovery is delivered into a quick and efficient visualization of all the topological dependencies in your infrastructure, processes, and services.

### 👍 How this helps

Smartscape shows all the dependencies of a given service. Those include connections to queues, web servers, app servers, and a native process. The host view shows historical and live time-series data for usage as well as the consuming processes. This information allows us to better plan the migration, as all depending services must be considered during the migration.

![image](/images/aws-lab1_lab1-smartscape.png)

Referring to the picture above: 

* On the horizontal axis, it visualizes all ingoing and outgoing call relationships within each tier
* On the vertical axis, it displays full-stack dependencies across all tiers
    * Data center
    * Hosts
    * Process
    * Service
    * Application

