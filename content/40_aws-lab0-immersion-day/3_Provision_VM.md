---
title: "Provision VM"
chapter: false
weight: 4
---
## Provision VM

This step creates two CloudFormation stacks that do the following:

* Add two EC2 instance named: `dt-orders-monolith` and `dt-orders-services`
* At EC2 startup, it installs `Docker` and `Docker-Compose`
* At EC2 startup, it installs the `OneAgent` for your Dynatrace tenant
* Starts up the sample application by running `docker-compose up`

### 1. Copy provisioning script command

From within Dynatrace on the left side menu in Dynatrace, pick the `dashboard` menu.

On the dashboard page, open the `Workshop Provisioning` dashboard.

![image](/images/aws-lab0-immersion-day_dt-provision-dashboard-list.png)

On the dashboard page, click the dashboard named `Provision workshop`.  Copy ALL the text from the `Markdown` text bon on the right.  You will paste this in the AWS cloud shell as the next step. 

![image](/images/aws-lab0-immersion-day_dt-copy-command.png)

Click the `Done` button on the dashboard to get out of edit mode.

### 2. Run the provisioning script command

Within the AWS SSH shell, paste the full command and you should see a prompt to proceed as shown below.

```
===================================================================
About to Provision Workshop for:
https://syh360.dynatrace-managed.com/e/aaaaa-bbbb-ccccc-ddddd
SETUP_TYPE   = all
KEYPAIR_NAME = ee-default-keypair
===================================================================
Proceed? (y/n) : 
```

Once the script complete, you should see output as shown below.

```
-----------------------------------------------------------------------------------
Done Setting up Workshop config
End: Thu Nov  4 01:45:06 UTC 2021
-----------------------------------------------------------------------------------
Create AWS resource: monolith-vm
{
    "StackId": "arn:aws:cloudformation:us-west-2:838488672964:stack/monolith-vm-1635990306/d82cd2b0-3d10-11ec-a495-023df82ab493"
}

```

### 3. Verify CLoudFormation Stacks

The CloudFormation may take a few minutes, but you can check the CloudFormation output to ensure that all the AWS resources were provisioned successfully. 

Monitor CloudFormation stack status within the AWS console. Navigate to the `CloudFormation` page or just navigate to:
* <a href="https://console.aws.amazon.com/cloudformation/home" target="_blank">https://console.aws.amazon.com/cloudformation/home</a>

When it is complete, it will show a `CREATE_COMPLETE` status as shown below.s

![image](/images/aws-lab0-immersion-day_CFTCreateCompeleteMonoAG.png)
 
### 💥 **TECHNICAL NOTE**

_The process to provision everything will take ~5 minutes, so please be patient. You will also see 3 more CFT (Cloud Formation Template's) deploying but we wont need those till we get to Kubernetes Lab 6_

