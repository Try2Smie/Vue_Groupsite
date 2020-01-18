import Vue from 'vue'
import Vuex from 'vuex'
import { LOGIN_STATUS, USERNAME, USER_ID, MY_PROJECT_ID } from '../type'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin: false, // 登录状态
    username: null, // 账户名
    user_id: null, // 用户id
    my_project_id: null // 用户的项目id
  },
  mutations: {
    [LOGIN_STATUS](state, payload) {
      state.isLogin = payload
    },
    [USERNAME](state, payload) {
      state.username = payload
    },
    [USER_ID](state, payload) {
      state.user_id = payload
    },
    [MY_PROJECT_ID](state, payload) {
      state.my_project_id = payload
    }
  },
  actions: {
  },
  modules: {
  }
})
