---
title: "Backtrace and Service Flow"
chapter: false
weight: 50
---

![image](/images/florian.png)

We just saw one way to review process and service communication, but Let’s look at how Dynatrace understands your applications’ transactions from end to end. and visualizes through **Service Backtraces** and **Service flows**.

* With **Service backtrace**, you see the calls **TO** a service.,

* With **Service flow**, you see the flow of service calls **FROM** a service, request, or their filtered subset. Along with the specific services that are triggered, you can also see how each component of a request contributes to the overall response time.

{{% notice note %}}
As you plan your migration, it is important to gain a complete picture of interdependency to the rest of the environment architecture at host, processes, services, application perspectives. Since time is always scarce, being able to do this in a single place can shorten assessment timelines.
{{% /notice %}}

## Service backtrace

From the same **BookingService** service, click on the **Analyze Backtrace** button.

![image](/images/service-backtrace-arrow.png)

You should be on the service backtrace page where you will see information for this specific service.

![image](/images/service-backtrace.png)

Dynatrace understands your applications transactions from end to end. This transactional insight is visualized several ways like the backtrace. The backtrace tree view represents the sequence of services that led to this service call, beginning with the page load or user action in the browser.

Follow the picture above to locate the services that were called in what order that called the **BookingService**

1 . The starting point is the **BookingService**

2 . **BookingService** is called by the **Customer Frontend**

3 . **Customer Frontend** is a Tomcat Server where end user request started

## Service Flow

Now Let’s see another visualization called the service flow. TO navigate to this view, refer to these steps and the picture below:

1 . Click the `...` in the row for the **Customer Frontend**

2 . Choose the **Service Flow** menu item

![image](/images/service-backtrace-serviceflow.png)

## Response time perspective

You should now be on the **Service flow** page.

![image](/images/service-flow.png)

Refer to the numbers in the picture above:

1 . The timeframe defaults to 10 minutes but can be adjusted

2 . We are viewing the data from a **Response time perspective**. Shortly, we will review the **Throughput perspective**.

3 . Click on the boxes to expand the response time metrics. We can see that 99% of the BookingService response time is spent in the CreditCardValidation service.

4 . Just 4% of the BookingService response time is spent in the easyTravelBusiness database from the calls from CreditCardValidation.

5 . The BookingService service also calls the easyTravelBusiness database, but just 1% of the BookingService response time is spent in the easyTravelBusiness database.

## Throughput perspective

![image](/images/service-flow-tp.png)

Refer to the numbers in the picture above:

1 . The timeframe defaults to 10 minutes but can be adjusted

2 . Change to the **Throughput** perspective by clicking on the box

3 . Click on the boxes to expand the metrics to see the number of requests and average response times going to the BookingService

4 . We can see that on 50% of the calls to `BookingService` go to the `easyTravelBusiness` database. But, it does this 4x per request.

5 . Every call to BookingService make a call to the `CreditCardValidation` service

## View SQL details

Within easyTravel, the easyTravelBusiness database is actually an [Apache Derby embedded relational database](https://en.wikipedia.org/wiki/Apache_Derby). And the OneAgent Let’s is automatically see all the SQL statement details. To see them, refer to these steps in the picture below:

1 . Click on the easyTravelBusiness database

2 . Expand the `easyTravelBusiness` tile

3 . Click on `View database statements`

![image](/images/service-db.png)

## How this helps

From both these perspectives and this example, we now know that the bulk of the time is spent in the CreditCardValidation service, BUT more importantly and we also learned that both the BookingService and the CreditCardValidation service communicate to this database. **An important detail for planning!!**

The service flow and the database statements will also help you right size your database instance in the new environment and scale depending on the resource consumption during regular business and off business hours.
