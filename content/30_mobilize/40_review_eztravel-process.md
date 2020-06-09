---
title: "Processes and Services"
chapter: false
weight: 40
---

![image](/images/florian.png)

In the Smartscape view, we saw the visualizations of the relationships in vertical stack and as well as the relationships spatially. Now lets view the process and service tiers to see the relationships from a single entity.

Lets return back to the host page where we will explore each of the tiers for the VM. To get back there, from the right hand menu in Dynatrace choose `hosts` then click on the host with the prefix of **workshop-ez-1**.

Now on the host page, click on the **com.dynatrace.easytravel.business.backend.jar easytravel-*-x*** process in the `Processes and Containers` section.

![image](/images/host-process.png)

## Process view

You should be on the process page where you will see information for this backend process.

1. Expand the Properties to see data about the process such as JVM version and open ports
1. Processs that call this process (Inbound)
1. Services that are served by this process. In this case there are multiple
1. Processs that this process calls (Outbound)
1. Process specific metrics

![image](/images/process-view.png)

{{% notice info %}}
Note that Dynatrace automatically recognizes many common process like Tomcat and will capture process specific metrics such as JVM garbage collection. See a list of supported technologies in the [Dynatrace documentation](https://www.dynatrace.com/support/help/technology-support/supported-technologies-and-versions/)
{{% /notice %}}

## View a Service

Now lets review a specific service.

1. Click the `services` square above the host infographic to open the list of services
1. From the list of services, choose the `BookingService`

![image](/images/process-view-list.png)

## Service View

You should be on the service page where you will see information for this specific service

1. Expand the Properties to see data about the process such as JVM version and open ports
1. Services that call this service (Inbound)
1. Services that this service calls (Outbound)

![image](/images/service-view.png)

## Service level backtrace

You should be on the service level backtrace page where you will see information for this specific service.

Dynatrace understands your applications transactions from end to end. This transactional insight is visualized several ways like the backtrace. The backtrace tree view represents the sequence of services that led to this service call, beginning with the page load or user action in the browser.

![image](/images/service-backtrace.png)

Follow along using these numbers as reference:

1 . This this the booking service

2 . booking service is called by the Customer Frontend

3 . Customer Frontend is a Tomcat Server


Now lets see another visulization called the service flow. For this and refering to the picture above:

4 . Click the `...` in the row for the `Customer Frontend`

5 . Choose the `Service Flow` menu item

## How this helps

The risk of moving specific components (host, database, processes, services, application) depends on the complexity and interdependency to the rest of the environment architecture. For example, before migrating a database we can look at Smartscape to understand which services are actively using this database and in which capacity.