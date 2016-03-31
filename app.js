var express = require('express')
var port = process.env.PORT || 3000
var app = express()
var rootpath = __dirname;//根目录
var route = require('./routes')
app.listen(port)
route.routes(app,express);
