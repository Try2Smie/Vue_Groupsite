<template>
    <div>
        <el-container>
			<el-col :xs="4" :sm="6" :md="8" :lg="9" :xl="11">
				<el-table
					:data="groupData"
					border
					stripe
					style="width: 100%">
					<el-table-column
						prop="project_id"
						label="项目编号"
						width="80">
					</el-table-column>
					<el-table-column
						prop="user_id"
						label="学工号"
						width="100">
					</el-table-column>
					<el-table-column
						prop="user_name"
						label="姓名">
					</el-table-column>
				</el-table>	
			</el-col>
			<el-row>
				<el-button type="primary" plain @click="downloadExcel">下载(excel)</el-button>
			</el-row>
        </el-container>
    </div>
</template>

<script>
export default {
    name: 'groupmember',
    data () {
        return {
			groupData: [
				{
					project_id: null,
					user_id: null,
					user_name: null
				}
			]
        }
    },
    methods: {
		// 下载成excel
		downloadExcel() {
			this.$axios.get('/apis/member/getallgroups/exporttoexcel').then(res => {
				// console.log(res.data)
				if (res.data.status === 200) {
					this.$message.success('Excel文件已保存到桌面！')
				}
			})
		}
    },
    created () {
		/* (给判断语句外套一个异步请求以确保每次页面加载时父组件的getloginstatus先进行) */
		this.$axios.get('/apis/users/getloginstatus').then(res => {

			// 判断是否登录 (由于父组件中异步操作getloginstatus未执行，所以在这里也需要在判断状态前getloginstatus，使得执行顺序为父组件的getloginstatus->该组件getloginstatus->状态判断)
			if (this.$store.state.isLogin !== true) {
				this.$router.push({path: '/login'})
			} else {
				this.$axios.get('/apis/member/getallgroups/display').then(res => {
					// console.log(res.data)
					this.groupData = res.data.groupdata
				})
			}
		})
    }
}
</script>

<style>
/* .el-row {
	margin-bottom: 20px;
	&:last-child {
	margin-bottom: 0;
	}
} */

.el-row {
	margin-bottom: 20px;
}
.el-row:last-child {
	margin-bottom: 0;
}


.el-col {
	border-radius: 4px;
}
.bg-purple-dark {
	background: #99a9bf;
}
.bg-purple {
	background: #d3dce6;
}
.bg-purple-light {
	background: #e5e9f2;
}
.grid-content {
	border-radius: 4px;
	min-height: 36px;
}
.row-bg {
padding: 10px 0;
background-color: #f9fafc;
}
</style>