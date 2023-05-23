---
title: "Metric Streams"
chapter: false
weight: 4
---
## Metric Streams

Dynatrace Davis automatically analyzes abnormal situations within your IT infrastructure and attempts to identify any relevant impact and root cause. Davis relies on a wide spectrum of information sources, such as a transactional view of your services and applications, as well as all on events raised on individual nodes within your Smartscape topology.

There are two main sources for single events in Dynatrace:

* Metric-based events (events that are triggered by a series of measurements)
* Events that are independent of any metric (for example, process crashes, deployment changes, and VM motion events)

Custom metric events are configured in the global settings of your environment and are visible to all Dynatrace users in your environment.

### 1. Setup Custom metric alerting for AWS

1 . To add custom alerts, navigate to `Settings --> Anomaly Detection --> Metric events` menu. 

2 . Click the `Add metric events` button.

![image](/images/aws-lab4_addmetricevent.png)

3 . Fill in the below information on the `Add metric event` template
1.  Summary:  `CPU % percentage`
2.  Type:  `Metric key` from dropdown
3.  Metric key `EC2 CPU usage %` from dropdown
4.  Agregation `Average` from dropdown
5.  Management zone `dt-orders-monolith`
6.  under entities click on `>` to see `Dimension key of entity type` and select `EC2 instance` from dropdown

![image](/images/aws-lab4_dimensionkey.png)

7.  Dymension filter click on `Add dimension filter` and select as shown below.

![image](/images/aws-lab4_adddimensionfilter.png)

8.  under Monitoring strategy section select as shown.

![image](/images/aws-lab4_monotoringstrategy.png)

9.  select the `>` next to `Advanced model properties` and input as shown.

![image](/images/aws-lab4_advancedmodelproperties.png)

10. In the `Event template` section add:
    1. Title:  `CPU CUSTOM ALERT`
    2. Event type from dropdown:  `Custom alert`
    3. Dimension key of entity for events select `EC2 instance` from dropdown

![image](/images/aws-lab4_keydimensionofentity.png)

11. click on `Save Changes`

4 . Add another rule, with everything the same, except for the `Event Description` to have the `title` as `CPU Resource Alert` and `Event type` = `RESOURCE` as shown below. 
  1. toggle the `Alert on missing data` to `off`

![image](/images/aws-lab4_eventtemplate.png)

5 . Save your changes and the list should look as shown below.

![image](/images/aws-lab4_savedmetricevents.png)

### 2. SSH to monolith host 

To connect to the host, simply use `EC2 Instance Connect`.  To this, navigate to the `EC2 instances` page in the AWS console.

From the list, pick the `dt-orders-monolith` and then the `connect` button.

![image](/images/aws-lab4_aws-ec2-connect-list.png)

Then on the next page, choose the `EC2 Instance Connect` option and then the `connect` button.

![image](/images/aws-lab4_aws-ec2-connect.png)

Once you connected, you will see the terminal prompt like the below.

```
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-1045-aws x86_64)
...
...
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
ubuntu@ip-10-0-0-118:~$ 
```

### 3. Trigger a CPU problem

Using a unix utility <a href="https://linuxconfig.org/how-to-stress-test-your-cpu-on-linux" target="_blank">yes</a>, we can generate CPU stress just by running the `yes` command a few times.

In the terminal, copy all these lines and run them:

```
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &
```

To verify, run this command:

```
ps -ef | grep yes
```

The output should look like this:

```
ubuntu    5802  5438 99 20:48 pts/0    00:00:05 yes
ubuntu    5805  5438 89 20:48 pts/0    00:00:04 yes
ubuntu    5806  5438 97 20:48 pts/0    00:00:03 yes
ubuntu    5818  5438  0 20:48 pts/0    00:00:00 grep --color=auto yes
```

3 . Back in Dynatrace within the `host` view, the CPU should now be high as shown below

![image](/images/aws-lab4_lab4-cpu.png)

4 . It may take a minute or so, but you will get two problem cards as shown below.  #1 is the alert from the `severity = RESOURCE` where Davis was invoked, and #2 is the alert from `severity = CUSTOM ALERT`.

![image](/images/aws-lab4_lab4-custom-alert-problems.png)

### 4. Review Problem Notifications

1 . Navigate to `Settings --> Integrations --> Problem Notifications` 

2 . Read the overview and then click the `Add Notification` button

3 . Click various `Notification types` from the drop down to review the configurations inputs.

4 . For the `Custom integration` type, review the option to customize the payload.

5 . Notice how you can choose the `Alert profile`, but you only have default

### 5. Review Alerting Profiles

1 . Navigate to `Settings --> Alerting --> Alerting profiles`

2 . Read the overview and then expand the `default` rule.

3 . Now add one, by clicking on the `Add alerting profile` button

4 . Review the options to choose severity rules and filters

### 6. Stop the CPU problem

To stop the problem, you need to `kill` the processes.  To do this:

1 . Back in the CloudShell, run this command to get the process IDs `ps -ef | grep yes`

2 . For each process, copy the process ID and run `kill <PID>`

For example:

```
#### If output is this...

ubuntu@ip-10-0-0-118:~$ ps -ef | grep yes
ubuntu    5802  5438 99 20:48 pts/0    00:00:05 yes
ubuntu    5805  5438 89 20:48 pts/0    00:00:04 yes
ubuntu    5806  5438 97 20:48 pts/0    00:00:03 yes

#### Then run...

kill 5802
kill 5805
kill 5806
```

3 . Verify they are gone by running this again `ps -ef | grep yes`

4 . Verify that CPU in Dynatrace goes to normal and the problems will eventually automatically close

### 6. Exit the SSH

Simply type `exit` to exit the VM and return the CloudShell.

### 💥 **TECHNICAL NOTE** 

* Alert configuration is available through the <a href="https://www.dynatrace.com/support/help/dynatrace-api/configuration-api/anomaly-detection-api/anomaly-detection-api-metric-events/" target="_blank">Anomaly detection—metric events API</a>. Using the API, you can list, update, create, and delete configurations.

