---
title: Review easyTravel
chapter: false
weight: 20
---

![image](/images/florian.png)

## Review EC2 instances

Let’s first review the EC2 instances where the easyTravel application is running by opening the [AWS portal ec2 instances page](https://console.aws.amazon.com/ec2/v2/home). 

Here there are two instances that both run the easyTravel application. The one named: **YOUR_LAST_NAME-workshop-ez** is deployed as a bunch of standalone processes.  The other one named: **YOUR_LAST_NAME-workshop-ez-docker** deploys the application as multiple Docker containers using Docker Compose.

2 . Click on the VM called **YOUR_LASTNAME-dynatrace-modernize-workshop-ez**

![image](/images/aws-host-list.png)

This will open a detail page where you can you find info about your instance.  Referring to the picture below, check out the following for your instance:

1. the Public IP to get to the EZ travel application
1. the security group that was added to expose the ports
1. AMI running Linux (ubuntu 18.04) host
1. [Instance Type](https://aws.amazon.com/ec2/instance-types/)

![image](/images/ec2-overview.png)      

## Dynatrace OneAgent

These two EC2 Instances were created using a [CloudFormation Script](https://github.com/dt-demos/modernize-workshop-setup/blob/master/aws/workshopCloudFormationTemplate.yaml) and the [user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html) boot scripts where used to installing easyTravel and the Dynatrace OneAgent.

If you were wondering **HOW** we already installed the Dynatrace OneAgent, just right click on the host named **YOUR_LAST_NAME-workshop-ez** and pick the **Instance settings** menu and then **View/Change user data**

![image](/images/ec2-userdata.png)

These two command will download and run the OneAgent installer.  The URL and token you entered earlier were passed as parameters to the CloudFormation template.

![image](/images/oneagent-userdata.png)

{{% notice info %}}
Learn more about the various ways the OneAgent can be installed, check out the [Dynatrace documentation](https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-oneagent/)
{{% /notice %}}

## Open the easyTravel application

1 . Back on the ec2 instance page for **YOUR_LAST_NAME-workshop-ez**, use the copy button to copy the **public IP**.

![image](/images/ec2-publicip.png)

2 . Then in a new Browser tab, paste that IP, **http://PUBLIC-IP**, to view the EasyTravel application. You should see a webpage that looks like this:

![image](/images/eztravel-orange.png)

{{% notice note %}}
The application may take several minutes to start, so don't panic if it does not immediately appear.  Just keep the browser tab open and occasionally hit refresh.
{{% /notice %}}

3 . Back on the ec2 instance page, copy the **public IP** Dockerized version named  **YOUR_LAST_NAME-workshop-ez-docker**.  

4 . Then in an additional browser tab, paste that IP, **http://PUBLIC-IP**, to view the EasyTravel application.  Again, it may take few minutes to be available.

## Continue with the review

While the application is starting, let us now move to the next section to review what we can see now in Dynatrace.
