'user strict';

var mysql = require('mysql');
var exportToCsv = require("export-to-csv");

/*
 * Database Configuration
 */
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'password123',
    database : 'demo_db'
});

connection.connect(function(err) {
    if (err) throw err;
});


/*
 * Function to fetch info for particular customer
 */
exports.getParticularUserData = function(callback, customer_id){
	var query = 'select * from customer  where customer_id='+customer_id+';';
	connection.query(query, function(err, rows) {
		callback(err, rows);
	});
}

/*
 * Function to fetch orders for a customers
 */
exports.getUserOrders = function(callback, customer_id){
	var query = 'select * from customer_order_details where customer_id='+customer_id+';';
	console.log("query"+query)
	connection.query(query, function(err, rows) {
		callback(err, rows);
	});
}

/*
 * Function to fetch info for all the customers
 */
exports.getAllUserData = function(callback){
	var query = 'select * from customer;';
	connection.query(query, function(err, rows) {
		callback(err, rows);
	});
}

/*
 * Function to fetch all the orders
 */
exports.getAllOrderData = function(callback){
	var query = 'select * from orders;';
	connection.query(query, function(err, rows) {
		callback(err, rows);
	});
}

/*
 * Function to fetch the orders between date range
 */
exports.getOrdersBetween = function(callback, beginDateRange, endDateRange, groupBy){
	console.log("groupBy::"+groupBy)

	bd = "'"+beginDateRange+"'";
	ed = "'"+endDateRange+"'";

	var query = 'select * from orders where date between '+bd+' and '+ed+';';

	if (groupBy == "day"){
		console.log("wanted group by day");
		query = 'select date, sum(product_quantity)as total_sold from orders where date between '+bd+' and '+ed+' group by 1;';

	}else if (groupBy == "month"){
		query = 'select date_format(date, "%m-%Y") as month, sum(product_quantity) as total_sold from orders where date between '+bd+' and '+ed+' group by 1;';
		console.log("wanted group by day");
	}
	else if (groupBy == "week"){
		query = 'select week(date), sum(product_quantity) as total_sold from orders where date between '+bd+' and '+ed+' group by 1;';
		console.log("wanted group by day");
	}

	console.log("query:: "+query)
	connection.query(query, function(err, rows) {
		callback(err, rows);
	});
}

//module.exports = connection;
