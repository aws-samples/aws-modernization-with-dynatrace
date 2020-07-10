+++
title = "AWS Cleanup"
chapter = false
weight = 10
+++

{{% notice warning %}}
In order to prevent charges to your AWS account, we recommend cleaning up the infrastructure that was created. If you plan to keep things running so you can examine the workshop a bit more, please remember to do the cleanup when you are done. It is very easy to leave things running in an AWS account, forget about it, and then accrue charges.
{{% /notice %}}

#### Workshop resource cleanup

Simply run these commands to call a script that will remove the keypair called **YOUR_LAST_NAME-dynatrace-modernize-workshop**
and delete the CloudFormation stack called **YOUR_LAST_NAME-dynatrace-modernize-workshop**. By deleting the stack, the VPC and ec2 instances will be deleted.

```
cd ~/modernize-workshop-setup/aws
./cleanupAWSWorkshop.sh
```

The script output will look like this:

```
==========================================
Cleaning Up AWS workshop resources
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
Cleaning Up AWS workshop resources COMPLETE
End: Tue Jun 16 14:42:22 EDT 2020
=============================================
```

#### Verify

{{% notice warning %}}
The script will run fast, but it will take about 4-5 minutes for the CloudFormation script to complete.  You can monitor progress @ https://console.aws.amazon.com/cloudformation/home
{{% /notice %}}

What you are looking for the CloudFormation stack named **YOUR_LAST_NAME-dynatrace-modernize-workshop** to be deleted.

#### Dynatrace AWS Monitor cleanup

If you set the [AWS Monitor](/15_workshop_setup/15_aws_monitor.html), are can keep the role and policy in place to continue monitoring and there is **NO CHARGE** by AWS for role and policies configuration.  But if you want to remove the AWS configuration for this, then follow these steps.

1 . In AWS web console, navigate to **IAM --> Roles**

2 . Set filter to `dynatrace_monitoring_role`, click the row and then the **Delete Role** button

3 . Navigate to **IAM --> Policies**

4 . Set filter to `dynatrace_monitoring_policy`, click the row and then the **Delete Policy** under the **Policy Actions** button.

