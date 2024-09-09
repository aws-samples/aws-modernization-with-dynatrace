---
title: "Review Service Flow"
chapter: false
weight: 8
---
## Review Service Flow

1. Return to the `frontend` service.  You can use the `breadcrumb` menu as shown below.

    ![image](/images/aws-lab1_lab1-navigate-to-frontend.png)

1. On the `frontend` service page, locate the Understand dependencies` section on the right, and then click the `view Service flow` button.

    ![image](/images/aws-lab1_lab1-service-flow-arrow.png)

### Response time perspective

You should now be on the **Service flow** page.

Right away, we can see how this application is structured:  

* Frontend calls backend
* Backend calls database

![image](/images/aws-lab1_lab1-service-flow.png)

Refer to the numbers in the picture above:

1. The timeframe defaults to whatever you have your global timeframe selector set to, up to a maximum of 24 hours.
1. We are viewing the data from a **Response time perspective**. Shortly, we will review the **Throughput perspective**.
1. Click on the boxes to expand the response time metrics. We can see that most of the response time, most of the time is spent in the backend service.
1. Even though there are a few calls to the database for every backend service request, only a very small amount of the response time is spent in the database. 

### Throughput perspective

![image](/images/aws-lab1_lab1-service-flow-tp.png)

Refer to the numbers in the picture above:

1. The timeframe defaults to 10 minutes but can be adjusted
1. Change to the **Throughput** perspective by clicking on the box
1. Click on the boxes to expand the metrics to see the number of requests and average response times going to the backend sevice
1.  We can see the number of requests to `backend` database

### Analyze service backtrace

Dynatrace understands your applications transactions from end to end. This transactional insight is visualized several ways like the backtrace. 

The backtrace tree view represents the sequence of services that led to this service call, beginning with the page load or user action in the browser.

### 👍 How this helps

Using the service flow and service backtrace, these two tools give you a complete picture of interdependency to the rest of the environment architecture at host, processes, services, and application perspectives.

### Review Service backtrace

Let’s now take a look at the Services by clicking on the `Services` left side Dynatrace menu.

Pick the `backend` service.

![image](/images/aws-lab1_lab1-trans-services-db.png)

On the `backend` service, click on the `Analyze Backtrace` button.

![image](/images/aws-lab1_newBacktrace.png)

You should be on the service backtrace page where you will see information for this specific service.

This will get more interesting in the next lab, but for the monolith backend, we can see that the backtrace is as follows:

1. The starting point is the `backend`
1. `backend` is called by the `frontend` service
1. `ApacheJMeter` traffic from the load generator script
1. You may also see browser traffic to the **frontend** from the `My web application`.  If you don't that is OK.

_**If you click on any of the rows in the backtrace, the bottom portion of the page will expand.**_

![image](/images/aws-lab1_lab1-service-backtrace-arrows.png)

