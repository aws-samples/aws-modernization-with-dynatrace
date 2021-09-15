---
title: "Technologies and processes"
chapter: false
weight: 92
---

By default, Dynatrace gives you FullStack horizontal (who talks to whom) and vertical (what runs on what) dependency visibility as part of Dynatrace Smartscape! All without a single line of code or configuration change – just by installing the OneAgent.

Seeing which processes make up the monolith has been an eye-opener for many teams that have done this exercise. “Oh – we completely forgot about the dependency to this legacy process we introduced 5 years ago!” – that’s a common thing you hear!

As you plan your migration, knowing what technologies make up your eco-system is key so what you can decide whether to migrate, refactor or replace certain services.

The workshop is somewhat limited, so here is an example from another environment.

![image](/images/lab1-technology-demo.png)

## 👍 How this helps

This is another out-of-the-box feature that helps you understand what technologies are in your environment with a heat map presentation to what degree they exist.

## Review Technologies and processes View

1. Click on the **Technologies and processes** link on the left side menu within Dynatrace to view the technologies that OneAgent was able to automatically discover and instrument.

    ![image](/images/lab1-technology.png)

1. In the filter box, type `tag`, choose `stage`, and the value of `dev`. It should look like this:

    ![image](/images/lab1-technology-filter.png)

## Planning Ahead

You can always click into the `Hub` menu within Dynatrace to learn about the many technologies that Dynatrace supports.  This list is in sync and constantly updated in conjunction with the <a href="https://www.dynatrace.com/hub" target="_blank">Dynatrace website hub page</a>
