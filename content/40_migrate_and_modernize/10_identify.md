+++
title = "Identify"
chapter = false
weight = 10
+++

![image](/images/henrik.png)

EasyTravel is a monolithic Java application that as we saw earlier provides several web services like Booking, Authentication, and Journey.

Our overall goal at easyTravel is to breakout each of these backend services into separate services. This will allow us to have separate Continuous Integration (CI) pipelines to build and test each service independantly. By putting these service into Docker images, we gain the ability to deploy the service into modern platforms like Kubernetes using AWS managed services. By adding Continuous Deployment (CD) to our process, we will vastly increase our ability to delivery features faster to our customers.

![image](/images/adapt-microservices.png)

## Identify checkDestination to become a microservices

For this review, we are going to focus on the `JourneyService`.

Referring to the picture above, notice how the INTERMEDIATE STEP show the `JourneyService` resulting in two services:

* JourneyService
* checkDestination

As the lead developer, Henrik knows that within the code the checkDestination is a separate Java method and he would like to understand how often it gets called and the typical response times. This will help establish the Services Levels that will be required for monitoring and sizing.

## The Setup

Dynatrace automatically detects and monitors most server-side services in your environment with no configuration required. If your application doesn’t rely on standard frameworks, you can set up custom services.

With a custom service you can instruct Dynatrace which method, class, or interface it should use to gain access to each of your application’s custom server-side services.

Henrik knows the Java class and method within the JourneyService` and configured this custom service.

![image](/images/java-custom-service.png)

{{% notice info %}}
During the workshop provisioning we used the [Dynatrace API](https://www.dynatrace.com/support/help/dynatrace-api/configuration-api/service-api/custom-services-api/) to add this configuration. Navigate to the (**Settings –> Server-side service monitoring –> custom service detection**) to check it out.
{{% /notice %}}

## Service Review

1 . In Dynatrace, open the `transactions and services` page from the left side menu.

2 . Use the Management Zones filter to pick the `ez-travel` option

![image](/images/mz-filter.png)

{{% notice info %}}
During the workshop provisioning we used the Dynatrace Management Zones API to add this configuration. Navigate to (**Settings –> Preferences –> Management Zones**) to check it out.
{{% /notice %}}

3 . Use the `Technology` filter choosing the `Apache Tomcat` option. From the list, pick the `JourneyService`

![image](/images/pick-journey.png)

4 . On the Journey service page, click the View service flow button. Go ahead and change the Throughput view and expand the CheckDestination service to see the Request and response time details.

![image](/images/check-destination.png)

## What did we learn?

The `CheckDestination` service is called nearly each invocation to the `JourneyService` and its not a high contributor to overall time. So Henrik now has the informaton he needs to make smarter re-architecture and re-platforming decisions
