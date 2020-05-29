+++
title = "Dynatrace OneAgent"
chapter = false
weight = 10
+++

![image](/images/florian.png)

Dynatraces OneAgent provides the industry’s largest technology coverage, spanning cloud native to legacy environments in an all-in-one solution. OneAgent provides:

* A set of specialized processes that run on each monitored host. OneAgent collects metrics from the operating system it runs on and compares the metrics to performance metrics. The metrics are then reported to Dynatrace.
* Monitors technologies like Java, Node.js, .NET and more in greater detail by injecting itself into processes and monitors performance with code level insights.
* Delivers Real User Monitoring by injecting a JavaScript tag into the HTML of each application page that is rendered by your web servers.

![image](/images/dt-oneagent.png)

The OneAgent can be automatically installed and rolled out through configuration management tools such as Chef, Puppet, Ansible, Terraform or by just including the download and install into any custom deployment script.

{{% notice info %}}
You can review the process to manually install and try it on one of your hosts with [this guide](http://AWS-modernize-workshop.alliances.dynatracelabs.com/120_more.html).
{{% /notice %}}