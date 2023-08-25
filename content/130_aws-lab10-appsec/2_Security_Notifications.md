---
title: "Security Notifications"
chapter: false
weight: 3
---
## Security Notifications

In order to get alerted in case new vulnerability is discovered in our environment, we can setup security notifications. There are currently three notification types:
- Email: sends a email to a predefined address
- Jira: opens a new Jira Issue
- Custom integration (Webhook): sends a webrequest with a payload to an end-point. 

Two steps are required to setup notifications. First we need to create a *Security Profile*, which defines in which cases a notifications is sent out. Then we can setup a *Security Notification* that sends out a notification for the previously created *Security Profile*. 

### Tasks to complete this step

- The first step is to create a Vulnerability Alerting Profile 
  - Go to *Settings > Alerting > Vulnerability alerting profiles*
  - Click on **Add alerting profile**
  - Specify a name, e.g. *Critical and high vulnerabilities*
  - Toggle the *Critical* and *High* Risk Levels
  - Click on **Save changes**
![image](/images/aws-lab10-appsec_4-1-alerting-profile.png)
- After that we can setup the notification for the profile we just created
  - Go to *Settings > Integration > Security notifications*
  - Click on **Add integration##
  - Under *Security alert type* select *Vulnerability alert* 
  - For the Notification type we are going to use *Email*
  - Display name: Email for critical and high vulnerabilities.
  - Under *To* click on *Add recipient* and enter your email address
  - The *Subject* and *Body* fields allow us to define the information in the email.
    - You can for example add the severity in to the subject: [{Severity}] Security problem {SecurityProblemId}: {Title}
  - The last step is to select the alerting profiles, where you can select the previously created profile
  
From now on, you will receive notifications whenever a new vulnerability with a risk score of *critical* or *high* is discovered. 

