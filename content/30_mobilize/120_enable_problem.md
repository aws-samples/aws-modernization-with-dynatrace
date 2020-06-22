+++
title = "Enable a Problem"
chapter = false
weight = 120
+++

![image](/images/emma.png)

I am Emma from the Cloud Operations team, we are going to jump ahead to trigger a problem that we will review shortly.

Various problem patterns that Dynatrace can detect are built into the easyTravel codebase so that we can easily simulate problems without redeploying the application.

These problems will take a few minutes to appear, so we are going to turn one of them ON and then proceed to the next section. You will then review the problem the **Operate** module of the workshop.

### Turning on a problem pattern

The easyTravel has REST API that an be used to enable or disable a problem pattern.  To make this easier, scripts are provided that will find the IP address for your **YOUR_LAST_NAME-workshop-ez** instance and make the required HTTP REST call for the feature flag.

{{% notice info %}}
Best to run each problem pattern seperately so that it is easier to analyze. It will take about 4-5 minutes for the problem pattern to manifest.
{{% /notice %}}

### Problem Pattern #1: CreditCardCheckError500
Causes Error in the Booking Service. Root cause is Communication plugin could not contact credit card verification application via named pipe in the Booking Service.

To enable this problem, run these commands.  The script output will just indicate the problem is now enabled.

```
cd ~/modernize-workshop-setup/aws
./setProblemPattern-CreditCardCheckError500.sh
```

{{% notice info %}}
The problem pattern will be turned on when the script is called. Turn off the problem pattern by just re-running the command and adding false as a parameter. For example: `./setProblemPattern-CreditCardCheckError500 false`
{{% /notice %}}

### Problem Pattern #2: CPULoadJourneyService
Causes a response time issue impacting multiple services. Root cause is checkDesination Service in Journey Service from a high CPU function call.

To enable this problem, run these commands.  The script output will just indicate the problem is now enabled.

```
cd ~/modernize-workshop-setup/aws
./setProblemPattern-CPULoadJourneyService.sh
```

{{% notice info %}}
The problem pattern will be turned on when the script is called. Turn off the problem pattern by just re-running the command and adding false as a parameter. For example: `./setProblemPattern-CPULoadJourneyService.sh false`
{{% /notice %}}

