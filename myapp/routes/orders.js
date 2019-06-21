var express = require('express');
var router = express.Router();
var connection = require('../lib/dbconf.js')
var exportToCsv = require("export-to-csv");
var Blob = require('blob');
//import {ExportToCsv} from 'export-to-csv';

/*
 * Configuration for the CSV generation 
 */
  const options = { 
    fieldSeparator: ',',
    quoteStrings: '"',
    decimalSeparator: '.',
    showLabels: true, 
    showTitle: true,
    title: 'CSV_Order_details',
    useTextFile: false,
    useBom: true,
    useKeysAsHeaders: true,
  };

const csvExporter = new exportToCsv.ExportToCsv(options);

/* GET Orders listing. */

/*
 * mapping orders base route to Function to fetch all orders
 */
router.get('/', function(req, res, next) {
	connection.getAllOrderData(function(err,rows){
		res.send(rows);
	},req.params.customerid);
});


/*
 * mapping orders route to function that fetches the orders between date range 
 */
router.get('/:beginDateRange/:endDateRange', function(req, res, next) {
	console.log(req.query.groupBy);
	
	connection.getOrdersBetween(function(err,rows){
		res.send(rows);
	},req.params.beginDateRange,req.params.endDateRange, req.query.groupBy);
});			

/*
 * mapping orders route to function that fetches the orders between date range 
 */
router.get('/csv/:beginDateRange/:endDateRange', function(req, res, next) {

	var ordersData;
	
	connection.getOrdersBetween(function(err,rows){
		
		ordersData = rows;
		let arraybuffer = Uint8Array.from(JSON.stringify(ordersData)).buffer;
		console.log("arraybuffer: "+JSON.stringify(ordersData))
		console.log("ordersData:"+ ordersData)
		csvExporter.generateCsv(JSON.stringify(ordersData));
			
	},req.params.beginDateRange,req.params.endDateRange);
	
//	csvExporter.generateCsv(ordersData);
	
});			



module.exports = router;
