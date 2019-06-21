var express = require('express');
var router = express.Router();
var connection = require('../lib/dbconf.js')

/* GET Customers listing. */
router.get('/', function(req, res, next) {
  res.send("to get specific customer info, provide: {customerid} " +
  		   "to get specific customer order info, provide: {customerid}/orders ");
});

/*
 * mapping customers route to fetch all customers data 
 */
router.get('/all', function(req, res, next) {
	connection.getAllUserData(function(err,rows){
		res.send(rows);
	});
});			

/*
 * mapping customers route to fetch specific customer's data
 */
router.get('/:customerid', function(req, res, next) {
	connection.getParticularUserData(function(err,rows){
		res.send(rows);
	},req.params.customerid);
});			

/*
 * mapping customers route to fetch specific customer's orders
 */
router.get('/:customerid/orders', function(req, res, next) {
	connection.getUserOrders(function(err,rows){
		res.send(rows);
	},req.params.customerid);
});			


module.exports = router;
