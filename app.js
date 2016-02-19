var express = require('express')
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

//index page
app.get('/',function(req,res){
	indexaction(req,res);
})

app.get('/index',function(req,res){
	indexaction(req,res);
})

app.post('/index',function(req,res){
	res.render('index',{
	})
})

app.post('/article',function(req,res){
	res.render('article',{
		title:title,
		flag:'article'
	})
})

//list page
app.post('/list',function(req,res){
	listaction(req,res);
})

app.get('/list',function(req,res){
	listaction(req,res);
})


function indexaction(req,res){
	conn.query('SELECT * FROM article', function(err, rows, fields) {
    if (err) throw err;
      var article = rows[0].title;
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('layout',{
        	article:article,
	    	name:rows[0].name,
	    	title:title,
	    	flag:'index'
	    })
      });
    });
	
}

function listaction(req,res){
	res.render('list',{
	})
}

