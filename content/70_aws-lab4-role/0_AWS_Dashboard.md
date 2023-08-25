---
title: "AWS Dashboard"
chapter: false
weight: 1
---
## AWS Dashboard

In addition to monitoring your AWS workloads using OneAgent, Dynatrace provides integration with AWS CloudWatch which adds infrastructure monitoring to gain insight even into serverless application scenarios.

### 👍 How this helps

Dynatrace brings value by enriching the data from AWS CloudWatch extending observability into the platform with additional metrics for cloud infrastructure, load balancers, API Management Services, and more.

These metrics are managed by Dynatrace's AI engine automatically and this extended observability improves operations, reduces MTTR and increases innovation. 

Here is an example from another environment.

![image](/images/aws-lab4-role_lab3-aws-dashboard.png)

### Hosts regional page 

Notice the following details:
1. A summary of type and status is shown
1. A running average for virtual machines
1. A table of host with AWS monitor metrics summarized.  Notice that both hosts with and without an OneAgent are both shown

![image](/images/aws-lab4-role_lab3-host-list.png)

### EC2 example

Here is an example of a host with no OneAgent.

Notice the following details:
1. Expand the properties to see more details
1. All the AWS CloudWatch metrics are viewable as time-series data

![image](/images/aws-lab4-role_lab3-host-detail.png)

### Lambda example

Here is a list of the Lambda functions.  Notice tags and time-series data.

![image](/images/aws-lab4-role_lab3-lambda-list.png)

### Preset dashboards

As AWS services are enabled, Dynatrace will enable preset dashboards automatically.  These can be cloned and customized or hidden as required.  Here is one example:

![image](/images/aws-lab4-role_lab3-preset-dashboard.png)

To see more dashboards, navigate to this repository:
* <a href="https://github.com/Dynatrace/snippets/tree/master/product/dashboarding/aws-metric-streaming" target="_blank">https://github.com/Dynatrace/snippets/tree/master/product/dashboarding/aws-metric-streaming</a>

### Lab Setup:  We will not execute this part of the lab as we have automated the creation of a proxy known as the Dynatrace Activegate and creating the necessary AWS policies and roles that are needed for the Cloudwatch configuration. You can see all the magic in the Git repo you copied in Lab 0 in the provision-scripts/provision-workshop.sh file.  However we will show you the steps so you are familiar and can reference them should you need them for other purposes. Hands on will resume on step 3 of this lab.

There are <a href="https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-cloud-platforms/amazon-web-services/aws-monitoring-with-dynatrace-managed" target="_blank">several ways</a> one can configure the Dynatrace AWS monitor, but for this workshop we will use a `quick` solution using AWS `role` based access by creating and executiung a `Cloud Formation Template` by following these basic steps:

1. Download the Dynatrace_Monitoring_Role file from the github repository
1. Create AWS Role for monitoring
1. Create Dynatrace AWS connection with role based acces 

### Step 1 of 3: Download the Dynatrace_Monitoring_Role file from the below github repo

```
https://github.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/blob/main/provision-scripts/cloud-formation/dynatrace-role-access.yaml
```
1.  Copy the contents of the script by clicking on the copy button
2.  Paste the contents in a fresh notepad and save it as `dynatrace-role-access.yaml` in your desktop

![image](/images/aws-lab4-role_role1.png)


### Step 2 of 3: Create AWS Role for monitoring

The AWS monitoring role defines the minimum scope of permissions you need to give to Dynatrace to monitor the services running in your AWS account. Create it once and use anytime when enabling Dynatrace access to your AWS account.

1 . From your amazon console home type `cloudformation` and select `Stacks`.

![image](/images/aws-lab4-role_role2.png)

2 . Select the `Create stack` dropdown and click on `With new resources (standard)`.

![image](/images/aws-lab4-role_role3.png)

3 . On the `Create stack` page, select radio buttons for `Template is ready` and `Upload a template file`.

4 . Next, Click the `Choose file` button and select the `dynatrace-role-access.yaml` file you saved in the earler step. 

5 . Click on `Next`.

![image](/images/aws-lab4-role_role4.png)

6 . On the `Specify stack details` enter the `stack name` as `DT-monitoring-role` and in the `Parameters` section paste the `ExternalID` you copied earlier from the Cloud and Virtualizatoin -> AWS integration page in the Dynatrace platform and click `next`.

![image](/images/aws-lab4-role_role5.png)
 
7 . On the `Configure stack options` click `Next`.

8 . On the `Review DT-monitoring-role` notice the parameters fileed out with your info including the `ExternalID`.  Finally, aknowledge and `Submit`.

![image](/images/aws-lab4-role_role6.png)
![image](/images/aws-lab4-role_role7.png)

9 . On the Stacks page you will see the `Create_Complete` message in the status.


### Step 3 of 3: Create Dynatrace AWS connection with role based acces

Dynatrace can use role based access to make secure REST or Query protocol requests to the AWS service API. You'll now need to return to the Dynatrace portal to finalize your integration and make the connection that it can use to get metrics from Amazon Web Services.

1. From the Cloud and Virtualizatoin -> AWS integration page on the Dynatrace portal add the following bits of information:  
    1.  Connection Name: `Dynatrace Integration`
    2.  IAM Role: `Dynatrace_monitoring_role`
    3.  Your AWS account ID:  found on the AWS console top right hand dropdown.
    4.  Click `Connect`

![image](/images/aws-lab4-role_role8.png)


2. Once the connection is successfully `verified` and saved, your AWS account will be listed in the `Cloud and virtualization` settings page. If successful, your should see the configuration now on the `AWS connections` page:

![image](/images/aws-lab4-role_dt-aws-dashboard-list.png)

