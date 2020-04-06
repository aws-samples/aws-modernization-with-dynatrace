+++
title = "Create Dynatrace Tokens"
chapter = false
weight = 60
+++

{{% notice warning %}}
The next set of steps assume that your Dynatrace tenant us fully provisioned and you are logged in.
{{% /notice %}}

{{% notice warning %}}
The next set of steps assume that your AWS resources are fully provisioned.  If you were using your own AWS account, ensure that the CloudFormation is in a fully complete status. You can monitor in the AWS console **CloudFormation** service page. When it is done you should see **CREATE_COMPLETE** for all stack and nested stacks.
{{% /notice %}}

{{% notice info %}}
You can always login to your tenant using the URL **https://[your tenant].live.dynatrace.com/** or by using the the **SaaS login** link on the top right of the [Dynatrace home page](https://www.dynatrace.com).
{{% /notice %}}

## Gather environment and token info

To configure and deploy the OneAgent Operator, we will need the following info from your SaaS tenant:

- Environment ID
- API tokens (you will make two)
- PaaS token

We have provided a simple UNIX shell script for this workshop that prompts for these values and writes them to a `configs.txt` files. Later in the workshop steps, there are a few other simple UNIX shell that will automate the step that read this files so that you don't need to type or copy-paste these values over and over agaian during the workshop.

So start by running this script that will provide prompts. Follow the sections below to get these values and paste them against the prompt.  If you mess up, you can re-run the script.

1. run UNIX shell script

```
cd ~/dynatrace-k8s
./get-dt-cfg.sh
```

You can always view your entered in values by just viewing the file with this command.

```sh
cat configs.txt
```

### 1. Environment ID

1. From the Dynatrace left side menu, select **Deploy Dynatrace**

1. Click the **Setup PaaS integration** button

    ![generate_paas_token](/images/deploy-dt.png)

1. Click the **Copy** button under the environment ID.

    ![generate_paas_token](/images/save-environment.png)

1. Back in the AWS UNIX terminal, paste the value for the **Environment ID** prompt as shown here:

```
Please enter your Dynatrace credentials as requested below: 

Environment ID (ex. https://<ENVIRONMENT_ID>.live.dynatrace.com):
```

{{% notice tip %}}
For Dynatrace SaaS, the environment ID is your tenant ID. You can find it in the first part of your URL, e.g. `https://ENVIRONMENTID.live.dynatrace.com`. ENVIRONMENTID is the Environment ID.
{{% /notice %}}

### 2. PaaS Token

1. On this same page. click the **Generate new token** button.

    ![generate_paas_token](/images/generate-paas-token.png)

1. Enter a name for your token (e.g. k8sOperatorPaaS)

1. click the **Generate** button then the **Copy** button

    ![generate_paas_token](/images/generate-paas-token-two.png)

1. Back in the AWS UNIX terminal, paste the value for the **PaaS token** prompt

### 3. API Token

1. From the Dynatrace left side menu, navigate to: <i>Settings -> Integration -> Dynatrace API</i>

1. Click on <b>Generate Token</b>

    ![generate_api_token](/images/generate_api_token.png)

2. Enter a name for your token (e.g. k8sOperator)
3. Leave the default options and click <b>Generate</b>
   
    ![api_token](/images/api_token.png)     

4. Expand the newly created token, copy the token value and paste it to your bastion terminal script prompt : API token 

    ![api_token_value](/images/api_token_value.png)

5. Back in the terminal, paste the value for the **PaaS token** prompt.

### 4. Config Token

This is an additional token you will create. It is not needed for the Operator itself but it will be needed to automate some configurations in Dynatrace. This will, for example, create Web Application monitoring configuration and create Synthetic Browser Monitors to generate traffic to the Sock Shop web site.

1. Follow the same procedure as for the <b><u>API token</u></b> except you will need to grant different access scope to this token than the default.

1. Toggle on the following options:

  - Create and read synthetic monitors, locations, and nodes
  - Read configuration
  - Write configuration

    ![config_token](/images/config_token.png)

    - Don't forget to click the <b>Generate</b> button!

1. Back in the terminal, paste the value for the **Config token** prompt.

### Verify

Your completed data entry, should look like this:

```
Please enter your Dynatrace credentials as requested below: 
Environment ID (ex. https://<ENVIRONMENT_ID>.live.dynatrace.com): mytenant
PaaS token: my-pass-token
API token: my-api-token
Config token: my-config-token

Please confirm these are correct: 
Environment ID:  mytenant
API token:  my-api-token
PaaS token:  my-pass-token
Config token:  my-config-token
Is this correct? (y/n): y
```

You can review the saved values, by simply typing

```
cat configs.txt
```