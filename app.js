var express = require('express')
var port = process.env.PORT || 3000
var app = express()
var title = '博客世界-blog-world';
app.set('views','./views')
app.set('view engine','ejs')

app.listen(port)

//index page
app.get('/',function(req,res){
	res.render('index',{
		title:title,
		cont:'这里是ejs模板的首页'
	})
})
