+++
title = "Transactions and Services"
chapter = false
weight = 60
+++

![image](/images/florian.png)

Within Dynatrace, services can take the form of web services, web containers, database requests, custom services, and more. Services may in turn call other services such as web services, remote services, and databases services.

Web applications consist of web pages that are served by web servers and web containers, for example Tomcat. Web and mobile applications are built upon services that process requests like web requests, web service calls, and messaging. Such “server-side services” can take the form of web services, web containers, database requests, custom services, and more. Services may in turn call other services such as web services, remote services, and databases services.

{{% notice note %}}
As you plan your migration, it is important to gain a complete picture of interdependency to the rest of the environment architecture at host, processes, services, application perspectives. Since time is always scarce, being able to do this in a single place can shorten assessment timelines.
{{% /notice %}}

## View the complete end to end flow 

Lets now take a look at the transactions and Services by click on the `Transactions and services` left side Dynatrace menu.

There alot of services in this list. To help manange this list a [Dynatrace auto-tagging rule](https://www.dynatrace.com/support/help/how-to-use-dynatrace/tags-and-metadata/) was added by the workshop scripts and we can now use a tag filter to make this list more manageble.

In the filter box, type tag, choose `workshop-group`, and the value of `ez-travel`. It should look like this:

![image](/images/trans-services.png)

You can now pick the `EasytravelService` service to open the service page. From the `Understand dependencies` section on the right, click the `view service flow` button to see what it calls. It should be more complex as shown below.

![image](/images/ez-service-flow.png)

## How this helps

Knowing the type of access, executed statements, and amount of data transferred during regular hours of operation allows for better planning and prioritization of the move groups. In some cases, you may decide to not migrate this database in favor of other services or databases that are less complex to migrate due to fewer dependencies.

{{% notice info %}}
If you want to learn more about the approach and features available in Dynatrace to virtually break your monolithic architecture, have a look at [8-Step Recipe to Break Monoliths](https://www.dynatrace.com/news/blog/breaking-the-monolith-an-8-step-recipe/).
{{% /notice %}}
