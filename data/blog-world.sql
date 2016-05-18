/*
Navicat MySQL Data Transfer

Source Server         : blog-world
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : blog-world

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-18 09:06:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `auther` varchar(25) NOT NULL,
  `article` text NOT NULL,
  `createtime` datetime NOT NULL,
  `deleteflag` tinyint(1) NOT NULL DEFAULT '1',
  `autherid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`autherid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'jquery完善的处理机制', '戴明儒', '使用jQuery选择器不仅比使用传统的getElementById()和getElementsByTagName()函数简洁得多，而且还能避免某些错误。请看下面例子：\r\n\r\n1 <script>\r\n2    document.getElementById(\"div\").style.color =\"red\";\r\n3 </script>\r\n运行上面代码后，浏览器就会报错，原因是网页中没有ID为div的元素。\r\n\r\n改进后代码如下：\r\n\r\n1 <script>\r\n2     if(document.getElementById(\"div\")){  //用了IF语句来判断是否有ID为div的元素，如果有，执行下面代码 \r\n3         document.getElementById(\"div\").style.color =\"red\"\r\n4     }\r\n5 </script>\r\n这样就可以避免游览器报错，但如果要操作的元素很多，可能对每个元素都要进行一次判断，而jquery方面问题上的处理是非常不错的，即使用JQUERY获取网页中不存在的元素也不会报错。\r\n\r\n代码如下：\r\n\r\n1 <script>\r\n2    $(\"#div\").css(\"color\",\"red\");\r\n3 </script>\r\n有了这个预防措施，即使以后因为某种原因删除网页上某个以前使用过的元素，也不用担心这个网页的JavaScript会报错。\r\n\r\n注意点：\r\n\r\n$(\"div\")获取的永远是jquery对象，即使网页上没有此元素。因此当要用jquery检查某个元素在网页上是否存在时。\r\n\r\n不能使用以下代码：\r\n\r\n1 <script>\r\n2   if($(\"#div\")){\r\n3       $(\"#div\").css(\"color\",red)  //这样游览器会报错\r\n4   }\r\n5 </script>\r\n而是应该跟获取长度来判断。\r\n\r\n代码如下：\r\n\r\n<script>\r\n  if($(\"#div\").length >0){\r\n      $(\"#div\").css(\"color\",red)\r\n  }\r\n</script>\r\n这时候也可以转化为DOM对象来判断。\r\n\r\n代码如下：\r\n\r\n复制代码\r\n 1 <body>\r\n 2    <div id=\"div\">ccccccc</div>\r\n 3 <script src=\"jquery-2.1.4.min.js\"></script>\r\n 4 <script>\r\n 5    var $div = $(\"#div\");\r\n 6    var  div = $div[0];\r\n 7    if(div){\r\n 8        $div.css(\"color\",\"red\")   //此时DIV的颜色就变为red\r\n 9    }\r\n10 </script>\r\n11 </body>\r\n使用jQuery选择器不仅比使用传统的getElementById()和getElementsByTagName()函数简洁得多，而且还能避免某些错误。请看下面例子：\r\n\r\n1 <script>\r\n2    document.getElementById(\"div\").style.color =\"red\";\r\n3 </script>\r\n运行上面代码后，浏览器就会报错，原因是网页中没有ID为div的元素。\r\n\r\n改进后代码如下：\r\n\r\n1 <script>\r\n2     if(document.getElementById(\"div\")){  //用了IF语句来判断是否有ID为div的元素，如果有，执行下面代码 \r\n3         document.getElementById(\"div\").style.color =\"red\"\r\n4     }\r\n5 </script>\r\n这样就可以避免游览器报错，但如果要操作的元素很多，可能对每个元素都要进行一次判断，而jquery方面问题上的处理是非常不错的，即使用JQUERY获取网页中不存在的元素也不会报错。\r\n\r\n代码如下：\r\n\r\n1 <script>\r\n2    $(\"#div\").css(\"color\",\"red\");\r\n3 </script>\r\n有了这个预防措施，即使以后因为某种原因删除网页上某个以前使用过的元素，也不用担心这个网页的JavaScript会报错。\r\n\r\n注意点：\r\n\r\n$(\"div\")获取的永远是jquery对象，即使网页上没有此元素。因此当要用jquery检查某个元素在网页上是否存在时。\r\n\r\n不能使用以下代码：\r\n\r\n1 <script>\r\n2   if($(\"#div\")){\r\n3       $(\"#div\").css(\"color\",red)  //这样游览器会报错\r\n4   }\r\n5 </script>\r\n而是应该跟获取长度来判断。\r\n\r\n代码如下：\r\n\r\n<script>\r\n  if($(\"#div\").length >0){\r\n      $(\"#div\").css(\"color\",red)\r\n  }\r\n</script>\r\n这时候也可以转化为DOM对象来判断。\r\n\r\n代码如下：\r\n\r\n复制代码\r\n 1 <body>\r\n 2    <div id=\"div\">ccccccc</div>\r\n 3 <script src=\"jquery-2.1.4.min.js\"></script>\r\n 4 <script>\r\n 5    var $div = $(\"#div\");\r\n 6    var  div = $div[0];\r\n 7    if(div){\r\n 8        $div.css(\"color\",\"red\")   //此时DIV的颜色就变为red\r\n 9    }\r\n10 </script>\r\n11 </body>\r\n使用jQuery选择器不仅比使用传统的getElementById()和getElementsByTagName()函数简洁得多，而且还能避免某些错误。请看下面例子：\r\n\r\n1 <script>\r\n2    document.getElementById(\"div\").style.color =\"red\";\r\n3 </script>\r\n运行上面代码后，浏览器就会报错，原因是网页中没有ID为div的元素。\r\n\r\n改进后代码如下：\r\n\r\n1 <script>\r\n2     if(document.getElementById(\"div\")){  //用了IF语句来判断是否有ID为div的元素，如果有，执行下面代码 \r\n3         document.getElementById(\"div\").style.color =\"red\"\r\n4     }\r\n5 </script>\r\n这样就可以避免游览器报错，但如果要操作的元素很多，可能对每个元素都要进行一次判断，而jquery方面问题上的处理是非常不错的，即使用JQUERY获取网页中不存在的元素也不会报错。\r\n\r\n代码如下：\r\n\r\n1 <script>\r\n2    $(\"#div\").css(\"color\",\"red\");\r\n3 </script>\r\n有了这个预防措施，即使以后因为某种原因删除网页上某个以前使用过的元素，也不用担心这个网页的JavaScript会报错。\r\n\r\n注意点：\r\n\r\n使用jQuery选择器不仅比使用传统的getElementById()和getElementsByTagName()函数简洁得多，而且还能避免某些错误。请看下面例子：\r\n\r\n1 <script>\r\n2    document.getElementById(\"div\").style.color =\"red\";\r\n3 </script>\r\n运行上面代码后，浏览器就会报错，原因是网页中没有ID为div的元素。\r\n\r\n改进后代码如下：\r\n\r\n1 <script>\r\n2     if(document.getElementById(\"div\")){  //用了IF语句来判断是否有ID为div的元素，如果有，执行下面代码 \r\n3         document.getElementById(\"div\").style.color =\"red\"\r\n4     }\r\n5 </script>\r\n这样就可以避免游览器报错，但如果要操作的元素很多，可能对每个元素都要进行一次判断，而jquery方面问题上的处理是非常不错的，即使用JQUERY获取网页中不存在的元素也不会报错。\r\n\r\n代码如下：\r\n\r\n1 <script>\r\n2    $(\"#div\").css(\"color\",\"red\");\r\n3 </script>\r\n有了这个预防措施，即使以后因为某种原因删除网页上某个以前使用过的元素，也不用担心这个网页的JavaScript会报错。\r\n\r\n注意点：\r\n\r\n$(\"div\")获取的永远是jquery对象，即使网页上没有此元素。因此当要用jquery检查某个元素在网页上是否存在时。\r\n\r\n不能使用以下代码：\r\n\r\n1 <script>\r\n2   if($(\"#div\")){\r\n3       $(\"#div\").css(\"color\",red)  //这样游览器会报错\r\n4   }\r\n5 </script>\r\n而是应该跟获取长度来判断。\r\n\r\n代码如下：\r\n\r\n<script>\r\n  if($(\"#div\").length >0){\r\n      $(\"#div\").css(\"color\",red)\r\n  }\r\n</script>\r\n这时候也可以转化为DOM对象来判断。\r\n\r\n代码如下：\r\n\r\n复制代码\r\n 1 <body>\r\n 2    <div id=\"div\">ccccccc</div>\r\n 3 <script src=\"jquery-2.1.4.min.js\"></script>\r\n 4 <script>\r\n 5    var $div = $(\"#div\");\r\n 6    var  div = $div[0];\r\n 7    if(div){\r\n 8        $div.css(\"color\",\"red\")   //此时DIV的颜色就变为red\r\n 9    }\r\n10 </script>\r\n11 </body>\r\n', '2016-02-20 17:08:09', '1', '1');
INSERT INTO `article` VALUES ('2', '初识js中的闭包', '戴明儒', '今天看了关于js闭包方面的文章，还是有些云里雾里，对于一个菜鸟来说，学习闭包确实有一定的难度，不说别的，能够在网上找到一篇优秀的是那样的不易。\r\n\r\n　　当然之所以闭包难理解，个人觉得是基础知识掌握的不牢，因为闭包牵扯到一些前面的东西，比如作用域\\等等，如果连基本的作用域都没有弄清楚，自然不可能搞懂闭包，还有就是对js的实践比较少，因为你根本就不知道什么时候要用这东西，自然谈不上对闭包的深刻理解。\r\n\r\n　　今天我就简单的说说我目前所理解的闭包，当然可能不完全正确，但是我相信会给你一定的启发。\r\n\r\n \r\n\r\n　　首先我们来谈谈js中的变量，如果你不知道我为什么要说这些，那么你根本没有掌握js的基础，建议回头复习。\r\n\r\njs中分：全局变量 和 局部变量\r\n\r\n　　全局变量：可以在任意位置访问的量就叫全局变量\r\n\r\n　　　　\r\n\r\n1 var age = 20;\r\n2 function a(){\r\n3     console.log(age); >>20\r\n4 }\r\n5 a();\r\n　　局部变量：函数中用var定义的变量，只能在函数中访问这个变量，函数外部访问不了。\r\n\r\n1 function a(){\r\n2     var age = 20;\r\n3 }\r\n4 a();\r\n5 console.log(age); >> Uncaught ReferenceError: age is not defined\r\n \r\n\r\n注意点1：在函数中如果不使用var定义变量那么js引擎会自动添加成全局变量。\r\n\r\n注意点2：全局变量从创建的那一刻起就会一直保存在内存中，除非你关闭这个页面，局部变量当函数运行完以后就会销毁这个变量，假如有多次调用这个函数它下一次调用的时候又会重新创建那个变量，既运行完就销毁，回到最初的状态，简单来说局部变量是一次性的，用完就扔，下次要我再重新创建。\r\n\r\n \r\n\r\n函数的相关知识点：\r\n\r\n        1. 一个函数内可以嵌套多个函数\r\n\r\n　　  2. 函数里面的子函数可以访问它上级定义的变量，注意不只是一级，如果上级没有会继续往上级找，直到找到为止，如果找到全局变量到找不到就会报错。\r\n\r\n 　　　　\r\n\r\n复制代码\r\n1 function a(){\r\n2     var name = \"追梦子\";\r\n3     function b(){\r\n4         console.log(name); >> \"追梦子\"\r\n5     }\r\n6     b();\r\n7 }\r\n8 a();\r\n复制代码\r\n　　  3. 函数的另外一种调用形式，你可以把它叫做自调用，自己调用自己，达到自执行的效果。\r\n\r\n　　　\r\n\r\n1 var a = 0;\r\n2 (function(){\r\n3    console.log(++a); >>1\r\n4 })()\r\n这种方式用()把内容包裹起来，后面的（）表示执行这个函数，可能你会问为什么要把函数包起来，如果不包裹起来，js会把它当作函数声明来处理，如果包裹起来就是表达式，还没有看懂就上网查吧。\r\n\r\n \r\n\r\n \r\n\r\n开始我们正式闭包部分---------------------------- 币包 ---------------像钱包一样的东西，可以把东西包裹起来----------\r\n\r\n      首先我们来看看为什么需要学习闭包，加以理解 -- 0 v  0- -\r\n\r\n \r\n\r\n1 function a(){\r\n2    var num = 0;\r\n3    console.log(++num);\r\n4 }\r\n5 a(); >>1\r\n6 a(); >>1\r\n上面代码输出了两次1，为什么呢？如果你有看我上面的关于变量部分肯定能够想到个大概。\r\n\r\n　　前面我们说过了函数执行完以后，里面的变量（即局部变量）就会销毁，下一次运行又会重新创建那个变量，所以虽然你第一次++num了但是这个变量在第一次执行完毕以后就被销毁了。\r\n\r\n那么我们怎么样才能确保第一次的变量不被销毁，那么就需要我们的闭包出场了。\r\n\r\n温馨提示：JavaScript中有回收机制，函数没有被引用执行完以后这个函数的作用域就会被销毁，如果一个函数被其他变量引用，这个函数的作用域将不会被销毁，（简单来说就是函数里面的变量会被保存下来，你可以理解成全局变量。）\r\n\r\n…………………………………………………………………………………… 当 当 当 ................. 下面有请我们的币包同志\r\n\r\n \r\n\r\n复制代码\r\nfunction a(){\r\n    var aa = 0;\r\n    function b(){\r\n        aa ++;\r\n        console.log(aa);\r\n    }\r\n    return b;\r\n}\r\nvar ab = a();\r\nab(); //1\r\nab(); //2\r\n复制代码\r\n看到了吧里面的变量的值没有被销毁，因为函数a被外部的变量ab引用，所以变量aa没有被回收。\r\n\r\n     如果某个函数被它的父函数之外的一个变量引用，就形成了一个闭包\r\n\r\n还有一种更为常用的闭包写法\r\n\r\n复制代码\r\nvar bi = (function(){\r\n    var a = 0;\r\n    function b(){\r\n        a ++;\r\n        console.log(a);\r\n    }\r\n    return b;\r\n})();\r\n\r\nbi(); //1\r\nbi(); //2\r\nbi(); //3\r\n复制代码\r\n执行过程分析：\r\n\r\n　　首先把一个自执行函数赋值给了bi，这个自执行函数运行完成以后就bi的值就变成了\r\n\r\nfunction b(){\r\n    a ++;\r\n    console.log(a);\r\n}\r\n　　因为我们在上面的代码return回去了b，然后因为这个自执行函数被bi引用所以里面的变量a并没有因为这个自执行函数执完而销毁，而是保存到了内存中，所以我们多次打印bi（）就成了1、2、3\r\n\r\n \r\n\r\n下面我来说一个闭包的使用场景吧。\r\n\r\n 　　没有使用闭包的版本\r\n\r\n复制代码\r\nwindow.onload = function(){\r\n    var ul = document.getElementsByTagName(\"ul\")[0];\r\n    var li = ul.getElementsByTagName(\"li\");\r\n    for(var i=0;i<li.length;i++){\r\n        li[i].onclick = function(){\r\n            console.log(i); //不管我怎么点都是返回6\r\n        }\r\n    }\r\n}\r\n复制代码\r\n　　使用了闭包的版本\r\n\r\n复制代码\r\nwindow.onload = function(){\r\n    var ul = document.getElementsByTagName(\"ul\")[0];\r\n    var li = ul.getElementsByTagName(\"li\");\r\n    for(var i=0;i<li.length;i++){\r\n        (function(i){\r\n            li[i].onclick = function(){\r\n                console.log(i); //点击第几个返回第几个\r\n            }\r\n        })(i)\r\n    }\r\n}\r\n复制代码\r\n、、、、、如果你不理解这个，你只要这样子用就能够达到效果。', '2016-02-20 17:09:23', '1', '1');
INSERT INTO `article` VALUES ('12', '【node.js】通过cookie-parser来设置用户cookie', '戴明儒', '<p>\r\n    <span style=\"font-size: 16px;\">个人博客做到后台验证的时候需要用到cookie百度了一会最后通过cookie-parser来实现了下面直接上干货</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p>\r\n    <span style=\"font-size: 16px;\">首先通过npm安装cookie-parser\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>\r\n<pre class=\"brush: js;\">\r\n   npm install cookie-parser\r\n</pre>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p>\r\n    <span style=\"font-size: 16px;\">服务端配置</span>\r\n</p>\r\n<p>\r\n    <span style=\"font-size: 16px;\">首先引入</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>\r\n<pre class=\"brush: js;\">\r\nvar cookieParser = require(&#39;cookie-parser&#39;);\r\nvar app = express();\r\napp.use(cookieParser());\r\n</pre>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p>\r\n    <span style=\"font-size: 16px;\">紧接着我在吧判断代码单独封装了一个函数</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>\r\n<pre class=\"brush: js;\">\r\nfunction isSession(req.res){\r\n\r\n  if(req.cookies.isVisit){\r\n\r\n    console.log(req.cookies); //如果存在名为isvisit则打印\r\n\r\n  }else{\r\n\r\n    res.render(&#39;login&#39;,{});//否则跳转到登录页面\r\n\r\n  }\r\n\r\n}\r\n</pre>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p>\r\n    <span style=\"font-size: 16px;\">下面是当登录成功后 设置</span>\r\n</p>\r\n<p></p>\r\n<pre class=\"brush: js;\">\r\n    res.cookie(&#39;isVisit&#39;, &#39;admin&#39;, {maxAge: 60 * 10000});//设置isVisit 时间为10分钟\r\n</pre>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p>\r\n    <span style=\"font-size: 16px;\">到此node简单的通过cookie来设置session就实现了。</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2016-04-21 17:04:55', '1', '1');
INSERT INTO `article` VALUES ('15', 'canvas基础学习一', '戴明儒', '<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">开始之前我要插播一条小知识</span>\r\n</p>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">在IPHONE上手机号码的默认值显示为拨号连接如果不需要可以设置meta的telephone=no就可以了<br/></span>\r\n</p>\r\n<pre class=\"brush: js;\">&lt;meta name=&quot;format-deletion&quot; content=&quot;telephone=no&quot; /&gt;</pre>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">因工作需要今天开始看了一下CANVAS 在此做一个笔记。</span>\r\n</p>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">首先可以使用</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>\r\n<pre class=\"brush: js;\">document.getElementById(&#39;canvas&#39;);</pre>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">来获取canvas对象。然后可以通过</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>\r\n<pre class=\"brush: js;\">canvas.width = 800;canvas.height = 800;</pre>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">来设置canvas的宽高。</span>\r\n</p>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">接下来对canvas的绘制主要用到了 getContext这个方法，这个方法接受一个string类型的参数通常为2d,</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>\r\n<pre class=\"brush: js;\">\r\nvar context = canvas.getContext(&#39;2d&#39;);//使用context对canvas进行绘制\r\ncontext.moveTo(100,100);//接受2个参数X,Y 表示开始的坐标点\r\ncontext.lineWidth = 5;//顾名思义 线条宽度为5\r\ncontext.strokeStyle = &#39;#000000&#39;;//线条的颜色为黑色\r\ncontext.stroke();//确定绘制\r\ncontext.fillStyle = &#39;#000&#39;;//填充颜色\r\ncontext.fill();//确认填充\r\n</pre>\r\n<p>\r\n    <br/>\r\n</p>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">如果我们要绘制多个图形那么只需要将绘制头部添加</span>\r\n</p>\r\n<pre class=\"brush: js;\">context.beginPath();</pre>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">尾部添加</span>\r\n</p>\r\n<pre class=\"brush: js;\">context.closePath();</pre>\r\n<p style=\"line-height: 1.5em;\">\r\n    <span style=\"font-size: 16px;\">暂时就写这么多吧 都是一些基本知识</span>\r\n</p>', '2016-05-10 15:54:16', '1', '1');
INSERT INTO `article` VALUES ('17', '原生JS封装Ajax请求', '戴明儒', '<p>今天项目中做了一个游戏，但是和JQ相冲突，期间需要用到AJAX ， &nbsp;对于我这种用习惯了JQ封装好的AJAX的人，突然来写原生是一件多么痛苦的事情，所以找了个封装好的轮子，就不自己造了，如果以后需要可以随时用。<br/></p><p>下面附上代码</p><p><br/></p><p><br/></p><pre class=\"brush: js;\">function&nbsp;ajax(options)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options&nbsp;=&nbsp;options&nbsp;||&nbsp;{};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options.type&nbsp;=&nbsp;(options.type&nbsp;||&nbsp;&quot;GET&quot;).toUpperCase();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options.dataType&nbsp;=&nbsp;options.dataType&nbsp;||&nbsp;&quot;json&quot;;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;params&nbsp;=&nbsp;formatParams(options.data);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//创建&nbsp;-&nbsp;非IE6&nbsp;-&nbsp;第一步\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(window.XMLHttpRequest)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;xhr&nbsp;=&nbsp;new&nbsp;XMLHttpRequest();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{&nbsp;//IE6及其以下版本浏览器\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;xhr&nbsp;=&nbsp;new&nbsp;ActiveXObject(&#39;Microsoft.XMLHTTP&#39;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//接收&nbsp;-&nbsp;第三步\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xhr.onreadystatechange&nbsp;=&nbsp;function&nbsp;()&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(xhr.readyState&nbsp;==&nbsp;4)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;status&nbsp;=&nbsp;xhr.status;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(status&nbsp;&gt;=&nbsp;200&nbsp;&amp;&amp;&nbsp;status&nbsp;&lt;&nbsp;300)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options.success&nbsp;&amp;&amp;&nbsp;options.success(xhr.responseText,&nbsp;xhr.responseXML);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options.fail&nbsp;&amp;&amp;&nbsp;options.fail(status);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//连接&nbsp;和&nbsp;发送&nbsp;-&nbsp;第二步\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(options.type&nbsp;==&nbsp;&quot;GET&quot;)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xhr.open(&quot;GET&quot;,&nbsp;options.url&nbsp;+&nbsp;&quot;?&quot;&nbsp;+&nbsp;params,&nbsp;true);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xhr.send(null);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;if&nbsp;(options.type&nbsp;==&nbsp;&quot;POST&quot;)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xhr.open(&quot;POST&quot;,&nbsp;options.url,&nbsp;true);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//设置表单提交时的内容类型\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xhr.setRequestHeader(&quot;Content-Type&quot;,&nbsp;&quot;application/x-www-form-urlencoded&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xhr.send(params);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;//格式化参数\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;formatParams(data)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;arr&nbsp;=&nbsp;[];\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(var&nbsp;name&nbsp;in&nbsp;data)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;arr.push(encodeURIComponent(name)&nbsp;+&nbsp;&quot;=&quot;&nbsp;+&nbsp;encodeURIComponent(data[name]));\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;arr.push((&quot;v=&quot;&nbsp;+&nbsp;Math.random()).replace(&quot;.&quot;,&quot;&quot;));\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;arr.join(&quot;&amp;&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p>然后是调用方法</p><p><br/></p><pre class=\"brush: js;\">ajax({\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;url:&nbsp;&quot;./TestXHR.aspx&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//请求地址\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type:&nbsp;&quot;POST&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//请求方式\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data:&nbsp;{&nbsp;name:&nbsp;&quot;super&quot;,&nbsp;age:&nbsp;20&nbsp;},&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//请求参数\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dataType:&nbsp;&quot;json&quot;,\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;success:&nbsp;function&nbsp;(response,&nbsp;xml)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;此处放成功后执行的代码\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fail:&nbsp;function&nbsp;(status)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;此处放失败后执行的代码\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;});</pre>', '2016-05-13 11:10:23', '1', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `headimgpath` varchar(100) DEFAULT NULL,
  `deleteflag` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '戴明儒', '523121837@qq.com', '8899248', null, '1');
INSERT INTO `user` VALUES ('2', 'Daiv', 'daimingru1994@qq.com', 'dcf110119', null, '1');
