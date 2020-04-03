---
title: "Main Page"
chapter: true
weight: 1
---

# Main Page

Welome content for Dynatrace AWS EKS Monitoring

## TO FINALIZE --- Workshop Use cases

Structure the workshop around the problems DevOps typically faces when managing EKS.

example: Operational Problem we help solve....e.g.
    Something blew up (spike in load or error)
    Show Diagnose an issue in the cluster
    What the specific EKS problem....e.g. ran out of IP and can't autoscale can't handle load.  show how we visualize crash-loop
    How we layer DT on top of EKS

example: AppDev Problems with deployment and Failures 
    New promotional campaign release.  build has defects that cause errors.  Look at alerts & diagnostics
    Pre-Prod "slow down".  detect with load
    pod starts with no resource limits. Causes failures in the app
    IDEA - new feature to view k8 events (nodes with cpu pressure. part of davis root cause analysis)

Ideas for lab flow....

1. Gain basic observality to nodes, pods, and ns
    - install agent & db
    - install SS app
    - review OOB tags based on k8 lables
    - k8 events w/ dashboard
1. Add custom structure for sample app --> to enable more filtering for views, dashboard & alerts
    - setup process & service naming
    - MZ setup for  
1. Add another app and segment 
    - resusable dashboard with filtering by MZ
1. Rule based security
1. Alerting rules