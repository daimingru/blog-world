var express = require('express')
var port = process.env.PORT || 3000
var app = express()

app.set('views','./views')
app.set('view engine','jade')
app.listen(port)

console.log('运行成功！端口号是：'+port)

//index page
app.get('/',function(req,res){
	res.render('index',{
		title:'博客世界-blog-world'
	})
})

//index page
app.get('/admin/list',function(req,res){
	res.render('list',{
		title:'文章列表-博客世界-blog-world'
	})
})

//index page
app.get('/movie/:id',function(req,res){
	res.render('detail',{
		title:'文章详情-博客世界-blog-world'
	})
})

//index page
app.get('/admin/movie',function(req,res){
	res.render('admin',{
		title:'添加文章-博客世界-blog-world'
	})
})