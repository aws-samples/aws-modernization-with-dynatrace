+++
title = "About Dynatrace"
chapter = false
weight = 20
+++

## Dynatrace and AWS

Dynatrace is an [APN Advanced Technology Partner](https://aws.amazon.com/partners/find/partnerdetails/?n=Dynatrace&id=001E000000texmiIAA) and AWS DevOps, Migration, and Containers Competency Partner. Dynatrace provides software intelligence to simplify enterprise cloud complexity and accelerate digital transformation. With AI and complete automation, the company’s all-in-one platform provides answers, not just data, about the performance of applications, the underlying infrastructure and the experience of all users. 

![dt](/images/dt.png)

Dynatrace has pioneered and expanded the collection of observability data in highly dynamic cloud environments with the OneAgent. In addition to metrics, logs and traces, we are also collecting user experience data for full, end-to-end visibility.

Dynatrace delivers answers, not just more data, through three distinct capabilities:

![dt-capabilities](/images/dt-capabilities.png)

## Real-time topology mapping provides context across the full stack

Metrics, logs, and traces are frequently stored without meaningful context that ties them together. With such data silos,a holistic system health assessment is impossible. For example, you might get an alert for an increased failure rate of service A and another alert because process B has an increase in CPU usage. But it’s impossible to tell if these two alerts are related and how end users are impacted by them.

To avoid such data silos, Dynatrace automatically detects and collects a rich set of context metadata to create a real-time topology map called Smartscape. It captures the relationships and dependencies for all system components, both vertically up and down the stack and horizontally between services, processes, and hosts. Within large enterprise systems, there are billions of ever-changing dependencies, and Smartscape keeps track of them all.

The topology map enables Dynatrace to understand the actual connection between all captured metrics, traces, logs, and user experience data. Other than mere time-based correlation topology mapping reveals the actual causal dependencies between captured data. This is the basis for Dynatrace’s radically different AI engine, Davis.

![dt-capabilities](/images/dt-topology.png)

## Causation-based AI delivers precise answers

Traditional observability solutions offer little information beyond dashboard visualizations. At the end, it remains to human experts to analyze the data in time-consuming war rooms. Despite all efforts, too many user complaints stay unresolved. Dynatrace is the only software intelligence platform that reliably takes that burden off human operators. Davis, the Dynatrace causation-based AI engine, automates anomaly root-cause analysis and is custom built for highly dynamic microservice environments.

* Built at the core of the Dynatrace platform Davis processes all observability data across the full technology stack, independent of origin.
* Precise technical root-cause analysis. Davis pinpoints malfunctioning components by probing billions of dependencies in milliseconds.
* Identification of bad deployments. Davis knows exactly what deployment or config change has introduced the anomaly in the first place.
* Discovery of unknown unknowns. Davis does not rely on predefined anomaly thresholds but automatically detects any unusual “change points” in the data.
* Automatic hypothesis testing by systematically working through the complete fault tree.
* No repetitive model learning or guessing. Unlike machine learning approaches, Davis’ causation-based AI relies on a topology map, which is updated in real-time.

![dt-problem](/images/dt-problem.png)
