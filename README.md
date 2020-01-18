# Vue_Groupsite
使用vuejs(element-ui) + nodejs(express-generator) + Mysql 设计的分组网站



#### 分组网站要求：

（1）要求用户注册登录
（2）每个项目有项目名称、项目密码和负责人；只有知道项目密码的用户才能进入一个项目组队
（3）谁都可以建立一个空组（可以只允许项目负责人建立空组）
（4）每个人最后只能在一个组。
（5）可以限定一些人只能加入几个组之一。
（6）每个组要有一个组长
（7）到了截止日期将不允许任何改变。
（8）分组情况可以转换到excel表中。



#### 运行项目操作

- 下载

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
- `cd groupsite`  通过 `npm run serve` 运行vuejs，浏览器通过http://localshot:8080来查看项目。