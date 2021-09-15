---
title: "Serviceflow"
chapter: false
weight: 90
---

## Analyze the Service Flow 
Now that we are back on the frontend service, let's look at the service flow to see what's different now. Just click on the view service flow button to open this.

![image](/images/lab4-serviceflow.png) 

## Response time perspective
You should now be on the Service flow page.

Right away, we can see how this application is structured:
* Frontend calls order, customer, and catalog service
* Order service calls order and customer service

Something you would never know from the application web UI!

![image](/images/lab4-serviceflow-responsetime.png)

Refer to the picture above:
1.	We are viewing the data from a Response time perspective. Shortly, we will review the Throughput perspective.
2.	Click on the boxes to expand the response time metrics. Most of the response time is spent in the order service and the least in the customer services. And as in the simple version of the application, a very small amount of the response time is spent in the databases.

## Throughput perspective

![image](/images/lab4-serviceflow-thoroughput.png)   

Refer to the picture above:
1.	Change to the Throughput perspective by clicking on the box
2.	Click on the boxes to expand the metrics to see the number of requests and average response times going to each service

## 👍 How this helps

Reviewing the architecture before and after changes is now as easy as a few clicks!
