+++
title = "Cloud9 Cleanup"
chapter = false
weight = 30
+++

The last resource to clean up is the Cloud9 Environment.

{{% notice warning %}}
Once you delete the Cloud9 environment is deleted, the inputs with the Dyntrace tokens you entered early will be gone too.  So you will need to repeat the workshop again if you want to reprovision the workshop using using a new Cloud9 instance.
{{% /notice %}}

### Delete Cloud9 Environment

1 . Navigate to the [cloud9 console](https://console.aws.amazon.com/cloud9/home) or just search for it under the **AWS console services** menu.

![image](/images/c9-search.png)

2 . Ensure the **dynatrace-workshop** environment is selected, then click the **Delete** button

![image](/images/aws-delete-c9.png)


3 . You will be prompted to confirm the delete.  