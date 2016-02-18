var express = require('express')
var port = process.env.PORT || 3000
var app = express()
var title = '博客视界-blog-world';//博客标题title
var rootpath = __dirname;//根目录
express.static(path.join(__dirname, 'public'))
app.set('views','./views')
app.set('view engine','ejs')//ejs模板

app.listen(port)

//index page
app.get('/',function(req,res){
	indexaction(req,res);
})

app.get('/index',function(req,res){
	indexaction(req,res);
})

function indexaction(req,res){
	res.render('index',{
		title:title,
		rootpath:rootpath
	})
}

