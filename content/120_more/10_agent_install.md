+++
title = "OneAgent Manual Install"
chapter = false
weight = 10
+++

[OneAgent](https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-oneagent/x) is responsible for collecting all monitoring data within your monitored environment. A single OneAgent per host is required to collect all relevant monitoring data—even if your hosts are deployed within Docker containers, microservices architectures, or cloud-based infrastructure.

The OneAgent can be automatically installed and rolled out through configuration management tools such as Chef, Puppet, Ansible, Terraform or by just including the download and install into any custom deployment script.

To show how easy it is, lets do a quick Dynatrace OneAgent install directly on a host.

## Lets Start

1 . If you are not already there, first login into your Dynatrace environment

{{% notice info %}}
You can always login to your tenant using the URL **https://[your tenant].live.dynatrace.com** or by using the the SaaS login link on the top right of the Dynatrace home page https://www.dynatrace.com.
{{% /notice %}}

2 . From the left side menu on the bottom, choose ‘deploy dynatrace’ link to open the view below. Once on that screen, click the `start installation` button.

![image](/images/dt-deploy.png)

3 . Select the `linux` button

![image](/images/dt-deploy-linux.png)

4 . You will now see the unix commands that we simply copy and run within the VM. Note that the installer is configured just to call the API against your Dynatrace environment.

![image](/images/dt-deploy-commands.png)

5 . Now you need to connect to the VM using SSH.

6 . Now copy the **wget -O Dynatrace-OneAgent-Linux...** command from the Dynatrace Installer OneAgent page and paste back to the Unix session at the command line and run it.

7 . You can run or skip the second command to verify the signature.

8 . Copy the command to install the OneAgent and paste back to the Unix session.

{{% notice warning %}}
You may have to prefix the installation command with **sudo**.
{{% /notice %}}

For example:

```
sudo /bin/sh Dynatrace-OneAgent-Linux-1.193.81.sh --set-app-log-content-access=true --set-infra-only=false
```

When the install is complete you should see a message with the last lines that look like this:

```
Dynatrace OneAgent has successfully connected to Dynatrace Cluster Node https://ENVIRONMENTID.live.dynatrace.com:443/communication. You are all set. The Dynatrace OneAgent is fully operational.
```

9 . Back in the Dyntrace Installer OneAgent page, click the ‘show deployment status’ button to review the OneAgent status.

The host and processes are now monitored including many metrics like host CPU and metrics for each process discovered. But in order to get ‘deep’ visibility into code execution and transactions, you may need to restart the application. Upon restart, the OneAgent will automatically load into each process. The good news is that it does this without any changes to your code or your startup scripts.

Here is an example with some warnings, that is OK. We just simply restart the application.

![image](/images/dt-deploy-status-yellow.png)

Once the OneAgent is fully in place, the Dynatrace deployment status should now look like this:

![image](/images/dt-deploy-status-green.png)

## Now give it a try on some of your hosts!!
