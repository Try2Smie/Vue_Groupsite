var express = require('express');
var router = express.Router();

// 导入MySQL数据库相关
var mysql = require('mysql');
var query = require('../db/index');

// xlsx
var xlsx = require('node-xlsx').default;
var fs = require('fs')

var os = require('os')

/* 显示某个项目的成员表信息 */
router.get('/getmemberofproject/:id', function(req, res, next) {
	let sql = `SELECT * FROM project_${req.params.id}`
	query(sql, (err, results) => {
		res.send(results)
	})
});


/* 根据项目id，获取项目的小组成员信息——顺序：先组长，然后按照user_id顺序 */
router.get('/getgroupmembersbyid/:id', async (req, res) => {
	// console.log(req.params)
	let sql = `SELECT * FROM project_${req.params.id} ORDER BY user_id`
	query(sql, (err, results) => {
		if (err) {
			res.send({
				'status': 0,
				'message': '查询不到该项目的成员信息'
			})
		} else {
			// console.log(results)
			let group_members = results
			let director = {}
			let leader = {}
			for(let index in group_members) {
				if (group_members[index].status === 3) { // 项目负责人兼组长
					let entry = group_members[index]  
					director = entry
					leader = entry

					group_members.splice(index, 1)
					entry.user_name = entry.user_name + '(组长)'
					group_members.unshift(entry)
					break; // 项目负责人与组长都已找到
				} else if (group_members[index].status === 1) { // 项目负责人（排序后项目负责人不一定在第一位）
					director = group_members[index]
				} else if (group_members[index].status === 2) { // 组长
					let entry = group_members[index]  
					leader = entry

					group_members.splice(index, 1)
					entry.user_name = entry.user_name + '(组长)'
					group_members.unshift(entry)	
				}
			}

			res.send({
				'status': 200,
				'group_members': group_members,
				'director': director, // 项目负责人
				'leader': leader // 组长
			})
		}
	})
})


/* 点击申请，输入正确密码则可加入项目 */
router.post('/applytoproject/:id', async (req, res) => {
	let sql_psw = `SELECT project_psw FROM project WHERE id=${req.params.id}`
	query(sql_psw, (err_psw, results_psw) => {
		// 输入正确密码，成功加入项目组
		if (results_psw[0].project_psw === req.body.password) { 
			let sql = `
			INSERT INTO project_${req.params.id} (user_id, user_name) VALUES (${req.session.user.user_id}, '${req.session.user.user_name}');
			UPDATE user SET project_id=${req.params.id} WHERE user_id=${req.session.user.user_id};
			`
			query(sql, (err, results) => {
				if (err) {
					res.send({
						'status': 1,
						'message': '密码正确，但是数据库操作错误，申请失败！'
					})
				} else {
					// 前端后端都要更新req.session.user.project_id
					req.session.user.project_id = req.params.id
					res.send({
						'status': 200,
						'message': '密码正确，并且申请成功！',
						'my_project_id': req.session.user.project_id
					})
				}
			})
		} else { // 密码错误
			res.send({
				'status': 0,
				'message': '密码错误！'
			})
		}
	})
})


/* （重新）选定组长 */
router.put('/chooseleader', async (req, res) => {
	console.log(req.body.new_leader_id)
	console.log(req.body.status_string)
	let sql

	//1 未选定组长的情况
	if (req.body.status_string === 'nooriginalleader') {
		if (req.session.user.user_id === req.body.new_leader_id) { // 1-1 项目负责人兼组长 （负责人status由1设为3）
			sql = `UPDATE project_${req.session.user.project_id} SET status=3 WHERE user_id=${req.session.user.user_id};`
		} else { // 1-2 选中组长不是项目负责人 （选中组长的status设为2）
			sql = `UPDATE project_${req.session.user.project_id} SET status=2 WHERE user_id=${req.body.new_leader_id};`
		}

		query(sql, (err, results) => {
			if (err) {
				res.send({
					'status': 0,
					'message': '数据库操作错误！'
				})
			} else {
				res.send({
					'status': 200,
					'message': '成功修改组长！'
				})
			}
		})

	// 2 重新选定组长：删除原组长数据并修改现在组长状态
	} else if (req.body.status_string === 'changeleader') {
		// 先查看项目负责人在这个项目中的status，是否兼任原组长
		let origin_leader_status
		query(`SELECT status FROM project_${req.session.user.project_id} WHERE user_id=${req.session.user.user_id}`, (err, results) => {
			origin_leader_status = results[0].status
			// console.log("origin_leader_status: ", origin_leader_status)

			// 2-1 项目负责人兼原组长 （将负责人status由3变1，并新组长status设为2）		
			if (origin_leader_status === 3) {
				sql = `
				UPDATE project_${req.session.user.project_id} SET status=1 WHERE user_id=${req.session.user.user_id};
				UPDATE project_${req.session.user.project_id} SET status=2 WHERE user_id=${req.body.new_leader_id};
				`
			// 2-2 项目负责人不是原组长 
			} else {
				// 2-2-1 选中的新组长为项目负责人 （将原组长status设为null，项目负责人status由1设为3）
				if (req.body.new_leader_id === req.session.user.user_id) {
					sql = `
					UPDATE project_${req.session.user.project_id} SET status=null WHERE status=2;
					UPDATE project_${req.session.user.project_id} SET status=3 WHERE user_id=${req.session.user.user_id};
					`
					// 2-2-2 选中的新组长不是项目负责人 （将原组长status设为null，新组长status设为2）
				} else {
					sql = `
					UPDATE project_${req.session.user.project_id} SET status=null WHERE status=2;
					UPDATE project_${req.session.user.project_id} SET status=2 WHERE user_id=${req.body.new_leader_id};
					`
				}
			}		
			// console.log("sql: ", sql)

			query(sql, (err, results) => {
				if (err) {
					res.send({
						'status': 0,
						'message': '数据库操作错误！'
					})
				} else {
					res.send({
						'status': 200,
						'message': '成功修改组长！'
					})
				}
			})			
		})
	}

})


/* 获取全部组队情况 */
/* 导出组队信息到excel表 */
router.get('/getallgroups/:status', async (req, res) => {
	// console.log(req.params)

	let sql = 'SELECT project_id, user_id, user_name FROM user ORDER BY project_id, user_id'

	query(sql, (err, results)=>{
		if (err) {
			res.send({
				'status': 0,
				'message': '数据库操作错误！'
			})
		} else {
			// 显示所有小组成员
			if (req.params.status === 'display') {
				res.send({
					'status': 200,
					'groupdata': results
				})
			} else if (req.params.status === 'exporttoexcel') { // 导出excel
				let data = [] // 将这个数组写入excel 
				let title = ['项目编号', '学工号', '姓名']//这是第一行 俗称列名 
				data.push(title) // 添加列名 

				let id = results[0].project_id // 第一个user的项目编号
				results.forEach((element) => {
					let arrInner = []
					if (element.project_id != id) {
						data.push([])
						id = element.project_id
					}
					if (id === null) {
						arrInner.push("未组队")
					} else {
						arrInner.push(element.project_id)
					}

					arrInner.push(element.user_id)
					arrInner.push(element.user_name)
					data.push(arrInner)
				});
				// console.log(data)

				let buffer = xlsx.build([{
					name: "sheet1", // sheet 名称
					data: data 
				}]);

				let dir = `${os.homedir()}/Desktop/分组名单.xlsx`
				// let dir = './分组名单.xlsx'
				fs.writeFile(dir, buffer, {flag: 'w+'}, (err) => { 
					if(err) { 
						res.send({
							'status': 1,
							'message': '写入excel失败！'
						})
					} else { 
						res.send({
							'status': 200,
							'message': '写入excel成功！文件已保存到桌面'
						})
					} 
				});
			}
		}
	})
})

module.exports = router;

