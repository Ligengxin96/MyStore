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
  <link rel="icon" href="./res/static/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="./res/layui/css/layui.css"  media="all">
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">


<script type="text/javascript">
//未付款订单
$(function() {
	$.post("order_showOrder.action",{"status":1},function(data){
		if (data == '') {
			$("#unPayOrder").append("<h1>没有未付款订单,<a href=\"book_goodsListUI.action\" class=\"active\">点击这里前往商品页面购物</a>");
		}else { 
		 $(data).each(function(i, n) {
			$("#unPayOrder").append(
					 "<div class=\"content content-nav-base shopcart-content\">"+
				       "<div class=\"cart w1200\">"+
				        " <div class=\"cart-table-th\">"+
				           "<div class=\"\">"+
							  "<div class=\"th-inner\">"+
								  "订单时间:"+n.orderTime+"\t收货地址:"+n.address+""+
								"</div>"+
				          " </div>"+
				         "</div>"+
				         "<div class=\"OrderList\">"+
				           "<div class=\"order-content\" id=\""+n.orderId+"\">"+
				             
				           "</div>"+
				         "</div>"+
				   
				         "<div class=\"FloatBarHolder layui-clear\">"+
				           "<div class=\"th th-chk\">"+
				             "<div class=\"select-all\">"+
				             "</div>"+
				           "</div>"+
									
				           "<div class=\"th Settlement\">"+
				             "<button class=\"layui-btn\" buttonId=\""+n.orderId+"\" onclick=\"changeOrderStatus(\'"+n.orderId+"\',2)\">付款</button>"+
				           "</div>"+
				           "<div class=\"th total\">"+
				             "<p>应付：<span class=\"pieces-total\">"+n.total+"</span></p>"+
				          " </div>"+
									" <div class=\"th-inner\" >"+
										"<button class=\"layui-btn \" onclick=\"deleteOrder(\'"+n.orderId+"\')\">取消订单</button>"+
									 "</div>"+
				         "</div>"+
				      " </div>"+
				     "</div>"
		          )
		          $.post("orderItem_showOrderItem.action",{"orderId":n.orderId},function(data){
		     		 $(data).each(function(i, m) {
		     			$("#"+n.orderId+"").append(
		     					"<ul class=\"item-content layui-clear\">"+
		     		            "<li class=\"th th-chk\">"+
		     		              "<div class=\"select-all\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-item\">"+
		     		              "<div class=\"item-cont\">"+
		     		                "<a href=\"javascript:;\"> <img src=\"./res/static/bookImgs/"+m.image+"\" alt=\"\"></a>"+
		     		                "<div class=\"text\">"+
		     		                  "<div class=\"title\">"+m.bookName+"</div>"+
		     		                "</div>"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-price\">"+
		     		              "<span class=\"th-su\">"+m.currentPrice+'元'+"</span>"+
		     		            "</li>"+
		     		            "<li class=\"th th-amount\">"+
		     		              "<div class=\"box-btn layui-clear\">"+
		     			          	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     		                "<input class=\"Quantity-myinput\" type=\"text\" bookId=\""+m.bookID+"\" name=\"\" value=\""+m.quantity+"本\"  disabled=\"disabled\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-sum\">"+
		     		              "<span class=\"sum\">"+'小计'+(m.currentPrice*m.quantity).toFixed(1)+'元'+"</span>"+
		     		          "</ul>" 
		     		          )
		     		}); 
		     	},"json") ;
		}); 
		}
	},"json") ;
	
	
});
</script>

<script type="text/javascript">
//未发货订单
$(function() {
	$.post("order_showOrder.action",{"status":2},function(data){
		if (data == '') {
			$("#unSentOrder").append("<h1>没有未发货订单,<a href=\"book_goodsListUI.action\" class=\"active\">点击这里前往商品页面购物</a>");
		}else { 
		 $(data).each(function(i, n) {
			$("#unSentOrder").append(
					 "<div class=\"content content-nav-base shopcart-content\">"+
				       "<div class=\"cart w1200\">"+
				        " <div class=\"cart-table-th\">"+
				           "<div class=\"\">"+
							  "<div class=\"th-inner\">"+
								  "订单时间:"+n.orderTime+"\t收货地址:"+n.address+""+
								"</div>"+
				          " </div>"+
				         "</div>"+
				         "<div class=\"OrderList\">"+
				           "<div class=\"order-content\" id=\""+n.orderId+"\">"+
				             
				           "</div>"+
				         "</div>"+
				   
				         "<div class=\"FloatBarHolder layui-clear\">"+
				           "<div class=\"th th-chk\">"+
				             "<div class=\"select-all\">"+
				             "</div>"+
				           "</div>"+
									
				           "<div class=\"th Settlement\">"+
				           "<button class=\"layui-btn\">等待发货</button>"+ 
				           "</div>"+
				           "<div class=\"th total\">"+
				             "<p>预计送达时间:<span class=\"pieces-total\">"+"3天后"+"</span></p>"+ 
				          " </div>"+
									
				         "</div>"+
				      " </div>"+
				     "</div>"
		          )
		          $.post("orderItem_showOrderItem.action",{"orderId":n.orderId},function(data){
		     		 $(data).each(function(i, m) {
		     			$("#"+n.orderId+"").append(
		     					"<ul class=\"item-content layui-clear\">"+
		     		            "<li class=\"th th-chk\">"+
		     		              "<div class=\"select-all\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-item\">"+
		     		              "<div class=\"item-cont\">"+
		     		                "<a href=\"javascript:;\"> <img src=\"./res/static/bookImgs/"+m.image+"\" alt=\"\"></a>"+
		     		                "<div class=\"text\">"+
		     		                  "<div class=\"title\">"+m.bookName+"</div>"+
		     		                "</div>"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-price\">"+
		     		              "<span class=\"th-su\">"+m.currentPrice+'元'+"</span>"+
		     		            "</li>"+
		     		            "<li class=\"th th-amount\">"+
		     		              "<div class=\"box-btn layui-clear\">"+
		     			          	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     		                "<input class=\"Quantity-myinput\" type=\"text\" bookId=\""+m.bookID+"\" name=\"\" value=\""+m.quantity+"本\"  disabled=\"disabled\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-sum\">"+
		     		              "<span class=\"sum\">"+'小计'+(m.currentPrice*m.quantity).toFixed(1)+'元'+"</span>"+
		     		          "</ul>" 
		     		          )
		     		}); 
		     	},"json") ;
		}); 
		}
	},"json") ;
	
	
});
</script>

<script type="text/javascript">
//未确认收货订单
$(function() {
	$.post("order_showOrder.action",{"status":3},function(data){
		if (data == '') {
			$("#unConfirmOrder").append("<h1>没有待签收订单,<a href=\"book_goodsListUI.action\" class=\"active\">点击这里前往商品页面购物</a>");
		}else { 
		 $(data).each(function(i, n) {
			$("#unConfirmOrder").append(
					 "<div class=\"content content-nav-base shopcart-content\">"+
				       "<div class=\"cart w1200\">"+
				        " <div class=\"cart-table-th\">"+
				           "<div class=\"\">"+
							  "<div class=\"th-inner\">"+
								  "订单时间:"+n.orderTime+"\t收货地址:"+n.address+""+
								"</div>"+
				          " </div>"+
				         "</div>"+
				         "<div class=\"OrderList\">"+
				           "<div class=\"order-content\" id=\""+n.orderId+"\">"+
				             
				           "</div>"+
				         "</div>"+
				   
				         "<div class=\"FloatBarHolder layui-clear\">"+
				           "<div class=\"th th-chk\">"+
				             "<div class=\"select-all\">"+
				             "</div>"+
				           "</div>"+
									
				           "<div class=\"th Settlement\">"+
				           "<button class=\"layui-btn\" buttonId=\""+n.orderId+"\" onclick=\"changeOrderStatus(\'"+n.orderId+"\',0)\">确认收货</button>"+ 
				           "</div>"+
				           "<div class=\"th total\">"+
				             "<p><span class=\"pieces-total\"></span></p>"+ 
				          " </div>"+
									
				         "</div>"+
				      " </div>"+
				     "</div>"
		          )
		          $.post("orderItem_showOrderItem.action",{"orderId":n.orderId},function(data){
		     		 $(data).each(function(i, m) {
		     			$("#"+n.orderId+"").append(
		     					"<ul class=\"item-content layui-clear\">"+
		     		            "<li class=\"th th-chk\">"+
		     		              "<div class=\"select-all\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-item\">"+
		     		              "<div class=\"item-cont\">"+
		     		                "<a href=\"javascript:;\"> <img src=\"./res/static/bookImgs/"+m.image+"\" alt=\"\"></a>"+
		     		                "<div class=\"text\">"+
		     		                  "<div class=\"title\">"+m.bookName+"</div>"+
		     		                "</div>"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-price\">"+
		     		              "<span class=\"th-su\">"+m.currentPrice+'元'+"</span>"+
		     		            "</li>"+
		     		            "<li class=\"th th-amount\">"+
		     		              "<div class=\"box-btn layui-clear\">"+
		     			          	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     		                "<input class=\"Quantity-myinput\" type=\"text\" bookId=\""+m.bookID+"\" name=\"\" value=\""+m.quantity+"本\"  disabled=\"disabled\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-sum\">"+
		     		              "<span class=\"sum\">"+'小计'+(m.currentPrice*m.quantity).toFixed(1)+'元'+"</span>"+
		     		          "</ul>" 
		     		          )
		     		}); 
		     	},"json") ;
		}); 
		}
	},"json") ;
	
	
});
</script>

<script type="text/javascript">
//历史订单
$(function() {
	$.post("order_showOrder.action",{"status":0},function(data){
		if (data == '') {
			$("#historyOrder").append("<h1>没有历史订单,<a href=\"book_goodsListUI.action\" class=\"active\">点击这里前往商品页面购物</a>");
		}else { 
		 $(data).each(function(i, n) {
			$("#historyOrder").append(
					 "<div class=\"content content-nav-base shopcart-content\">"+
				       "<div class=\"cart w1200\">"+
				        " <div class=\"cart-table-th\">"+
				           "<div class=\"\">"+
							  "<div class=\"th-inner\">"+
								  "订单时间:"+n.orderTime+"\t收货地址:"+n.address+""+
								"</div>"+
				          " </div>"+
				         "</div>"+
				         "<div class=\"OrderList\">"+
				           "<div class=\"order-content\" id=\""+n.orderId+"\">"+
				             
				           "</div>"+
				         "</div>"+
				   
				         "<div class=\"FloatBarHolder layui-clear\">"+
				           "<div class=\"th th-chk\">"+
				             "<div class=\"select-all\">"+
				             "</div>"+
				           "</div>"+
									
				           "<div class=\"th Settlement\">"+
				          
				           "</div>"+
				           "<div class=\"th total\">"+
				             "<p><span class=\"pieces-total\"></span></p>"+ 
				          " </div>"+
									
				         "</div>"+
				      " </div>"+
				     "</div>"
		          )
		          $.post("orderItem_showOrderItem.action",{"orderId":n.orderId},function(data){
		     		 $(data).each(function(i, m) {
		     			$("#"+n.orderId+"").append(
		     					"<ul class=\"item-content layui-clear\">"+
		     		            "<li class=\"th th-chk\">"+
		     		              "<div class=\"select-all\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-item\">"+
		     		              "<div class=\"item-cont\">"+
		     		                "<a href=\"javascript:;\"> <img src=\"./res/static/bookImgs/"+m.image+"\" alt=\"\"></a>"+
		     		                "<div class=\"text\">"+
		     		                  "<div class=\"title\">"+m.bookName+"</div>"+
		     		                "</div>"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-price\">"+
		     		              "<span class=\"th-su\">"+m.currentPrice+'元'+"</span>"+
		     		            "</li>"+
		     		            "<li class=\"th th-amount\">"+
		     		              "<div class=\"box-btn layui-clear\">"+
		     			          	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		     		                "<input class=\"Quantity-myinput\" type=\"text\" bookId=\""+m.bookID+"\" name=\"\" value=\""+m.quantity+"本\"  disabled=\"disabled\">"+
		     		              "</div>"+
		     		            "</li>"+
		     		            "<li class=\"th th-sum\">"+
		     		              "<span class=\"sum\">"+'小计'+(m.currentPrice*m.quantity).toFixed(1)+'元'+"</span>"+
		     		          "</ul>" 
		     		          )
		     		}); 
		     	},"json") ;
		}); 
		}
	},"json") ;
	
});
</script>

<script type="text/javascript">
//修改订单状态(付款或者确认收货)
 function changeOrderStatus(orderId,satus) {
	$.ajax({
		url : "order_updateOrderStatus.action",
		data : {"id":orderId,"status":satus},
		cache : false,
		async : false,
		type : "POST",
		dataType : 'json',
		error : function() {
			alert("操作成功!");
			window.location.href="orderItem_userInformationUI.action";
		},
	});
} 

</script>
<script type="text/javascript">
//取消订单
 function deleteOrder(orderId) {
	$.ajax({
		url : "order_deleteOrder.action",
		data : {"id":orderId},
		cache : false,
		async : false,
		type : "POST",
		dataType : 'json',
		error : function() {
			alert("操作成功!");
			window.location.href="orderItem_userInformationUI.action";
		},
	});
} 

</script>

<script type="text/javascript">
//修改用户信息
function updateInformation() {
	var userEmail = document.getElementById("userEmail").value;
	var userPhone = document.getElementById("userPhone").value;
	var userAddress = document.getElementById("userAddress").value;
	$.ajax({
		url : "user_updateInformation.action",
		data : {"userEmail":userEmail,"userPhone":userPhone,"userAddress":userAddress},
		cache : false,
		async : false,
		type : "POST",
		dataType : 'json',
		error : function() {
			alert("操作成功!");
			window.location.href="orderItem_userInformationUI.action";
		},
	});
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
         <div class="sp-cart"><a href="shoppingCart_shoppingCartUI.action">购物车</a><span></span></div>
      </div>
    </div>
  </div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top:30px;">
  <legend>个人中心</legend>
</fieldset>

<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">我的信息</li>
    <li>待付款订单</li>
    <li>待发货订单</li>
    <li>待签收订单</li>
    <li>历史订单</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">

   <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">我的邮箱</label>
      <div class="layui-input-inline">
        <input id="userEmail" type="text" value="${user.userEmail}" name="email" lay-verify="email" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">我的手机号</label>
      <div class="layui-input-inline">
        <input id="userPhone" type="text" value="${user.userPhone}" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
    </div>
    
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">收货地址</label>
      <div class="layui-input-inline-my" >
        <input id="userAddress" width="500px" type="text" value="${user.userAddress}" name="address" lay-verify="required|phone" autocomplete="off" class="layui-input" >
      </div>
    </div>
    </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1"  onclick="updateInformation()">修改信息</button>
    </div>
  </div>
</div>

    <div class="layui-tab-item" id="unPayOrder"></div>	   
 
    <div class="layui-tab-item" id="unSentOrder"></div>
    
    <div class="layui-tab-item" id="unConfirmOrder"></div>
    
    <div class="layui-tab-item" id="historyOrder"></div>
    
  </div>
 
<script>
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  
  //…
});
</script>

</body>
</html>