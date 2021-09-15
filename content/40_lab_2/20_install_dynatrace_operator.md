---
title: "Kubernetes Dynatrace Operator"
chapter: false
weight: 20
---

One key Dynatrace advantage is ease of activation. OneAgent technology simplifies deployment across large enterprises and relieves engineers of the burden of instrumenting their applications by hand. As Kubernetes adoption continues to grow, it becomes more important than ever to simplify the activation of observability across workloads without sacrificing the deployment automation that Kubernetes provides. Observability should be as cloud-native as Kubernetes itself.

In our workshop, we will install the Dynatrace Operator that streamlines lifecycle management.  You can read more about it here in this <a href="https://www.dynatrace.com/news/blog/new-dynatrace-operator-elevates-cloud-native-observability-for-kubernetes/" target="_blank">Dynatrace blog</a>.

Organizations will often customize the Dynatrace Operator installation and you can read more about the options in the <a href="https://www.dynatrace.com/support/help/technology-support/container-platforms/kubernetes/monitor-kubernetes-environments/" target="_blank">Dynatrace docs</a> but, we are going to use a single command that we can get from the Dynatrace interface to show how easy it is to get started.

## Install Dynatrace Operator

1. To navigate to Kubernetes page, follow these steps and refer to the picture below:

    1. Within Dynatrace, click on the `Deploy Dynatrace` menu
    1. Click on the `Start Installation` button
    1. Click on the `Kubernetes` button

    ![image](/images/lab4-operator-menu.png)

1. To get the Dynatrace Operator installation command, refer to the steps and pictures below:

    1. On the Kubernetes configuration page, enter `dynatrace-workshop` for the name. This is not the cluster name, it will show up as the Kubernetes page name in Dynatrace
    1. Click the `Create tokens` button
    1. Select the `Skip SSL Certificate Check` to be ON
    1. Click the `Copy` button

    ![image](/images/lab4-operator.png)

1. Paste the command in SSH Shell and run it.  When you run the command, it will do the following:
    * Create a namespace called `dynatrace` in your cluster containing the Dynatrace Operator supporting pods
    * Set the OneAgent on each of the cluster nodes as to provide full-stack Dynatrace monitoring
    * Create a Kubernetes dashboard that will be populated with the Kubernetes data pulled from the API
    * Setup a Dynatrace Active gate that runs as a container in the `dynatrace` namespace that is used in the polling of Kubernetes API
    * Enable preset out-of-the-box Kubernetes dashboards

## Verify Dynatrace Operator

Once the script is complete, then monitor the installation until you all pods are in `Running` state with all pods as `1/1`.

```
kubectl -n dynatrace get pods
```

Rerun the command until the output looks like this:

```
NAME                                 READY   STATUS    RESTARTS   AGE
dynakube-classic-g5n9d               1/1     Running   0          2m45s
dynakube-classic-vr5qh               1/1     Running   0          2m45s
dynakube-kubemon-0                   1/1     Running   0          2m43s
dynakube-routing-0                   1/1     Running   0          2m45s
dynatrace-operator-f946fb4c6-q5k5g   1/1     Running   0          3m59s
```

## Verify Dynatrace Monitoring

We will review more detail shortly, but quickly verify within Dynatrace that the hosts are now monitored.

From the left-side menu in Dynatrace choose `Hosts`. Ensure the `management zone` filter is set to all `ALL`

![image](/images/mz-pick-all.png)

You should see the two hosts like the ones shown below in addition to the host with the name `dt-orders-monolith`.

![image](/images/lab2-eks-hosts.png)
