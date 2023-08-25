---
title: "Getting familiar with Application Security"
chapter: false
weight: 2
---
## Getting familiar with Application Security

Now that Application Security is enabled, lets explore the product and analyze some vulnerabilities.

### Vulnerabilities
On this screen you can see a list of all vulnerabilities that were discovered in the environment. 

![image](/images/aws-lab10-appsec_2-2-vulnerabilities.png)

The list is sorted by the Davis Security Score, which is based on the CVSS, but also factors in context information detected at runtime. This contextual information, shown as icons next to the Davis Security Score, indicates whether there is public exposure, sensitive data in range, presence of vulnerable functions, and availability of a public exploit. 


  <aside class="positive"> 

   📓 `Contexual Information`
    <br> - **Public exposure**: The vulnerability affects a process that is exposed to the internet, based on the Dynatrace entity model (Smartscape).
    <br> - **Sensitive Data**: The vulnerability affects a process that has database access, based on the Dynatrace entity model.
    <br> - **Vulnerable Functions**: The vulnerable code of the affected librariy is actively used.  We have not enabled this yet, therefore this information won't be displayed. 
    <br> - **Public Exploit**: There is a known exploit for this vulnerability.

  </aside>

<br>

### Tasks to complete this step

<aside class="positive"> 

📓  In March 2022 a [critical vulnerability was discovered in the Spring Framework](https://www.dynatrace.com/news/blog/what-is-spring4shell-vulnerabilities-in-the-java-spring-framework/). The affected versions of the Spring Beans library are vulnerable to Remote Code Execution (RCE), allowing attackers to install a web shell on a victim's application by manipulating the classloader with a specific HTTP Post request.<br>

Let's see if we are affected by this vulnerability.

</aside>

1. Click on the *Filter by* field, select *Snyk/CVE ID* and enter CVE-2022-22965. ![image](/images/aws-lab10-appsec_2-2-filter.png)
<br>As you can the vulnerability was detected in your environment, with a Davis Security Score of 8.8 out of 10. It also shows you that there are 3 process groups that are affected. ![image](/images/aws-lab10-appsec_2-3-result.png)
2. Now, click on *Remote Code Execution* to show further details about this vulnerability.
3. Here you can see all the details about this specific vulnerability: ![image](/images/aws-lab10-appsec_2-3-detail.png)
    1. At the top you can see the context information, it shows that no public internet exposure was detected, meaning that all requests to the affected processes are from the local network. However, the **Sensitive data assets** indicates that the there is a access to a database from at least one of the processes, meaning that some data could be at risk. Meanwhile on the right side, it is indicated that there is a ***public exploit*** available for this vulnerability, making it easier for potential attackers to exploit the vulnerability. 
    2. Here you can see how the Davis Security Score was calculated. Its original CVSS is a 9.8, but now that Davis has factored in the contextual information, it has been lowered to 8.8. This is because, although reachability to Sensitive Data has been identified, there is no Public Internet Exposure as all requests come from Adjacent networks. This helps you prioritize the different vulnerabilities. 
    3. Under context and details you can see that there are 8 processes in 3 process groups that are affected by the vulnerabily. A description of the vulnerability is also provides, for example it mentions that the current known exploits affect applications deployed on Tomcat, Payara or Glassfish using Java 9 or higher. Links to other resources, such as the National Vulnerability Database, OWASP and Snyk are also provided for further research. 
4. By scrolling further down, you can see additional context informaion, like all affected processes, the affected container images and other related entities. ![image](/images/aws-lab10-appsec_2-3-detail-2.png)
    - Click on *View all process groups*. ![image](/images/aws-lab10-appsec_2-5-click-view-all.png)
    - This shows the list of all affected Process Groups. As we saw in the detail information about the vulnerability, currently the exploits are only known to work with Java 9 or newer and applications deployed in Tomcat, Payara or Glassfish. Since Dynatrace collects all these information at runtime, it is quite easy to see if the Process Groups match these criteria. ![image](/images/aws-lab10-appsec_2-6-remediation-tracking.png)
    - First, click on the first Process Group to see the Process Group Details and expand the *Properties and Tags* section. ![image](/images/aws-lab10-appsec_2-7-pg-details.png)
    - As you can see in the properties, the application is deployed on Tomcat and is running on Java 11, meaning that it is affected by the spring4shell vulnerability. 

