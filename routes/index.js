var comm = require('.././config.js');
var path = require('path');
var bodyParser = require("body-parser"); //用于解析客户端请求的body中的内容,内部使用JSON编码处理,url编码处理以及对于文件的上传处理.
var moment = require("moment") //处理时间格式
var ueditor = require("ueditor");//百度富文本编辑器
var cookieParser = require('cookie-parser');//cookie
var conn = comm.conn;
conn.connect();
module.exports.routes = function(app,express){

  app.use(express.static('./public'));
  app.set('views','./views')
  app.set('view engine','ejs')//ejs模板
  app.use(bodyParser.urlencoded({ extended: false }));//用于post请求 
  app.use(bodyParser.urlencoded({
    extended: true
  }));
  app.use(bodyParser.json());
  app.use(cookieParser());//cookie
  app.use("ueditor/ueditor", ueditor(path.join(__dirname, 'public'), function(req, res, next) {
      // ueditor 客户发起上传图片请求
      if (req.query.action === 'uploadimage') {
          var foo = req.ueditor;
          var imgname = req.ueditor.filename;
          var img_url = '../upload/images/';
          //你只要输入要保存的地址 。保存操作交给ueditor来做
          res.ue_up(img_url); 
      }
      //  客户端发起图片列表请求
      else if (req.query.action === 'listimage') {
          var dir_url = '/images/ueditor/';
          // 客户端会列出 dir_url 目录下的所有图片
          res.ue_list(dir_url); 
      }
      // 客户端发起其它请求
      else {
          res.setHeader('Content-Type', 'application/json');
          res.redirect('/ueditor/nodejs/config.json');
      }
  }));


// 使用 cookieParser 中间件，cookieParser(secret, options)
// 其中 secret 用来加密 cookie 字符串（下面会提到 signedCookies）
// options 传入上面介绍的 cookie 可选参数




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
  
  app.get('/article', function(req, res){  
    var article_id = req.query.id;
    conn.query('SELECT * FROM article where id=' + article_id, function(err, rows, fields) {
    if (err) throw err;
      var article = forTimearry(rows);
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('layout',{
          article:article,
          name:rows[0].name,
          title:rows[0].title,
          flag:'article'
        })
      });
    });
  });  

  //post login
  app.post('/login',function(req,res){
    conn.query('select password,id from user where email = "' + req.body.username + '" ',function(err,rows,fields){
        if(err){
            res.send({success:'错了'});
        }
        if(rows.length){
           if(rows[0].password == req.body.password){
              res.cookie('userid', rows[0].id, {maxAge: 60 * 10000});
              res.send({success:true});
           }else{
              res.send({success:false});
           }
        }else{
            res.send({success:false});
        }
    });
  });

  //admin 
  app.get('/admin',function(req,res){
    if(isSession(req,res)){
      conn.query('select name from user',function(err,rows,fields){
        if(err) throw err;
        res.render('admin/layout',{
          name:rows[0].name,
          title:'博客视界-后台管理系统',
          flag:'write'
        })
      })
    }
  })

  //admin 
  app.get('/write',function(req,res){
    if(isSession(req,res)){
      conn.query('select name from user where id = \'' + req.cookies.userid + '\'',function(err,rows,fields){
        if(err) throw err;
        res.render('admin/layout',{
          name:rows[0].name,
          title:'博客视界-后台管理系统',
          flag:'write'
        })
      })
    }
  })

  //mylist 
  app.get('/mylist',function(req,res){
    var _title = '博客视界-文章列表';
    conn.query('SELECT * FROM article where autherid =\'' + req.cookies.userid + '\' order by id desc limit 0,10', function(err, rows, fields) {
    if (err) throw err;
      var article = forTimearry(rows);
      var introduction = delHtmlTag(article);
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('admin/layout',{
          article:article,
          introduction:introduction,
          name:rows[0].name,
          title:_title,
          flag:'list'
        })
      });
    });
  })

    //bglist 
  app.get('/bglist',function(req,res){
    var _title = '文章列表';
    conn.query('SELECT * FROM article order by id desc limit 0,10', function(err, rows, fields) {
    if (err) throw err;
      var article = forTimearry(rows);
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('admin/layout',{
          article:article,
          name:rows[0].name,
          title:_title,
          flag:'bglist'
        })
      });
    });
  })

  //接受并且返回发表文章内容
  app.post('/createarticle',function(req,res){
    var date = new Date().Format("yyyy-MM-dd hh:mm:ss");
     conn.query('SELECT * FROM article order by id desc limit 0,10', function(err, rows, fields) {
        if (err) throw err;
     conn.query('insert into article (`title`, `auther`, `article`, `createtime`, `deleteflag`, `autherid`) VALUES ( \'' + req.body.title + '\', \'' + req.body.writer + '\', \'' + req.body.content + '\', \'' + date + '\', 1, \'' + req.cookies.userid + '\')',function(err,result){
      if(err){
        res.send({success:false});
        return;
      }else{
        res.send({success:true});
        return;
      }
    });
   });
  });
}


function indexaction(req,res,conn){
    var _title = '博客视界-blog-world';
    conn.query('SELECT * FROM article order by id desc limit 0,5', function(err, rows, fields) {
    if (err) throw err;
      var article = forTimearry(rows);
      var introduction = delHtmlTag(article);
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('layout',{
          article:article,
          introduction:introduction,
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
      var introduction = delHtmlTag(article);
      conn.query('SELECT name FROM user', function(err, rows, fields) {
      if (err) throw err;
        res.render('layout',{
          article:article,
          introduction:introduction,
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




Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

//匹配html标签
function delHtmlTag(str)
{   
    var array = str;
    for(var i = 0;i<array.length;i++){
        array[i].article = array[i].article.replace(/<[^>]+>/g,"");
    }
    return array;
}

//验证session
function isSession(req,res){
  // 如果请求中的 cookie 存在 isVisit, 则输出 cookie
  // 否则，设置 cookie 字段 isVisit, 并设置过期时间为1分钟
  if (req.cookies.userid) {
    return true;
  } else {
    res.render('login',{});
    return false;
  }
}