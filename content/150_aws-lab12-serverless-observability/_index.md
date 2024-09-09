---
title: "Lab 12 - Serverless Observability with Dynatrace"
chapter: true
weight: 150
---
## Lets pick up where we left off in lab 11 and see what our Lambdas are up to

From your Dynatrace console navigate to `services`
you will have a few new services now specifically the Lamda functions we deployed.  Looks from the image below that we have 1 fully instrumented lambda and 1 lambda that althogh recognized by the DT-OneAgent as an end point its not yet instrumented.  **WAIT** you say you dont have any instrumented Lamdas.  Well I wanted to see if you are paying attention!.. Lets finish 1 final step to instrument the Lambda fully with the power or the DT-OneAgent observability.  
![image](/images/aws-lab12-serverless-observability_lambdaServices.png)

Navigate on the left side menu to `Settings` then `Start Installation` and select `AWS Lambda`

![image](/images/aws-lab12-serverless-observability_deployLambda.png)

### 💥 **TECHNICAL NOTE**
*if we were doing this as a manual install this would be the steps to accomplish what we have automated throught the LambdaProvisionScript.sh*

What we will need from this settings is the `DT_CONNECTION_AUTH_TOKEN` value you see here which starts with `dt`.  In order to expose that for your Dynatrace tenant click on the `eye icon`.  Copy this to your clipboard or a notepad to use in the subsequent step.

![image](/images/aws-lab12-serverless-observability_deployLambdaSettings.png)

Next we will move back to the AWS console to complete the instrumentation.  
* Navigate to `Lambda` in the AWS console
* Select fuctions from the Left `hamburger` menu
* Select `serverlessDBActions`
* Scroll down to the tabs and select `Configuration` followed by `Environment Variables`
* Click on edit button and find the `DT_CONNECTION_AUTH_TOKEN` and in the box next to it cut and paste over the `REPLACE-ME-PLEASE` 
* Save your changes
* Your lambda will update with the proper values.

![image](/images/aws-lab12-serverless-observability_awsLambdaVar.png)

### 💥 **TECHNICAL NOTE**
*check your DT tenant again under ``services` and see that your lambda is now recognized as Lambda function Icon as I showed before but also as a bonus check your AWS dashboard from the left menu and notice that now this lambda is and active link*

![image](/images/aws-lab12-serverless-observability_cwLambdaLink.png)

### Lambda and Dynatrace Service Flow

Now that you have 1 of your Lambdas instrumented with the power of the Dynatrace OneAgent lets continue to dive into the DT Orders application and look to see how this Modernization has impacted our environment. 

1.  From the Services view in the Dynatrace console click on service called `frontend` with  `Staging-frontend` underneath. 
1.  Then select `view service flow` on the right of the this window

![image](/images/aws-lab12-serverless-observability_serviceFlow.png)

What you will see is the flow of requests flowing from the `frontend` service. Explore this page and look how the different services support this `frontend` service.

![image](/images/aws-lab12-serverless-observability_frontendServiceFlow.png)

Take a look at the service flow once again to see some interresting information.  Remember that of the 2 Lambda functions we deployed we only added the DT auth token to 1 of them, the `serverlessDBActions` is fully instrumented and in this service flow we can see the following information from the catalog service flow:
1.  Requests to public networks coincides with the unistrumented findByNameContains lambda
1.  ServerlessDBActions with the Lambda icon is fully instrumented
1.  Although we updated 2 workflows with our Lambdas seems the catalog still has other requests that could posibly be candidates for a `modernization` treatement as the catalog is still calling its `embedded database`

![image](/images/aws-lab12-serverless-observability_catalogdServiceFlow.png)

### Lambda and Dynatrace Distributed Tracing
Now we will look at this information from a different angle and dive into the requests that are transacting.

In the `service flow` page click over the box for the `servervlessDBActions` and select the `filter` icon. This will isolate the calls that start in the `frontend` service and end with our Lambda function.  

![image](/images/aws-lab12-serverless-observability_filter.png)

Now that we have filtered the calls click over the `frontend` box select the disctributed tracing icon that looks like a ladder, this will take us to the `distributed tracing` section of Dynatrace.

![image](/images/aws-lab12-serverless-observability_feDistributedTracing.png)

Now click on the frist instance on the resulting page name `/catalog/1html`

![image](/images/aws-lab12-serverless-observability_catalogDTracing.png)

Your resulting page will be the call stack from the front end to the our Lambda function.  here you can expand each layer of the call to show metadata and attributes associated with each step of the call stack.  

![image](/images/aws-lab12-serverless-observability_trace.png)

**WHATS THAT LAST CALL UNDER OUR LAMBDA??**

Remember that in the beging when we explained how the architecture was going to be laid out.  We we explained that unlike the existing catalog service our Lambda function calls a RDS database running a MySql instance.  Well here is that call. Icon you are seeing is representative of the open source technology called Open Telemetry or `OTEL` for short.  

As we dive into the metadata and attributes of this request we can see:
* URI that was exectued
* HTTP method
* Response Status
* Client IP and much more.
![image](/images/aws-lab12-serverless-observability_lambdaDT.png)

With the OTEL instrumentation for the Lambda function we are now able to analyze the details of the calls to the RDS database
* Tracing system
* db.name
* db.statement or the sql that was executed
* Span and Trace ID to help further correlate the tracing.

![image](/images/aws-lab12-serverless-observability_otelDT.png)

### 💥 **TECHNICAL NOTE**``
*Dive into OpenTelemetry with AWS Lambda and see how it transforms the game. It's like having a superpower for spotting exactly how your serverless apps are doing, making it a breeze to tune them up for speed and reliability. You get to fix issues faster, save on resources, and keep your users smiling, all with one clever tool.*

### Parting Words

And there is much more to see that the Dynatrace platform can offer that we didnt have time to talk about.  We hope that in future workshops we will be able to continue to bring you more content as we at Dynatrace strive to define what it means to have "Cloud Done Right"
