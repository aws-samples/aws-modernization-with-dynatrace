---
title: "Dynatrace Operator Installation Walk-Through"
chapter: false
weight: 6
---
## Dynatrace Operator Installation Walk-Through

One key Dynatrace advantage is ease of activation. OneAgent technology simplifies deployment across large enterprises and relieves engineers of the burden of instrumenting their applications by hand. As Kubernetes adoption continues to grow, it becomes more important than ever to simplify the activation of observability across workloads without sacrificing the deployment automation that Kubernetes provides. Observability should be as cloud-native as Kubernetes itself.

In our workshop, we will install the Dynatrace Operator that streamlines lifecycle management.  You can read more about it here in this <a href="https://www.dynatrace.com/news/blog/new-dynatrace-operator-elevates-cloud-native-observability-for-kubernetes/" target="_blank"> Dynatrace Blog </a>

Organizations will often customize the Dynatrace Operator installation and you can read more about the options in the <a href="https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-container-platforms/kubernetes/get-started-with-kubernetes-monitoring/dto-config-options-k8s" target="_blank"> Dynatrace Doc</a> but, we are going to use a single command that we can get from the Dynatrace interface to show how easy it is to get started.

1. To navigate to Deploy Dynatrace Page, follow these steps and refer to the picture below:

    1. Within Dynatrace, click on the `Deploy Dynatrace` menu
    1. Click on the `Start Installation` button
    1. Click on the `Kubernetes` button

    ![image](/images/aws-lab6_lab4-operator-menu.png)

1. To get the Dynatrace Operator installation command, refer to the steps and pictures below:

    1. On the Kubernetes configuration page, enter `dynatrace` for the name and `workshop` for the group. This is not the cluster name, it will show up as the Kubernetes page name in Dynatrace
    1. Click the `Create tokens` button
    1. Select the `Skip SSL Certificate Check` to be ON
    
    ![image](/images/aws-lab6_newkubdep.png)

