---
title: "Enable application problems"
chapter: false
weight: 1
---
## Enable application problems

The Dynatrace Orders sample application has pre-built problems with different versions.  

These problems can be enabled with a `setversion` URL that can be used to change the version and thus the behavior of the application. Version 1 is the **"normal"** behavior and problems are enabled by setting the version to a value such as 2 or 3.

In the next section, you will run a unix script that sets these problems.

### Monolith deployment - backend service - High Response time for all requests 

![image](/images/aws-lab5-Davis-Mono_lab3-backend-problem-usecase.png)

### Service deployment - order service - exceptions for all order related requests

![image](/images/aws-lab5-Davis-Mono_lab3-order-problem-usecase.png)

### 💥 **TECHNICAL NOTE**

<i>Refer to <a href="https://github.com/dt-orders/overview" target="_blank">dt-orders overview README</a></i>

