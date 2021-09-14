---
title: "Review AWS monitor"
chapter: false
weight: 21
---

On the far left Dynatrace menu, navigate to the `Infrastructure -> AWS` menu.

![image](/images/dt-aws-dashboard-menu.png)

You may see `no data` initially as seen here. This is because Dynatrace makes Amazon API requests every 5 minutes, so it might take a few minutes for data to show until we are done with application setup on AWS.

![image](/images/dt-aws-dashboard-blank.png)

Once data is coming in, the dashboard pages will look similar to what is shown below.

![image](/images/dt-aws-dashboard-overview.png)

![image](/images/dt-aws-dashboard.png)

## Review collected metrics

Once data starts to be collected, click in the blue availability zone section located under the grey header labeled EC2 and you should see the list of availability zones below. Click on `us-west-2c` and the EC2 instances will be listed.

![image](/images/aws-monitor-list.png)

Click on an EC2 instance, and you will see how this host still is represented in the same Host view that we saw earlier with the host running the OneAgent. The basic CPU and memory metrics from CloudWatch are graphed for you. What is GREAT, is that this host is being monitored automatically by the Dynatrace AI engine and can raise a problem when there are anomalies.

![image](/images/aws-monitor-host.png)

## 👍 How this helps

The AWS monitor is a central way to get a picture and metrics for the AWS resources running against your accounts as you migrate.

Read more about how to scale your enterprise cloud environment with enhanced AI-powered observability of all AWS services in [this Dynatrace blog](https://www.dynatrace.com/news/blog/monitor-any-aws-service/).

### 💥 **TECHNICAL NOTE** 

See the [Dynatrace Docs](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/amazon-web-services/aws-monitoring-with-dynatrace-saas/) for more details on the setup options.
