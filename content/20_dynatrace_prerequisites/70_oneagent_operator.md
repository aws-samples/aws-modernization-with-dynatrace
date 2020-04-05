+++
title = "OneAgent Operator Overview"
chapter = false
weight = 70
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

