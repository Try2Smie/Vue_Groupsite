<template>
	<div id="projectdetail">
		<el-container>
			<el-main>
				<h3>{{project.title}}</h3>
				<div class="body" v-html="project.body"></div>
			</el-main>
			<el-aside width="25%">
				<h4>项目成员组成</h4>
				<el-table
					:data="memberData"
					stripe
					border
					max-height="400"
					style="width: 100%">
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
				<el-button v-if="showBtn" type="primary" @click="applyToProject()">申请加入项目？</el-button>
			</el-aside>
		</el-container>
	</div>
</template>

<script>
import {MY_PROJECT_ID} from '@/type'
export default {
	name: 'projectdetail',
	data () {
		return {
			showBtn: false,
			project: {
				title: null,
				body: null
			},
/* 			project: {
				title: '标题',
				body: '项目具体内容项目具体内容项目具体内容项目具体内容项目具体内容项目具体内容项目具体内容项目具体内容项目具体内容项目具体内容'
			}, */
			memberData: null
		}
	},
	methods: {
		// 申请加入项目
		applyToProject() {
			this.$prompt('请输入项目密码', '提示', {
				confirmButtonText: '确定',
				cancelButtonText: '取消',
				inputPattern: /^[0-9a-zA-Z]{6}$/,
				inputErrorMessage: '项目密码应为6位字符[0-9a-zA-Z]'
			}).then(({ value }) => {
				// 输入正确密码则成功加入项目组
				this.$axios.post('/apis/member/applytoproject/'+this.$route.params.id, {
					password: value
				}).then(res => {
					// console.log(res.data)
					if (res.data.status === 200) {
						// 更新我的项目id
						this.$store.commit(MY_PROJECT_ID, res.data.my_project_id)

						this.$message({
							type: 'success',
							message: '您已成为小组一员。'
						});
						this.$router.push({path: '/myproject'})
					} else {
						this.$notify.error({
							title: '申请失败',
							message: '密码错误！'
						});
					}
				})
			}).catch(() => {
				this.$message({
				type: 'info',
				message: '取消输入'
				});       
			});			
		}
	},

	created () {
		if (this.$store.state.isLogin & this.$store.state.my_project_id === null) {
			this.showBtn = true // 只有已登录+未参与项目才会显示申请按钮
		}

		if (parseInt(this.$route.params.id) === this.$store.state.my_project_id) {
			this.$router.push({path: '/myproject'})
		} else {
			// 获取项目信息
			// console.log(this.$route.params)
			this.$axios.get('/apis/project/getprojectbyid/'+this.$route.params.id).then(res => {
				// console.log(res.data)
				this.project = res.data.project_detail
				document.title = '项目：' + this.project.title // 更换页面标题
			})

			// 获取成员表
			this.$axios.get('/apis/member/getgroupmembersbyid/'+this.$route.params.id).then(res => {
				// console.log(res.data)
				this.memberData = res.data.group_members
			})
		}
	}
}
</script>

<style scope>
#projectdetail 	h3 {
	text-align: center;
}
#projectdetail .body {
	text-indent: 2em;
}

#projectdetail .el-main {
	margin: 0 auto;
}

.el-aside {
    background-color: #D3DCE6;
    text-align: center;
}

/* 组长 */
/* #projectdetail tbody > tr:first-child {
	background-color: oldlace;
} */
</style>