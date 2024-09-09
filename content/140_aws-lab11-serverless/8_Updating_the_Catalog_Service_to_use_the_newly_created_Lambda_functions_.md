---
title: "Updating the Catalog Service to use the newly created Lambda functions "
chapter: false
weight: 9
---
## Updating the Catalog Service to use the newly created Lambda functions 

Ensure you are still in the same directory 
```
~/aws-modernization-dt-orders-setup/provision-scripts/
```
Lets double check that the `catalog-service-serverless.yml` has all the necessary updates from the LambdaProvisionScript.sh

```
cat catalog-service-serverless.yml
```
![image](/images/aws-lab11-serverless_catalog-service-serverless.png) 
Your file should also have 2 sets of URLs as in the section pictured.  `If you do not let your instructor know.`  From this cat output you can see that the deployment will be targeting the catalog service in the `staging` namespace, which is were our DT Orders app is currently running within our K8 cluster. 

### Lets finally deploy the update and get those Lambdas working!

in your AWS CLI console type the following command: (make sure you are in the /provision-scripts directory)

```
kubectl apply -f catalog-service-serverless.yml
```
![image](/images/aws-lab11-serverless_catalogDeploy.png) 

Validate that you have an output as pictured above.  If you do **SUCCESS** however it will take a few minutes to get the changes to take place and traffic from the load gen to start flowing into the functions. 

**👍If we have time lets take a 5 min break and if we dont we will carry on**

