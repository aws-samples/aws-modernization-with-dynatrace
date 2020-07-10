+++
title = "Databases"
chapter = false
weight = 70
+++

![image](/images/florian.png)

{{% notice note %}}
As you plan your migration, Database observability is critical to a successful plan. Knowing the type of access, executed statements, and amount of data transferred during regular hours of operation allows for better migration planning and prioritization of the move groups. In some cases, you may decide to not migrate this database in favor of other services or databases that are less complex to migrate due to fewer dependencies.
{{% /notice %}}

To learn some out of the box features of Dynatrace, Let’s do a quick review the two databases that exist for easyTravel.

## Review MongoDB

Click on the **Mongo** database to open the database page. 

![image](/images/database.png)

On this page you can explore the database process metrics like writes, reads, and drill into database statements.

![image](/images/database-mongo.png)

## Review SQL Database

Click on the **Databases** link in the Dynatrace's left side menu to view the databases that OneAgent was able to automatically discover and instrument.

As mentioned early, easyTravel uses an [Apache Derby embedded relational database](https://en.wikipedia.org/wiki/Apache_Derby), but we also setup a easyTravel EC2 Instance that is running MongoDB in a docker container. So you should see both listed in the database view.

![image](/images/database-derby.png)

## How this helps

When monitoring database activity, Dynatrace shows you which database statements are executed most often and which statements take up the most time. You can also see which services execute the database statements what will be direct input to migration planning and prioritization of the move groups.

{{% notice info %}}
Dynatrace monitors all the popular database SQL Server, Oracle, MongoDB to name a few. See [Dynatrace documentation](https://www.dynatrace.com/platform/database-monitoring/) for more details on platform support.
{{% /notice %}}
