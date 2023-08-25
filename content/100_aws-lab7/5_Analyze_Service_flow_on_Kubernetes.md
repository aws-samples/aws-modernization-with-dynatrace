---
title: "Analyze Service flow on Kubernetes"
chapter: false
weight: 6
---
## Analyze Service flow on Kubernetes
Duration: 5

In this step we will walk through the Service Flow view within Dynatrace  and see what's different now that its deployed on Kubernetes.

### Tasks to complete this step
1. Review Services View for `Frontend` service
   * Left Menu -> Applications & Microservices -> Services <br>
            ![image](/images/aws-lab7_lab2-step8-services.png)
   * Top Menu -> filter by ``` dt-orders-k8 management ``` zone.
         ![image](/images/aws-lab7_lab4-k8-mgmtzone-filter.png)
   * Pick the ``` frontend ``` service.
         ![image](/images/aws-lab7_lab4-k8-frontendservice-filter.png)
   * Just click on the view service flow button to open this.
         ![image](/images/aws-lab7_lab4-serviceflow.png) 

2. Analyze Services view from Response time perspective
   - You should now be on the Service flow page.
   - Right away, we can see how this application is structured:
      * Frontend calls order, customer, and catalog service
      * Order service calls order and customer service
   - Something you would never know from the application web UI!
         ![image](/images/aws-lab7_lab4-serviceflow-responsetime.png)

   - Refer to the picture above:
      1.	We are viewing the data from a Response time perspective. Shortly, we will review the Throughput perspective.
      2.	Click on the boxes to expand the response time metrics. Most of the response time is spent in the order service and the least in the customer services. And as in the simple version of the application, a very small amount of the response time is spent in the databases.

3. Analyze Services view from Throughput perspective
         ![image](/images/aws-lab7_lab4-serviceflow-thoroughput.png)   

   - Refer to the picture above:
      1.	Change to the Throughput perspective by clicking on the box
      2.	Click on the boxes to expand the metrics to see the number of requests and average response times going to each service

<aside class="positive">

**👍 How this helps**

Reviewing the architecture before and after changes is now as easy as a few clicks!

</aside>

