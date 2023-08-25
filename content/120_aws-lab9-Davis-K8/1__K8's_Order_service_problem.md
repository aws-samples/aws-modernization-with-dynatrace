---
title: " K8's Order service problem"
chapter: false
weight: 2
---
##  K8's Order service problem

Now we are going to set the k8's `order` service version that will cause failures on the all requests.

To automate the version change, a unix script is provided that will do the following:
* Call the `order/setversion` URL set the order-service version
* Send a Dynatrace `CUSTOM_DEPLOYMENT` event indicating the change

After a minute or so, you should expect to see exceptions for all order related requests.

![image](/images/aws-lab9-Davis-K8_lab3-order-problem-usecase.png)

### 1. Enable the problem pattern

You will use the AWS Cloudshell to set the order service to version 3.

The argument for this depends on whether you do this on the Docker or the Kubernetes setup.

#### 1 - For Kubernetes setup, run this command.

```
cd ~/aws-modernization-dt-orders-setup/learner-scripts/
./set-version.sh k8-order 3
```

Ensure there are numerical values at the end for Response Data: `storedEventIds` like:

```
Response Data
{"storedEventIds":[8663164135574257870,-5988376401319068441],"storedIds":["8663164135574257870_1628095127627","-5988376401319068441_1628095127627"],"storedCorrelationIds":[]}
```

### 2. View app in browser

The event has the URL back to the sample application, so just click that if you don't have the sample app up already.  You should see `version 3` for the order app now too.

![image](/images/aws-lab9-Davis-K8_lab3-app-ui-order-version-3.png)


### 3. Review problem in Dynatrace

The problem may take a minute to show up, but this is what the problem will look like once it does. Also, you may see two problems that eventually get merged into one as Dynatrace is performing the problem analysis.

1. Problem card windows and impact summary
1. Root cause
1. Deployment event as additional context

![image](/images/aws-lab9-Davis-K8_lab3-order-problem.png)

### 4. Analyze problem

Referring to #4 in the picture above, click on the `Analyze failure rate degradation` button.

Right away we can see that there were exceptions in the code and the `details` button can be clicked to see the code stack trace.

![image](/images/aws-lab9-Davis-K8_lab3-order-problem-detail.png)

### 5. Analyze problem impact

From the problem card click on the Kubernetes Service -> `Order` link from the `Impacted Service` box, next click on the `order` service in the `related services` section to open the service page.  Notice the anomaly generated.

![image](/images/aws-lab9-Davis-K8_K8viewrequests.png)

Next click on the `view all request` as pictured above to see a timeline of all the transactions on the `order` service.

![image](/images/aws-lab9-Davis-K8_K8Failure.png)

and select the `failure rate` tab so you can see exactly when the problem started.

![image](/images/aws-lab9-Davis-K8_K8FailureRate.png)

### 6. Disable the problem pattern

From the `Services` host shell, run these commands to set the version back to version 1

####  For Kubernetes run this command.

```
cd ~/aws-modernization-dt-orders-setup/learner-scripts/
./set-version.sh k8-order 1
```

Dynatrace will automatically close the problem once it detects things are back to normal.

