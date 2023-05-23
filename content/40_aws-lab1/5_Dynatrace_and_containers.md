---
title: "Dynatrace and containers"
chapter: false
weight: 6
---
## Dynatrace and containers

In the picture above, the arrow shows the properties for Docker.

Our sample app was built as a Docker container and Dynatrace hooks into containers and provides code for injecting OneAgent into containerized process.  

### How Dynatrace monitors containers

![image](/images/aws-lab1_lab1-docker-monitoring.png)

Dynatrace hooks into containers and provides code for injecting OneAgent into containerized processes.

There’s no need to modify your Docker images, modify run commands, or create additional containers to enable Docker monitoring. Simply install OneAgent on your hosts that serve containerized applications and services. Dynatrace automatically detects the creation and termination of containers and monitors the applications and services contained within those containers.

### 💥 **TECHNICAL NOTE** 

<i>You can read more about Dynatrace Docker Monitoring <a href="https://www.dynatrace.com/support/help/technology-support/cloud-platforms/other-platforms/docker/basic-concepts/how-dynatrace-monitors-containers/" target="_blank">here</a> and technical details <a href="https://www.dynatrace.com/support/help/technology-support/cloud-platforms/other-platforms/docker/monitoring/monitor-docker-containers" target="_blank">here</a></i>

### View a Service

Now Let’s review a specific service.

1. Click the `services` square above the host infographic to open the list of services
1. From the list of services, choose the `frontend`

![image](/images/aws-lab1_lab1-pick-service.png)

### Service View

You should be on the service page where you will see information for this specific service.  Follow the picture below to locate the following:

1. Click on the `Properties` line to toggle on/off to see additional data
1. Click to view the services that call this service (Inbound)
1. Click to view the services that this service calls (Outbound)

![image](/images/aws-lab1_lab1-service-view.png)

