var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session') //中间件--用于下发session
var parseurl = require('parseurl')   // test


var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');  /* 账户相关api */
var projectRouter = require('./routes/project'); /* 项目相关api */
var memberRouter = require('./routes/member'); /* 项目成员相关api */

var app = express();


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json()); // 告诉express要识别客户端提交过来的json
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// app.use(require('cors')()) // 后端设置允许跨域，弃用


/* 使用express-session下发session */
app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: 'keyboard cat', 
  name: 'sessionid', // 默认为connect.sid
  resave: false,
  saveUninitialized: true,
  // cookie: { secure: true }
}))

// 添加统一接口前缀/apis  使得与前端proxy代理一致
app.use('/apis/', indexRouter);
app.use('/apis/users', usersRouter);  // 用户信息
app.use('/apis/project', projectRouter); // 项目相关
app.use('/apis/member', memberRouter); // 个人中心

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
