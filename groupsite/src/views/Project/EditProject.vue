<template>
	<div id="editProject">
		<el-form :model="project" :rules="rules" ref="project" label-width="100px">
			<el-form-item label="项目标题" prop="title">
				<el-input v-model="project.title"></el-input>
			</el-form-item>
			<el-form-item label="项目内容" prop="body">
				<el-input type="textarea" rows="10" v-model="project.body"></el-input>
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
					<p>确认修改此项目？</p>
					<div style="text-align: right; margin: 0">
						<el-button size="mini" type="text" @click="visible = false">取消</el-button>
						<el-button type="primary" size="mini" @click="submitForm('project')">确定</el-button>
					</div>
					<el-button type="primary" slot="reference">保存修改</el-button>
				</el-popover>				
				<el-button class="reset" @click="resetForm('project')">清空内容</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
import {pasArr, MY_PROJECT_ID} from '@/type'
export default {
	name: 'editproject',
	data () {
		return {
			visible: false,
			project: {
				title: null, // 项目标题
				body: null, // 项目详情主体
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
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.$axios.put('/apis/project/editproject/'+this.$route.params.id, {
						project: this.project
					}).then(res => {
						// console.log(res.data)
						if (res.data.status === 200) {
							this.visible = false
							this.$router.push({path: '/myproject'})
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
		},
		// 清空输入框
		resetForm (formName) {
			this.$refs[formName].resetFields()
		}
	},
	
	created () {
    	/* (给判断语句外套一个异步请求以确保每次页面加载时父组件的getloginstatus先进行) */
		this.$axios.get('/apis/users/getloginstatus').then(res => {

			// 判断是否登录 (由于父组件中异步操作getloginstatus未执行，所以在这里也需要在判断状态前getloginstatus，使得执行顺序为父组件的getloginstatus->该组件getloginstatus->状态判断)
			if (this.$store.state.isLogin !== true) {
				this.$router.push({path: '/login'})
			} else {
				// 获取详情
				// console.log(this.$route.params)
				this.$axios.get('/apis/project/getprojectbyid/'+this.$route.params.id).then(res => {
					// console.log(res.data)
					this.project = res.data.project_detail
					document.title = '修改项目：' + this.project.title // 更换页面标题
				})
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