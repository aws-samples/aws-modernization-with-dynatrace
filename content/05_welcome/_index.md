+++
title = "Meet the team"
chapter = true
weight = 5
+++

![image](/images/mm.png)

Mythical Mysfits is a multinational corporation with verticals in every business segment. Mythical Mysfits travel division’s flagship product is the customer facing website, easyTravel, where customers can search and book travel. 

![image](/images/ez-logo.png)

The easyTravel team has just started the journey to modernize and move to a bigger cloud infrastructure footprint with the goal of more agility and efficiency to optimize workloads, innovate faster, and deliver optimal user experiences. 

But this journey won't be easy since the easyTravel application has been built over time and is currently managed with a patchwork of different legacy and open source infrastructure monitoring tools. And with the market downturn in travel bookings, the team must still modernize and do more with less.

Meet Pravin, easyTravels CTO, who will share some of the teams challenges.

![image](/images/pravin.png)

### Challenge #1: Understanding the Legacy Application

Firstly, we need to have a good overview of all of our hosts, processes, services and technologies as to answer:

1. Which technologies are in use and where do they run?
1. Which technologies are legacy and can’t be moved because not supported?
1. What is the big picture and end-to-end aggregate view of the legacy app services?
1. Who is responsible and needs to be included in the discussion?

In our current state, we anticipate this as a few week effort by our developer and operations teams to inventory the hosts, technology and dependencies. Because our IT teams are distributed and siloed by function, it may take several meetings to review the new diagrams and spreadsheets and we will have to assign a project manager to help coordinate and keep everyone on task.  All this will take time and takes valuable time from our already busy team.

### Challenge #2: Understanding application usage patterns

In addition needing to understand the blueprint for the existing application and infrastructure landscape, we need to know how the end-user traffic patterns map to resource consumption patterns of the underlying services as to properly answer:

1. What will it cost to run in the cloud? 
1. What network traffic will there be between the services we migrate and those that have to stay in the current data center?
1. How can I make sense of all the Spaghetti codes in the legacy app?

Because we use multiple monitoring and logging tools, gathering and compiling all this data will take time.  What will likely happen is that some teams will lack the resources to take on this task resulting in low confidence in the resulting analysis.

### Challenge #3: Making decision for the application migration strategy 

We at Mythical Mysfits are familar with ["the 6-Rs" migration strategies](https://docs.aws.amazon.com/whitepapers/latest/aws-migration-whitepaper/the-6-rs-6-application-migration-strategies.html) as shown below ...

![image](/images/cloud-migration-strategies-new.png)

...but, we are challenged with best determining which on makes sense for us.  We want to balance the lower risk of just "lifting and shifting" versus benefits of the moving to new technology and the cost savings with on-demand and scalable AWS services. 

What is need to answer is:

1. What are the dependencies, complexity and which pieces are most important for each component and service?
1. What are the underlying infrastructure components and dependencies?
1. Where are the data repositories and what is the activity?
1. Which KPI’s are the most relevant?
1. What are the application usage patterns (mentioned above)?

Much like the effort to gather application usage patterns, we anticpate this effort being laborous and requiring multiple teams to get involved.  Again adding more time and taking resources away from other work.

### Challenge #4: Benchmarking performance and ensuring service levels

As mentioned above, we have a patchwork of tools with many of them focused on a single view.  

Some tools focus on host monitoring, some on just logs, and some are just for website traffic. Our challenges is that there is no unified view across our current on-prem platforms let alone the cloud.  As a result, it is hard to know how the application and underlying services are behaving now AND many of our current tools aren't suited to support Cloud service or new technologies like Kubernetes. 

At high level, we know we must first establish system benchmarks and then, during and post migration:

1. Validate business outcomes
1. Manage service levels real-time for full stack visibility of user experience, application and components?
1. Maintain single view in our hybrid cloud environment

With our current set of tooling and manual approach to aggregate all the data, we simply will not be able to keep up with the demand resulting in blind spots and delays in gathering data and an increased risk to hurting services levels.

### Challenge #5: Increased Complexity for Operations

The team has quickly learned that building out cloud infrastructure, where everything is virtualized and dynamic, causes interdependencies to go way up, adding more layers of complexity.  

What is need to do is both scale up our teams ability to support all this new complexity AND minimize disruption during cloud migration and prevent delays, but do so without adding a whole new set of resources.

[DC Worldwide CIO Agenda 2020 Predictions](https://www.idc.com/getdoc.jsp?containerId=prUS45616519) state that through 2022, deployment of artificial intelligence to augment, streamline, and accelerate IT operations will be a principal IT transformation initiative for 60% of enterprise IT organizations. 

Currently, the platform and tools we use do not have, and are far away from having, artificial intelligence built-in to help us.

Unless we change, we will continue to spend much time looking for root cause because different teams from Ops and Apps and even Biz must get involved to review multiple tools, dashboards and logs and that translates a lot of time and resources wasted on troubleshooting.

## Before we dig in ...

Before take a look at how Dynatrace can help us with these challenges, we first need to setup your workshop environment. So proceed now to the [Prerequisites](/10_prerequisites.html) section to get started.


