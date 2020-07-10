+++
title = "Dynatrace"
chapter = false
weight = 20
+++

### Remove workshop Config

Once you clean up the AWS workshop resources, you may want to remove the Dynatrace configuration that was added as part of the [workshop setup](/15_workshop_setup/40_workshop_setup.html).

To do this, just run this script and it will clean up the Dynatrace configuration by calling the Dynatrace API.

```
cd ~/modernize-workshop-setup/dynatrace
./cleanupWorkshopConfig.sh
```

