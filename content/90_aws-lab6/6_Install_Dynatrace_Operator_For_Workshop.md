---
title: "Install Dynatrace Operator For Workshop"
chapter: false
weight: 7
---
## Install Dynatrace Operator For Workshop

<aside class="positive"> 

📓 The `dynakube.yaml` file was automatically generated in AWS cloudshell during the provision script you ran in Lab0. Therefore we'll use a modified version of the commands
</aside>
    
1. First, copy and paste command below into your AWS Cloud Shell to orient you in correct directory for `dynakube.yaml` file.
       
        ```
        cd ~/aws-modernization-dt-orders-setup/gen
        ```
1. Next, copy the commands from the `Monitor Kubernetes / Openshift`  configuration page of Dynatrace UI or from below to continue with the Kuberentes Operator Install steps.

         ```
         kubectl create namespace dynatrace
         kubectl apply -f https://github.com/Dynatrace/dynatrace-operator/releases/download/v0.14.1/kubernetes.yaml
         kubectl -n dynatrace wait pod --for=condition=ready --selector=app.kubernetes.io/name=dynatrace-operator,app.kubernetes.io/component=webhook --timeout=300s
         kubectl apply -f dynakube.yaml
         ```

    <aside class="negative">
        If you receive any errors running the commands above, please ensure you're in the `/aws-modernization-dt-orders-setup/gen` folder as highlighted in the step above.
    </aside>
     
1. When you run the command, it will do the following:
    1. Create a namespace called `dynatrace` in your cluster containing the Dynatrace Operator supporting pods
    1. Set the OneAgent on each of the cluster nodes as to provide full-stack Dynatrace monitoring
    1. Create a Kubernetes dashboard that will be populated with the Kubernetes data pulled from the API
    1. Setup a Dynatrace Active gate that runs as a container in the `dynatrace` namespace that is used in the polling of Kubernetes API
    1. Enable preset out-of-the-box Kubernetes dashboards

