---
title: "Sample App"
chapter: false
weight: 3
---
## Sample App

To get the Public IP to the frontend of the Sample Application, open the `EC2 instances` page in the AWS console. On the newly created host `dt-orders-services` find the `Public IP` as shown below.

![image](/images/aws-lab2_setup-services-ip-address.png)

### View the Sample app in a Browser

To view the application, copy the public IP into a browser that will look like this.

### 💥 **TECHNICAL NOTE**

<i>One difference you will see is the a dynamic list for the backend services versions.  We will refer to this again later in the labs.</i>

![image](/images/aws-lab2_lab2-app.png)

### Transactions and services

Let’s now take a look at all the services being monitored by clicking on the `Transactions and services` left side Dynatrace menu.

In the management zone drop down, choose `dt-orders-services`. The filtered list should now look like this:

![image](/images/aws-lab2_lab2-trans-services.png)

Choose the `frontend` service.

