+++
title = "How Davis Works"
chapter = false
weight = 20
+++

![image](/images/emma.png)

Davis is Dynatrace’s AI engine that is purpose-built for today’s web-scale enterprise clouds. Davis analyzes complex dependencies, creates application topology dynamically and helps you in anomaly detection.

**1. Intelligent anomaly detection**

Problems in Dynatrace represent anomalies, i.e. deviations from a normal behavior or state. Such anomalies can be, for example, a slow service or a slow user login to an application. Whenever a problem is detected, Dynatrace raises a specific problem event indicating such an anomaly.

**2. Smart Baselines & Problems**

Context-rich data collection and baselining are the two fundamental pillars that anomaly detection is built on. A huge amount of high-quality and accurate data is necessary to determine baselines that can effectively be used to distinguish between normal and anomalous situations.

Dynatrace uses a sophisticated AI causation engine, called Davis, to automatically detect performance anomalies in your applications, services, and infrastructure. Dynatrace “problems” are used to report and alert on abnormal situations, such as performance degradations, improper functionality, or lack of availability (i.e., problems represent anomalies in baseline system performance).

**3. Causation versus correlation**

Davis uses deterministic AI which is a radically different approach to traditional machine learning. It performs an automatic fault-tree analysis, the same methodology NASA and the FAA are using. This is causation not correlation. The resulting root cause analysis is precise and reproducible step by step.

### How Dynatrace Davis analyzes a critical situation

Davis processes all data, whether it comes from a mainframe, the infrastructure, a cloud platform or the CI/CD pipeline. This enables Davis to provide the granularity and precision needed to automate the enterprise cloud, unlike traditional AI.

* **Automatic detection of topology and communications** - As Oneagent constantly discovers new resources in the environment and builds it into the topology maps. The direction of the communication is shown by the arrow with solid line between entities representing active communication.
* **Metric and event-based detection of abnormal component states** - The new AI engine automatically checks all component metrics for suspicious behavior. This involves the near real-time analysis of thousands of topologically related metrics per component and even your own custom metrics.

### Problem Card

This is an example of Dynatrace in action where Davis detected a problem. It’s showing the business impact and root cause of the issue in a simple, straight-forward way that everybody understands.

![image](/images/dt-problem-view.png)

All the high-fidelity data collected by OneAgent is constantly ingested into the AI and through that deterministic AI capabilities Dynatrace identifies the actual root cause with unmatched precision. Davis also helps in providing you the business impact analysis in terms of applications, services, infrastructure components and the real users impacted by a certain anomaly.

![image](/images/dt-problem-view-evaluation.png)

Your Problem Page
The problem we enabled earlier at the end of the Assessment section should be there now. Navigate to the `Problem` Dashboard from the menu or the RED icon on the top right of the Dynatrace page.