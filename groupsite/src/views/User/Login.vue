<template>
  <div id="login" style="margin: 0 auto;">
    <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">
        <el-form-item label="用户ID号" prop="userid">
          <el-input type="number" v-model="ruleForm.userid" autocomplete="off" placeholder="请输入你的用户ID号"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input :type="passType" v-model="ruleForm.password" autocomplete="off" placeholder="请输入你的密码">
            <i slot="suffix" title="显示密码" @click="showPlainText(passType)" style="cursor:pointer;"
            :class="[showOpenEye?'el-input__icon iconfont icon-eye-open':'el-input__icon iconfont icon-eye-closed']"></i>
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">登录</el-button>
          &nbsp;&nbsp;没有账号?
          <router-link to="/register">点我注册</router-link>
        </el-form-item>
      </el-form>
    </el-col>
  </div>
</template>

<script>
export default {
  data () {
    return {
      passType: 'password',
      showOpenEye: 'false',

      ruleForm: {
        userid: '',
        password: ''
      },
      rules: {
        userid: [
          {required: true, message: '请填写8位数字用户ID!', trigger: 'blur'},
          { min: 8, max: 8, message: '用户ID为8位', trigger: 'blur' },      
        ],
        password: [
          {required: true, message: '请填写密码!', trigger: 'blur'},
        ]
      }
    }
  },
  methods: {
    // 点击登录
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post('/apis/users/login', {
            user_id: this.ruleForm.userid,
            password: this.ruleForm.password
          }).then(res => {
            // console.log(res.data)
            if (res.data.status === 200) {
              this.$router.push({ path: '/' })
              // 登录后跳转到home页
              window.location.reload() // 页面刷新
            } else {
              this.$notify.error({
                title: '登录失败',
                message: res.data.message
              })
            }
          })
        } else {
          this.$notify.error({
            title: '错误',
            message: '输入格式错误！'
          });
          return false;
        }
      });
    },

    // 显示密码明文/暗文
    showPlainText (passType) {
      if (passType === 'password') {
        this.passType = 'text' // 显示密码变为显示明文
        this.showOpenEye = true
      } else if (passType === 'text') {
        this.passType = 'password'
        this.showOpenEye = false
      }
    }
  },
  created () {

  }
}
</script>

<style>

</style>