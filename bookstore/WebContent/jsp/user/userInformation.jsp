<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="./res/layui/css/layui.css"  media="all">
	<link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script src="./res/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
});
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
        <div class="login">
			<s:if test="#session.user != null">
        		<a href="user_informationUI.action">欢迎你,<s:property value="#session.user.username"/>&nbsp;&nbsp;</a>	
        	</s:if>
        	<s:if test="#session.user != null">
        		<a href="user_logoutUI.action"><font color="black">安全退出</font></a>	
        	</s:if>
        	<s:if test="#session.user == null">
        		<a href="user_loginUI.action">登录</a>
        	</s:if>
		</div>
         <div class="sp-cart"><a href="shoppingCart_shoppingCartUI.action">购物车</a><span>2</span></div>
      </div>
    </div>
  </div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top:30px;">
  <legend>个人中心</legend>
</fieldset>
 
<ul class="layui-nav">
  <li class="layui-nav-item layui-this"><a href="">我的信息</a></li>
  <li class="layui-nav-item "><a href="">待付款订单</a></li>
  <li class="layui-nav-item "><a href="">待发货订单</a></li>
  <li class="layui-nav-item "><a href="">待签收订单</a></li>
</ul>

<h1>&nbsp;&nbsp;</h1>
<form class="layui-form" action="" >

   <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">我的邮箱</label>
      <div class="layui-input-inline">
        <input type="text" value="${user.userEmail}" name="email" lay-verify="email" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">我的手机号</label>
      <div class="layui-input-inline">
        <input type="text" value="${user.userPhone}" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
    </div>
    
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">收货地址</label>
      <div class="layui-input-inline-my" >
        <input width="500px" type="text" value="${user.userAddress}" name="address" lay-verify="required|phone" autocomplete="off" class="layui-input" >
      </div>
    </div>
    </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">修改信息</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>



</body>
</html>