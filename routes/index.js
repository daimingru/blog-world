var comm = require('.././config.js');
var bodyParser = require("body-parser"); //用于解析客户端请求的body中的内容,内部使用JSON编码处理,url编码处理以及对于文件的上传处理.
var moment = require("moment") //处理时间格式
var conn = comm.conn;
conn.connect();
module.exports.routes = function(app,express){

  app.use(express.static('./public'));
  app.set('views','./views')
  app.set('view engine','ejs')//ejs模板
  app.use(bodyParser.urlencoded({ extended: false }));//用于post请求 

  app.get('/',function(req,res){
    indexaction(req,res,conn);
  })

  app.get('/index',function(req,res){
    indexaction(req,res,conn);
  })

  app.get('/list',function(req,res){
    listaction(req,res,conn);
  })

  //login 
  app.get('/login',function(req,res){
    res.render('login',{});
  })

  //post login
  app.post('/login',function(req,res){
    conn.query('select password from user where email = "' + req.body.username + '" ',function(err,rows,fields){
        if(err){
            res.send({success:'错了'});
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
};  


function indexaction(req,res,conn){
    var _title = '博客视界-blog-world';
    conn.query('SELECT * FROM article order by id desc limit 0,5', function(err, rows, fields) {
    if (err) throw err;
      var article = forTimearry(rows);
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('layout',{
          article:article,
          name:rows[0].name,
          title:_title,
          flag:'index'
        })
      });
    });
}

function listaction(req,res,conn){
    var _title = '博客视界-文章列表';
    conn.query('SELECT * FROM article order by id desc limit 0,10', function(err, rows, fields) {
    if (err) throw err;
      var article = forTimearry(rows);
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('layout',{
          article:article,
          name:rows[0].name,
          title:_title,
          flag:'list'
        })
      });
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