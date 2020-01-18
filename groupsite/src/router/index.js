import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import About from '../views/About.vue'

import ProjectList from '../views/Project/ProjectList.vue'
import AddProject from '../views/Project/AddProject.vue'
import ProjectDetail from '../views/Project/ProjectDetail.vue'
import EditProject from '../views/Project/EditProject.vue'

import MyProject from '../views/Home/MyProject.vue'

import GroupMember from '../views/Home/GroupMember.vue'
// import Message from '../views/Home/Message.vue'

import Login from '../views/User/Login.vue'
import Register from '../views/User/Register.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    // component: Home,
    redirect: '/projectlist',
    meta: {
      title: '分组网站'
    }
  },
  {
    path: '/about',
    name: 'about',
    component: About,
    meta: {
      title: '关于'
    }
  },
  // Project
  {
    path: '/projectlist',
    name: 'projectlist',
    component: ProjectList,
    meta: {
      title: '项目列表'
    }
  },
  {
    path: '/addproject',
    name: 'addproject',
    component: AddProject,
    meta: {
      title: '新建项目'
    }
  },
  {
    path: '/project/detail/:id',  // route.params
    name: 'projectdetail',
    component: ProjectDetail,
    meta: {
      title: '详细内容'
    }
  },
  {
    path: '/editproject/:id',
    name: 'editproject',
    component: EditProject,
    meta: {
      title: '修改项目'
    }
  },  
  {
    path: '/myproject',
    name: 'myproject',
    component: MyProject,
    meta: {
      title: '我的项目'
    }
  },
  {
    path: '/groupmember',
    name: 'groupmember',
    component: GroupMember,
    meta: {
      title: '分组情况'
    }
  },
/*   {
    path: '/message',
    name: 'message',
    component: Message,
    meta: {
      title: '消息'
    }
  }, */
  // User
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {
      title: '登录'
    }
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    meta: {
      title: '注册'
    }
  }
]

const router = new VueRouter({
  // mode: 'history',
  routes
})

export default router
