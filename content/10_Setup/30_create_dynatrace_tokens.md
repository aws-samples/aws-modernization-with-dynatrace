+++
title = "Create Dynatrace Tokens"
chapter = false
weight = 30
+++

## Gather environment and token info

To configure and deploy the OneAgent Operator, we will need the following info from your SaaS tenant:

- Environment ID
- API token
- PaaS token

Note: The installation procedure is also documented [here](https://www.dynatrace.com/support/help/shortlink/kubernetes-deploy) 

From your bastion host terminal, execute the following script to enter this info to have it stored in the `configs.txt` file and environment variables so you don't need to type or copy-paste it again during the class.

```
./get-dt-cfg.sh
```
Again, you can always, if needed, get those configs printed by running this command (from the current directory):

```sh
cat configs.txt
```

### Environment ID

For Dynatrace SaaS, the environment ID is your tenant ID. You can find it in the first part of your URL, e.g. `https://ENVIRONMENTID.sprint.dynatracelabs.com` .

- For example, for https://jwx05250.sprint.dynatracelabs.com , ENVIRONMENT ID=jwx05250

### API Token

Go in the left menu: <i>Settings -> Integration -> Dynatrace API</i>

1. Click on <b>Generate Token</b>

  ![generate_api_token](/images/generate_api_token.png)

2. Enter a name for your token (e.g. k8sOperator)
3. Leave the default options and click <b>Generate</b>
   
    ![api_token](/images/api_token.png)     

4. Expand the newly created token, copy the token value and paste it to your bastion terminal script prompt : API token 

    ![api_token_value](/images/api_token_value.png)

### Config Token

This is an additional token you will create. It is not needed for the Operator itself but it will be needed to automate some configurations in Dynatrace. This will, for example, create Web Application monitoring configuration and create Synthetic Browser Monitors to generate traffic to the Sock Shop web site.

- Follow the same procedure as for the <b><u>API token</u></b> except you will need to grant different access scope to this token than the default.

- Toggle on the following options:

  - Create and read synthetic monitors, locations, and nodes
  - Read configuration
  - Write configuration

    ![config_token](/images/config_token.png)

- Don't forget to click the <b>Generate</b> button!
- Expand the newly created token, copy the token value and paste it to your bastion terminal script prompt : Config token

### PaaS Token

Go in <i>Settings -> Integration -> Platform as a Service</i>
1. Either copy the existing InstallerDownload token or click on <b>Generate Token</b>
   
    ![generate_paas_token](/images/generate_paas_token.png)

1. Enter a name for your token (e.g. k8sOperatorPaaS)
1. click Generate
   
    ![paas_token](/images/paas_token.png)

1. Expand the newly created token, copy the token value and paste it to your bastion terminal script prompt : PaaS token

    ![paas_token_value](/images/paas_token_value.png)

