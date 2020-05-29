+++
title = "Databases"
chapter = false
weight = 70
+++

![image](/images/florian.png)

Click on the `Databases` link in the Dynatraces left side menu to view the databases that OneAgent was able to automatically discover and instrument.

As mentioned early, easyTravel uses an [Apache Derby embedded relational database](https://en.wikipedia.org/wiki/Apache_Derby), but we also setup a easyTravel VM that is running MongoDB in a docker container. So you should see both listed in the database view.

![image](/images/database.png)

## Review MongoDB

Click on the `Mongo` database to open the database page. On this page you can explore the database process metrics like writes, reads, and drill into database statements.

![image](/images/database.png)

## How this helps

Knowing the type of access, executed statements, and amount of data transferred during regular hours of operation allows for better planning and prioritization of the move groups. In some cases, you may decide to not migrate this database in favor of other services or databases that are less complex to migrate due to fewer dependencies.

{{% notice info %}}
Dynatrace monitors all the popular database SQL Server, Oracle, MongoDB to name a few. See [Dynatrace documentation](https://www.dynatrace.com/platform/database-monitoring/) for more details on platform support.
{{% /notice %}}
