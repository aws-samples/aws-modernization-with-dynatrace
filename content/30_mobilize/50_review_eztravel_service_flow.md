---
title: "Service Flow"
chapter: false
weight: 50
---

![image](/images/florian.png)

As just mentioned, Dynatrace understands your applications’ transactions from end to end. This transactional insight is visualized through Service flow, which illustrates the sequence of service calls that are triggered by each service request in your environment.

With Service flow, you see the flow of service calls from the perspective of a single service, request, or their filtered subset. Along with the specific services that are triggered, you can also see how each component of a request contributes to the overall response time.

Lets review what you are seeing on the service flow page.

## Response time perspective

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

4 . We can see that on 50% of the calls to `BookingService` goto the `easyTravelBusiness` database. But, it does this 4x per request.

5 . Every call to BookingService make a call to the `CreditCardValidation` service

## View SQL details

Within easyTravel, the easyTravelBusiness database is actually an [Apache Derby embedded relational database](https://en.wikipedia.org/wiki/Apache_Derby). And the OneAgent lets is automatically see all the SQL statement details. To see them, refer to these steps in the picture below:

1 . Click on on the easyTravelBusiness database

2 . Expand the `easyTravelBusiness` tile

3 . Click on `View database statements`

![image](/images/service-db.png)

## What did we learn

From both these perspectives, We now know that the bulk of the time is spent in the CreditCardValidation service, BUT more importantly and we also learned that both the BookingService and the CreditCardValidation service communicate to this database. **An important detail for planning!!**

## How this helps

The service flow and the database statements will also help you right size your database instance in the new environment and scale depending on the resource consumption during regular business and off business hours.
