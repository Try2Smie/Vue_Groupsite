var express = require('express');
var router = express.Router();

// 导入MySQL数据库相关
var mysql = require('mysql');
var query = require('../db/index');

/* 获取所有项目信息 */
router.get('/', function(req, res, next) {
	// res.render('index', { title: 'Express' });
	let sql = 'SELECT * FROM project'
	query(sql, (err, results) => {
		res.send(results)
	})
});


/* 新增项目 */ 
// 项目标题，项目主体，项目负责人id，项目创建时间，项目密码
router.post('/addproject', async (req, res) => {
  // console.log(req.session)
  // console.log(req.body)
	let sql = 'INSERT INTO project (project_title, project_body, director_id, project_psw, create_time) VALUES (?,?,?,?,?)'
	let inserts = [req.body.project.title, req.body.project.body, req.session.user.user_id, req.body.project.password, new Date()]
	sql = mysql.format(sql, inserts)
  // console.log(sql)

	query(sql, (err, results) => {
		if (err) {
			// console.log(err)
			res.send({
				'status': 0,
				'message': '表project添加数据失败'
			})
		} else {
			// console.log(results)
			// 给每个项目新建一个成员表，项目负责人也是组员(status=1)  组长status=2  其余null
			let sql2 = `CREATE TABLE project_${results.insertId} (
				id INT PRIMARY KEY AUTO_INCREMENT,
				user_id INT NOT NULL,
				user_name VARCHAR(255) NOT NULL,
				status INT,
				FOREIGN KEY (user_id) REFERENCES user(user_id)
			);
			INSERT INTO project_${results.insertId} (user_id, user_name, status) VALUES (${req.session.user.user_id}, '${req.session.user.user_name}', 1);
			UPDATE user SET project_id=${results.insertId} WHERE user_id=${req.session.user.user_id};
			`
			// console.log(sql2)
			query(sql2, (err2, results2) => {
				if (err2) {
					res.send({
						'status': 1,
						'message': '给该项目创建成员表并添加成员失败'
					})
				} else {
					// 前端后端都要更新req.session.user.project_id
					req.session.user.project_id = results.insertId
					res.send({
						'status': 200,
						'message': '表project添加一条数据&成员表创建并添加成员成功',
						'my_project_id': req.session.user.project_id
					})
				}
			})
		}
	})
})


/* 显示所有项目列表 */
router.get('/showprojectlist', async (req, res) => {
	let sql = 'SELECT * FROM project ORDER BY update_time DESC'
	query(sql, (err, results) => {
		if (err) {
			res.send({
				'status': 0,
				'message': '数据库操作错误'
			})
		} else {
			// console.log(results)
			let project_list = [];
			results.forEach(element => {
				// console.log(element)
				project_list.push({
					'id': element.id,
					'director_id': element.director_id,
					'title': element.project_title,
					'body': element.project_body,
					'update_time': element.update_time
				})
			});
			res.send({
				'status': 200,
				'message': '成功获取所有项目列表数据',
				'project_list': project_list
			})
		}
	})
})


/* 根据项目id，获取具体一个项目的全部信息 */
router.get('/getprojectbyid/:id', async (req, res) => {
	// console.log(req.params)
	let sql = `SELECT * FROM project WHERE id=${req.params.id}`
	query(sql, (err, results) => {
		if (err) {
			res.send({
				'status': 0,
				'message': '数据库操作错误'
			})
		} else {
			// console.log(results)
			let project_detail = {
				'title': results[0].project_title,
				'body': results[0].project_body,
				'password': results[0].project_psw
			}
			res.send({
				'status': 200,
				'message': 'ok',
				'project_detail': project_detail
			})
		}
	})
})



/* 修改项目 */ 
// 项目标题，项目主体，项目更新时间，项目密码
router.put('/editproject/:id', async (req, res) => {
	// console.log(req.body)
	// console.log(req.params)

	let sql = 'UPDATE project SET project_title = ?, project_body = ?, project_psw = ? WHERE id = ?'
	let inserts = [req.body.project.title, req.body.project.body, req.body.project.password, req.params.id]
	sql = mysql.format(sql, inserts)
	// console.log(sql)

	query(sql, (err, results) => {
		if (err) {
			res.send({
				'status': 0,
				'message': '数据库操作失败'
			})
		} else {
			res.send({
				'status': 200,
				'message': '修改项目详情成功！'
			})
		}
	})
})


module.exports = router;


