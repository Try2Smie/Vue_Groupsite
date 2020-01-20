# Vue_Groupsite 分组网站
使用vuejs(element-ui) + nodejs(express-generator) + Mysql 设计的分组网站



#### 运行项目操作

- 分别通过`cd groupsite`和`cd groupback`进入这两个文件夹，通过`npm install`安装依赖 

- 修改groupback/db/index.js 中MySQL的配置

  ```mysql
  const pool = mysql.createPool({
  	host: 'localhost',
  	port: '3306',
  	user: 'root',  // 修改用户名
  	password: 'root', // 修改密码
  	database: 'groupsite',
  	multipleStatements: true  // 允许一个query多条语句
  })
  ```

- 运行groupsitedb.sql 生成数据库`groupback`的表和数据

- `cd groupback` 通过 `npm start` 运行 nodejs

- `cd groupsite`  通过 `npm run serve` 运行vuejs

- 浏览器查看项目 http://localshot:8080 



#### 更新操作

groupsite中`npm run build` 生成的前端静态文件已经放置到groupback中，将项目下载下来查看的时候不需要再给groupsite安装依赖以及运行，直接对groupback运行`npm start`和`npm stop`即可



----



#### 设计要求：

1. 要求用户注册登录
2. 每个项目有项目名称、项目密码和负责人；只有知道项目密码的用户才能进入一个项目组队
3. 谁都可以建立一个空组（可以只允许项目负责人建立空组）
4. 每个人最后只能在一个组。
5. 可以限定一些人只能加入几个组之一。
6. 每个组要有一个组长
7. 到了截止日期将不允许任何改变。
8. 分组情况可以转换到excel表中。



#### 页面和功能描述

##### 账号相关——登录/注册/退出登录/关于我

- login
  
  ![image-20200120144118157.png](https://i.loli.net/2020/01/20/kF5mGKVvdXS3H86.png)
- register
  ![image-20200120144603500.png](https://i.loli.net/2020/01/20/vwjBXh7zYROWCrd.png)
- 关于我 （需要先登录）
  ![image-20200120151309976.png](https://i.loli.net/2020/01/20/WOzn2crDwTeg4JK.png)
- logout （需要先登录）
  
  - 点击即退出登录



##### 项目相关——项目列表/新建项目/我的项目/项目详情/修改项目

- 项目列表 **（首页）**

  - 根据后端数据库中内容的更新来排序
    ![image-20200120145144478.png](https://i.loli.net/2020/01/20/DJPm2Fzbp9RCqds.png)

- 项目详情

  - 点击“项目列表”中的某个项目即可进入“项目详情”；若选中项目为用户所在项目，则进入“我的项目”

- 新建项目

  ![image-20200120150423639](https://i.loli.net/2020/01/20/rgLqDavSB1ziGhw.png)

  - 可以手动设置项目密码，或者点击生成6位随机密码
  - 若未登录，点击“立即创建”提示“操作失败”
  - 创建项目 等同于 用户成为该项目的项目负责人
  - 如果用户已经参与了其它任一项目，点击“新建项目”会弹出提示“参与项目数量受限”，点击“确定”跳转到”我的项目“
    ![image-20200120151140845](https://i.loli.net/2020/01/20/T7F6ELlWXUkzmAH.png)

- 我的项目 （需要登录，否则跳转到登录页面）

  - 若项目组长已定，则其排在组员最上方，并有标记
  - 若登录用户为项目负责人，则其有权限将任意组员设为组长
    ![image-20200120152012949.png](https://i.loli.net/2020/01/20/i65CraFsUBmkDVQ.png)

  - 若登录用户为项目的组长，则其有权限修改项目
    ![image-20200120152335976.png](https://i.loli.net/2020/01/20/gFDeHVZAiRJ9tB4.png)

- 修改项目

  - 组长有权修改项目标题/项目内容/项目密码

  ![image-20200120152654368.png](https://i.loli.net/2020/01/20/wG4SEWoUv5YzAx7.png)



##### 分组情况 （需要登录，否则跳转到登录页面）

- 显示所有分组情况
- 点击“下载”根据后端数据库会在电脑桌面生成分组情况的excel表格 “分组名单.xlsx”
  ![image-20200120150012290.png](https://i.loli.net/2020/01/20/MEPByq9wvzlbcuC.png)


