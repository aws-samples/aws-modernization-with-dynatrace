+++
title = "Workshop Setup"
chapter = false
weight = 40
+++

![image](/images/jess.png)

This step will provision several AWS resources and the Dynatrace configuration needed for the workshop.

1 . AWS resources - using AWS CLI

* Add a KeyPair for the VMs called **YOUR_LAST_NAME-dynatrace-modernize-workshop**

2 . AWS resources - using a CloudFormation stack created by the AWS CLI

* Add a CloudFormation stack named **YOUR_LAST_NAME-dynatrace-modernize-workshop**
* Add a VPC named **YOUR_LAST_NAME-dynatrace-modernize-workshop**
* Add VM named: **workshop-ez-1** with a new security group named **security_group_workshop-ez**
    * At startup, it installs Docker and the EZ travel application 
    * At startup, it installed the OneAgent for your Dynatrace tenant
* Add VM named: **workshop-ez-docker-1** with a new security group named **security_group_workshop-ez-docker** 
    * At startup, it installs Docker and the EZ travel application using the Docker-Compose implmentation 
    * At startup, it installed the OneAgent for your Dynatrace tenant

3 . Dynatrace configuration

* Set global [Frequent Issue Detection](https://www.dynatrace.com/support/help/how-to-use-dynatrace/problem-detection-and-analysis/problem-detection/detection-of-frequent-issues/) settings to Off
* Adjust the [Service Anomaly Detection](https://www.dynatrace.com/support/help/how-to-use-dynatrace/problem-detection-and-analysis/problem-detection/how-to-adjust-the-sensitivity-of-problem-detection/) global settings
* Add a [custom Java sensor](https://www.dynatrace.com/support/help/how-to-use-dynatrace/transactions-and-services/configuration/define-custom-services/) for the CheckDestination backend service
* Add [Management Zones](https://www.dynatrace.com/support/help/how-to-use-dynatrace/management-zones/) for ez-travel and ez-travel-docker
* Add modernize-workshop [dashboard](https://www.dynatrace.com/support/help/how-to-use-dynatrace/dashboards-and-charts/)
* Add autoTagging rule for a [tag](https://www.dynatrace.com/support/help/how-to-use-dynatrace/tags-and-metadata/) called workshop-group.
* Add [application](https://www.dynatrace.com/support/help/how-to-use-dynatrace/real-user-monitoring/setup-and-configuration/web-applications/initial-configuration/define-your-applications-via-the-my-web-application-placeholder/) for EasyTravelOrange and EasyTravelOrangeDocker

#### Run the script

1 . run these commands to start the provisioning process

```
cd ~/modernize-workshop-setup/aws
./provisionAWSWorkshop.sh
```

The script output will look like this:

```
==========================================
Provisioning AWS workshop resources
Starting: Tue Jun 16 14:41:09 EDT 2020
==========================================
...
...
```

When it completes, it will look like this:

```
...
...
=============================================
Provisioning AWS workshop resources COMPLETE
End: Tue Jun 16 14:42:22 EDT 2020
=============================================
```

{{% notice warning %}}
The script will run fast, but it will take about 1-2 minutes for the CloudFormation script to complete.  You can monitor progress @ https://console.aws.amazon.com/cloudformation/home
{{% /notice %}}

{{% notice warning %}}
Once the ec2 instances are running, it will take an additional 4-6 minutes for the easyTravel sample application to completely start, so please be patient.
{{% /notice %}}

2 . While this is processing, you can review this checklist and move to the the next section.

### Checklist

In this section, you should have completed the following:

:white_check_mark: Used the AWS Cloud Shell and ran various UNIX commands

:white_check_mark: Configured the AWS Monitoring Dynatrace Integration 

:white_check_mark: Captured environment and token info needed for automation scripts

:white_check_mark: Provisioned workshop AWS resources