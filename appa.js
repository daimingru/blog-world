var express = require('express')
var port = process.env.PORT || 80
var bodyParser = require("body-parser")
var request = require('request');  
var crypto = require('crypto')
var sha1 = require('sha1')
var app = express()
app.listen(port)
app.use(bodyParser.urlencoded({ extended: true }))





//微信配置接口，用于接受页面绑定域名是微信验证服务器是否正确的接口

app.get('/wger',function(req,res){
    console.log(req.query);
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





//用户在app中点击对应卡片的路由

app.get('/index?id=1',function(req,res){

    var return_uri = 'http%3A%2F%2Fwww.aparesse.com%2Fget_wx'  // encode后的URL地址， 用户确认授权后悔跳转到这个页面  需要加http://
    var state = new Buffer('{"a":"1","b":"2"}').toString('base64'); //  跳转到上面URL 地址后  携带的参数     参数格式为  {"":""}
    var url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf114c69f6437bf60&redirect_uri='+return_uri+'&response_type=code&scope=snsapi_userinfo&state=' + state + '#wechat_redirect';
    res.redirect(url); //重定向到微信授权页面

});


//用户点击确认授权跳转到的页面 （即上一步设置的encode后的URL地址）

app.get('/get_wx', function(req,res, next){
    
    var code = req.query.code;//微信会返回一个code  用于下一步换取oppenid  
    var state = req.query.state;// 获取上一步中 自己设置的携带的参数
    
    //发送请求使用code换取oppenid
    request.get(
        {   
            url:'https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxf114c69f6437bf60&secret=cbce5967dc69e7922cd7161dd91e205f&code=' + code + '&grant_type=authorization_code',
        },
        function(error, response, body){
            //完成请求后微信返回的statusCode == 200 证明授权成功
            if(response.statusCode == 200){

                var data = JSON.parse(body);

                var access_token = data.access_token; //access_token 用于换取头像的，服务器需要做缓存，有时间限制 具体可以看微信文档
                var openid = data.openid;  // 所需要的openid

                res.send('<h2>获取成功</h2><div>' + decodeURIComponent(body) + '</div>');
                
            }else{

                //这里是用户在授权页面拒绝操作后的回调
                console.log(response.statusCode);
                
            }

        }
    );
});