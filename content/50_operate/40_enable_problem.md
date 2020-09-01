+++
title = "Enable a Problem"
chapter = false
weight = 40
+++

![image](/images/emma.png)

Various problem patterns that Dynatrace can detect are built into the easyTravel codebase so that we can easily simulate problems without redeploying the application.

### Turning on a problem pattern

The easyTravel has REST API that can be used to enable or disable a problem pattern.  To make this easier, scripts are provided that will find the IP address for your **YOUR_LAST_NAME-workshop-ez-monolith** instance and make the required HTTP REST call for the feature flag.

{{% notice info %}}
Best to run each problem pattern separately so that it is easier to analyze. It will take about 4-5 minutes for the problem pattern to completely be analyzed.
{{% /notice %}}

### Problem Pattern #1: CreditCardCheckError500

Causes Error in the Booking Service. Root cause is Communication plugin could not contact credit card verification application via named pipe in the Booking Service.

![image](/images/dt-ai-booking-problem.png)

1 . To enable this problem, run these commands.  The script output will just indicate the problem is now enabled.

```
cd ~/modernize-workshop-setup/aws
./setProblemPattern-CreditCardCheckError500.sh
```

2 . Navigate to the **Problems** page from the menu. In about a minute, the problem will appear.  Hit browswer refresh as required.   

![image](/images/dt-ai-problem.png)

Once the problem appears, checkout:

* Business impact analysis
* Impacted services
* Root cause
* Visual resolution path

3 . Disable the problem

The problem pattern will be turned on when the script is called. Turn off the problem pattern by just re-running the command and adding false as a parameter. For example: 

```
cd ~/modernize-workshop-setup/aws
./setProblemPattern-CreditCardCheckError500 false
```

### Problem Pattern #2: CPULoadJourneyService

Causes a response time issue impacting multiple services. Root cause is checkDesination Service in Journey Service from a high CPU function call.

![image](/images/dt-ai-journey-problem.png)

1 . To enable this problem, run these commands.  The script output will just indicate the problem is now enabled.

```
cd ~/modernize-workshop-setup/aws
./setProblemPattern-CPULoadJourneyService.sh
```

2 . Navigate to the **Problems** page from the menu. In about a minute, the problem will appear.  Hit browswer refresh as required.   

![image](/images/dt-ai-problem.png)

Once the problem appears, checkout:

* Business impact analysis
* Impacted services
* Root cause
* Visual resolution path

3 . Disable the problem

The problem pattern will be turned on when the script is called. Turn off the problem pattern by just re-running the command and adding false as a parameter. For example: 

```
cd ~/modernize-workshop-setup/aws
./setProblemPattern-CPULoadJourneyService false
```

## (Optional) Review what problems are enabled

This script will can also be used to review what problems are enabled.  Just run this to verify that the **CreditCardCheckError500** or **CPULoadJourneyService** is in the list. There will be other patterns in the list, but you can ignore them.

```
cd ~/modernize-workshop-setup/aws
./getProblemPatterns.sh
```

Sample output with **CreditCardCheckError500** enabled

```
--------------------------------------------------------------------------------------
Enabled Patterns on YOUR_LAST_NAME-dynatrace-modernize-workshop-ez-monolith (34.209.63.151)
--------------------------------------------------------------------------------------

CreditCardCheckError500
DatabaseCleanup
DummyNativeApplication.NET
DummyPaymentService
SocketNativeApplication
ThirdPartyAdvertisements
ThirdPartyContent
UseFinanceServiceWCF.NET
```