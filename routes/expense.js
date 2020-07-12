var express = require('express');
var router = express.Router();


router.post('/addExpense', function (req, res) {
	var service_name = req.body.service_name;
	if(typeof service_name == "undefined" || service_name == "")
	{
		res.send({error : 0,"message" : "Please provide Service Name","data" : []});
		return;
	}
	var room_type = req.body.room_type;
	if(typeof room_type == "undefined" || room_type == "")
	{
		res.send({error : 0,"message" : "Please provide room type","data" : []});
		return;
	}
	var rate = req.body.rate;
	if(typeof rate == "undefined" || rate == "")
	{
		res.send({error : 0,"message" : "Please provide room rate","data" : []});
		return;
	}
	var sql ="INSERT into add_on_services (service_name, room_type, rate) VALUES ('"+service_name+"','"+room_type+"','"+rate+"'); "
  global.db.query(sql, function (err, result) {
		if (err) throw err;
		console.log(result);
		res.send({error : 0,"message" : "Insert successfully","data" : result});
	});
})


router.post('/fetchExpense', function (req, res) {
	var sql = "select * from add_on_services order by service_id desc  limit 1000";
	if(typeof req.body.roomType != 'undefined')
	{
		sql = "select * from add_on_services where room_type IN ('all','"+req.body.roomType+"') order by service_id desc  limit 1000";
	}
	global.db.query(sql, function (err, result) {
		if (err) throw err;
		console.log(result);
		res.send({error : 0,"message" : "credential match","data" : result});
	});
})


module.exports = router;