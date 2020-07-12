
var express = require('express')
  , user = require('./routes/user')
  , room = require('./routes/room')
  , booking = require('./routes/booking')
  , expense = require('./routes/expense')
  , property = require('./routes/property')
  , http = require('http')
  , path = require('path');
  var app = express();
  const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./swagger.json');
 
 
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
//var methodOverride = require('method-override');

var mysql      = require('mysql');
var bodyParser=require("body-parser");
var connection = mysql.createConnection({
              host     : 'localhost',
              user     : 'root',
              password : '',
              database : 'hotel_db'
            });
 
connection.connect();
 
global.db = connection;
 
// all environments
app.set('port', process.env.PORT || 8080);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

app.use("/user", user);
app.use("/booking", booking);
app.use("/expense", expense);
app.use("/property", property);
//Middleware
app.listen(8080)
