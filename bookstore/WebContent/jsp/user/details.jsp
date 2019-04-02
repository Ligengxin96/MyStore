<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>       
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>商品详情</title>
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
function addBookToCart() {
	var bookCount = $('.number-cont input').val();
	window.location.href="shoppingCart_addBookToCart.action?bookId=${bookId}&bookCount="+bookCount;
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
        		<a href="user_informationUI.action">欢迎你,<s:property value="#session.user.username"/>&nbsp&nbsp</a>	
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
              <button class="layui-btn layui-btn-primary purchase-btn">立刻购买</button>
           
             <a onclick="addBookToCart()" ><button class="layui-btn  layui-btn-danger car-btn"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>  </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>