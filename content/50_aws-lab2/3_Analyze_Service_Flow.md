---
title: "Analyze Service Flow"
chapter: false
weight: 4
---
## Analyze Service Flow

Now that we are back on the frontend service, lets look at the service flow to see whats different now.  Just click on the `View service flow` button to open this.

![image](/images/aws-lab2_lab2-service-flow-arrow.png)

### Response time perspective

You should now be on the `Service flow` page.

Right away, we can see how this application is structured:  

* Frontend calls order, customer, and catalog service
* Order service calls order and customer service

Something you would never know from the application web UI !

![image](/images/aws-lab2_lab2-service-flow.png)

Refer to the picture above:

1. We are viewing the data from a `Response time perspective`. Shortly, we will review the `Throughput perspective`.
1. Click on the boxes to expand the response time metrics. We can see that most of the response time, most of the time is spent in the `order` service and the least in the `customer` services.  And as in the monolith version of the application, a very small amount of the response time is spent in the databases. 

### Throughput perspective

![image](/images/aws-lab2_lab2-service-flow-tp.png)

Refer to the picture above:

1. Change to the `Throughput perspective` by clicking on the box
1. Click on the boxes to expand the metrics to see the number of requests and average response times going to each service

### 👍 How this helps

Review architecture before and after changes is now as easy as a few clicks! 

