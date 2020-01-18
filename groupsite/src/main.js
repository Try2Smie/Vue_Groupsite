import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './plugins/element.js'
import VueRouter from 'vue-router'
import axios from 'axios' // 引入axios进行异步请求

Vue.prototype.$axios = axios
// Vue.prototype.$axios = axios.create({
//   baseURL: 'http://localhost:3000'
// })

Vue.config.productionTip = false



// 设置页面标题
router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
})


// 处理element-ui navbar的NavigationDuplicated
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
