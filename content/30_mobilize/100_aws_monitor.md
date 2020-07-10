+++
title = "AWS Monitor"
chapter = false
weight = 100
+++

![image](/images/florian.png)

In addition to monitoring your AWS workloads using OneAgent, Dynatrace provides integration with AWS Monitor which adds Infrastructure monitoring to gain insight even into serverless application scenarios.

If you set up an AWS monitor earlier in the [Workshop setup](/15_workshop_setup/15_aws_monitor.html), you should now have data so Let’s review it now.

## Review the AWS monitor data

On the far left Dynatrace menu, navigate to the "AWS" menu as shown here:

![image](/images/dt-aws-dashboard-menu.png)

Dynatrace has been gathering metrics by calling the Amazon API every 5 minutes. Go ahead and navigate into the various resources to review what is being collected.  

![image](/images/dt-aws-dashboard.png)

Click in the blue availability zone section located under the grey header labeled EC2 and you should see the list of availability zones below.  Click on **us-west-2c** and the EC2 instances will be listed. You should  find the Cloud9 instance which does NOT have a Dynatrace OneAgent running on it. Notice too how you automatically get regional and instance type data.

![image](/images/aws-monitor-list.png)

Click on the **Cloud9** instance, and you will see how this host still is represented in the same **Host** view that we saw earlier with the host running the OneAgent. The basic CPU and memory metrics from CloudWatch are graphed for you.  What is GREAT, is that this host is being monitored automatically by the Dynatrace AI engine and can raise a problem when there are anomalies.

![image](/images/aws-monitor-host.png)


## How this helps

The AWS monitor is a central way to get a picture and metrics for the AWS resources running against your accounts as you migrate. 