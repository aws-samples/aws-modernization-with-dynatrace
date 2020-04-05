+++
title = "Setup alert notifications"
chapter = false
weight = 80
+++

** IDEA  alerting ---> Send problem --> to Chime or SMS based on tags --> use the problem ID to link back drill to root cause
** If fake out the anomoly detection, then need to explain demo vs. real world. like setting the baseline manually

# Setup alert notifications

<u>Scenario:</u> 

The Kubernetes platform admin team works with different tools and they want to receive their alert notifications by email.

On the other hand, the teams in charge of development and support/ops of the Sock Shop services use a chatops tool such as Slack. There are specific Slack channels for each service and also channels for dev and channels for support/ops.

For example: 

- the "carts dev team" only want to receive alerts related to the <b>carts</b> service running in <b>dev</b> on their Slack channel
  - they don't want to receive anything related to <b>production</b> on that channel
- the "carts support/ops team" only want to receive <b>production</b> related alerts on their channel and only those involving the <b>carts</b> service
- both teams are using the Kubernetes platform but they are not in charge of it; this is the platform admin team who does that
  - in consequence, they don't want to receive infrastructure-only related alerts

## Kubernetes platform admin team

### Create an Alerting Profile for the Kubernetes platform admin team

- In the menu, go in <i>Settings -> Alerting -> Alerting profiles</i>
- Create a new profile named : `k8s infra`
- In the <b>Define management zone filter for profile</b> select `[Kubernetes] My HOT k8s cluster`
- Expand the <b>Resource alert</b> Severity Rule. Set the <b>Send notification if a problem remains open longer than</b> to `5 minutes`. Click <b>Save</b>

    ![k8s_infra_resource_alert_rule](/images/k8s_infra_resource_alert_rule.png)

- That's it! You can click <b>Done</b>
  - Because the selected <b>Management Zone</b> already filter for only <b>Hosts</b> and <b>Process Groups</b> part of the Kubernetes cluster and we removed the <b>Services</b> entities from the <b>Management Zone</b> definition, this <b>Alerting Profile</b> will result in only sending alerts related to Kubernetes cluster infrastructure (hosts/nodes + processes/containers)

### Create a Problem Notification mechanism for the Kubernetes platform admin team

You will set up problem notification to send emails to the Kubernetes platform admin team.

- In the menu, go in <i>Settings -> Integrations -> Problem notifications</i> 
- Click on <b>Set up notifications</b> 
- Select <b>Email</b>

    ![problem_notification_setup](/images/problem_notification_setup.png)

- Enter a name of your choice for the setting
- Enter an email address (1)
  - Use a real email address that you can access 
- At the bottom, select the `k8s infra` Alerting Profile (2)
- Click <b>Send test notification</b> to test your setup (3) 
- Check you emails. You should have received a test problem notification email. If successful, click <b>Save</b> (4)

    ![k8s_team_notification_setup](/images/k8s_team_notification_setup.png)

## Sock Shop carts service dev team

### Create an Alerting Profile for the carts service dev team

- In the menu, go in <i>Settings -> Alerting -> Alerting profiles</i>
- Create a new profile named : `carts dev`
- In the <b>Define management zone filter for profile</b> select `ns:dev`
- The dev team environment have their apps running under tests. 
  - The test environments are not always up. 
  - So they're not concerned by availability. 
  - Their concerns are performance, errors and resource utilization
- So remove <b>Severity Rules</b> to only keep:
  - Error alert
  - Slowdown alert
  - Resource alert
- We need to add filter to only scope the carts service. For each of those <b>Severity rules</b>, do:
  - Expland the rule
  - Set the <b>Send notification if a problem remains open longer than</b> to `0  minutes`
  - From <b>Filter problems by tag</b>, select `Only include entities that have all tags`
  - Click <b>Create tag filter</b>
  - Select tag : `[Kubernetes]app:carts`
  - Click <b>Save</b>
- Once you have done all 3 rules, your <b>Alerting Profile</b> configuration should like below: 

    ![alerting_profile_carts_dev](/images/alerting_profile_carts_dev.png)


### Create a Problem Notification mechanism for the carts dev team

You will set up problem notification to send messages to the carts dev team via their Slack channel.

- In the menu, go in <i>Settings -> Integrations -> Problem notifications</i> 
- Click on <b>Set up notifications</b> 
- Select <b>Slack</b>
- Enter a name of your choice for the setting, for example: `carts dev team`
- Use the following webhook URL:
  - `https://hooks.slack.com/services/TSUACBL6B/BSF0ZKRQB/`
    - For which you will add this, at the end: `TJUjduBvQ4wFW0sR811QwC7O`
- Enter the following channel: `#carts-dev`
- In title, enter `<your_name> {State} Problem {ProblemID} {ProblemTitle} {ImpactedEntity}`
  - Replace `<your_name>` with your name or whatever you prefer that can identify yourself
- At the bottom, select the `carts dev` <b>Alerting Profile</b>.
- Click <b>Send test notification</b> to validate your configuration 
- In your browser, open the `#carts-dev` Slack channel using this URL : `https://hot-k8s.slack.com/archives/CTF9PTMNU`
  - User name : `perform@email.com`
  - Password : `performHOT`
- Look at the test messages and find yours

    ![slack_carts_dev_test_run](/images/slack_carts_dev_test_run.png)

- If successful, go back to the Dynatrace console and click <b>Save</b>

## Sock Shop carts service support/ops team

### Create an Alerting Profile for the carts service support/ops team

- In the menu, go in <i>Settings -> Alerting -> Alerting profiles</i>
- Create a new profile named : `carts support/ops`
- In the <b>Define management zone filter for profile</b> select `ns:prod`
- The support/ops team concerns are different than dev:
  - Same as dev, their concerns are performance, errors and resource utilization
  - But availability is crucial 
- So <b>Severity Rules</b> to keep are (remove the rest):
  - Availability
  - Error alert
  - Slowdown alert
  - Resource alert
- We need to add filter to only scope the carts service. For each of those <b>Severity rules</b>, do:
  - Expland the rule
  - Set the <b>Send notification if a problem remains open longer than</b> to `0  minutes`
  - From <b>Filter problems by tag</b>, select `Only include entities that have all tags`
  - Click <b>Create tag filter</b>
  - Select tag : `[Kubernetes]app:carts`
  - Click <b>Save</b>
- Once you have all 4 rules done, your <b>Alerting Profile</b> configuration should like below: 

    ![alerting_profile_carts_ops](/images/alerting_profile_carts_ops.png)

### Create a Problem Notification mechanism for the carts support/ops team

You will set up problem notification to send messages to the carts support/ops team via their Slack channel.

- In the menu, go in <i>Settings -> Integrations -> Problem notifications</i> 
- Click on <b>Set up notifications</b> 
- Select <b>Slack</b>
- Enter a name of your choice for the setting, for example: `carts support/ops team`
- Use the following webhook URL:
  - `https://hooks.slack.com/services/TSUACBL6B/BT2G9TE7L/`
    - For which you will add this, at the end: `VWExFaiDu4i4cwaV9OzfAqPt`
- Enter the following channel: `#carts-support-ops`
- In title, enter `<your_name> {State} Problem {ProblemID} {ProblemTitle} {ImpactedEntity}`
  - Replace `<your_name>` with your name or whatever you prefer that can identify yourself
- At the bottom, select the `carts support/ops` <b>Alerting Profile</b>.
- Click <b>Send test notification</b> to validate your configuration 

    ![slack_channels](/images/slack_channels.png)

- In <b>Slack</b>, switch to the `#carts-support-ops` channel
  - Look at the test messages and find yours
- If successful, go back to the Dynatrace console and click <b>Save</b>

## Meanwhile...

<u>Scenario</u>: Projects are moving fast withinin the company.

A hot new service is being pushed onto the cluster.

### Deploy the <b>" hot new service"</b>

Execute the following command to deploy the service:

```sh
$ ./deploy-hot-new-service.sh
```
### Turn on the promo campaign

The marketing team has a promo campaign they had implemented. The project was fast-tracked and is now deployed in production.

![promo_socks](/images/promo_socks.png)

- The deployment mode for this promo campaign is using a feature flag
- By default, the promo is disabled but it can be enabled on the fly using an API call

The day for the release of the promo has come. Enable the promo feature by running the following command and enter `1` at the prompt

```sh
$ ./toggle-sockshop-promo-ff.sh
```

### Deploy new carts build in dev

Also, in parallel, there are changes coming again to the <b>carts</b> services. The dev team is working on some new feature for marketing.

Execute the following command to deploy a new <b>carts</b> build in dev:

```sh
$ ./deploy-carts-new-build.sh
```

## Problems?

<u>Keep an eye on the Slack channels and your emails</u> ... at one point you will receive one or two emails from the "Dynatrace team"

![email_notification_cpu](/images/email_notification_cpu.png)

- You can click on the Open in browser link or look at <b>Problems</b> in the Dynatrace menu

- We see 2 hosts are experiencing CPU saturation

    ![cpu_saturation_problems](/images/cpu_saturation_problems.png)

- We see the same by looking at <b>Kubernetes</b> view which shows 2 problematic <b>nodes</b>

    ![kubernetes_problematic_nodes](/images/kubernetes_problematic_nodes.png)

- Click on <b>Analyze nodes</b> (bottom right) to get more details on the nodes. We see 2 nodes are at 99% CPU utilization
  
    ![kubernetes_node_analysis](/images/kubernetes_node_analysis.png)

- Drill-down into one of these 2 nodes to get to the <b>Host</b> view. 
- Look at <b>CPU Usage</b>

    ![host_cpu_usage](/images/host_cpu_usage.png)

- Click on <b>Consuming processes</b>. The processes (containers) running on the host (node) will be listed. Sort them by `CPU usage` and you will see the culprit, the "hot new service" container. 

    ![host_consuming_processes](/images/host_consuming_processes.png)

- This issue had the potential to create bigger problems impacting the whole cluster and the rest of the workload. The pod definition in this case does not have any resource limit. But the service itself needs to be fixed and until then, we will remove this from the cluster.

    ```sh
    $ ./undeploy-hot-new-service.sh
    ```

- The CPU consumption on the nodes will go back to normal. Within a few minutes you will receive a `RESOLVED Problem` email notification.


If you look back at Slack, you should have received notifications on the `#carts-support-ops` channel; if not, wait a bit.
  
  ![slack_cart_support_ops_problem_open](/images/slack_carts_support_ops_problem_open.png)

- Click on the link to drill-down to the <b>Problem</b> details

    ![carts_promo_problem](/images/carts_promo_problem.png)

- The <b>carts</b> service is experiencing a significant transaction failure rate increase, which is always bad but even worse this time because we are in the promo campaign. :rage: 
- Getting back into Dynatrace
  - You can look drill-down to <b>Analyze failure rate degradation</b>

    ![carts_promo_failure_analysis](/images/carts_promo_failure_analysis.png)

    - You can see the error message: something is not implemented right in the promo campaign... But this is affecting the whole <b>carts</b> service and no customer can add items to the cart anymore... This is bad... :grimacing:
    - Good thing we had the promo campaign deployed using a feature flag! We can easily turn off the flag and things should go back to normal.
      - Execute the following command,  entering `2` at the prompt

        ```sh
        $ ./toggle-sockshop-promo-ff.sh
        ```
    - After a few minutes, you will get a message in the #carts-support-ops channel notifying the problem is resolved
  
        ![slack_carts_support_ops_problem_resolved](/images/slack_carts_support_ops_problem_resolved.png)

So Dynatrace helped the Kubernetes platform team to identify a rogue new service and remove it before it causes issues to the rest of the cluster workload.

It also helped to quickly solve a potentially catastrophous problem with the promo campaign.

What about the new build that the dev team is working on? We don't want to repeat past mistakes and deploy a faulty build to production... :unamused:

- Look at the `#carts-dev` Slack channel, there should be a problem notification (if not wait a bit).

    ![slack_carts_dev_problem_open](/images/slack_carts_dev_problem_open.png)

- Seems the currently tested new build is expriencing performance issues. Click on the problem link to drill down into the details.

    ![carts_dev_problem](/images/carts_dev_problem.png)

- Click on <b>Analyze response time degradation</b>

    ![carts_dev_response_time_analysis](/images/carts_dev_response_time_analysis.png)

- What we see here:
  1. The affected request is `addToCart`
  2. The response time for that request is around 9.3 seconds
  3. Top findings tell us that it is essentially all <b>Active wait time</b>
  4. Let's get down to code level by clicking on <b>View method hotspots</b>

    ![carts_dev_method_hotspots](/images/carts_dev_method_hotspots.png)

- What we see here:
  1. Click on <b>Hotspots</b> to switch from the call hierarchy to the hotspot view
  2. Select the first method `Thread.sleep`. 
     - You will see below the reverse method call hierarchy
  3. Click on `expand`
     - You see the `Thread.sleep` method is being called by the `ItemsControllers.addToCart` method

This is the information the dev team need to fix the issue in the code. 

You can also get further down into deep dive by clicking on the drilldown to PurePaths button (top right)

![drill_down_to_PurePaths](/images/drill_down_to_PurePaths.png)

Click on one of the PurePaths listed. You can then look at the PurePath details, which are showing the calls to the MongoDB data store and also that the `addToCart` method is where the time is spent. 

![carts_dev_purepath](/images/carts_dev_purepath.png)

Since this build is bad, you will roll back to the previous build by executing the following commands:

```sh
$ kubectl rollout history deployments carts -n dev
```

This will show you the deployment rollout story. Normally you should have two deployments. 

![carts_dev_rollout_history](/images/carts_dev_rollout_history.png)

That means you need to rollback to `Revision 1`

```sh
$ kubectl rollout undo deployments carts --to-revision=1 -n dev
```
It will take about 5 minutes for the new carts pod to become ready.

Eventually, you will receive a Slack message in the `#carts-dev` channel notifying the problem is resolved.

![slack_carts_dev_problem_resolved](/images/slack_carts_dev_problem_resolved.png)

<b><u>ONE LAST THING</u></b>You should disable or delete your alerting profiles after this class if you don't want to continue receive alert emails.


{{% children showhidden="false" %}}
