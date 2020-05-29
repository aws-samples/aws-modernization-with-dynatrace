---
title: Review easyTravel
chapter: false
weight: 20
---

![image](/images/florian.png)

1 . Open the AWS portal (https://console.aws.amazon.com/ec2/v2/home) and open the Virtual Machine (VM) page. One way to do this is search for virtual machines

2 . Click on the VM called **workshop-ez-1** and you can see:

* the Public IP to get to the EZ travel application
* the security group that was added to expose the ports
* AMI running Linux (ubuntu 18.04) host.

![image](/images/ec2-overview.png)

## Dynatrace OneAgent

These VMs were created using the AWS CLI and the [user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html) boot scripts where used to installing easyTravel and the Dynatrace OneAgent.

To see what was installed:

Just right click on the host named `workshop-ez-1` and pick the **Instance settings** menu and then **View/Change user data**

![image](/images/ec2-userdata.png)

{{% notice info %}}
Learn more about the various ways the OneAgent can be installed, check out the [Dynatrace documentation](https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-oneagent/)
{{% /notice %}}

## Open the easyTravel application

1 . From the ec2 overview page, use the copy button to copy the “public IP” for this VM.

2 . Then in a new Browser tab, visit **http://PUBLIC-IP** to view the EasyTravel application. You should see a webpage that looks like this:

![image](/images/eztravel-orange.png)

{{% notice info %}}
If the application may take several minutes to start, so don't panic if it does not immediately appear.
{{% /notice %}}