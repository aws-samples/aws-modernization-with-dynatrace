---
title: "Review Kubernetes within Dynatrace"
chapter: false
weight: 4
---
## Review Kubernetes within Dynatrace

In this step we will walk through the different Dynatrace dashboards that are available out of the box for monitoring Kubernetes.

### Tasks to complete this step
1. Validate AWS ActivateGate visible in Dynatrace UI</summary>
   1. Go to the Dynatrace UI.<br>
   2. From the Dynatrace Menu, click `Manage --> Deployment status` to review OneAgent Deployment status<br>
   3. Within the `Deployment status` page, next click on the `ActiveGate` option to review the Active Gate. <br>
   4. From Dynatrace menu on the left, go to Manage -> Deployment Status -> ActiveGates, you will notice there is a `dynatrace-workshop-cluster-activegate-0` connected to your Dynatrace environment now.  This actigate gate routes all the agent traffic from apps that are running on that AKS cluster. <br>

1. Review Kubernetes Dashboards are accessible from the left-side menu in Dynatrace choose `Kubernetes` and navigate to the Kubernetes cluster page as shown below: <br>
      📓**Note:** Be sure that your management zone is NOT filtered!**

      ![image](/images/aws-lab7_lab2-k8s-layers.png)

      **1 - Kubernetes cluster** - A summary the Kubernetes cluster is shown at the top of the Kubernetes dashboard.<br>

      **2 - Nodes** - The resources for the Cluster are summarized for the one-to-many hosts or Cluster nodes in this view.
      Explore specific node in the Node Analysis section, pick the analyze nodes button.
      ![image](/images/aws-lab7_lab4-aks-nodeutiliz.png)

      **3 - Namespaces** - Namespaces are ways to partition your cluster resources to run multiple workloads (for example `application A` and `application B` workloads) on same cluster
      1.	This workload section shows workloads over time
      2.	In the Cluster workload section, pick the view all workloads button.
            ![image](/images/aws-lab7_lab4-aks-workload.png)
      - In the filter, pick namespace then staging
            ![image](/images/aws-lab7_lab4-aks-workload-filter.png)

      **4 - Kubernetes workload**
      - Pick the frontend to drill into.
         ![image](/images/aws-lab7_la4-aks-kubeworkload.png)
      - Review the workload overview page to look at various metrics related to the workload.
      - Click on Kubernetes POD to look at POD utilization metrics.
         ![image](/images/aws-lab7_lab4-aks-frontend-workload.png)

      **5 - POD** - Review the POD overview page to look at various metrics related to the POD
      - Click on Container next to look at container metrics      
         ![image](/images/aws-lab7_lab4-aks-pod.png)
       

      **6 - Containers** - Referring to the diagram above, expand the properties and tags section to view:
      - Container information
      - Kubernetes information
      - In the info graphic, pick the service to open the services list
      - In the service list, click on k8-frontend service
      ![image](/images/aws-lab7_lab4-aks-container.png)

      - Next click on 2 Services Icon to review the services running inside the container
      - Select the active front-end service.
      
      **7 - Service** - This view should now look familiar. In Lab 1, we looked at the service for the frontend and backend.  Notice how the Kubernetes information is also available in the service properties.  
            ![image](/images/aws-lab7_aks-layer7-service.png)
      

