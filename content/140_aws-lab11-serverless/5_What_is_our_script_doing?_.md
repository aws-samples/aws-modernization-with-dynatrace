---
title: "What is our script doing? "
chapter: false
weight: 6
---
## What is our script doing? 
A shell script is one way to automate and execute commands in the AWS cli that will create the functions but of course there is other ways such as `Cloud Formation Templates`, `Terraform` or a myriad of other automation sdks.  

This shell script for us doing the following: 
*  Deploying the RDS database (will take about 3 to 4 mins to complete)
*  Creating the MySql instance within that RDS db. 
*  Creating the necessary permissions to allow the RDS to communicate with MySql
*  Creating all the environment variables that the script needs to reference
*  Creating 2 functions with public facing function URLs and the Dynatrace Layer.  
      *  `What is a dynatrace layer? It a way to load all the libraries and dependancys necessary for lambda to talk to your DT-Tenant and provide you with the observability you need in context.`
*  Updating the catalog-service-serverless-yml with the values of the functionURL's of the lambda functions 

Once the script completes its time to double check a few things and finally deploy the changes to the catalog service in the workshop K8s cluster.

