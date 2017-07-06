var express = require('express')
var port = process.env.PORT || 80
var bodyParser = require("body-parser")
var request = require('request');  
var crypto = require('crypto')
var sha1 = require('sha1')
var app = express()
app.listen(port)
app.use(bodyParser.urlencoded({ extended: true }))


app.get('/',function(req,res){

    //1.获取微信服务器Get请求的参数 signature、timestamp、nonce、echostr
    var signature = req.query.signature,//微信加密签名
        timestamp = req.query.timestamp,//时间戳
            nonce = req.query.nonce,//随机数
          echostr = req.query.echostr;//随机字符串

    //2.将token、timestamp、nonce三个参数进行字典序排序
    var array = ['weixin',timestamp,nonce];
    array.sort();

    //3.将三个参数字符串拼接成一个字符串进行sha1加密
    var tempStr = array.join('');

    const hashCode = crypto.createHash('sha1'); //创建加密类型 

    var resultCode = hashCode.update(tempStr,'utf8').digest('hex'); //对传入的字符串进行加密

    res.send(echostr);

});



app.get('/index',function(req,res){

    var return_uri = 'http%3A%2F%2Fwww.aparesse.com%2Fget_wx'
    var state = new Buffer('{"a":"1","b":"2"}').toString('base64');
    var url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf114c69f6437bf60&redirect_uri='+return_uri+'&response_type=code&scope=snsapi_userinfo&state=' + state + '#wechat_redirect';
    res.redirect(url);

});


app.get('/get_wx', function(req,res, next){
    
    var code = req.query.code;
    var state = req.query.state;
    request.get(
        {   
            url:'https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxf114c69f6437bf60&secret=cbce5967dc69e7922cd7161dd91e205f&code=' + code + '&grant_type=authorization_code',
        },
        function(error, response, body){

            if(response.statusCode == 200){

                var data = JSON.parse(body);
                var access_token = data.access_token;
                var openid = data.openid;


                res.send('<h2>获取成功</h2><div>' + decodeURIComponent(body) + '</div>');
                
            }else{
                console.log(response.statusCode);
            }

        }
    );
});