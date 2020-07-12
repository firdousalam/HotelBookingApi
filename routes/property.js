var express = require('express');
var router = express.Router();


router.post('/addProperty', function (req, res) {
	var property_name = req.body.property_name;
	if(typeof property_name == "undefined" || property_name == "")
	{
		res.send({error : 0,"message" : "Please provide Property Name","data" : []});
		return;
	}
	var property_details = req.body.property_details;
	if(typeof property_details == "undefined" || property_details == "")
	{
		res.send({error : 0,"message" : "Please provide property details","data" : []});
		return;
	}

	var sql ="INSERT into property (property_name, property_details) VALUES ('"+property_name+"','"+property_details+"'); "
  global.db.query(sql, function (err, result) {
		if (err) throw err;
		console.log(result);
		res.send({error : 0,"message" : "Insert successfully","data" : result});
	});
})


router.post('/fetchProperty', function (req, res) {
	var sql = "select * from property limit 1000";
	
	global.db.query(sql, function (err, result) {
		if (err) throw err;
		console.log(result);
		res.send({error : 0,"message" : "fetch successfully","data" : result});
	});
})


module.exports = router;