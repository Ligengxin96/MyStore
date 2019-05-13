<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>       
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>商品详情</title>
  <link rel="icon" href="./res/static/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script type="text/javascript">
  layui.config({
    base: './res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery'],function(){
      var mm = layui.mm,$ = layui.$;
      var cur = $('.number-cont input').val();
      $('.number-cont .btn').on('click',function(){
        if($(this).hasClass('add')){
          cur++;
         
        }else{
          if(cur > 1){
            cur--;
          }  
        }
        $('.number-cont input').val(cur)
      })
      
  });
</script>

<script type="text/javascript">
//查询图书评论
$(function() {
	var bookId = ${bookId};
	$.post("comment_findComment.action",{"bookId":bookId},function(data){
		 $(data).each(function(i, n) {
			$("#comment").append(
			"<blockquote class=\"layui-elem-quote layui-quote-nm\">"+n.commentTime+"\t"+n.userName+":"+n.comments+"</blockquote>")
		}); 
	
	},"json") ;
});

</script>

<script type="text/javascript">
//添加到购物车
function addBookToCart() {
	var bookCount = $('.number-cont input').val();
	var bookId = ${bookId};
	 $.ajax({
	        url : 'shoppingCart_addBookToCart.action',
	        data: {"bookCount":bookCount,"bookId":bookId},
	        cache : false, 
	        async : false,
	        type : "POST",
	        dataType : 'text',
	        success :function(date){
	        	if(date == "login"){
	        		alert("请先登陆");
	        		window.location.href="user_loginUI.action";
	        	}
	        	if(date == "addSuccess"){
	        		alert("加入购物车成功");
	        	}
	        }
    });
	
}
</script>

<script type="text/javascript">
//点击立即购买后直接产生订单
function buyNow() {
	var bookIDs = [];
	var bookCount = $('.number-cont input').val();
	var bookId = ${bookId};
	bookIDs.push(bookId);
	bookIDs.push(bookCount);
	var params = $.param({'bookIDs' : bookIDs}, true);
	 $.ajax({
	        url : 'order_buyNow.action',
	        data: params,
	        cache : false, 
	        async : false,
	        type : "POST",
	        dataType : 'text',
	        success :function(date){
	        	debugger
	        	if(date == "login"){
	        		alert("请先登陆");
	        		window.location.href="user_logoutUI.action";
	        	}
	        	else{
	        		//获取的数据是text 直接window.sessionStorage.setItem("orderId",str); 报错 需要转换下数据类型(var str = date;)
	        		var str = date;
	        		window.sessionStorage.setItem("orderId",str);
	        		window.location.href = "order_myOrderUI.action";
	        	}
	        }
    });
	
}
</script>

<script type="text/javascript">
//添加图书评论
function addComment() {
	var comments = document.getElementById("myComment").value;
	var bookId = ${bookId};
	$.ajax({
        url : 'comment_addComment.action',
        data: {"comments":comments,"bookId":bookId},
        cache : false, 
        async : false,
        type : "POST",
        dataType : 'text',
        success :function(date){
        	if(date == "login"){
        		alert("请先登陆");
        		window.location.href="user_logoutUI.action";
        	}
        	if(date == "success"){
        		alert("评论成功");
        		location.reload();
        	}
        }
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

  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="index.jsp" >
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

  <div class="content content-nav-base datails-content">
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
    <div class="data-cont-wrap w1200">
      <div class="crumb">
       <a href="user_index.action">首页</a>
        <span>></span>
         <a href="book_goodsListUI.action" class="active">所有商品</a>
        <span>></span>
        <a href="javascript:;">产品详情</a>
      </div>
      <div class="product-intro layui-clear">
        <div class="preview-wrap">
          <a href="javascript:;"><img src="./res/static/bookImgs/<s:property value="bigImage"/>"></a>
        </div>
        <div class="itemInfo-wrap">
          <div class="itemInfo">
            <div class="title">
              <h4><s:property value="bookName"/> </h4>
              <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
            </div>
            <div class="summary">
              <p class="reference"><span>作者</span><s:property value="author"/></p>
              <p class="reference"><span>ISBN</span><s:property value="ISBN"/></p>
              <p class="reference"><span>出版社</span><s:property value="press"/></p>
              <p class="reference"><span>参考价</span><del>￥</i><s:property value="price"/></del></p>
              <p class="activity"><span>活动价</span><strong class="price"><i>￥</i><fmt:formatNumber value="${price*discount/10 }" pattern="#0.0"/></strong></p>
              <p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong class="address">
              
              <s:if test="#session.user != null">
        		 <s:property value="#session.user.userAddress"/>
        	  </s:if>
        	  <s:if test="#session.user == null">
        		<a href="user_loginUI.action">需要登陆获取收获地址</a>
        	  </s:if>
        	
              </strong></p>
            </div>
            <div class="choose-attrs">
              <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" id="bookCount" name="bookCount" value="1"><span class="add btn">+</span></div></div>
            </div>
           
            <div class="choose-btns">
              <a onclick="buyNow()" ><button class="layui-btn layui-btn-primary purchase-btn">立刻购买</button></a>
           
             <a onclick="addBookToCart()" ><button class="layui-btn  layui-btn-danger car-btn"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>  </a>
            </div>
          </div>
        </div>
      </div>
      
       <div align="center" class="header" >
		<blockquote class="layui-elem-quote">
			<input id="myComment" type="text" name="title" required lay-verify="required" placeholder="谈谈你对这本书的评论吧" autocomplete="off" class="layui-input"></inpute>
			<button class="layui-btn" onclick="addComment()">提交评论</button>
		</blockquote>
  	 </div>  
   
   	<div  class="header" id="comment">
   </div>  
      
    </div>
    
  </div >
   
   
   
  
	   

 
</body>
</html>