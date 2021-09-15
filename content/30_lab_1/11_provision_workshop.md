---
title: "Lab 1 Setup "
chapter: false
weight: 11
---

This step just requires you to run a script that will provision several AWS resources and the Dynatrace configuration needed for the workshop.

## Let’s Begin

From the Cloudshell window, run these commands to start the provisioning process:

```
cd ~/aws-modernization-dt-orders-setup/provision-scripts
./provision-workshop.sh
```

The script output will look like this:

```
===================================================================
About to Provision Workshop - k8
===================================================================
Proceed? (y/n)

```

Select `Y` and when it completes, it will look like this:


```
...
...
=============================================
Provisioning AWS workshop resources COMPLETE
End: Tue Jun 16 14:42:22 EDT 2020
=============================================
```

The script will run fast, but it will take about 1-2 minutes for the CloudFormation script to complete. 

## What this script is doing

1 . AWS resources - using AWS CLI

* Add a KeyPair for the EC2 Instances called YOUR_LAST_NAME-dynatrace-modernize-workshop

2 . AWS resources - using a CloudFormation stack created by the AWS CLI

* Add a CloudFormation stack named `YOUR_LAST_NAME-dynatrace-modernize-workshop`
* Add a VPC named `YOUR_LAST_NAME-dynatrace-modernize-workshop`
* Add EC2 instance named: `YOUR_LAST_NAME-workshop-monolith` with a new security group named security_group_workshop-ez
* At EC2 startup, it installs Docker and Docker-Compose
* At EC2 startup, it installs the OneAgent for your Dynatrace tenant
* Starts up the sample application

3 . Dynatrace configuration 

* Set global <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/problem-detection-and-analysis/problem-detection/detection-of-frequent-issues/" target="_blank">Frequent Issue Detection</a> settings to Off
* Adjust the <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/problem-detection-and-analysis/problem-detection/how-to-adjust-the-sensitivity-of-problem-detection/" target="_blank">Service Anomaly Detection</a>
* Add <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/management-zones/" target="_blank">Management Zones</a> for the monolith and micro services versions of the application
* Add <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/tags-and-metadata/" target="_blank">Auto Tagging Rules</a> to drive management zone and SLO settings
* Add <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/service-level-objectives/" target="_blank">SLOs</a> for a use in custom dashboards

### 💥 **TECHNICAL NOTE**

_The Dynatrace configuration scripts use a combination of <a href="https://github.com/dynatrace-oss/dynatrace-monitoring-as-code" target="_blank">Dynatrace Monitoring as Code</a> framework (a.k.a. monaco) and the <a href="https://www.dynatrace.com/support/help/dynatrace-api/configuration-api/" target="_blank">Dynatrace Configuration API</a> for those few Dynatrace configurations not yet supported by monaco._

## Review CloudFormation Output

As mentioned above, it may take a few minutes, but you can check the CloudFormation output to ensure that all the AWS resources were provisioned successfully. 

Monitor CloudFormation stack status within the AWS console. Navigate to the `CloudFormation` page or just navidate to:
* <a href="https://console.aws.amazon.com/cloudformation/home" target="_blank">https://console.aws.amazon.com/cloudformation/home</a>

When it is complete, it will show a `CREATE_COMPLETE` status as shown below, but with your unique stack name.

![image](/images/setup-vm-cloudformation.png)

### 💥 **TECHNICAL NOTE**

_The process to provision everything will take ~5 minutes, so please be patient._

_If you using a personal or corporate account, the CloudFormation may rollback due to VPC limits being reached. In that scenario, delete one of the VPCs and retry the script._
