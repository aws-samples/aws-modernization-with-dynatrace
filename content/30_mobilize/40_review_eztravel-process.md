---
title: "Processes and Services"
chapter: false
weight: 40
---

![image](/images/florian.png)

In the Smartscape view, we saw the visualizations of the relationships in vertical stack and as well as the relationships spatially. Now Let’s view the process and service running on the host.

{{% notice note %}}
As you plan your migration, you need more than just host level metrics.  Knowing the details for each services, **BEFORE** you change it, will lower the risk of impacting the business.
{{% /notice %}}

## Host view

Return back to the host view for the host with the prefix of **YOUR_LAST_NAME-workshop-ez** and locate the **Processes and Containers** section.

![image](/images/host-arrow-process.png)

Click on the **com.dynatrace.easytravel.business.backend.jar easytravel-*-x*** process in the **Processes and Containers** section to open the process detail view.

![image](/images/host-process.png)

## Process view

You should be on the process page where you will see information for this backend process.  Follow the picture below to locate the following:

1. Click on the **Properties** line to toggle on/off to see additional data about the process such as JVM version and open ports
1. Click to view the processes that call this process (Inbound)
1. Click to view the services that are served by this process. In this case there are multiple
1. Click to view the processes that this process calls (Outbound)
1. Click to view the Process specific time-services metrics

![image](/images/process-view.png)

{{% notice info %}}
Note that Dynatrace automatically recognizes many common processes like Tomcat and will capture process specific metrics such as JVM garbage collection. See a list of supported technologies in the [Dynatrace documentation](https://www.dynatrace.com/support/help/technology-support/supported-technologies-and-versions/)
{{% /notice %}}

## View a Service

Now Let’s review a specific service.

1. Click the **services** square above the host infographic to open the list of services
1. From the list of services, choose the **BookingService**

![image](/images/process-view-list.png)

## Service View

You should be on the service page where you will see information for this specific service.  Follow the picture below to locate the following:

1. Click on the **Properties** line to toggle on/off to see additional data
1. Click to view the services that call this service (Inbound)
1. Click to view the services that this service calls (Outbound)

![image](/images/service-view.png)

## How this helps

Very quickly we have seen what processes and services are running on a host AND more importantly, what processes and services call (inbound) and are being called (inbound).  Having a real-time picture is certainly more accurate that out of date documentation.