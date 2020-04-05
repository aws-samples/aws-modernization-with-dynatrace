+++
title = "Service Naming Rules"
chapter = false
weight = 30
+++

# Setup Service naming rules

## Explore auto-detected Service names

Take a quick look at the current <b>Service</b> naming as automatically assigned by Dynatrace with the built-in naming rules.

You can see <b>Services</b> in different locations in the Dynatrace console

- <b>Service & Transactions</b> view
- <b>Technologies/Process Groups</b> view : for a given <b>Process Group</b>, the infographic shows the <b>Service</b> implemented by the <b>Process Group</b>
- <b>Smartscape</b>

## Configure custom Service naming rules

We want to achieve with <b>Services</b> a similar result than we did with <b>Processes</b>, showing up with names that tells us:

- Whether the <b>Services</b> are in Kubernetes or not. Have Service name start with `k8s` for those in Kubernetes
- What project is the <b>Service</b> part of. Your company likely has multiple projects running in the same cluster
- The <b>Service</b> namespace, which in our case with Sock Shop also tells us if it's production or dev
- The container name, which correspond to our microservice name
- In some cases, SpringBoot for example, there can be multiple web services for the same Java process. So we also want to see the Web Service name. 

Target Service naming convention :  `k8s-project-namespace-container Web Service Name`

Let's apply that configuration in Dynatrace!

- Go in <i>Settings -> Server-side service monitoring -> Service naming rules</i> and click <b>Add a new rule</b>
- Provide a name to the rule, for example : `Kubernetes Project.Namespace.Container Web Service`
- First, we want this rule to apply only to containerized processes running in Kubernetes. This is done by defining a condition.
  - In the conditions drop-down, select the property `"Kubernetes namespace"` and the condition `"exists"`
- For the name format, we can enter free text and/or use placeholders.
  - Placeholders are in between brackets {} to distinguish them from free text
  - Enter this format : 
    - `k8s-{ProcessGroup:Kubernetes:pipeline.project}.{ProcessGroup:KubernetesNamespace}.{ProcessGroup:KubernetesContainerName} {Service:WebServiceName}`

![custom_service_naming_rule](/images/custom_service_naming_rule.png)

### Preview 

- Click the <b>Preview</b> button

![service_naming_rule_preview](/images/service_naming_rule_preview.png)

- Once done with Preview, click <b>Create rule</b>
- And <u>DON'T FORGET</u> to save (button at the bottom right)

### Built-in rules

You will notice there is a section named builtin rules. This is where the out-of-the-box service naming rules are defined. 

This is helpful to understand how Dynatrace come out with auto-discovered service names. 

![built-in_service_naming_rules](/images/built-in_service_naming_rules.png)

## Validate

Navigate to <b>Technologies</b> and <b>Transactions & Services</b> views to look at the applied custom service naming rule.

![service_naming_validation](/images/service_naming_validation.png)

It might take a minute or two for all processes to show up with the new names. If the naming doesn't change, it's probably that you forgot to save the rule... You will have to repeat the previous steps to create it again. :unamused:

![service_naming_rules](/images/service_naming_rules.png)

{{% children showhidden="false" %}}
