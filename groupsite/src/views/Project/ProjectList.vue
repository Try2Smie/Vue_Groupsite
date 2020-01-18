<template>
	<div id="projectList">
		<!-- <el-container> -->
			<el-main>
				<el-table 
					:data="projectlist" 
					@row-click="handleRowClick">
<!-- 					<el-table-column prop="id" label="编号" width="140">
					</el-table-column> -->
					<el-table-column
						type="index"
						:index="indexMethod">
					</el-table-column>
					<el-table-column prop="director_id" label="项目负责人" width="140">
					</el-table-column>
					<el-table-column prop="title" label="标题" width="200">
					</el-table-column>
					<el-table-column prop="body" label="概要">
					</el-table-column>
				</el-table>
			</el-main>
		<!-- </el-container> -->
	</div>
</template>

<script>
export default {
	name: 'projectlist',
	data () {
		return {
			projectlist: null
/* 			projectlist: [{
				director_id: '12345',
				title: '基于vuejs的分组网站',
				body: '基于vuejs的分组网站基于vuejs的分组网站基于vuejs的分组网站，基于vuejs的分组网站基于vuejs的分组网站基于vuejs的分组网站，基于vuejs的分组网站基于vuejs的分组网站基于vuejs的分组网站，'
			}*/
		}
	},
	methods: {
		indexMethod(index) {
			return index+1;
		},
		handleRowClick (row) {
			// console.log(row)
			// 跳转到详情页  把row.title作为route.query 
			// this.$router.push({path: '/projectdetail/', query: {title: row.title}})

			// 跳转到详情页  把row.title作为route.params 
			this.$router.push({path: '/project/detail/'+row.id})
		}
	},

	created () {
		this.$axios.get('/apis/project/showprojectlist').then(res => {
			// console.log(res.data)
			if (res.data.status === 200) {
				this.projectlist = res.data.project_list
			}
		})
	}
}
</script>
<style>
/* 修改默认样式：去掉scoped, id projectList时唯一的，所以不会全局污染 */
#projectList .el-table .cell{ 
	white-space: nowrap;
}
</style>