+++
title = "Scale"
chapter = false
weight = 20
+++

![image](/images/henrik.png)

Due to the complexity and effort of refactoring a bunch of code, Henrik has decided to take a mixed cloud adoption strategy.

The intermediate step will be to support his developments efforts:

* **Refactor** the backend Java application to be packaged and served within a Docker image
* **Rebuild** relational in-memory Apache Derby database to Mongo

The final step be to put on AWS Kubernetes Service (AKS) and AWS Cosmos DB once the Cloud operations team has complete their certification of AKS and Cosmos.

![image](/images/adapt-docker.png)

## Lets see what it looks like

In Dynatrace, goto the hosts page and open the host with **workshop-ez-docker-1** as the prefix. This VM was also provisioned earlier in this workshop. But this time, easyTravel was provisioned using Docker and Docker Compose. You can check out the docker-compose.yml file here

Now instead of a bunch of standalone Java processes, the host page shows the detected Docker containers. **And it did this with NO additonal configuration changes or changes to the Docker image!!**

Go ahead and click on the `View container` button to see an overview of each container.

![image](/images/docker-host.png)

Also, go back and click the of the processes like **dynatrace/easytravel-frontend**.

## How Dynatrace monitors containers

Dynatrace hooks into containers and provides code for injecting OneAgent into containerized processes.

There’s no need to modify your Docker images, modify run commands, or create additional containers to enable Docker monitoring. Simply install OneAgent on your hosts that serve containerized applications and services. Dynatrace automatically detects the creation and termination of containers and monitors the applications and services contained within those containers.

![image](/images/docker-monitoring.png)

{{% notice info %}}
You can read more about Dynatrace Docker Monitoring [here](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/other-platforms/docker/basic-concepts/how-dynatrace-monitors-containers/) and technical details [here](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/other-platforms/docker/monitoring/monitor-docker-containers)
{{% /notice %}}

## Validate SLAs

During the workshop provisioning we used the [Dynatrace API](https://www.dynatrace.com/support/help/dynatrace-api/configuration-api/dashboards-api/) to add Dashbaord that allows for a quick comparison of the non-Dockerized and Dockerized implementations of easyTravel.

Navigate the dashboards from the left side menu to analyze volumes, response times, and load.

![image](/images/dashboard.png)

## How this helps

Dynatrace monitors the progress of shifting workloads to the cloud. It helps us make better decisions on what to move when based on how tightly coupled services are and on the automatic baseline comparison between pre-migration and in-migration.
