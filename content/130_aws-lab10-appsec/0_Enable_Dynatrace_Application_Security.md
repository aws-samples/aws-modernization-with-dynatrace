---
title: "Enable Dynatrace Application Security"
chapter: false
weight: 1
---
## Enable Dynatrace Application Security

Application Security is an integral part of the Dynatrace platform, and it uses the same core technologies as all other Dynatrace products. This includes OneAgent, Smartscape, PurePath, and DAVIS. This not only makes configuration quick and easy, but also means that observability is used to enrich vulnerability data as well as provide accurate insight into your runtime applications. The only action required is toggling a switch in the user interface. 

To demonstrate this, we will enable Application Security in our environment by following the below. Once this is completed, we will explore the product and analyze some vulnerabilities. 

### Tasks to complete this step

1. Enable runtime Vulnerability detection
    1. Navigate to the relevant settings page
         1. Click on `Third Party Vulnerabilities` in the Application Security section of the menu
        2. Click on `Activate Settings`
    2. Toggle `Enable runtime vulnerability detection` 

        <br>![image](/images/aws-lab10-appsec_1-1-enable-appsec-1.png)<br>

        <aside class="positive"> 

        📓 Alternatively we can go to Settings > Application Security > Runtime vulnerability detection.<br>

        On the page that opens, toggle *Enable runtime vulnerability detection*, then click on ***Save changes*** when prompted, to complete the activation. 

        <br>![image](/images/aws-lab10-appsec_1-2-enable-appsec-2.png)<br>

        </aside>

        

        <aside class="positive"> 

        📓 The following technologies are currently supported by Dynatrace Applcation Security:
        -  Java
        -  .NET
        - Kubernetes
        - Node.js
        - PHP

        </aside>

