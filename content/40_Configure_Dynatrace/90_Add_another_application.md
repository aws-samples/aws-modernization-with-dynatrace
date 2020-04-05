+++
title = "Add another app"
chapter = true
weight = 90
+++

## Deploy a new application

<u>Scenario</u> : The company is developing many products. Aside from <b>Sock Shop</b>, a new project, named <b>guestbook</b>, is starting on Kubernetes.

Execute the following script to deploy guestbook :

```sh
$ ./deploy-guestbook-app.sh
```

Execute the following command to obtain the guestbook home page URL
```sh
$ kubectl get svc -n guestbook
```

Take a note of the External-IP for the `frontend` service and copy it in a new browser tab/window to load the guestbook app home page.

![guestbook_services](/images/guestbook_services.png)

<u>NOTE</u>: If the page does not load, wait one or two minutes and try again. It is possible it takes some time for the DNS to be updated.

### Enter a comment

The app is still very basic :grinning: . 

It's a simple PHP frontend taking comments as input and writing those to a Redis data store. If you reload the app in a different browser, the page will load with the comments previously entered being displayed.

- Enter a few comments to generate transactions

![guestbook_app](/images/guestbook_app.png)

## View the guestbook app in Dynatrace

- Switch to the Dynatrace console, in the <b>Services</b> view, you will see 2 new services
- In the <b>Technologies</b> view, you will also see new technologies associated to the guestbook app processes (Apache HTTP Server, PHP and Redis)
- Select one of those 2 services and drill-down to the underlying process group. Expand the properties and take a look.

![guestbook_dt_services](/images/guestbook_dt_services.png)

## Create Management Zones based on process property

We want to be able to easily segregate views of <b>Sock Shop</b> and <b>guestbook</b>. This is done by leveraging <b>Management Zones</b>. 

The `product` tag (based on the pod label) is a good candidate as a condition for the <b>Management Zone</b> rule.

- Go in <i>Settings -> Preferences -> Management Zones</i>. Click <b>Add Management Zones</b>.
- We will start with Sock Shop. Enter a name for the Management Zone : `app:sockshop`
- Click <b>Add new rule</b>

![create_management_zone](/images/create_management_zone_enter_name.png)

### Configure Management Zone rules

The rule will be based on Process groups <b>(1)</b>. 
- <u>Note</u>: It would also be valid to base it on Services.

The condition is based on a <b>Process Group</b> tag <b>(2)</b>, `product`, auto-imported from a Kubernetes label and of value equal to `sockshop` <b>(3)</b> 

![management_zone_rule_sockshop](/images/management_zone_rule_sockshop.png)

### Preview Management Zone rule

- Click on <b>Preview</b>
  
Preview shows the <b>Management Zone</b> will only apply to <b>Process Groups</b> and <b>Processes</b>. This is normal, this is how we had it defined.

![preview_management_zone_rule_infra](/images/preview_management_zone_rule_infra.png)

### Extending Management Zone rule

The Management Zone rule can be extended to underlying <b>Hosts</b> (nodes) and to <b>Services</b> associated to the <b>Process Groups</b>.

- To extend to <b>Hosts</b> and <b>Services</b>, tick the associated check boxes 

![extend_management_zone_rule](/images/extend_management_zone_rule.png)

- Click on <b>Preview</b>

You now see the <b>Management Zone</b> will apply to services and infrastructure entities such as <b>Hosts</b> and <b>Process Groups</b>.

![preview_management_zone_rule_services](/images/preview_management_zone_rule_services.png)

- <u>DON'T FORGET to click on the <b>Save</b> button!</u> 

### Repeat for the guestbook app

Repeat the same steps for the <b>guestbook</b> app. The only differences are: 

- Name the Management Zone : `app:guestbook`
- Use `[Kubernetes]product` equals `guestbook`
- <u>DON'T FORGET to save!</u> 

![management_zone_rule_guestbook](/images/management_zone_rule_guestbook.png)

## Validate in Dynatrace

- Navigate in the different dashboards
- You will see a filter icon appear in the top menu bar
- Clicking on this button will list the available <b>Management Zones</b> 

![management_zones_filter](/images/management_zones_filter.png)

- Select a <b>Management Zone</b> and navigate to the <b>Services</b> and <b>Technologies</b> views. Notice the difference, the lists are filtered according to the selected zone.

You might have noticed that the <b>Applications</b> and <b>Synthetic Monitors</b> are not part of the defined <b>Management Zones</b>. 

- Again, this is normal. <b>Applications</b> and <b>Synthetic Monitors</b> do not inherit auto-tags from <b>Services</b>, <b>Process Groups</b> or <b>Hosts</b>. 
- They need their own tags to be defined and a corresponding <b>Management Zone rule</b> to be added.

If you look at the <b>Sock Shop - Production</b> application, you will see it already has `product` and `stage` tags assigned. This comes from auto-tagging rules imported via REST API at the same time the web app configuration was imported.

{{% children showhidden="false" %}}
