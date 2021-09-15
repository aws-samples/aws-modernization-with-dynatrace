---
title: "Process"
chapter: false
weight: 60
---

In the Smartscape view, we saw the visualizations of the relationships in vertical stack and as well as the relationships spatially. Now let’s view the processes and services running on the host.

As you plan your migration, you need more than just host level metrics.  Knowing the details for each service, **BEFORE** you change it, will lower the risk of impacting the business.

## 👍 How this helps

Very quickly we have seen what processes and services are running on a host AND more importantly, what processes and services call (outbound) and are being called (inbound).  Having a real-time picture is certainly more accurate that out of date documentation.

## Lets Review!

Return back to the host view for the host with the prefix of `dt-orders-monolith` and locate the `Processes and Containers` section.

Click on the `monolith-frontend` process to open the process detail view.

![image](/images/lab1-host-process.png)

## Process view

You should be on the process page where you will see information for this process.  Follow the picture below to locate the following:

1. Click on the `Properties` line to toggle on/off to see additional data. Did you notice Docker?
1. On the info graphic, click to view the processes that call this process (Inbound)
1. On the info graphic, click to view the services that are served by this process. In this case there are multiple
1. On the info graphic, click to view the processes that this process calls (Outbound)

![image](/images/lab1-process-view.png)

### 💥 **TECHNICAL NOTE**

_Dynatrace automatically recognizes many common processes like Tomcat and will capture process specific metrics such as JVM garbage collection. See a list of supported technologies, languages and containers in the <a href="https://www.dynatrace.com/support/help/technology-support/supported-technologies-and-versions" target="_blank">Dynatrace documentation</a>_

## Dynatrace and containers

In the picture above, the arrow shows the properties for Docker.

Our sample app was built as a Docker container and Dynatrace hooks into containers and provides code for injecting OneAgent into containerized process.  

## How Dynatrace monitors containers

![image](/images/lab1-docker-monitoring.png)

Dynatrace hooks into containers and provides code for injecting OneAgent into containerized processes.

There’s no need to modify your Docker images, modify run commands, or create additional containers to enable Docker monitoring. Simply install OneAgent on your hosts that serve containerized applications and services. Dynatrace automatically detects the creation and termination of containers and monitors the applications and services contained within those containers.

### 💥 **TECHNICAL NOTE** 

_You can read more about Dynatrace Docker Monitoring <a href="https://www.dynatrace.com/support/help/technology-support/cloud-platforms/other-platforms/docker/basic-concepts/how-dynatrace-monitors-containers/" target="_blank">here</a> and technical details <a href="https://www.dynatrace.com/support/help/technology-support/cloud-platforms/other-platforms/docker/monitoring/monitor-docker-containers" target="_blank">here</a>_

## View a Service

Now Let’s review a specific service.

1. Click the `services` square above the host infographic to open the list of services
1. From the list of services, choose the `frontend`

![image](/images/lab1-pick-service.png)

## Service View

You should be on the service page where you will see information for this specific service.  Follow the picture below to locate the following:

1. Click on the `Properties` line to toggle on/off to see additional data
1. Click to view the services that call this service (Inbound)
1. Click to view the services that this service calls (Outbound)

![image](/images/lab1-service-view.png)
