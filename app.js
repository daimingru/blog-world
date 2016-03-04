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
var database = require('./config');
var conn = database.conn;
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


app.post('/article',function(req,res){
    conn.query('SELECT * FROM article order by id desc limit 0,5', function(err, rows, fields) {
    if (err) throw err;
      var id = req.body.id - 1;
      // 遍历数组格式化时间
      rows = forTimearry(rows);
      var article = rows.reverse();
        res.render('article',{
            indexa:id,
            article:article
        })
    });
})


app.post('/login',function(req,res){
    conn.query('select password from user where email = "' + req.body.username + '" ',function(err,rows,fields){
        if(err){
            res.send({success:'错了1'});
        }
        if(rows.length){
           if(rows[0].password == req.body.password){
              res.send({success:true});
           }else{
              res.send({success:false});
           }
        }else{
            res.send({success:false});
        }
    });
    
})

function indexaction(req,res){
    if(arguments[2]){
        templute = 'index';
    }else{
        templute = 'layout';
    }
	conn.query('SELECT * FROM article order by id desc limit 0,5', function(err, rows, fields) {
    if (err) throw err;
      var article = forTimearry(rows);
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

//错误信息
function showError(err){
    alert(err);
}

//遍历数组时间 
function forTimearry(rows){
    for(var i = 0;i<rows.length;i++){
        rows[i].createtime = moment(rows[i].createtime).format("YYYY-MM-DD");
    }
    return rows;
}

