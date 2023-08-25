---
title: "AWS and Dynatrace"
chapter: false
weight: 4
---
## AWS and Dynatrace

Lets dig deeper into the ways <a href="https://www.dynatrace.com" target="_blank">Dynatrace</a> helps in each phase of our modernization journey.

The <a href="https://aws.amazon.com/cloud-migration" target="_blank">AWS Cloud Migration portal</a> provides the best practices, documentation, and tools that cloud architects, IT professionals, and business decision makers need to successfully achieve short-term and long-term objectives. 

The AWS migration framework presented on the AWS Cloud Migration portal frames this guidance into the <a href="https://aws.amazon.com/cloud-migration/how-to-migrate/" target="_blank">phases</a> shown below.

* **Assess phase** - Before we move, we need to ensure our return on investment by understanding current cost and savings. In addition, we need to validate our organization’s readiness to move to cloud from 6 different perspectives of Cloud Adoption framework- Governance, people, business, platform, security and operations.

* **Mobilize phase** - We need to perform a detailed application and infrastructure discovery and put a plan in place. We need to identify and put in place the right tools to help iron out the challenges of portfolio analysis, right sizing, application prioritization and application grouping.

* **Migrate & modernize phases** - It is critical that we accelerate our move to the cloud and application transformations to achieve the benefits, but we must also validate our architecture decisions and our performance and scalability benchmarks.

* **Operate & optimize phase** - Once migrated, it will start to get interesting with usage of all modern services, modern architectures using Fargate, ECS, EKS, Lambda, Amazon Aurora Serverless and much more.  We know we need to adopt modern ways of operations by automating monitoring tasks, remediation tasks and ITSM tasks.  We must also continue to expand and optimize our costs and performance.

Here is an overview for how <a href="https://www.dynatrace.com" target="_blank">Dynatrace</a> helps in each phase of our modernization journey.

![image](/images/aws-better-together_cloud-framework-new.png)

### #1: Understanding the Legacy Application

With Dynatrace OneAgent and Smartscape technologies, it is now fast and easy to answer these questions about the our existing applications:

🔷 Which technologies are in use and where do they run?

🔷 How can I aggregate multiple services to have a big picture of the legacy app?

🔷 Who is responsible and needs to be included in the discussion?

🔷 How can I make sense of all the Spaghetti codes in the legacy app?

![image](/images/aws-better-together_dt-agent.png)

The Dynatrace Smartscape topology map enables you to understand the actual connection between all captured metrics, traces, logs, and user experience data. Other than mere time-based correlation, topology mapping reveals the actual causal dependencies between captured data. This is the basis for Dynatrace’s radically different AI engine, Davis.

!![image](/images/aws-better-together_dt-smartscape-words.png)

### Understanding application usage patterns

Dynatrace automatically generate a blueprint of existing infrastructure, services and the application landscape thanks to Dynatrace Smartscape Technology. Dynatrace baselines existing on-premise applications, automatically detects all dependencies (internal as well as external) and calculates current resource consumption.  

Dynatrace has out-the-box dashboards for each tier in the stack. 

![image](/images/aws-better-together_dt-usage-dashboard.png)

Incoming and outgoing connection to processes running monitored hosts is another view created automatically.

![image](/images/aws-better-together_dt-network-flow.png)

Instead of gathering this data from multiple tools, all teams can look to one source to help answer questions such as:

🔷 What will it cost to run in the cloud? 

🔷 What network traffic will there be between the services we migrate and those that have to stay in the current data center?

🔷 How can I make sense of all the Spaghetti codes in the legacy app?

![image](/images/aws-better-together_dt-move-server.png)

### Making decision for the application migration strategy 

Dynatrace provides immediate feedback on decisions & transformation. By monitoring the progress of shifting workloads to the cloud, it helps make better decisions on what to move when based on how tightly coupled services are and on the automatic baseline comparison between pre-migration and in-migration.  One feature for this is the service flow, where dependencies and usage can be analyzed. 

![image](/images/aws-better-together_dt-flow.png)

This automatically built view along with other views such as the Smartscape view allows for "virtual" monolith to micro service migration planning without code changes. This enable smarter re-architecture and re-platforming decisions based on the existing on-premise workload and to validate other non-functional requirements such as scale, failover, costs.

![image](/images/aws-better-together_dt-scale.png)

### Benchmarking performance and ensuring service levels

At high level, we know we must first establish system benchmarks and then, during and post migration.  With the AI-supported base lining on the migrated services, Dynatrace allows for validating the success of the migration project from a performance, resource and cost perspective. 

![image](/images/aws-better-together_dt-b4-after.png)

With the build-in "hot-spot" analysis and performance analysis capabilities, Dynatrace can help pinpoint when issues show up. Here is one example where a problem has identified to be within the code execution area.  From there, one can drill into method level hot spots to see what might have changed and is impacting service levels.

![image](/images/aws-better-together_dt-review.png)

Migration often means moving to new technologies such as Kubernetes.  Dynatrace monitors native Kubernetes and managed Kubernetes service like AWS EKS. Dynatrace auto-discovers any environment and provides full observability without any configuration or code changes. No matter your cloud platform, container runtime or service mesh layer, Dynatrace makes monitoring applications and clusters simple. 

![image](/images/aws-better-together_dt-k8.png)

By providing a single view into hybrid cloud environments and support for new technologies like Kubernetes, validating business outcomes is simplified.

### Increased complexity for operations

Adopting modern architectures and cloud services means automating monitoring tasks, remediation tasks and ITSM tasks. 

Traditional observability solutions offer little information beyond dashboard visualizations. At the end, it remains to human experts to analyze the data in time-consuming war rooms. Despite all efforts, too many user complaints stay unresolved. Dynatrace is the only software intelligence platform that reliably takes that burden off human operators. Davis, the Dynatrace causation-based AI engine, automates anomaly root-cause analysis and is custom built for highly dynamic micro service environments.

Dynatrace’s purpose-built AI engine, Davis, sits at the core of Dynatrace and delivers AI-powered insights, detects problems, which are opened when Dynatrace detects anomalies with your applications (impacting end users), services (impacting service levels) or infrastructure (unhealthy system components) for hybrid cloud environments.

![image](/images/aws-better-together_dt-how-works.png)

🔷 Built at the core of the Dynatrace platform Davis processes all observability data across the full technology stack, independent of origin.

🔷 Precise technical root-cause analysis. Davis pinpoints malfunctioning components by probing billions of dependencies in milliseconds.

🔷 Identification of bad deployments. Davis knows exactly what deployment or config change has introduced the anomaly in the first place.

🔷 Discovery of unknown unknowns. Davis does not rely on predefined anomaly thresholds but automatically detects any unusual "change points" in the data.

🔷 Automatic hypothesis testing by systematically working through the complete fault tree.

🔷 No repetitive model learning or guessing. Unlike machine learning approaches, Davis’ causation-based AI relies on a topology map, which is updated in real-time.

You gain advanced observability across cloud and hybrid environments, from microservices to mainframe. Automatic full-stack instrumentation, dependency mapping and AI-assisted answers detailing the precise root-cause of anomalies, eliminating redundant manual work, and letting you focus on what matters, delivering instant answers across the full stack.

As a result, you gain advanced observability across cloud and hybrid environments, from microservices to mainframe. Automatic full-stack instrumentation, dependency mapping and AI-assisted answers detailing the precise root-cause of anomalies, eliminating redundant manual work, and letting you focus on what matters, delivering instant answers across the full stack.

![image](/images/aws-better-together_dt-problem-view.png)

