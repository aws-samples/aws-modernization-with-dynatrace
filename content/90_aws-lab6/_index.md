---
title: "Lab 6 - Dynatrace Operator for Kubernetes"
chapter: true
weight: 90
---
## Overview

Re-hosting (also referred to as lift and shift) is a common migration use case. Re-architecture and Re-platform are steps that break the traditional architectures and replace individual components with cloud services and microservices. 

For this lab you are going to use an updated version of the application on a Kubernetes.  This makes it easy for you to see the transformation of the Sample Application in Lab 1 and the value of running Kubernetes on AWS without needing to stand up or maintain your own Kubernetes control plane. 

### 💥💥💥 Notice 💥💥💥

If you would rather NOT provision Kubernetes on AWS, then please follow the `AWS Lab 2 - Modernization with Containers` workshop guide. This guide has a shorter setup process but, still allows you to interact with the sames transformed application. 

### 💥💥💥 Notice 💥💥💥

This lab assumed you already provisioned an Amazon Elastic Kubernetes Service (EKS) cluster. If you did not have a cluster, then return the Kubernetes Lab.

### Objectives of this Lab 

🔷 Install the Dynatrace Operator and sample application

🔷 Review how the sample application went from a simple architecture to multiple services 

🔷 Examine the transformed application using service flows and back traces 

