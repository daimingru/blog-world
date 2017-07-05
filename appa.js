var express = require('express')
var port = process.env.PORT || 80
var bodyParser = require("body-parser")
var app = express()
app.listen(port)
app.use(bodyParser.urlencoded({ extended: true }))

app.post('/',function(req,res){  
  res.send({success:false})
})  

app.get('/',function(req,res){
    res.end(req.body)
})