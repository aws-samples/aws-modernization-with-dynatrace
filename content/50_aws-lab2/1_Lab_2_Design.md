---
title: "Lab 2 Design"
chapter: false
weight: 2
---
## Lab 2 Design

For this lab, another version of the application exists that breaks out each of these backend services into separate services. By putting these services into Docker images, we gain the ability to deploy the service into modern platforms like Kubernetes and Cloud managed services such as the ones shown below.

![image](/images/aws-lab2_lab2-picture.png)

**#1 . Sample Application**

Sample app representing a "services" architecture of a frontend and multiple backend services implemented as Docker containers that we will review in this lab.

**#2 . Load generator process**

A [JMeter](https://github.com/dt-orders/load-traffic) process sends simulated user traffic to the sample app running within a Docker container. You will not need to interact with this container, it just runs in the background.

**#3 . Dynatrace monitoring**

The Dynatrace OneAgent has been installed by the workshop provisioning scripts and is communicating to your Dynatrace Managed tenant.

### 💥 **TECHNICAL NOTE** 

<i>Learn more about the various ways the OneAgent can be installed, in the <a href="https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-oneagent" target="_blank">Dynatrace documentation</a></i>

**#4 . AWS monitoring**

In addition to monitoring your AWS workloads using OneAgent, Dynatrace provides [integration](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/amazon-web-services/aws-monitoring-with-dynatrace-saas/) with AWS CloudWatch which adds infrastructure monitoring to gain insight even into serverless application scenarios.

We will not have them configured for the lab, with Dynatrace you can also monitor other AWS services that influence the performance of your AWS-hosted applications. See the [Dynatrace Docs](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/amazon-web-services/supporting-services/) for complete list of AWS Supported services.

**#5 . AWS Dashboard**

This out-of-the-box dashboard gives insights on AWS CloudWatch metrics from each configured AWS account.

