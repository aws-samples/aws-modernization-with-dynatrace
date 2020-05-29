---
title: "Host and Smartscape"
chapter: false
weight: 30
---

![image](/images/florian.png)

Now lets review what the OneAgent automatically discovered using these various Dynatrace views:

* Host
* Smartscape
* Services and Service Flow
* Transactions and services
* Databases
* Technologies
* Host view

You should be on the host page, but if not, from the right hand menu in Dynatrace choose `hosts` then click on the host with the prefix of **workshop-ez-1**.

On host page, you will see basic infrastructure information for the host.

1. Now expand the `Properties` section to see data about the host:
1. Host resource metrics (CPU, memory)
1. Host availability
1. Discovered processes. In this case most of which are Java applications running in Tomcat.

![image](/images/host-view.png)

## Smartscape view

Lets see how Dynatrace can visualize these processes using Smartscape.

1. Just click on the `...` box on the to the right of the host name
1. pick `Smartscape view` menu option
1. this will open Smartscape filtered to this VM

![image](/images/host-smartscape.png)

## About Smartscape

Smartscape is Dynatraces near real-time environment-topology visualization tool, is one of the most powerful features of Dynatrace. Smartscape auto-discovery delivers a quick and efficient visualization of all the topological dependencies in your infrastructure, processes, and services:

* On the horizontal axis, it visualizes all ingoing and outgoing call relationships within each tier
* On the vertical axis, it displays full-stack dependencies across all tiers
    * Datacenter
    * Hosts
    * Process
    * Service
    * Application

Enterprise have many hosts, services, and application that are ever changing. The ability to automatically discover and change as the environment changes is a key feature that Smartscape delivers.

![image](/images/dt-smartscape.png)

Feel free to explore the Smartscape.

## How this helps

Smartscape shows all the dependencies of a given service. Those include connections to queues, web servers, app servers, and a native process. This information allows us to better plan the migration, as all depending services must be considered during the migration.