NodeJS-MySQL using express framework
================

- Implemented back-end & REST APIs using NodeJs
- Used MySQL as database 
- used NPM 

Usage:
-----
Implemented following set of APIs:
1. GET customers/                        	         [Get all Customers Data]            
2. GET customers/:id                            	 [Get specific customers Data by his/her ID]
2. GET customers/:id/orders                       	 [Get orders for specified customer]
3. GET orders                                     	 [Get all the orders Data]
4. GET orders/:beginDate/:endDate                        [Get the orders in between date range]  
5. GET orders/:beginDate/:endDate?groupBy                [Get the orders in between date range & group by day/week/month]  
6. GET orders/csv/:beginDate/:endDate                    [Get the orders in between date range in CSV]  

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

