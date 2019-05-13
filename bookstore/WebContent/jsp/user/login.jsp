<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>用户登陆</title>
  <link rel="icon" href="./res/static/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
//跳转到注册页面
function registerUI(){
	window.location.href = "user_registerUI.action";
} 
</script>

</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="user_index.action">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="user_loginUI.action">登录</a></div>
        <div class="sp-cart"><a href="shoppingCart_shoppingCartUI.action">购物车</a><span></span></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="index.jsp">
            <img src="./res/static/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
	          
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base  login-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="book_goodsListUI.action" class="active">所有商品</a>
            <a href="buytoday.html">今日团购</a>
            <a href="information.html">图书资讯</a>
            <a href="about.html">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form  class="layui-form" action="user_login.action" method="post">
            <legend>用户登录</legend>
							<h3 align="center" ><font color="red"><s:actionerror/></font></h3>
							<div class="layui-input-inline">
								<input type="text" name="username"  value="<s:property value="username"/>" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-input-inline">
							</div>
							<div class="layui-input-inline">
									<input type="password" name="password" lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-item login-btn">
							<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1" type="submit">登录</button>
							<div class="layui-input-block">
							<button class="layui-btn" onclick="registerUI()" type="button">立即注册</button>
             				 </div>
             				 <div class="layui-input-block"> </div>
							<p><a href="user_changePasswordUI.action" class="fr">忘记密码？</a></p>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">图书资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">Protoss书城版权所有 &copy; 2019-2029</p>
    </div>
  </div>

</body>
</html>