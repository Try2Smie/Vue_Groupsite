<template>
	<div id="myproject">
		<el-container>
			<el-main>
				<h3>{{project.title}}</h3>
				<div class="body" v-html="project.body"></div>
			</el-main>
			<el-aside width="25%">
				<h4>项目成员组成</h4>
				<el-table
					:data="memberData"
					@row-dblclick="handleRowdblClick"
					stripe
					border
					max-height="400"
					style="width: 100%"
					highlight-current-row
					@current-change="handleCurrentChange"
					:row-class-name="tableRowClassName">
					<el-table-column
						type="index"
						min-width="2%"
						label=" ">
					</el-table-column>
					<el-table-column
						prop="user_id"
						label="学工号"
						min-width="40%">
					</el-table-column>
					<el-table-column
						prop="user_name"
						label="姓名"
						min-width="58%">
					</el-table-column>
				</el-table>
				<router-link v-show="isleader" :to="{path: '/editproject/'+$store.state.my_project_id}" tag="el-button" class="el-button el-button--primary">修改项目</router-link>
			</el-aside>
		</el-container>
	</div>
</template>

<script>
import { LOGIN_STATUS, USERNAME, USER_ID, MY_PROJECT_ID } from '@/type'
export default {
	name: 'myproject',
	data () {
		return {
			isdirector: false, // 是否为项目负责人
			isleader: false, // 是否为组长
			leader: null, // 组长
			project: {
				title: null,
				body: null
			},
			memberData: null
		}
	},
	methods: {
		// 设置当小组有组长时组长行的颜色
		tableRowClassName({row, rowIndex}) {
			if (row.user_id === this.leader.user_id) {
				return 'leader-row'
			}
			return '';
		},
		
		// 项目负责人点击表格行时的提示
		handleCurrentChange(val) {
			// console.log(val)
			if (this.isdirector) {
				this.$message({
					type: 'info',
					message: `双击可将 【${val.user_name}】 定为组长`
				});
			}
		},

		// 项目负责人通过双击表格行设置组长
		handleRowdblClick (val) {
			// console.log(val)	
			if (this.isdirector) {
				let status_string = '' // 设定组长的三种情况
				let confirm_string = '' // 消息提示语句
				if (Object.keys(this.leader).length === 0) { // 还未有组长
					status_string = 'nooriginalleader'
					confirm_string = `是否确定将组员 【${val.user_name}】 定为组长?`
				} else if (val.user_id === this.leader.user_id) { // 选中者已经是组长了
					status_string = 'alreadyleader' 
					confirm_string = `【${val.user_name}】 已经是组长了！`
				} else { // 已有组长，但选中者不是组长
					status_string = 'changeleader'
					confirm_string = `是否确定将组长 【${this.leader.user_name}】 修改为 【${val.user_name}】?`
				}
				
				this.$confirm(confirm_string, '提示', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning'
				}).then(() => {
					// if status_string != 'alreadyleader'
					if (val.user_id != this.leader.user_id) { // 在选中者本身不是组长的情况下重新选定组长
						this.$axios.put('/apis/member/chooseleader', {
							new_leader_id: val.user_id,
							status_string: status_string
						}).then(res => {
							// console.log(res.data)
							if (res.data.status === 200) {
								this.$message({
									type: 'success',
									message: `组员${val.user_name}已被定为组长！`
								});		
								window.location.reload() // 页面重新加载以更新成员表						
							}
						})
					}
				}).catch(() => {
					this.$message({
						type: 'info',
						message: '已取消'
					});          
				});
			}
		}
	},

	created () {
    	/* (给判断语句外套一个异步请求以确保每次页面加载时父组件的getloginstatus先进行) */
		this.$axios.get('/apis/users/getloginstatus').then(res => {

			// 判断是否登录 (由于父组件中异步操作getloginstatus未执行，所以在这里也需要在判断状态前getloginstatus，使得执行顺序为父组件的getloginstatus->该组件getloginstatus->状态判断)
			if (this.$store.state.isLogin !== true) {
				this.$router.push({path: '/login'})
			} else {
				// 判断是否已经有项目了
				if (this.$store.state.my_project_id == null) { // 未有参与项目为undefined， 不全等与null，并且store状态初值也为null(设置为undefined输出仍为null)
					this.$alert('您还没有参与的项目', '提示', {
						center: true,
						confirmButtonText: '确定',
						callback: action => {
							this.$router.push({path: '/projectlist'})
						}
					});
				} else {
					// 获取项目信息
					// console.log(this.$route.params)
					this.$axios.get('/apis/project/getprojectbyid/'+this.$store.state.my_project_id).then(res => {
						// console.log(res.data)
						this.project = res.data.project_detail
						document.title = '项目：' + this.project.title // 更换页面标题
					})

					// 获取成员表
					this.$axios.get('/apis/member/getgroupmembersbyid/'+this.$store.state.my_project_id).then(res => {
						// console.log(res.data)
						this.memberData = res.data.group_members
						this.leader = res.data.leader
						this.isdirector = (res.data.director.user_id == this.$store.state.user_id)
						this.isleader = (res.data.leader.user_id == this.$store.state.user_id)
						// console.log("负责人：", this.isdirector)
						// console.log("组长：", this.isleader)
					})
				}
			}
		})	
	}	
}
</script>
<style>
#myproject 	h3 {
	text-align: center;
}
#myproject .body {
	text-indent: 2em;
}

#myproject .el-main {
	margin: 0 auto;
}

.el-aside {
    background-color: #D3DCE6;
    text-align: center;
}

.el-table .leader-row {
    background: oldlace;
}

</style>