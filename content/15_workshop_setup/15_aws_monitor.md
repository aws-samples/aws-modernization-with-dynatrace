+++
title = "AWS Monitor"
chapter = false
weight = 15
+++

![image](/images/jess.png)

You can integrate Dynatrace with Amazon Web Services (AWS) for intelligent monitoring of services running in the Amazon Cloud. AWS integration helps you stay on top of the dynamics of your data center in the cloud.

The AWS monitoring policy defines the minimal scope of permissions you need to give to Dynatrace to monitor the services running in your AWS account. Create it once and use anytime when enabling Dynatrace access to your AWS account.

To get the information required for comprehensive AWS cloud-computing monitoring, Dynatrace needs to identify all the virtualized infrastructure components in your AWS environment and collect performance metrics related to those components. 

![image](/images/dt-aws-dashboard.png)

## Setup

There are several ways one can configure the integation, but for this workshop we will use a quick solution using AWS Role based access folling these basic steps:

1. Create AWS monitoring policy
1. Create an AWS monitorng role
1. Configure the AWS Dashboard

{{% notice info %}}
You can read more about the various ways in the [Dynatrace documents](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/amazon-web-services/aws-monitoring-with-dynatrace-saas/#role-based-access)
{{% /notice %}}

#### Step 1 of 3: Create AWS monitoring policy

The AWS monitoring policy defines the minimum scope of permissions you need to give to Dynatrace to monitor the services running in your AWS account. Create it once and use anytime when enabling Dynatrace access to your AWS account.

1 . Go to Identity and Access Management (IAM) in your Amazon Console.

2 . Go to Policies and click the `Create policy` button.

![image](/images/dt-aws-dashboard-policy.png)

3 . Select the JSON tab, and paste the predefined policy from the box below.

![image](/images/dt-aws-dashboard-policy-json.png)

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [		
        "autoscaling:DescribeAutoScalingGroups",
        "cloudwatch:GetMetricData",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeInstances",
        "ec2:DescribeVolumes",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:DescribeTags",
        "elasticloadbalancing:DescribeInstanceHealth",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:DescribeRules",
        "elasticloadbalancing:DescribeTargetHealth",
        "rds:DescribeDBInstances",
        "rds:DescribeEvents",
        "rds:ListTagsForResource",
        "dynamodb:ListTables",
        "dynamodb:ListTagsOfResource",
        "lambda:ListFunctions",
        "lambda:ListTags",
        "elasticbeanstalk:DescribeEnvironments",
        "elasticbeanstalk:DescribeEnvironmentResources",
        "s3:ListAllMyBuckets",
        "sts:GetCallerIdentity",
        "cloudformation:ListStackResources",
        "tag:GetResources",
        "tag:GetTagKeys",
        "cloudwatch:ListMetrics",
        "kinesisvideo:ListStreams",
        "sns:ListTopics",
        "sqs:ListQueues",
        "ec2:DescribeNatGateways",
        "ec2:DescribeSpotFleetRequests",
        "kinesis:ListStreams",
        "es:ListDomainNames",
        "cloudfront:ListDistributions",
        "firehose:ListDeliveryStreams",
        "elasticmapreduce:ListClusters",
        "kinesisanalytics:ListApplications",
        "elasticache:DescribeCacheClusters",
        "elasticfilesystem:DescribeFileSystems",
        "ecs:ListClusters",
        "redshift:DescribeClusters",
        "rds:DescribeDBClusters",
        "glue:GetJobs",
        "sagemaker:ListEndpoints",
        "apigateway:GET"
      ],
      "Resource": "*"
    }
  ]
}
```

4 . Give the policy a name. For example dynatrace_monitoring_policy. Type it in the Name field.

![image](/images/dt-aws-dashboard-policy-name.png)

5 . Click `Create policy` button.

#### Step 2 of 3: Create an AWS monitorng role

To give Dynatrace SaaS the role-based monitoring access to your AWS account, you need to create a dedicated monitoring role for Dynatrace in your AWS account. Dynatrace will use this role to authenticate in your AWS environment with the scope of permissions as defined by the monitoring policy. 

1 . In your browser, open a new tab and sign in to Dynatrace to get the External Id that is needs for the IAM role. 

2 . Go to **Settings > Cloud and virtualization > AWS**, click `Connect new instance` button, select `Role based authentication` method. 

![image](/images/dt-aws-dashboard-dt.png)

{{% notice warning %}}
Keep this browser window open. We will come back to it shortly to copy the Token and test the connection.
{{% /notice %}}

3 . Go to Identity and Access Management (IAM) in your Amazon Console.

4 . Go to Roles and create a new role for Dynatrace.

![image](/images/dt-aws-dashboard-role.png)

5 . Select the `Another AWS account` tile as to establish trust with the Dynatrace account. On this section:

* Type `509560245411` as the Account ID that can access your account. 
* Choose the `Require external ID` option
* Paste the `Token` value from your Dynatrace AWS connection page in Dynatrace to the `External ID` field
* Then click the `Next: Permissions` button.

![image](/images/dt-aws-dashboard-role-account.png)

6 . In the Attach permissions policies section, choose the monitoring policy you created, search for: `dynatrace_monitoring_policy`. Choose then checkbox next to it and then click the `Next: Review` button.

![image](/images/dt-aws-dashboard-role-policy.png)

7 . On the Review page, provide the role name of: `dynatrace_monitoring_role`. The role name, trusted entities and policy should have values as shown here.

![image](/images/dt-aws-dashboard-role-policy-name.png)

8 . Click the `Create Role` button.

#### Step 3 of 3: Connect

Once you've granted AWS access to Dynatrace, it's time to connect Dynatrace to your Amazon AWS account.

1 . Go back on the Dynatrace connection page you still have open

2 . Enter the name for this connection as `dynatrace-modernize-workshop`

3 . In the Role field, use the name of the role you created easier: `dynatrace_monitoring_role`

4 . Type your Account ID (the account you want us to pull metrics from).

![image](/images/dt-aws-dashboard-dt-setup.png)


5 . Click `Connect` button to verify and once verified, click the `save` button.

## Thats it !

Once the connection is successfully verified and saved, your AWS account will be listed in the Cloud and virtualization settings page and yuou should soon begin to see AWS cloud monitoring data.

![image](/images/dt-aws-dashboard-overview.png)

{{% notice info %}}
Dynatrace makes Amazon API requests every 5 minutes, so it might take a few minutes for data to show up for the first time.
{{% /notice %}}
