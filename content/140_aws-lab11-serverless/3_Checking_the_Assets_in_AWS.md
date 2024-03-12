---
title: "Checking the Assets in AWS"
chapter: false
weight: 4
---
## Checking the Assets in AWS

### Checking to make sure we have what we need to deploy our functions

If you remember in the begining we asked you to clone the git repo to your AWS console, well inside of that repo we also uploaded all of the assets we will need to successfully deploy the your RDS database and Lambda Functions:

first lets take a look at what we have:

```
cd ~/aws-modernization-dt-orders-setup/provision-scripts/
```
and type
```
ls -ltr
```
This will display the contents of this directory you just switched to:

ensure that you have all of the files highlighted by red outlines as they do the following:
* LambdaProvisionScript.sh - shell script used to automante the creation of the necessary parts.
* catalog-service-serverless.yml - used to deploy the changes to the catalog service in K8s
* create.sql - used to create the mysql db with in the RDS instance
* findByName.zip - contains all the Python code and logic necessary to build the findByName lambda
* serverlessDBActions.zip - same as above and necessary to build serverlessDBActions lambda

![image](/images/aws-lab11-serverless_lambdaAssests2.png)

`If you do not please advise your instructor or double check to make sure you are in the right directory.`
### 💥 **TECHNICAL NOTE**

*look closely at your list of permissions specifically on the LambdaProvisionScript.sh it is not set up to be executatable.  lets give it the permissions necessary to use that file.  In your console cli type "chmod u+x LambdaProvisionScript.sh" now so that we can reference and execute the script.  If you do another ls -ltr you will see it has now turned green.*

