---
title: "Workshop Cleanup"
chapter: true
weight: 99
---

If you plan to keep things running so you can examine the workshop a bit more please remember to do the cleanup when you are done. Depending on what you provisioned there maybe a few things to cleanup.

## Dynatrace config and monolith EC2 instance

Run this command to remove the AWS key pair, the AWS resources created by the CloudFormation template and the Dynatrace configuration:

```
cd ~/aws-modernization-dt-orders-setup/provision-scripts
./cleanup-workshop.sh
```

The start of the script output will look like this:

```
===================================================================
About to Delete Workshop resources
===================================================================
Proceed? (y/n) : y

==========================================
Deleting workshop resources
Starting: Fri 07 May 2021 04:35:46 AM UTC
==========================================
...
...
```

You can monitor the CloudFormation stack delete process in the <a href="https://console.aws.amazon.com/cloudformation/home" target="_blank">AWS console</a>

Eventually when it completes - plan for 5-10 minutes - it will look like this:

```
=============================================
Deleting workshop resources COMPLETE
End: Fri 07 May 2021 04:40:40 AM UTC
=============================================
```

## Kubernetes Cluster

If you created a Kubernetes cluster, then must delete the clusters you have spun up by running the `eksctl` command that will delete the CloudFormation stack made earlier.

### 💥 **TECHNICAL NOTE**

*If you adjusted the name of the cluster, then you need to adjust the argument value for `--name dynatrace-workshop-cluster`.  To verify the name, review it within the <a href="https://console.aws.amazon.com/cloudformation/home" target="_blank">AWS console</a>*

```
eksctl delete cluster --name dynatrace-workshop-cluster --region us-west-2 
```

Plan for 20-30 minutes for this to complete.

You can monitor the CloudFormation stack delete process in the <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank">AWS console</a>

## AWS Monitor Policy

If you created a IAM policy for the AWS monitor integration lab, then follow these steps.

1 . Navigate to IAM policies and delete the policy named `dynatrace_monitoring_policy` that you created earlier.

2 . Navigate to IAM role and delete the role named `dynatrace_monitoring_role` that you created earlier.

3 . Within Dynatrace, navigate to `Settings -> CLoud and Virtualization -> AWS` and remove the `dynatrace-modernize-workshop` connection created earlier.


## Use Dynatrace to try some of your applications

You have a fully feature enabled 15 day Dynatrace trial, so keep using it to monitor and manage your infrastructure and applications!!

Here are resources to get your started:

* <a href="https://www.dynatrace.com/support/help/get-started/get-started-with-dynatrace-saas/" target="_blank">Learn more about your tenant and install more OneAgents</a>
* <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/user-management-and-sso/manage-groups-and-permissions/" target="_blank">Add other users to your tenant</a>
* <a href="https://www.youtube.com/channel/UCcYJ-5q_AfmjQ4XTjTS0o3g" target="_blank">YouTube Videos</a>
* <a href="https://www.dynatrace.com/services-support/#support-resources-section" target="_blank">More Support resources</a>
