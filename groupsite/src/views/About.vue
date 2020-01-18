<template>
  <div class="about">
    <h1>基于Vuejs和Express的分组网站</h1>
    <p>Jaelyn.S 2019.11</p>
    <!-- <el-button v-show="$store.state.isLogin" type="primary" @click="deleteAccount()">点击注销账号</el-button> -->
  </div>
</template>

<script>
export default {
  name: 'about',
/*   methods: {
    // 删除账户，永久注销账号
    deleteAccount () {
      this.$axios.get('/apis/users/deleteaccount').then(res => {
        // console.log(res.data)
        if (res.data.status === 200) {
          window.location.reload() // 直接刷新页面，无需将isLogin赋值false
        }
      })
    }
  } */
}
</script>

<style>

</style>
