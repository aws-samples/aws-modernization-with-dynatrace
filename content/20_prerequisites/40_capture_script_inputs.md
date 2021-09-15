---
title: "Capture Setup Inputs"
chapter: false
weight: 40
---

The next steps of this guide will have you gather various information from your environment needed to provision and setup your environment and for exercises later in the workshop.

From your Dynatrace environment, you will capture:

* Base URL
* Environment ID
* API token
* PaaS token

### 💥 **TECHNICAL NOTE**
_The next set of steps assume that your Dynatrace tenant is fully provisioned, you have your AWS account, and you are logged in to both._

## Capture Inputs Script

In the code repo you cloned, there is a simple UNIX shell script for this workshop that prompts for these values and writes them to a file called `workshop-credentials.json`. Later in the workshop steps, there are a few other simple UNIX shell scripts that will automate the step that reads this file so that you don’t need to type or copy-paste these values over and over again during the workshop.

So start by running this script that will provide prompts. Follow the sections below to get these values and paste them against the prompt. If you mess up, you can re-run the script.

1 . Run inputs script

```
cd ~/aws-modernization-dt-orders-setup/provision-scripts
./input-credentials.sh
```

2 . Login into Dynatrace. 

### 💥 **TECHNICAL NOTE**
_The URL will be in the Dynatrace tenant creation email such as: https://[ENVIRONMENT ID].live.dynatrace.com.  You can also get there by by using the the SaaS login link on the top right of the <a href="https://www.dyntrace.com" target="_blank">Dynatrace home page</a>._

## Input 1 of 4: Your last name
In the UNIX terminal, enter your last name at the prompt. 

### 💥 **TECHNICAL NOTE**
_This will be added as a prefix for the provisioned resources._

## Input 2 of 4: Dynatrace Base URL

1 . Copy the Dynatrace base URL from your browser, for example: **https://[ENVIRONMENT ID].live.dynatrace.com**

### 💥 **TECHNICAL NOTE**
_Only include the base URL up to the **...dynatrace.com**_

2 . Back in the UNIX terminal, paste the value for the `Dynatrace Base URL` prompt.

## Input 3 of 4: Dynatrace PaaS Token

1 . From the Dynatrace left side menu, select `Settings`. Under the `Integrations` sub-menu, click the `Platform as a Service` option

![image](/images/setup-paas-menu.png)

2 . Click the `Generate Token` button, Enter a name for your token (e.g. workshop), then click the `Generate` button

![image](/images/setup-generate-paas-token.png)

3 . Use the `Copy` button

![image](/images/setup-paas-token-copy.png)

4 . Back in the UNIX terminal, paste the value for the `Dynatrace PaaS Token` prompt

## Input 4 of 4: Dynatrace API Token

1 . From the Dynatrace left side menu, select `Settings`. Under the `Integrations` sub-menu, click the `Dynatrace API` option

![image](/images/setup-api-menu.png)

2 . Click the `Generate Token` button, Enter a name for your token (e.g. workshop), then click the `Generate` button

![image](/images/setup-api-token.png)

3 . Expand both the `API V2` and `API V1` section and enable permissions as shown below

![image](/images/setup-api-settings.png)

4 . Use the `Copy` button

![image](/images/setup-api-copy.png)

5 . Back in the UNIX terminal, paste the value for the `Dynatrace API Token` prompt

### Verify

Your completed data entry should look like this:

```
Please confirm all are correct:
--------------------------------------------------
Your last name           : jones
Dynatrace Base URL       : https://ABC.live.dynatrace.com
Dynatrace PaaS Token     : zzzzzzzzzzzzzzzzzzzzzzz
Dynatrace API Token      : ggggggggggggggggggggggg
--------------------------------------------------
derived values
--------------------------------------------------
Dynatrace Environment ID : ABC
===================================================================
Is this all correct? (y/n) : y

===================================================================
Saved credential to: ../gen/workshop-credentials.json
{
    "RESOURCE_PREFIX": "jones",
    "DT_BASEURL": "https://ABC.live.dynatrace.com",
    "DT_ENVIRONMENT_ID": "ABC",
    "DT_PAAS_TOKEN": "zzzzzzzzzzzzzzzzzzzzzzz",
    "DT_API_TOKEN": "ggggggggggggggggggggggg",
    "AWS_REGION": "us-west-2"
}
```

After you confirm, the script will show the saved values in the `~/aws-modernization-dt-orders-setup/gen/workshop-credentials.json` file. 

### Fixing Inputs

If you mess up, you can re-run the script again and will prompt you again for each value.

```
cd ~/aws-modernization-dt-orders-setup/provision-scripts
./input-credentials.sh
```
