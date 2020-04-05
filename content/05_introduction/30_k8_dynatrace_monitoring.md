+++
title = "EKS with Dynatrace"
chapter = false
weight = 30
+++

## Elastic Kubernetes Service with Dynatrace

Dynatrace is an [EKS certified partner](https://aws.amazon.com/eks/partners/) and provides detailed monitoring and dashboarding for real-time visibility into the performance and health of Kubernetes applications. Dynatrace OneAgent is container-aware and comes with built-in support for out-of-the-box monitoring of Amazon EKS down to the infrastructure layer including application-only monitoring.

## Automatic monitoring of applications running in Kubernetes pods

Capturing and collecting contextual monitoring data, along with real-time topology information, is a core strength of Dynatrace OneAgent. Through Davis, the Dynatrace AI engine, you get actionable insights into the performance and health of your applications and the underlying Kubernetes platform.

Dynatrace provides full-stack visibility into containerized workloads with zero changes required to your code or deployments. Capabilities include:

* Automatic discovery - no image or container manipulation required
* Automatic capture of container and pod metadata
* Automatic transaction tracing
* Automatic log monitoring
* Automatic full stack monitoring: hosts, containers, processes, services, application
* Automatic code level visibility and tracing of applications in containers
* Automatic monitoring of real user experience for applications hosted in containers
* Automatic detection and import of Kubernetes pod metadata for containers

These capabilities not only ensure full-stack visibility into containers (down to the code level and database), they’re also key for automated discovery of your container and service-to-service dependencies. The real-time dependency model of your whole environment drives the core of Davis—the Dynatrace full-stack root-cause analytics engine.

Here a few views of what you will see with this workshop.

### Kubernetes Dashboard

![k8-tracing](/images/k8-dashboard.png)

### Automatic container and pod metadata

Metadata includes:
* Base and full pod name
* Container Name and image name
* Kubernetes and pod UID

![k8-pod-metadata](/images/k8-pod-metadata.png)

### Container log monitoring

All new log content from important processes will then be auto-detected and monitored. There's no need to copy or export log content to external storage to facilitate analysis.

![k8-log](/images/k8-log.png)

### Automatic transaction tracing

While monitoring basic container metrics helps you to track and understand infrastructure utilization, it doesn’t give you insights into the actual performance of the applications or their real-time dependencies to other applications and services. Dynatrace patented PurePath technology captures and analyzes transactions end-to-end across every tier of your application technology stack, from the browser all the way down to the code and database level.

![k8-tracing](/images/k8-tracing.png)