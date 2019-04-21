<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>我的订单</title>
  <link rel="icon" href="./res/static/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  
</head>

<script type="text/javascript">
//查询订单详情
$(function() {
	var orderId = window.sessionStorage.getItem("orderId");
	$.post("orderItem_showOrderItem.action",{"orderId":orderId},function(data){
		if (data == '') {
			alert("请选择商品")
			window.location.href="shoppingCart_shoppingCartUI.action";
		}else {
		 $(data).each(function(i, n) {
			$("#list-cont").append(
					"<ul class=\"item-content layui-clear\">"+
		            "<li class=\"th th-chk\">"+
		              "<div class=\"select-all\">"+
		              "</div>"+
		            "</li>"+
		            "<li class=\"th th-item\">"+
		              "<div class=\"item-cont\">"+
		                "<a href=\"javascript:;\"> <img src=\"./res/static/bookImgs/"+n.image+"\" alt=\"\"></a>"+
		                "<div class=\"text\">"+
		                  "<div class=\"title\">"+n.bookName+"</div>"+
		                "</div>"+
		              "</div>"+
		            "</li>"+
		            "<li class=\"th th-price\">"+
		              "<span class=\"th-su\">"+n.currentPrice+"</span>"+
		            "</li>"+
		            "<li class=\"th th-amount\">"+
		              "<div class=\"box-btn layui-clear\">"+
			          	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
			        	"<div class=\"less mylayui-btn\" >&nbsp;&nbsp;</div>"+
		                "<input class=\"Quantity-myinput\" type=\"text\" bookId=\""+n.bookID+"\" name=\"\" value=\""+n.quantity+"\"  disabled=\"disabled\">"+
		              "</div>"+
		            "</li>"+
		            "<li class=\"th th-sum\">"+
		              "<span class=\"sum\">"+(n.currentPrice*n.quantity).toFixed(1)+"</span>"+
		          "</ul>" 
		          )
		}); 
		}
	},"json") ;
});
 
</script>

<script type="text/javascript">
$(function() {
	var orderId = window.sessionStorage.getItem("orderId");
	$.post("orderItem_countTotal.action",{"orderId":orderId},function(data){
		if (data == '') {
			alert("请选择商品")
			window.location.href="shoppingCart_shoppingCartUI.action";
		}else {
		 $(data).each(function(i, n) {
			 $("#total").append("<p>应付：<span class=\"pieces-total\">"+n+"</span></p>")
		}); 
		}
	},"json") ;
});
</script>

<script type="text/javascript">
	function pay() {
		var orderId = window.sessionStorage.getItem("orderId");
		$.ajax({
			url : "orderItem_updateOrderStatus.action",
			data : {"orderId":orderId},
			cache : false,
			async : false,
			type : "POST",
			dataType : 'json',
			error : function() {
				alert("付款成功!请在个人中心查看订单信息");
				window.location.href="orderItem_userInformationUI.action";
			},
		});
		
		/* $.post("orderItem_updateOrderStatus.action",{"orderId":orderId},function(data){
			$(data).
			alert("付款成功!请在个人中心查看订单信息");
			window.location.href="orderItem_userInformationUI.action";
		},"json") ; */
		
	}

</script>

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



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="index.jsp" >
            <img src="./res/static/img/logo.png">
          </a>
        </h1>
      </div>
    </div>
  </div>


  <div class="content content-nav-base shopcart-content">
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
		
    <div class="cart w1200">
      <div class="cart-table-th">
        <div class="th th-chk">
          <div class="select-all">
						<div class="cart-checkbox">
						
						</div>
          </div>
        </div>
				<div class="th th-item">
				  <div class="th-inner">
				    商品
				  </div>
				</div>
        <div class="th th-item">
          
        </div>
        <div class="th th-price">
				
          <div class="th-inner">
            单价
          </div>
        </div>
        <div class="th th-amount">
          <div class="th-inner">
            数量
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            小计
          </div>
        </div>
        <div class="th th-op">
          
        </div>  
      </div>
      <div class="OrderList">
        <div class="order-content" id="list-cont">
          
						
        </div>
      </div>

      <div class="FloatBarHolder layui-clear">
        <div class="th th-chk">
          <div class="select-all">
          </div>
        </div>
        <div class="th Settlement">
          <button class="layui-btn" onclick="pay()">付款</button>
        </div>
        <div class="th total" id="total">
         
        </div>
      </div>
    </div>
  </div>

</body>
</html>