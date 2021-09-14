---
title: "Verify Cluster"
chapter: false
weight: 10
---

Only proceed with this next step once the CloudFormation stack shows `CREATE_COMPLETE` status.

![image](/images/setup-stack-complete.png)

## 1. Verify Cluster using kubectl

Using the CloudShell, you can verify the new cluster with the [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) command line tool used to control Kubernetes clusters. 

1. Run this command to display the command line options

    ```
    kubectl
    ```

1. Verify you are connected. You should see `dynatrace-workshop-cluster` as part of the output.

    ```
    kubectl config current-context
    ```

    The output should look like this:

    ```
    [user-info]@dynatrace-workshop-cluster.us-west-2.eksctl.io
    ```

1. List the nodes in the cluster

    ```
    kubectl get nodes
    ```

    The output should look like this:

    ```
    NAME                                           STATUS   ROLES    AGE     VERSION
    ip-192-168-31-207.us-west-2.compute.internal   Ready    <none>   5d23h   v1.21.2-eks-c1718fb
    ip-192-168-86-194.us-west-2.compute.internal   Ready    <none>   5d23h   v1.21.2-eks-c1718fb
    ```

    You can see even more detail with this command.

    ```
    kubectl describe nodes
    ```

## 2. Verify Cluster within AWS Console

With the AWS Console, search for the `Elastic Kubernetes Service` or click on the link below.
* [https://us-west-2.console.aws.amazon.com/eks/home?region=us-west-2#/clusters](https://us-west-2.console.aws.amazon.com/eks/home?region=us-west-2#/clusters)

![image](/images/setup-eks-cluster.png)

The cluster page, click on the new workshop cluster. You should see two nodes as shown below.

![image](/images/setup-eks-cluster-detail.png)

Explore the configuration and view nodes details.