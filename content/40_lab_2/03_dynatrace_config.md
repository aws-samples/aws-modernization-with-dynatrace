---
title: "Setup Dynatrace config"
chapter: false
weight: 03
---

From the Cloudshell window, run these commands to start the provisioning process:

```
cd ~/aws-modernization-dt-orders-setup/provision-scripts
./provision-workshop.sh k8
```

The script output will look like this:

```
===================================================================
About to Provision Workshop - k8
===================================================================
Proceed? (y/n)

```

Select `Y` and when it completes, it will look like this:

```
...
...
=============================================
Provisioning AWS workshop resources COMPLETE
End: Tue Jun 16 14:42:22 EDT 2020
=============================================
```

The script will run fast, but it will take about 1-2 minutes for the CloudFormation script to complete. 

### 💥 **TECHNICAL NOTE**

This script adds the following Dynatrace configuration

* Add [Management Zone](https://www.dynatrace.com/support/help/how-to-use-dynatrace/management-zones/) for the monolith and micro services versions of the application
* Add [Process Naming Rule](https://www.dynatrace.com/support/help/how-to-use-dynatrace/process-groups/configuration/customize-the-name-of-process-groups/) to have the services show as namespace-service-name
* Add [SLOs](https://www.dynatrace.com/support/help/how-to-use-dynatrace/service-level-objectives/) for a use in custom dashboards

