+++
title = "Role-Based Access Control"
chapter = true
weight = 50
+++

# Role-Based Access Control

<u><b>Scenario</b></u>: The Sock Shop app is mostly developed by contractors
- There is an internal devops team but otherwise the developers are not company employees 
- The corporate policies are that non-employees should not have access to any customer or production-related data
- Both dev and prod apps are running on a Kubernetes cluster so the same Dynatrace environment has data from multiple namespaces altogether
- During the previous exercises, we have seem how we can define Management Zones to segregate views based on custom rules
- Let's now see how we can provide role-based access control to Management Zones so Sock Shop developers can only access the data they need and are allowed to. 

## Create new User Groups

- Go in <i>User</i> (User icon, top right) <i>-> Account Settings -> Group Management</i>

![account_settings](/images/account_settings.png)

- We will create a user group for Sock Shop developers
  - Click on <b>Add group</b>
  - Provide a <b>Group name</b> of your choice (e.g. `sockshop dev`)
  - Configure the group to only access Sock Shop dev environment (management zone)
  - Click on <b>Save</b>

![new_user_group](/images/new_user_group.png)

## Invite new user

- Go in <i>User Management</i> and click <b>Invite user</b>
- Enter an email address <b>(1)</b> for the new user (use a real email address – you will need to retrieve the invite email)
  
    ![invite_new_user](/images/invite_new_user.png)  

- Assign the user to the `sock shop dev` group only <b>(2)</b>
- Expand the <b>Environment permissions</b> section to validate the user only access  the <b>ns:dev</b> management zone with the appropriate permissions <b>(3)</b>
- Click on <b>Invite</b> <b>(4)</b>

    ![user_group_assignation](/images/user_group_assignation.png)


## Retrieve invitation and sign up

- Retrieve the invitation email
- Either logout of your current session, open a `Private` or `Incognito` window or use a different browser to confirm the invitation and sign up
- Then log in with the new user account  

![invitation_email](/images/invitation_email.png)

## Validate data access in Dynatrace

- Once logged in as the new user, navigate around. 
- You will see your new user only have access to Sock Shop data related to the Kubernetes <b>dev</b> namespace.

![services_filtered_dev_namespace](/images/services_filtered_dev_namespace.png)

{{% children showhidden="false" %}}
