+++
title = "Add Synthetic Browser Monitors"
chapter = false
weight = 10
+++

Execute the following script to automatically create <b>Web Application</b> monitoring configuration and <b>Synthetic Browser Monitors</b> in Dynatrace.

- The idea is to avoid spending time in this exercise to manually configure the Sock Shop web apps and the Synthetic monitors using the Dynatrace console.
- Instead, the script automates this configuration via the Dynatrace REST API, using the config token you created earlier in this exercise

The Synthetic tests will generate steady traffic to your Sock Shop production web app.

```
./config-dt-webapps-synth.sh 
```

Once this script is executed, take a look at the result in Dynatrace.

- In the menu, go in <i>Applications</i>. You will see two new <i>Web Applications</i> defined : 
  
  - Sock Shop - Production
  - Sock Shop - Dev

    ![applications](/images/applications.png)

In Dynatrace, an <i>Application</i> represents the front-end, what is end-user facing. The information and metrics related to <i>Application</i> are coming from the end-users.

Click on the <i>Sock Shop - Production</i> application and explore. 

Drill-down to <b>Analyze User Sessions</b> to look at the individual user sessions, information about their browser, geographical location and their click path.

The script also created 4 Synthetic Monitors. These are scripts continuously executed from real browsers at a given frequency from specified geographical locations. 

- Synthetic Monitoring is a complement to Real User Monitoring
- It allows to benchmark execution of critical business transactions in a consistent manner
- It also measures availability. The test runs all the time, 24 hours by 7 days, even at times when there are no users on your apps. This allows to detect issues proactively, before real users report them.  

- In the menu, go in <i>Synthetic</i>. You will see 4 monitors defined.
  
  ![synthetic](/images/synthetic.png)

It will take a few minutes before all 4 Synthetic Monitors show up and a bit longer until they are start generating traffic.

## <b>OPTIONAL... but cool!</b> :metal: Tag User Session names

Dynatrace automatically capture the end user experience of our Shock Shop customers. For a variety of purposes, it would be very helpful to be able to search and find user sessions by their user name. 

Well, this is of course possible with Dynatrace! And it's just a few clicks to configure.

- In the menu, go in <i>Applications</i> then click on <b>Sock Shop - Production</b>
- Click on the <b>...</b> button (top right)
  
  ![application_view](/images/application_view.png)

- Click on <b>Edit</b>

    ![edit_application](/images/edit_application.png)

- Go in <i>Application Settings->User tag</i> and click the <b>Add tag (identifier) rule</b>
  1. In the <b>Expression type to capture</b> drop-down, select `CSS selector`
  2. In the <b>CSS selector</b> text box, enter `#howdy > a`
      - This tells the Dynatrace agent to capture the text displayed on the web page and associated to the CSS selector
      - This selector corresponds to the full user name (firstname lastname) displayed top right after log in
  3. Toggle on <b>Apply cleanup rule</b>
  4. In the <b>Regex</b> text box, enter `\s(\w+)$`
      - This regex captures only the last word from a given string (in this case, captures only the last name)    
  5. To test the regex, enter a user full name in the <b>Sample input</b> text box. For example: `Dynatrace Perform`. 
     - Click <b>Test</b>
     - The output will be `Perform`
  6. Click <b>Add tag (identifier) rule</b>

    ![add_tag_rule](/images/add_tag_rule.png)

  7. Don't forget to click on the <b>Save</b> button (bottom right)
   
    ![save_tag_rule](/images/save_tag_rule.png)

Give it some time (a few minutes) and then you can go, from the menu, in the <b>User Sessions</b> view and you should now see user sessions displayed by user name.

If you manually, from your browser, run transactions in the Production Sock Shop web app with a registered user, you will see your session tagged by user name (user last name is displayed).

![user_sessions](/images/user_sessions.png)

## <b>ALSO OPTIONAL... but even cooler!</b> :metal::metal: Enable Session Replay

Dynatrace also allows you to record sessions that you can visually replay.

<u>NOTE</u>: For replays to render properly, you need to use the <b>Google Chrome</b> browser with the <b>Dynatrace Real User Monitoring</b> extension. Replay will still be available if using different browser or Chrome without the extension but will not be rendered accurately and some objects will be missing.

![chrome_extension](/images/chrome_extension.png)

To enable <b>Session Replay</b>: 

- In the menu, go in <i>Applications</i> then click on <b>Sock Shop - Production</b> then <b>Edit</b> as you did for the previous step.
- Go in <i>Application Settings->Session Replay</i> and toggle on the <b>Enable Session Replay</b> switch

    ![enable_session_replay](/images/enable_session_replay.png)

- Don't forget to click on the <b>Save</b> button (bottom right)

<u>NOTE</u>: Session replays will only be available for real users, not for Synthetic Monitors. So if you want to watch a replay, you will need to run some transactions, from your browser, on the Production Sock Shop web app.

After running transactions from your browser, give it a few minutes, go in <b>User Sessions</b> and search for your session by user name or filter for Session Replay=yes. You will see sessions with replays have a "Play" icon

![user_session_replay](/images/user_session_replay.png)

Click the "Play" icon to watch the session replay, enjoy!

You can also click the picture below to watch a Youtube video of a session replay.

[![replay_video](https://img.youtube.com/vi/7kNSGCbC82g/0.jpg)](https://youtu.be/7kNSGCbC82g)

{{% children showhidden="false" %}}
