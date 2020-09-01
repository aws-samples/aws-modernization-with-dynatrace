+++
title = "Services Setup"
chapter = false
weight = 30
+++

![image](/images/emma.png)

Davis is designed to work with a baseline of behavior that usually takes several hours or days to establish.  Since we don't have time in this workshop to wait, we are going to use a feature of adjusting the anomoly detection rules for a couple of services so that Davis AI will detect a problem quickly.

Once we complete this seutp, we are going to trigger a problem that we will review together.

## Journey Service

1 . Navigate to the **Transactions and services** menu

![image](/images/dt-ai-pickservice.png)

2 . Use the filter to first find `JourneyService`.  Then type in **tag** and choose **workshop-group** and **ez-travel-monolith**.  From the remaining list pick the one highlighted here.

![image](/images/dt-ai-journey-filter.png)

3 . On the service page, pick the **Edit** menu item

![image](/images/dt-ai-journey-edit.png)

4 . Navigate to **Anomoly Detecection** menu

![image](/images/dt-ai-journey-enable.png)

5 . Turn off **Use global Anomaly detection settings**.  Adjust the settings for **Detect reponse time degrations**

![image](/images/dt-ai-journey-settings.png)

## Booking Service

1 . Navigate to the **Transactions and services** menu

![image](/images/dt-ai-pickservice.png)

2 . Use the filter to first find `BookingService`.  Then type in **tag** and choose **workshop-group** and **ez-travel-monolith**.  From the remaining list pick the one highlighted here.

![image](/images/dt-ai-booking-filter.png)

3 . On the service page, pick the **Edit** menu item

![image](/images/dt-ai-booking-edit.png)

4 . Navigate to **Anomoly Detecection** menu

![image](/images/dt-ai-booking-enable.png)

5 . Turn off **Use global Anomaly detection settings**.  Adjust the settings for **Detect increase in failture rate**

![image](/images/dt-ai-booking-settings.png)

## When complete, navigate to next page to enable a problem 