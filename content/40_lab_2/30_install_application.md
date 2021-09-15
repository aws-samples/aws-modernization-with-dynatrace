---
title: "Deploy sample application"
chapter: false
weight: 30
---

Dynatrace automatically derives tags from your Kubernetes/OpenShift labels. This enables you to automatically organize and filter all your monitored Kubernetes/OpenShift application components.

To review what is configured for the sample application, go ahead and open this folder and look at one such as the `frontend.yml`:

* <a href="https://github.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/tree/main/app-scripts/manifests" target="_blank">https://github.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/tree/main/app-scripts/manifests</a>

Notice the labels and annotations:

```
metadata:
      labels:
        app.kubernetes.io/name: frontend
        app.kubernetes.io/version: "1"
        app.kubernetes.io/component: frontend
        app.kubernetes.io/part-of: dt-orders
        app.kubernetes.io/managed-by: helm
        app.kubernetes.io/created-by: dynatrace-demos
      annotations:
        owner: Team Frontend
        chat-channel: dev-team-frontend 
```

Notice the defined container and version.  These containers are stored in <a href="https://hub.docker.com/u/dtdemos" target="_blank">Dockerhub</a>.

```
spec:
    containers:
    - name: frontend
    image: dtdemos/dt-orders-frontend:1
```

Notice the `DT_CUSTOM_PROPS` environment variable:

```
env:
    - name: DT_CUSTOM_PROP
        value: "project=dt-orders service=frontend"
```

### 💥 **TECHNICAL NOTES** 

* The `DT_CUSTOM_PROPS` is a special Dynatrace feature, that the OneAgent will automatically recognize and make Dynatrace tags for the process. You can read more details in the <a href="https://www.dynatrace.com/support/help/shortlink/process-group-properties#anchor_variables" target="_blank">Dynatrace documentation</a>


* Read more details on how Dynatrace identifies labels and tags Kubernetes in the <a href="https://www.dynatrace.com/support/help/technology-support/container-platforms/kubernetes/other-deployments-and-configurations/leverage-tags-defined-in-kubernetes-deployments" target="_blank">Dynatrace documentation</a>

## Run the script to deploy the sample application

Back in the SSH shell, run these commands to deploy the application:

```
cd ~/aws-modernization-dt-orders-setup/app-scripts
./start-k8.sh
```

### 💥 **TECHNICAL NOTE**

The <a href="https://github.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/tree/main/app-scripts" target="_blank">start-k8.sh</a> script automates a number of `kubectl` commands:

1. Create a namespace called `staging` where all these resources will reside
1. Grant the Kubernetes default service account a viewer role into the `staging` namespace
1. Create both the `deployment` and `service` Kubernetes objects for each of the sample

## Verify the pods are starting up

Rerun this command until all the pods are in `Running` status with all pods as `1/1`.

```
kubectl -n staging get pods
```

The output should look like this:

```
NAME                               READY   STATUS    RESTARTS   AGE
browser-traffic-5b9456875d-ks9vw   1/1     Running   0          30h
catalog-7dcf64cc99-hfrpg           1/1     Running   0          2d8h
customer-8464884799-vljdx          1/1     Running   0          2d8h
frontend-7c466b9d69-9ql2g          1/1     Running   0          2d8h
load-traffic-6886649ddf-76pqf      1/1     Running   0          2d8h
order-6d4cd477cb-9bvn4             1/1     Running   0          2d8h
```

## Kubernetes Role Binding - Overview

In Kubernetes, every pod is associated with a service account which is used to authenticate the pod's requests to the Kubernetes API. If not otherwise specified the pod uses the default service account of its namespace.

* Every namespace has its own set of service accounts and thus also its own namespace-scoped default service account. The labels of each pod for which the service account has view permissions will be imported into Dynatrace automatically.

* In order for Dynatrace to read the Kubernetes properties and annotations, you need to grant the Kubernetes default service account a viewer role into the `staging` namespace to enable this. We only have one namespace, but you will need to repeat these steps for all service accounts and namespaces you want to enable for Dynatrace within your environments.

For the workshop, we already updated the required file with the `staging` namespace. Next you will run the setup script that will apply it to your cluster. Go ahead and open this folder and look at the `dynatrace-oneagent-metadata-viewer.yaml` file. 
* <a href="https://github.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/tree/main/app-scripts/manifests" target="_blank">https://github.com/dt-alliances-workshops/aws-modernization-dt-orders-setup/tree/main/app-scripts/manifests</a>

