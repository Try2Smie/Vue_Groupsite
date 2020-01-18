// mysql数据库
const mysql = require('mysql')
// 链接池，创建多个链接、复用和分发链接
const pool = mysql.createPool({
	host: 'localhost',
	port: '3306',
	user: 'root',
	password: 'root',
	database: 'groupsite',
	multipleStatements: true  // 允许一个query多条语句
})

// 封装
query = function(sql, callback) {
	pool.getConnection((err, connection) => {
		if (err) console.log('connect failed')
		// if (err) callback(err, null, null)
		connection.query(sql, (err, results) => {
			if (err) console.log(err)
			callback(err, results) // 结果回调
			connection.release() // 释放连接资源
		})
	})
}

module.exports = query;
