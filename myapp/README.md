NodeJS-MySQL using express framework
================

- Implemented back-end & REST APIs using NodeJs
- Used MySQL as database 
- used NPM 

Usage:
-----
Implemented following set of APIs:

| Method        | End-Point           						              | Purpose  |
| ------------- |-----------------------------------------------| -------------------------- |
| GET   		    | customers           													| Get specific customers Data by his/her ID |
| GET		        | customers/:id                   							| Get orders for specified customer |
| GET           | customers/:id/orders            							| Get all the orders Data |
| GET   		    | orders           															| Get specific customers Data by his/her ID |
| GET		        | orders/:beginDate/:endDate                    | Get orders for specified customer |
| GET           | orders/:beginDate/:endDate?groupBy            | Get all the orders Data |
| GET           | orders/csv/:beginDate/:endDate                | Get the orders in between date range in CSV |

Technologies: 
-------------
- NodeJS, MySQL, NPM


How To Use:
---------------------
1. Prequisite: Install NodeJS, MySQL
2. NPM Install
3. Restore MySQL database: mysql -u <user> -p < database_backup.sql
4. Modify lib/dbconf.js and provide db connection details
4. NPM Start 
5. Application will be running on port 3000

