---
title: "Using your own account"
chapter: false
weight: 50
---

![image](/images/jess.png)

{{% notice warning %}}
You are responsible for the cost of the AWS services used while running this workshop in your AWS account.
{{% /notice %}}

{{% notice warning %}}
Your account must have the ability to create new IAM roles, scope other IAM permissions, and add/delete ec2 instances that are not on the free tier.
{{% /notice %}}

### Create an AWS account

If you don't already have an AWS account with Administrator access: [create
one now by clicking here](https://aws.amazon.com/getting-started/)

### Create an IAM user

Once you have an AWS account, ensure you are following the remaining workshop steps
as an IAM user with administrator access to the AWS account:

1. [Create a new IAM user to use for the workshop](https://console.aws.amazon.com/iam/home?#/users$new)

1. Enter the user details:
![Create User](/images/iam-1-create-user.png)

1. Attach the AdministratorAccess IAM Policy:
![Attach Policy](/images/iam-2-attach-policy.png)

1. Click to create the new user:
![Confirm User](/images/iam-3-create-user.png)

1. Take note of the login URL and save:
![Login URL](/images/iam-4-save-url.png)

### Login

Now logout and login as as the new **workshop** user.

### Set Region

Use a single region for the duration of this workshop. This workshop supports the following regions:

* us-west-2 (US West - Oregon)

Please select `US West (Oregon)` in the top right corner.

![Event Engine Region](/images/event-engine-region.png)
