var express = require('express')
var bodyParser = require("body-parser"); 
var moment = require("moment") //处理时间格式
var port = process.env.PORT || 3000
var app = express()
var title = '博客视界-blog-world';//博客标题title
var rootpath = __dirname;//根目录
app.use(express.static(__dirname + '/public'));
app.set('views','./views')
app.set('view engine','ejs')//ejs模板
app.listen(port)

//链接数据库
var mysql = require('mysql');
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database:'blog-world',
    port: 3306
});
conn.connect();

app.use(bodyParser.urlencoded({ extended: false }));//用于post请求 

//index page
app.get('/',function(req,res){
	indexaction(req,res);
})

app.get('/index',function(req,res){
	indexaction(req,res);
})

app.post('/index',function(req,res){
	indexaction(req,res,1);
})

app.post('/article',function(req,res){
    conn.query('SELECT * FROM article order by id desc limit 0,5', function(err, rows, fields) {
    if (err) throw err;
      var id = req.body.id - 1;
      var article = rows.reverse();
        res.render('article',{
            indexa:id,
            article:article
        })
    });
})

//list page
app.post('/list',function(req,res){
	listaction(req,res);
})

app.get('/list',function(req,res){
	listaction(req,res);
})

//login 
app.get('/login',function(req,res){
    res.render('login',{
    })
})

console.log(moment("20111031").format('YYYYMMDD'));
function indexaction(req,res){
    if(arguments[2]){
        templute = 'index';
    }else{
        templute = 'layout';
    }
	conn.query('SELECT * FROM article order by id desc limit 0,5', function(err, rows, fields) {
    if (err) throw err;
      var article = rows;
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render(templute,{
        	article:article,
	    	name:rows[0].name,
	    	title:title,
	    	flag:'index'
	    })
      });
    });
	
}


function listaction(req,res){
	conn.query('SELECT * FROM article order by id desc limit 0,10', function(err, rows, fields) {
    if (err) throw err;
      var article = rows;
        res.render('list',{
            article:article,
            title:title
        })
    });
}

