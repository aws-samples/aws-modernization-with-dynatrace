+++
title = "Deploy the OneAgent Operator"
chapter = false
weight = 40
+++

### OneAgent Operator

[Dynatrace OneAgent Operator](https://www.dynatrace.com/news/blog/introducing-dynatrace-oneagent-operator/
) is based on [Operator SDK](https://github.com/operator-framework/operator-sdk) and uses its framework for interacting with Kubernetes and OpenShift environments. Here are some of the benefits:

**Manage Dynatrace OneAgent deployments**

* no access to host needed
* fine-grained control of OneAgent roll-out 
* supports tolerations so you can deploy on tainted nodes

**Up-to-date monitoring**

* OneAgent updates are performed automatically, as soon as they’re available 
* Operator takes care of recycling all pods that have not yet picked up the latest version

### What you get 'out of the box'

* Automatic agent management by Operator
* Every worker node have an agent deployed via daemonset
    * Automatic agent update
    * Automatic discovery : no image or container manipulation required
    * Automated full stack monitoring: hosts, containers, processes, services, application
    * Automatic capture of container and pod metadata
* Automated transaction tracing
* Container log monitoring

### How it works

The Dynatrace OneAgent Operator watches custom resources if type ```OneAgent``` and monitors the desired state constantly. The rollout of Dynatrace OneAgent is managed by a DaemonSet initially. From here on Dynatrace OneAgent Operator controls the lifecycle and keeps track of new versions and triggers updates if required.  

Refer to the diagram below for the Operator lifecycle:

1. Watch for custom resources of type OneAgent
1. OneAgent deployment via DaemonSet
1. Watch for available version updates
1. Update OneAgent to the latest version available

![oneagent-operator](/images/oneagent-operator.png)

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
  
Look at the <b>Transactions & services</b> view.
- No <b>Service</b> will show up because we have not deployed an application yet
