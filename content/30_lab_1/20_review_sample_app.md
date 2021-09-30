---
title: "Sample app"
chapter: false
weight: 20
---

The sample application is called Dynatrace Orders.  A more detailed overview can be found <a href="https://github.com/dt-orders/overview" target="_blank">here</a>.  All the source code can be found <a href="https://github.com/dt-orders" target="_blank">here</a>.

## Get the Public IP to the frontend of the Sample Application.

To get the Public IP, open the `EC2 instances` page in the AWS console. On the newly created host `YOURNAME-dt-orders-monolith` find the `Public IP` as shown below.

![image](/images/setup-vm-ip-address.png)

## View the Sample app in a Browser

To view the application, paste the public IP using `HTTP` NOT `HTTPS` into a browser that will look like this:

![image](/images/lab1-app.png)

Use the menu on the home page to navigate around the application and notice the URL for key functionality.  You will see these URLs later as we analyze the application.

* Customer List = `customer/list.html`
* Customer Detail - Each customer has a unique page = `customer/5.html`
* Catalog List = `catalog/list.html`
* Catalog Search Form = `catalog/searchForm.html`
* Order List = `order/list.html`
* Order Form = `order/form.html`
