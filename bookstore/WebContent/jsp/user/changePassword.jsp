<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>修改密码</title>
  <link rel="icon" href="./res/static/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./js/regutils.js"></script>
<script type="text/javascript">


	//创建ajax对象
	function  ajaxFunction(){
	   var xmlHttp;
	   try{ // Firefox, Opera 8.0+, Safari
	        xmlHttp=new XMLHttpRequest();
	    }
	    catch (e){
		   try{// Internet Explorer
		         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		      }
		    catch (e){
		      try{
		         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		      }
		      catch (e){}
		      }
	    }
	
		return xmlHttp;
	 }
	
	//post方法
	function checkUserName(){
		var username = document.getElementById("username").value;
		
		//1.获取ajax对象
	 	var request = ajaxFunction();
	 	
		//2.发送请求
	 	request.open("POST","user_checkUsername.action",true);
		
	 	//3. 想获取服务器传送过来的数据， 加一个状态的s监听
		request.onreadystatechange = function(){
			
			//前半段表示 已经能够正常处理。  再判断状态码是否是200
			if(request.readyState == 4 && request.status == 200){
				var exist = request.responseText;
				if(exist==1){
					document.getElementById("span01").innerHTML = "<font ></font>";
				}
				if(exist==0){
					document.getElementById("span01").innerHTML = "<font color='red'>用户名错误!</font>";
				}
				if(exist==2){
					document.getElementById("span01").innerHTML = "<font color='red'>用户名不能为空!</font>";
				}
			}
		}
		
		//如果使用的是post方式带数据，那么 这里要添加头， 说明提交的数据类型是一个经过url编码的form表单数据
		request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		//带数据过去  ， 在send方法里面写表单数据。 
	 	request.send("username="+username);
	}
	
	function checkPassword(){
		var password = document.getElementById("password").value;
		var rePassword = document.getElementById("rePassword").value;
		
		//判断rePassword填写了不然,不填写密码直接移开,一直会提示密码可用
		if(!("" == rePassword)){
			if(password != rePassword){
				document.getElementById("span02").innerHTML = "<font color='red'>两次输入的密码不一致!</font>";
			}else {
				document.getElementById("span02").innerHTML = "<font color='green'>密码可用!</font>";
			}
		}else {
			document.getElementById("span02").innerHTML = "<font color='red'>密码不能为空!</font>";
		}
		
	}
	
	function checkUserEmail() {
		var userEmail = document.getElementById("userEmail").value;
		
		if(checkEmail(userEmail)){
			document.getElementById("span03").innerHTML = "<font color='green'>邮箱格式正确!</font>";
		}else{
			document.getElementById("span03").innerHTML = "<font color='red'>请填写正确的邮箱格式!</font>";
		}
	}
	
	function checkUserPhone(){
		var userPhone = document.getElementById("userPhone").value;
		
		if(checkMobile(userPhone)){
			document.getElementById("span04").innerHTML = "<font color='green'>手机格式正确!</font>";
		}else{
			document.getElementById("span04").innerHTML = "<font color='red'>请填写正确的手机号码!</font>";
		}
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
          <a href="#" >
            <img src="./res/static/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
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
          <form class="layui-form" action="user_changePassword.action" method="post">
            <h1 align="center">修改密码</h1>
            	<h3 align="center" ><font color="red"><s:actionerror/></font></h3>
						<div class="layui-input-inline">
						</div>
							<div class="layui-input-inline">
								<input type="text" id="username" name="username" value="<s:property value="username"/>" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input" onblur="checkUserName()"><span id="span01"></span>
							</div>
							<div class="layui-input-inline">
							</div>
							<div class="layui-input-inline">
								<input type="text" id="userEmail" name="userEmail" value="<s:property value="userEmail"/>" required  lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input" onblur="checkUserEmail()"><span id="span03"></span>
							</div>
							<div class="layui-input-inline">
							</div>
							<div class="layui-input-inline">
								<input type="text"  id="userPhone" name="userPhone" value="<s:property value="userPhone"/>" required  lay-verify="required" placeholder="手机号码" autocomplete="off" class="layui-input" onblur="checkUserPhone()"><span id="span04"></span>
							</div>
							<div class="layui-input-inline">
							</div>
							<div class="layui-input-inline">
								<input type="password" id="password" name="password" required  lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-input-inline">
							</div>
							<div class="layui-input-inline">
								<input type="password" id="rePassword" name="rePassword" required  lay-verify="required" placeholder="确认密码" autocomplete="off" class="layui-input" onblur="checkPassword()"><span id="span02"></span>
							</div>
							<div class="layui-form-item login-btn">
							<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1" type="submit">修改密码</button>
							<div class="layui-input-block">
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