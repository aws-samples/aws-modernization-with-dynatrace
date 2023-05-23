---
title: "Analyze Service Backtrace"
chapter: false
weight: 5
---
## Analyze Service Backtrace

Let’s now take a look at the transactions and Services by clicking on the `Transactions and services` left side Dynatrace menu.

In the management zone drop down, choose `dt-orders-services` and pick the `catalog` service.

![image](/images/aws-lab2_lab2-service-list-catalog.png)

### Open Backtrace Page

To see the backtrace page, just click on the `Analyze Backtrace` button.

![image](/images/aws-lab2_lab2-service-backtrace-arrow.png)

You should be on the service backtrace page where you will see information for this specific service.

This will get more interesting in the next lab, but for the modernized backend, we can see that the backtrace is as follows:

1. The starting point is the `catalog` service
1. `catalog` is called by the `order` service
1. `catalog` is called by the `frontend` service
1. You may also see browser traffic to the `frontend` from the `My web application`.  If you don't that is OK.


![image](/images/aws-lab2_lab2-backtrace-detail.png)

### 👍 How this helps

The `service flow` and `service backtrace` give you a complete picture of interdependency to the rest of the environment architecture at host, processes, services, application perspectives. 

