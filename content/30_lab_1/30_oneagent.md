---
title: "OneAgent"
chapter: false
weight: 30
---

The host running the sample application were all created using scripts that installed the sample application and to install the Dynatrace OneAgent.  Since we don't have to install the OneAgent now, let's just review its status.

1. Login into Dynatrace

1. Choose the `Deployment status` option from the left side menu to open the OneAgent deployment page.

![image](/images/lab1-deployment-status.png)

## Review another way to install the OneAgent 

1. Choose the `Deploy Dynatrace` option from the left side menu to open the OneAgent deployment page. 

1. Click the `Start installation` button.  This will open the Download page.

1. On the `Download agent` page, pick the platform `Linux` to view the commands will download and run the OneAgent installer.

![image](/images/lab1-download-dynatrace.png)

### 💥 **TECHNICAL NOTE** 

_The URL and Token is unique to your Dynatrace tenant.  If you expand the `Set customized options (optional).` section you can review other options for the OneAgent installer._

### 💥 **TECHNICAL NOTE** 

_Setting the hostname via  `/bin/sh Dynatrace-OneAgent-Linux-1.xxx.yyy.sh --set-host-name=my-host-name` is just <a href="https://www.dynatrace.com/support/help/how-to-use-dynatrace/hosts/configuration/set-custom-host-names-in-dynamic-environments" target="_blank">one of the ways</a> to customize host naming._

1 . These are the commands used to download, verify, and install the OneAgent.  **That is it!**

![image](/images/lab1-install-dynatrace.png)

2 . Go back the `Download agent` page and review other options like Windows or Kubernetes.

### 💥 **TECHNICAL NOTE** 

_Learn more about the various ways the OneAgent can be installed, check out the <a href="https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-oneagent" target="_blank">Dynatrace documentation</a>_

