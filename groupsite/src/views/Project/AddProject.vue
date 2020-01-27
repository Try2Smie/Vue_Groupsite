<template>
	<div id="addProject">
		<el-form :model="project" :rules="rules" ref="project" label-width="100px">
			<el-form-item label="项目标题" prop="title">
				<el-input v-model="project.title"></el-input>
			</el-form-item>
			<el-form-item label="项目内容" prop="body">
				<el-input type="textarea" rows="10" v-model="project.body"></el-input>
			</el-form-item>
			<el-form-item label="项目负责人">
				<span style="font-weight: bold;">{{project.director}}</span>				
			</el-form-item>		
			<el-form-item label="项目密码" prop="password">
				<el-col :span="4">
					<el-input v-model="project.password" placeholder="手动输入密码"></el-input>
				</el-col>
				<el-button type="primary" plain @click="generatePsw()">生成随机密码</el-button>
			</el-form-item>					
			<el-form-item>
				<!-- <el-button type="primary" @click="submitForm('project')">立即创建</el-button>				 -->
				<el-popover
					type="primary"
					placement="top"
					width="160"
					v-model="visible">
					<p>确认作为项目负责人创建此项目？</p>
					<div style="text-align: right; margin: 0">
						<el-button size="mini" type="text" @click="visible = false">取消</el-button>
						<el-button type="primary" size="mini" @click="submitForm('project')">确定</el-button>
					</div>
					<el-button type="primary" slot="reference">立即创建</el-button>
				</el-popover>				
				<el-button class="reset" @click="resetForm('project')">清空内容</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
import {pasArr, MY_PROJECT_ID} from '@/type'
export default {
	name: 'addproject',
	data () {
		return {
			visible: false,
			project: {
				title: null, // 项目标题
				body: null, // 项目详情主体
				director: null, // 项目负责人
				password: null // 项目密码
			},

			rules: {
				title: [{ required: true, message: '请输入项目标题', trigger: 'blur' }],
				body: [{ required: true, message: '请输入项目详情', trigger: 'blur' }],
				password: [
					{ required: true, message: '请设置项目密码', trigger: 'blur' },
					{ min: 4, max: 8, message: '长度在 4 到 8 个字符', trigger: 'blur' }]
			}
		}
	},

	methods: {
		// 生成随机密码
		generatePsw() {
			var password = '';
			let pasLen = 6; // 随机密码长度固定为6位
			for (var i=0; i<pasLen; i++){
				var x = Math.floor(Math.random()*pasArr.length);
				password += pasArr[x];
			}
			this.project.password = password
		},
		// 保存新项目
		submitForm(formName) {
			if (this.$store.state.isLogin === true) { // 首先验证是否登录
				this.$refs[formName].validate((valid) => {
					if (valid) {
						this.$axios.post('/apis/project/addproject', {
							project: this.project
						}).then(res => {
							// console.log(res.data)
							if (res.data.status === 200) {
								// 更新我的项目id
								this.$store.commit(MY_PROJECT_ID, res.data.my_project_id)

								this.visible = false
								this.$router.push({path: '/projectlist'})
							}
						})
					} else {
						this.$notify.error({
							title: '错误',
							message: '提交失败！！请重试'
						});						
						return false
					}
				})
			} else {
				this.$notify.error({
					title: '提交失败',
					message: '您还未登录！'
				});
				this.$router.push({path:'/login'})
			}			
		},
		// 清空输入框
		resetForm (formName) {
			this.$refs[formName].resetFields()
		}
	},
	
	created () {
		/* (给判断语句外套一个异步请求以确保每次页面加载时父组件的getloginstatus先进行) */
		this.$axios.get('/apis/users/getloginstatus').then(res => { 
			
			// 在登录状态下且已参与有项目时，提示“参与项目限制”  
			if (this.$store.state.isLogin === true & this.$store.state.my_project_id != null) {
				this.$alert('您已经有参与的项目了', '参与项目限制', {
					center: true,
					confirmButtonText: '确定',
					callback: action => {
						this.$router.push({path: '/myproject'})
					}
				});
			} else {
				this.project.director = this.$store.state.username
			}
		})
	}
}
</script>

<style scope>
.reset {
	margin-left: 20px;
}
</style>