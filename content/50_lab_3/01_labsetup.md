---
title: "Enable application problems"
chapter: false
weight: 01
---

The Dynatrace Orders sample application has pre-built problems with different versions.  

These problems can be enabled with a `setversion` URL that can be used to change the version and thus the behavior of the application. Version 1 is the **"normal"** behavior and problems are enabled by setting the version to a value such as 2 or 3.

In the next section, you will run a unix script that sets these problems.

## Monolith deployment - backend service - High Response time for all requests 

![image](/images/lab3-backend-problem-usecase.png)

## Service deployment - order service - exceptions for all order related requests

![image](/images/lab3-order-problem-usecase.png)

## 💥 **TECHNICAL NOTE**

Refer to [dt-orders overview README](https://github.com/dt-orders/overview) for more details of the various versions.