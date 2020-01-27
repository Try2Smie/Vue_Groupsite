<template>
  <div id="app">
    <el-container>
      <el-header>
        <el-col>
          <el-menu :default-active="$route.path" class="el-menu-demo" mode="horizontal" active-text-color="#409EFF" router>
            <el-menu-item><img src="./assets/logo.png" alt="logo" style="width 40px; height: 40px;"></el-menu-item>
            <el-menu-item index="/projectlist"><i class="el-icon-tickets"></i>项目列表</el-menu-item>
            <el-menu-item index="/addproject"><i class="el-icon-edit"></i>新建项目</el-menu-item>            
            <el-menu-item index="/myproject"><i class="el-icon-house"></i>我的项目</el-menu-item>            
            <!-- <el-submenu index="home">
              <template slot="title"><i class="el-icon-house"></i>Home</template>
              <el-menu-item index="/myproject">我的项目</el-menu-item>
              <el-menu-item index="/message">消息提醒</el-menu-item>
            </el-submenu> -->
            <el-menu-item index="/groupmember"><i class="el-icon-aim"></i>分组情况</el-menu-item>            
            <el-submenu index="/user">
              <template slot="title"><i class="el-icon-user"></i>账户</template>
              <div>
                <el-menu-item index="/login" v-if="!islogged">登录</el-menu-item>
                <el-menu-item index="/register" v-if="!islogged">注册</el-menu-item>
                <div v-else>
                  <el-menu-item index="/about">{{$store.state.username}}</el-menu-item>
                  <el-menu-item @click="logout()">退出登录</el-menu-item>
                  <!-- <el-menu-item index="/delete_user">注销</el-menu-item> -->
                </div>
              </div>
            </el-submenu>
          </el-menu>
        </el-col>
      </el-header>

      <el-main>
        <router-view></router-view>
      </el-main>

      <el-footer>
        <el-divider>
          <router-link to="/about"><i class="el-icon-user"></i>Jaelyn.S 2019 </router-link>
        </el-divider>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
import { LOGIN_STATUS, USERNAME, USER_ID, MY_PROJECT_ID } from '@/type'

export default {
  name: 'app',
  data () {
    return {
      islogged: false // 是否登录
    }
  },
  methods: {
    // 退出登录
    logout () {
      this.$axios.get('/apis/users/logout').then(res => {
        // console.log(res.data)
        window.location.reload()
      })
    }
  },
  created () {
    // 查看是否登录，获取登录用户名&参与的项目id
    this.$axios.get('/apis/users/getloginstatus').then(res => {
      // console.log(res.data)
      if (res.data.status === 200) {
        // 将数据存入状态state，并存入local storage，之后取出状态时不会
        this.$store.commit(LOGIN_STATUS, true)
        this.islogged = true
        this.$store.commit(USERNAME, res.data.username) // 用户名 
        this.$store.commit(USER_ID, res.data.user_id) // 用户ID
        this.$store.commit(MY_PROJECT_ID, res.data.my_project_id) // 参与的项目id      

        // console.log(this.$store.state.isLogin)
        // console.log(this.$store.state.username)
        // console.log(this.$store.state.user_id)
        // console.log(this.$store.state.my_project_id)

      } else {
        this.$notify.error({
          title: '登录提醒',
          message: '请先登录以查看更多信息'
        });
      }
    })
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
  margin-top: 20px;
}

.el-main {
  width: 90%;
  margin: auto;
}

.el-footer {
  position: relative;
  top: 200px;
}
</style>
