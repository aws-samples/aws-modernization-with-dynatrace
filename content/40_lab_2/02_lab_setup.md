---
title: "Lab 2 Setup"
chapter: false
weight: 02
---

This step extends what you did in the previous step and will provision an Amazon Elastic Kubernetes Service (EKS) cluster and the Dynatrace configuration needed for the workshop.

There are the following setup steps for this lab:
1. Install the pre-requisite tools
1. Setup Dynatrace config
1. Create Cluster
1. Verify Cluster
1. Install Dynatrace Kubernetes Operator
1. Install sample application

NOTE: The step `Create Cluster` will take ~30 minutes to complete while the EKS cluster is provisioning.

## Install the pre-requisite tools

1 . Start by installing `eksctl`, a simple command line utility for creating and managing Kubernetes clusters on Amazon Elastic Kubernetes Service (EKS). You can find out more by checking out the documentation.
* <a href="https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html" target="_blank">https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html</a>

First, make a new folder in your home directory

```
mkdir -p $HOME/bin 
```

Then install `eksctl` by copying the repo from github and unzip it in the directory you just created.  

```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C $HOME/bin 
```

Check that it is properly installed by checking the version number using the command below.

```
eksctl version 
```

2 . Next, install `kubectl`. Kubernetes uses this command line utility for communicating with the cluster API server. You can find out more by checking out the documentation
 * <a href="https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html" target="_blank">https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html</a>
 ```
 curl --silent -o $HOME/bin/kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl 
 ```

 3 . Change the permissions of the new folder to make it executable

```
chmod +x $HOME/bin/kubectl 
```

And check to make sure it installed properly by checking the version

```
kubectl version --short --client 
```

