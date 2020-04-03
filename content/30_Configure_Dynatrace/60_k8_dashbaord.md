+++
title = "Configure K8 Dashboard"
chapter = false
weight = 60
+++

- You need an <b>Environment ActiveGate</b> to connect Dynatrace to your Kubernetes cluster API
- You typically deploy the ActiveGate on a dedicated VM; running the ActiveGate in a container is not currently supported (but planned for the future)
- For this exercise, the <b>Environment ActiveGate</b> will be deployed on your bastion host

### Install the ActiveGate on your bastion host

- Make sure you are logged back in the Dynatrace console with your student account. You will need Dynatrace admin permissions for this exercise.
- In the Dynatrace console, from the menu, go to <b>Deploy Dynatrace</b>, scroll down to the bottom and click on <b>Install ActiveGate</b>
  
    ![install_ActiveGate](/images/install_ActiveGate.png)

- Select Linux.
- Copy the wget command (from step 2 - see screenshot below) to download the installer script and paste it to your terminal and run it from your bastion VM.
- Copy the command to run the installer script (step 4 - see screenshot below)
- Execute it in your terminal with elevated permissions <b><u>(precede the command with `sudo`)</u></b>

  ![ActiveGate_linux_installation](/images/ActiveGate_linux_installation.png)

- Click on <b>Show deployment status</b> (step 5) to validate the <b>ActiveGate</b> is deployed and connected to your SaaS tenant. See that the Kubernetes module is active. 

![deployment_status](/images/deployment_status.png)

## Configure connection to the Kubernetes cluster

1. You first need a Kubernetes <b>service account</b> with the right <b>cluster role</b> to access the Kubernetes API
2. Collect the information required to configure the connection
   
   - API endpoint URL
   - Service account Bearer token 

### Create the Dynatrace cluster monitoring service account

- The manifest (yaml file) is described in the documentation but you already have it downloaded from the github repo
- Execute the following command to create the objects associated to the account :

    ```sh
    $ kubectl apply -f manifests/dynatrace/kubernetes-monitoring-service-account.yaml 
    ```

### Collect the connection information

- Get the Kubernetes API endpoint URL

  - Execute the following command :
    ```sh
    $ kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}'; echo
    ```

- Get the service account API bearer token

  - Execute the following command :
    ```sh
    $ kubectl get secret $(kubectl get sa dynatrace-monitoring -o jsonpath='{.secrets[0].name}' -n dynatrace) -o jsonpath='{.data.token}' -n dynatrace | base64 -d ; echo
    ```

## Set up connection

- In the Dynatrace console, select <b>Kubernetes</b> in the menu
- Click on <b>Setup Kubernetes and OpenShift cluster monitoring</b>
  
    ![Kubernetes_menu](/images/Kubernetes_menu.png)

- Click on <b>Connect new cluster</b>
  - Provide a name of your choice to your cluster connection
  - Copy the cluster API URL you had printed during the previous step and paste it the <b>URL</b> text box
  - Copy the cluster bearer token you had printed during the previous step and paste it in the <b>Bearer Token</b> text box
    - Make sure the token is correct and there are no blank space (space, tab, line feed or carriage return).  
  - Click on <b>Connect</b>

    ![cluster_connection_setup](/images/cluster_connection_setup.png)

## The result

You will get an error message displayed. 

What happened? :worried:

![cluster_connection_error](/images/cluster_connection_error.png)

The error message mentions a problem with the TLS handshake. 

Your cluster API endpoint is using an untrusted self-signed certificate. You have 2 options : 

1. Configure the <b>ActiveGate</b> to skip the certificate check
   - Introduce security risks so not recommended
   - Can be OK for POC or test environments 
   - The procedure is explained in the doc here : https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-activegate/configuration/set-up-proxy-authentication-for-activegate/#expand-138option-2-disable-certificate-validation 


*** WE WILL NOT DO THIS... WE WILL POINT TO INSTRUCTIONS IN DOCS ***

2. Add the cluster self-signed certificate to the <b>ActiveGate</b> trusted keystore. 
   - This is what we will do next.
