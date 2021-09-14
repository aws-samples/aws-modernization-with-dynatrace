---
title: "Create Cluster"
chapter: false
weight: 04
---

Once you run the command to create the cluster, it will take 20-30 minutes to fully provision.

1 . Copy the `eksctl create cluster ...` command below and run it.

```
eksctl create cluster --region us-west-2 --with-oidc --ssh-access --version=1.21 --managed --name dynatrace-workshop --tags "Purpose=dynatrace-modernization-workshop" --ssh-public-key <YOUR-Key Pair-NAME>
```

It is OK when you get an error like this...

```
bash: syntax error near unexpected token `newline'
```

...because you **MUST** replace the argument value for `--ssh-public-key` with your Key Pair name that was automatically created in Lab 1 for the EC2 instance


2 . To get you Key Pair name that was automatically created in Lab 1 for the EC2 instance, navigate to the `Key Pairs` page in the AWS console:
* [https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs](https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs). The Key Pair name will be something like `jones-dynatrace-modernize-workshop` as shown below.

![image](/images/setup-keypairs-ui.png)

3 . Copy the Key Pair name and then back in the CLoudShell, click the `up arrow keyboard button` to get the previous command.

4 . Adjust the `--ssh-public-key <YOUR-Key Pair-NAME>` argument and then run the command again.

If you still get an error, first check that you have the correct `--ssh-public-key` argument value.

### 💥 **TECHNICAL NOTE**

*Optionally, you can adjust the argument value for `--name dynatrace-workshop` if you are sharing an AWS account with others as to make it a unique name.*

5 . Review the output will start to look like this and may take 20-30 minutes to fully provision..

```
cloudshell-user@ip-10-0-45-241 learner-scripts]$ eksctl create cluster --region us-west-2 --with-oidc --ssh-access --version=1.21 --managed --name dynatrace-workshop --tags "Purpose=dynatrace-modernization-workshop" --ssh-public-key jones-dynatrace-modernize-workshop
2021-09-03 19:26:32 [ℹ]  eksctl version 0.64.0
2021-09-03 19:26:32 [ℹ]  using region us-west-2
2021-09-03 19:26:32 [ℹ]  setting availability zones to [us-west-2a us-west-2b us-west-2d]
2021-09-03 19:26:32 [ℹ]  subnets for us-west-2a - public:192.168.0.0/19 private:192.168.96.0/19
2021-09-03 19:26:32 [ℹ]  subnets for us-west-2b - public:192.168.32.0/19 private:192.168.128.0/19
2021-09-03 19:26:32 [ℹ]  subnets for us-west-2d - public:192.168.64.0/19 private:192.168.160.0/19
2021-09-03 19:26:32 [ℹ]  nodegroup "ng-eaa2eae4" will use "" [AmazonLinux2/1.21]
2021-09-03 19:26:32 [ℹ]  using EC2 key pair %!q(*string=<nil>)
2021-09-03 19:26:32 [ℹ]  using Kubernetes version 1.21
2021-09-03 19:26:32 [ℹ]  creating EKS cluster "dynatrace-workshop" in "us-west-2" region with managed nodes
...
...
2021-09-03 19:28:33 [ℹ]  waiting for CloudFormation stack "eksctl-dynatrace-workshop-cluster"
2021-09-03 19:29:33 [ℹ]  waiting for CloudFormation stack "eksctl-dynatrace-workshop-cluster"
```

When this command is complete you should see:

```
2021-09-03 19:51:34 [ℹ]  node "ip-192-168-89-237.us-west-2.compute.internal" is ready
2021-09-03 19:53:35 [ℹ]  kubectl command should work with "/home/cloudshell-user/.kube/config", try 'kubectl get nodes'
2021-09-03 19:53:35 [✔]  EKS cluster "dynatrace-workshop-cluster" in "us-west-2" region is ready
```

6 . Also verify the CloudFormation script is also complete within the AWS console.

You can navigate to the CloudFormation page as shown below.
![image](/images/setup-cloudformation-search.png)

Or use this link as shortcut to the CloudFormation page
* [https://us-west-2.console.aws.amazon.com/cloudformation/home](https://us-west-2.console.aws.amazon.com/cloudformation/home)

On the CloudFormation page, click on the stack shown.

![image](/images/setup-cloudformation-stacks.png)

Then click on `Events` to see the provisioning steps. As it processes, the statuses will start to show `CREATE_COMPLETE`

![image](/images/setup-cloudformation-stacks-details.png)

You can monitor this as it runs for about 30 minutes. When it's complete, all statuses will show `CREATE_COMPLETE` 

