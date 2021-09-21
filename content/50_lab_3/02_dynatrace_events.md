---
title: "Dynatrace Events"
chapter: false
weight: 02
---

Before we get to the problems, let's review Refer to <a href="https://www.dynatrace.com/support/help/dynatrace-api/environment-api/events/post-event/" target="_blank">Dynatrace information events</a>.

Dynatrace information events enable continuous delivery tools to provide additional details for Dynatrace. Here is an example of two informational events for deployment and performance testing being be sent to Dynatrace.

![image](/images/lab3-pipeline.png)

There are several Dynatrace information event types:
* `CUSTOM_ANNOTATION`
* `CUSTOM_CONFIGURATION`
* `CUSTOM_DEPLOYMENT`
* `CUSTOM_INFO`
* `MARKED_FOR_TERMINATION`

Below we can see both the `CUSTOM_INFO` (#1) and `CUSTOM_DEPLOYMENT` events (#2) for a service that was the root cause to a problem the Dynatrace AI engine, Davis®, determined.

![image](/images/lab3-problemcard-events.png)

Each event has a timestamp, event source, a few standardized fields (depending on the event type), and the option to add additional custom fields.  See <a href="https://www.dynatrace.com/support/help/shortlink/api-events-post-event#parameters-mapping" target="_blank">this table</a> for details.  Here are two example events.  NOTE the URL back to the pipeline making the change.

![image](/images/lab3-event-examples.png)

## 👍 How this helps

Having information events speeds up triage by adding context to what’s happening with the application. Just imagine getting alerted about an issue and immediately seeing a load test or deployment took place, and in one click of the event, URL review the system, job, and team responsible!

## Dynatrace tags

When creating information events, you must target the entities to receive the event so that it’s only associated with the relevant component. That is where Dynatrace tags come in.

In a nutshell, tags in Dynatrace are labels or markers used for organizing entities in large monitoring environments. Below shows a few tags for my catalog service: `stage:staging` and `service:catalog-service`

![image](/images/lab3-tags.png)

## API call Example

```
curl -X POST \
  https://mySampleEnv.live.dynatrace.com/api/v1/events \
  -H 'Authorization: Api-token abcdefjhij1234567890' \
  -H 'Content-Type: application/json' \  
  -d '{
  "eventType" : "CUSTOM_DEPLOYMENT",
  "source" : "Pipeline Script" ,
  "deploymentName" : "Set order-service to version 1",
  "deploymentVersion" : "1"  ,
  "deploymentProject" : "dt-orders project" ,
  "ciBackLink" : "http://link-back-to-my-pipeline",
  "customProperties": {
      "Example Custom Property 1" : "Example: Commit SHA",
      "Example Custom Property 2" : "Example: Name of person who run pipeline",
      "Example Custom Property 3" : "Example: Application owner name",
      "Example Custom Property 4" : "Example: Ticket Number approving change"
  },
  "attachRules": {
            "tagRule" : [
                {
                  "meTypes":["PROCESS_GROUP_INSTANCE"],
                  "tags": [
                      {
                            "context": "CONTEXTLESS",
                            "key": "service",
                              "value": "order-service"
                      },
                          {
                            "context": "CONTEXTLESS",
                            "key": "project",
                              "value": "dt-orders"
                      },
                          {
                            "context": "CONTEXTLESS",
                            "key": "stage",
                              "value": "production"
                      }
            ]}
          ]}
        }
}'
```
