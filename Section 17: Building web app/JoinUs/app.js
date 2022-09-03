var express = require('express');
var  mysql = require('mysql');
var bodyParser = require("body-parser");
var app = express();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended:true}));
app/use(express.static(__dirname + "/public")); // connecting everything inside /public dir 

var connection = mysql.createConnection({
    host : 'localhost',
    user : 'sqluser',
    password : 'password', 
    database : 'join_us'
});

// ----------------------------------------------------------------- //

app.get("/", function(req, res){ // req = request, res = response, get= get information without sending any data
  res.send("HELLO FROM OUR WEB APP!"); // triggers when there is incomming request 
  console.log("Someone requested us!");
});

// 310. Add /joke route 
app.get("/joke", function(req,res){
		var joke = "What do you call a bird who cant fly?, A chicken";
	res.send(joke);
		});

// 310. Add /random_num route:
app.get("/random_num", function(req, res){
 var num = Math.floor((Math.random() * 10) + 1); // generate random number 
 res.send("Your lucky number is " + num);
});

// 311. connecting express with mysql
app.get("/count", function(req, res){
	// find count of user
    var q = 'SELECT COUNT(*) as count FROM users';
	connection.query(q, function(error, results){
		if (error) throw error;	
		var count = results[0].count;
		// res.send("We have "+ count + " users in our database");
		res.render("home", {data: count}); // refering to the home.ejs file, 'data' reffer to the data that need to display (count)
	});
});

// 315. COnnecting the form
app.post('/register', function(req,res){
 var person = {email: req.body.email};
 connection.query('INSERT INTO users SET ?', person, function(error, result) {
	 if (err) throw err;
	 console.log(result);
	 // res.send("Thanks for joining our wait list!");
	 res.redirect("/");
	
 });
});


// to start the server
app.listen(3000, function () { // groommide=3000, 
  console.log('App listening on port 3000!');
});