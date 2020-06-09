---
title: "Cloud9"
chapter: false
weight: 10
---

![image](/images/jess.png)

[AWS Cloud9](https://aws.amazon.com/cloud9/) is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser. It includes a code editor, debugger, and terminal. Cloud9 comes prepackaged with essential tools for popular programming languages, including JavaScript, Python, PHP, and more, so you don’t need to install files or configure your development machine to start new projects.

### Add a new Cloud9 environment

1 . Navigate to the the cloud9 console page from [this link](https://console.aws.amazon.com/cloud9/home) or just search for it.

![image](/images/c9-search.png)

2 . Click the `Create environment` button

![image](/images/c9-create.png)

3 . For the name use `dynatrace-workshop`

![image](/images/c9-name.png)

4 . Keep the default settings and create the environment

![image](/images/c9-settings.png)

{{% notice info %}}
This will take about 1-2 minutes to provision
{{% /notice %}}

5. When it comes up, customize the environment by closing the **welcome tab**
and **lower work area**, and opening a new **terminal** tab in the main work area.

![c9before](/images/c9before.png)

6. Your workspace should now look like this:

![c9after](/images/c9after.png)

{{% notice tip %}}
If you like this theme, you can change your theme by selecting **View / Themes** in the Cloud9 workspace menu.
{{% /notice %}}

{{% notice tip %}}
Ad blockers, javascript disablers, and tracking blockers should be disabled for
the cloud9 domain, or connecting to the workspace might be impacted.
Cloud9 requires third-party-cookies. You can whitelist the [specific domains]( https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-env-loading).
{{% /notice %}}