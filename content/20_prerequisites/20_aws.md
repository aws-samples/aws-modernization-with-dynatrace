---
title: "AWS Account Setup"
chapter: true
weight: 20
---

# Self-Paced Workshop

This workshop requires an AWS account where there is IAM user/identity that has proper permissions to set up the necessary AWS components to work through the workshop. Worried about costs associated with this workshop? Don't worry, there's a page that will allow you to request for AWS credits to pay for any costs incurred through this workshop!

You will need permission to add/delete: VPCs/subnets/Routes/IGWs/Route tables, CloudFormation Stacks, and EC2s/security groups/keypairs.
* If you are using an AWS trial account, you should have `AdministratorAccess` policy, so this is all you need. 
* If you are using an account owned by your organization, please ensure you have the right permissions and authority. 

If you already have an account, you can skip the `setting up your AWS account` section below

## Setting up your AWS account

{{% children %}}

{{% notice warning %}}
You are responsible for the cost of the AWS services used while running this workshop in your AWS account. We highly recommend you request AWS credit so you can run this workshop without any charge to you.
{{% /notice %}}

1. If you don't already have an AWS account with Administrator access: [create
one now by clicking here](https://aws.amazon.com/getting-started/)

1. Once you have an AWS account, ensure you are following the remaining workshop steps
as an IAM user with administrator access to the AWS account:
[Create a new IAM user to use for the workshop](https://console.aws.amazon.com/iam/home?#/users$new)

1. Enter the user details:
![create user](/images/iam-1-create-user.png)

1. Attach the AdministratorAccess IAM Policy:
![attach policy](/images/iam-2-attach-policy.png)

1. Click to create the new user:
![finish creation](/images/iam-3-create-user.png)

1. Take note of the login URL and save:
![login url](/images/iam-4-save-url.png)

## AWS Credit Request

<table class="credit" style="width:100%">
<tr class="credit">
  <td class="credit" style="width:70%">To help you cover the AWS service costs incurred by doing this tutorial,
AWS Credits are available courtesy of AWS Marketplace. Submit the form and you
will receive a confirmation email with an AWS Credit Code. Credits are 
available while supplies last.
  </td>

  <td class="credit" style="width:30%"> <a href="https://pages.awscloud.com/awsmp-wsm-dev-workshop-series-credit-request.html?trk=lab_dynatrace" target="_blank" class="credit-btn">Request AWS Credits</a>  </td>
</tr>
</table>
<table class="credit" style="width:100%">
<tr class="credit">
  <td class="credit" style="width:40%"> 
      <a href="https://aws.amazon.com/marketplace/pp/prodview-wxdauvo3ohksc?trk=el_a134p000003yrYeAAI&trkCampaign=AWSMP_pdp_dev_x_dg&sc_channel=el&sc_campaign=el_awsmp_mult&sc_outcome=Marketplace" target="_blank"><img src="/images/available-in-awsmp-badge.png"></a>
  </td>

  <td class="credit" style="width:60%">

  </td>

</tr>
</table>


<table class="credit">
<tr class="credit"><td class="credit" style="width:100%">
{{% notice note %}}
[AWS Marketplace](https://aws.amazon.com/marketplace/solutions/devops) is a digital software catalog that makes it easy to find, try, buy, deploy, and manage 
software that works with AWS. AWS Marketplace has over 8,000 listings from 1,600+ ISV's that can
help you master DevOps and drive modern application development in the cloud.
{{% /notice %}}
</td></tr>
</table>