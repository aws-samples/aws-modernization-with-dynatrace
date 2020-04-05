+++
title = "Deploy the OneAgent Operator"
chapter = false
weight = 80
+++

### Operator pod

Execute the following commands to create the objects necessary for the Operator:

- Creates a <b>namespace</b> for Dynatrace-related objects
- Retrieve the Operator and associated objects definition templates from github (`kubernetes.yaml`)
- Create the objects  

```sh
kubectl create namespace dynatrace
LATEST_RELEASE=$(curl -s https://api.github.com/repos/dynatrace/dynatrace-oneagent-operator/releases/latest | grep tag_name | cut -d '"' -f 4)
kubectl create -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/$LATEST_RELEASE/deploy/kubernetes.yaml
```

Validate that the Operator pod is running and ready:
```sh
kubectl get pods -n dynatrace
```

![operator_pod](/images/operator_pod.png)

### OneAgent custom resource

Create the secret (named `oneagent`) holding the API and PaaS tokens used to authenticate to to the Dynatrace cluster.

```sh
kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=$DT_API_TOKEN" --from-literal="paasToken=$DT_PAAS_TOKEN"
```

Execute the following script that will download the Operator Custom Resource definition and populate it with the SaaS Environment ID you provided in a previous step.

```sh
./config-cr.sh
```

You can take a look at the `cr.yaml` file and double-check the `apiUrl` field corresponds to your Dynatrace tenant URL: 

```
cat cr.yaml 
```

![cr_yaml](/images/cr_yaml.png)


Then create the custom resource:

```sh
kubectl create -f cr.yaml
```

## Validate the installation

Execute the following commands to validate the expected pods are running. You should see one pod for the operator and one pod for each of your cluster nodes (3):

```sh
kubectl get pods -n dynatrace -o wide -w
```
Wait until all pods are ready and then stop the command with `Ctrl-C`

![dynatrace_pods](/images/dynatrace_pods.png)

## Validate in Dynatrace

In the Dynatrace console, in the menu, go to the <b>Hosts</b> view. You should see 3 <b>Hosts</b> which are your cluster worker nodes.

In the Dynatrace console, look into the <b>Deployment Status</b> and <b>Hosts</b> view (from the left menu), you should see your nodes listed as hosts.

![hosts](/images/hosts.png)
  
From the Dynatrace left side menu, select the <b>Transactions & services</b> view.

Why is nothing there? Well, no <b>Service</b> will show up because we have not deployed an application yet.  So let's do that next!
