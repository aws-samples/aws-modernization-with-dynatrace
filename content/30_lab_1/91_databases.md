---
title: "Databases"
chapter: false
weight: 91
---

As you plan your migration, Database observability is critical to a successful plan. Knowing the type of access, executed statements, and amount of data transferred during regular hours of operation allows for better migration planning and prioritization of the move groups. In some cases, you may decide to not migrate this database in favor of other services or databases that are less complex to migrate due to fewer dependencies.

## 👍 How this helps 

When monitoring database activity, Dynatrace shows you which database statements are executed most often and which statements take up the most time. You can also see which services execute the database statements what will be direct input to migration planning and prioritization of the move groups.

Dynatrace monitors all the popular database SQL Server, Oracle, MongoDB to name a few. See <a href="https://www.dynatrace.com/platform/database-monitoring/" target="_blank">Dynatrace documentation</a> for more details on platform support.

## Navigate to the Database

To learn some out-of-the-box features of Dynatrace. Let’s do a quick review of the database that exists for the sample application.

1. Lets get back to the `backend` service. One way is to go back to the `Services` left side Dynatrace menu and then pick the `backend` service.

1. On the `backend` service page, click on the `[embedded]` database to open the database service page. 

![image](/images/lab1-pick-db.png)

## Database Review

The sample application uses an <a href="http://hsqldb.org/)" target="_blank">In memory Java relational database</a>.  On this page you can explore the database process like

1. What services call this database
1. Database availability
1. View individual SQL statements
1. Custom metric analysis 

![image](/images/lab1-database.png)

