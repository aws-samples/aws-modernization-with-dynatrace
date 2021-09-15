---
title: "Lab 1 Overview"
chapter: false
weight: 10
---

Referring to the picture below, here are the components for lab 1.

**#1 . Sample Application**

Sample app representing a simple architecture of a frontend and backend implemented as Docker containers that we will review in this lab.

**#2 . Dynatrace monitoring**

The Dynatrace OneAgent has been installed by the workshop provisioning scripts and is communicating to your Managed Dynatrace Tenant.

**#3 . Load generator process**

A <a href="https://github.com/dt-orders/load-traffic" target="_blank">JMeter</a> process sends simulated user traffic to the sample app running within a Docker container. You will not need to interact with this container, it just runs in the background.

![image](/images/lab1-setup.png)

## 💥 **TECHNICAL NOTE**: 
_A real-world scenario would often start with the application components running on a physical or virtualized host on-prem and not "Dockerized". To simplify the workshop, we "Dockerized" the application into a front-end and back-end. In Dynatrace, these Docker containers all show up as "processes" on a host just like a "non-Dockerized" application will._

