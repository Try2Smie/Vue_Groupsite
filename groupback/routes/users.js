var express = require('express');
var router = express.Router();

// 导入MySQL数据库相关
var mysql = require('mysql');
var query = require('../db/index');

/* GET users listing. */
/* get请求显示user表数据 */
router.get('/', async(req, res) => {
  	// res.send(query.toString());
  	let sql = 'SELECT * FROM user'
	query(sql, (err, results) => {
		if (err) {
			res.send(err)
		} else {
			res.send(results)
		}
	})
});

/* 用户注册 */
router.post('/register', async(req, res) => {
  	// console.log(req.body)
	let sql = 'INSERT INTO user (user_id, user_name, password, email) VALUES(?, ?, ?, ?)'
	let inserts = [req.body.user_id, req.body.user_name, req.body.password, req.body.email]
	sql = mysql.format(sql, inserts)

	query(sql, (err, results) => {
		// console.log(results)
		if (err) {
			// console.log(err)
			res.send({
				'status': 0,
				'message': '表user添加数据失败'
			})
		} else {
			// 注册成功同时登录
			req.session.islogin = true
			req.session.user = req.body  // 注册时的req.session.user比登录时的req.session.user少了id项，但不影响getloginstatus
			res.send({
				'status': 200,
				'message': '表user添加一条数据'
			})
		}
	})
});


/* 用户登录及注册时用户ID重复验证 */
router.post('/login', async (req, res) => {
	// console.log(req.body)

	if (Object.keys(req.query).length === 0) { /* 接口没有查询数据时，做用户登录 */
		let sql = 'SELECT * FROM user WHERE user_id=? AND password=?'
		let inserts = [req.body.user_id, req.body.password]
		sql = mysql.format(sql, inserts)
	
		query(sql, (err, results) => {
			if (results.length === 0) { // 没有找到用户名和密码都匹配的数据
				res.send({
					'status': 0,
					'message': '用户名或密码错误'
				})
			} else { // 找到对应数据
				req.session.islogin = true
				req.session.user = results[0]
				res.send({
					'status': 200,
					'message': 'user表中存在该条数据'
				})
			}
		})

	} else { /* 接口有查询数据时，做注册时用户id的存在验证 */
		let sql = 'SELECT * FROM user WHERE user_id=' + req.body.user_id
		query(sql, (err, results) => {
			if (results.length === 0) {
				res.send({
					'status': 0,
					'message': '该用户ID尚未被注册'
				})
			} else {
				res.send({
					'status': 200,
					'message': '该用户ID已存在！'
				})
			}
		})
	}
})


/* 查询登录状态，并返回登录用户名&参与的项目id */
router.get('/getloginstatus', async (req, res) => {
	// console.log('查询session： ', req.session)
	if (req.session.islogin) {
		res.send({
			'status': 200,
			'message': '已登录',
			'user_id': req.session.user.user_id,
			'username': req.session.user.user_name,
			'my_project_id': req.session.user.project_id
		})
	} else {
		res.send({
			'status': 0,
			'message': '未登录'
		})
	}
})


/* 退出登录 */
router.get('/logout', async (req, res) => {
	req.session.destroy()
	// console.log(req.cookies)
	// res.clearCookie('sessionid') // 无效？？？
	// console.log(req.cookies)
	res.send({
		'status': 200,
		'message': '账号已退出登录'
	})
})


/* 永久注销账号 */
/* router.get('/deleteaccount', async (req, res) => {
	let sql = 'DELETE FROM user WHERE user_id=' + req.session.user.user_id
	query(sql, (err, results) => {
		if (err) {
			res.send({
				'status': 0,
				'message': '数据库删除数据操作错误'
			})
		} else {
			req.session.destroy()
			res.send({
				'status': 200,
				'message': '注销账号成功'
			})
		}
	})
}) */


module.exports = router;
