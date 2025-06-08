---
title: "Deploying the LambdaProvisionScript.sh"
chapter: false
weight: 5
---
## Deploying the LambdaProvisionScript.sh

We First have to give the proper executable permissions to the script and only then we will be able to run the deployment.  We can combine the two commands as such.  Copy and paste the below command in the AWS CLI and ensure you are in the 
/provision-scripts directory.

```
chmod u+x LambdaProvisionScript.sh && ./LambdaProvisionScript.sh
```

**This will take about 3 to 5 mins to complete allong the way you will get an output message that it needs 10 more seconds.**

![image](/images/aws-lab11-serverless_lambdaDeploy.png)

