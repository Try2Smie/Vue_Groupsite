<template>
    <div id="register">
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <el-form ref="ruleForm" :model="ruleForm" status-icon :rules="rules">
            <el-form-item label="用户ID" prop="userid">
              <el-input type="number" v-model="ruleForm.userid" autocomplete="off" placeholder="请输入你的ID号"></el-input>
            </el-form-item>            
            <el-form-item label="用户名" prop="username">
              <el-input type="text" v-model="ruleForm.username" autocomplete="off" placeholder="请输入你的用户名"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-input :type="passType1" v-model="ruleForm.password" autocomplete="off" placeholder="请输入你的密码">
                <i slot="suffix" title="显示密码" @click="showPlainText(passType1, 1)" style="cursor:pointer;"
                :class="[showOpenEye1?'el-input__icon iconfont icon-eye-open':'el-input__icon iconfont icon-eye-closed']"></i>
              </el-input>
            </el-form-item>
            <el-form-item label="再次输入密码" prop="checkpassword">
              <el-input :type="passType2" v-model="ruleForm.checkpassword" autocomplete="off" placeholder="请在此输入你的密码">
                <i slot="suffix" title="显示密码" @click="showPlainText(passType2, 2)" style="cursor:pointer;"
                :class="[showOpenEye2?'el-input__icon iconfont icon-eye-open':'el-input__icon iconfont icon-eye-closed']"></i>
              </el-input>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
              <el-input type="email" v-model="ruleForm.email" autocomplete="off" placeholder="请输入你的邮箱地址"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
              <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
          </el-form>
        </el-col>
    </div>
</template>

<script>
export default {
  name: 'register',
  data() {
    // 用户ID是否已经存在 
    let checkUserID = (rule, value, callback) => {
      if (value.length != 8) { // 长度固定
        callback(new Error('请输入8位数字！'))
      } else { // 验证是否已经存在
        this.$axios.post('/apis/users/login?query=userid', {
          user_id: this.ruleForm.userid
        }).then(res => {
          // console.log(res.data)
          if (res.data.status === 200) {
            callback(new Error('该用户ID已被注册！'))
          } else {
            callback()
          }
        })
      }
    }

    // 检测再次输入密码是否正确
    let checkPassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.ruleForm.password) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    };    

    return {
      passType1: 'password', // 初始显示密文
      showOpenEye1: false, // 初始显示闭眼icon
      passType2: 'password', // 初始显示密文
      showOpenEye2: false, // 初始显示闭眼icon
            
      ruleForm: {
        userid: '', // 用户id
        username: '', // 用户名
        password: '', // 密码
        checkpassword: '', // 确认密码
        email: '' // 邮箱
      },
      rules: {
        userid: [
          {required: true, message: '请填写8位数字用户ID号!', trigger: 'blur'}, // 必填
          { validator: checkUserID, trigger: 'blur' } // 长度固定 用户id是否已经存在
        ],        
        username: [
          {required: true, message: '请填写1-18位用户名!', trigger: 'blur'}, // 必填
          { min: 1, max: 18, message: '长度在 1 到 18 个字符', trigger: 'blur' }, // 长度检测
        ],
        password: [
          {required: true, message: '请填写6-12位用户密码!', trigger: 'blur'},
          { min: 6, max: 12, message: '长度在 6 到 12 个字符', trigger: 'blur' }
        ],
        checkpassword: [
          {required: true, message: '请再次填写密码!', trigger: 'blur'},
          { validator: checkPassword, trigger: 'blur' } // 两次输入密码校对
        ],
        email: [
          {required: true, message: '请填写邮箱地址!', trigger: 'blur'},
          { type: 'email', message: '邮箱格式不正确，请输入正确邮箱地址', trigger: ['blur', 'change']} // 输入值类型检测
        ]
      }
    }
  },
  methods: {
    // 点击注册
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post('/apis/users/register', {
            user_id: this.ruleForm.userid,
            user_name: this.ruleForm.username,
            password: this.ruleForm.password,
            email: this.ruleForm.email
          }).then(res => {
            // console.log(res.data)
            if (res.data.status === 200) {
              // console.log("注册完成")
              this.$router.push({ path: '/' })
              // 注册后立即登录，跳转到home页
              window.location.reload() // 页面刷新reload()
            } else {
              return false
            }
          }).catch(err => {
            this.$notify.error({
              title: '错误',
              message: '注册失败！'
            });
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

    // 重置
    resetForm (formName) {
      this.$refs[formName].resetFields()
    },

    // 显示密码明文/暗文
    showPlainText (passType, index) {
      if (index === 1) { // 输入密码
        if (passType === 'password') {
          this.passType1 = 'text' // 显示密码变为显示明文
          this.showOpenEye1 = true
        } else if (passType === 'text') {
          this.passType1 = 'password'
          this.showOpenEye1 = false
        }
      } else { // 再次输入密码
        if (passType === 'password') {
          this.passType2 = 'text' // 显示密码变为显示明文
          this.showOpenEye2 = true
        } else if (passType === 'text') {
          this.passType2 = 'password'
          this.showOpenEye2 = false
        }
      }
    }
  }
}
</script>

<style scoped>

</style>
