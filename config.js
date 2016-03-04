//链接数据库
var mysql = require('mysql');
module.exports.conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database:'blog-world',
    port: 3306
});
