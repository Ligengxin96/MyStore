<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>购物车</title>
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<script type="text/javascript">
 //异步查询图书分类
$(function() {
	$.post("shoppingCart_showItem.action",{},function(data){
		 $(data).each(function(i, n) {
			$("#list-cont").append(
					"<ul class=\"item-content layui-clear\">"+
		            "<li class=\"th th-chk\">"+
		              "<div class=\"select-all\">"+
		                "<div class=\"cart-checkbox\">"+
		                  "<input class=\"CheckBoxShop check\" id=\"\" type=\"checkbox\" num=\"all\" name=\"select-all\" value=\"true\">"+
		                "</div>"+
		              "</div>"+
		            "</li>"+
		            "<li class=\"th th-item\">"+
		              "<div class=\"item-cont\">"+
		                "<a href=\"javascript:;\"> <img src=\"./res/static/bookImgs/"+n.bookImage+"\" alt=\"\"></a>"+
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
		                "<div class=\"less layui-btn\">-</div>"+
		                "<input class=\"Quantity-input\" type=\"\" name=\"\" value=\""+n.quantity+"\" disabled=\"disabled\">"+
		                "<div class=\"add layui-btn\">+</div>"+
		              "</div>"+
		            "</li>"+
		            "<li class=\"th th-sum\">"+
		              "<span class=\"sum\">"+n.currentPrice*n.quantity+"</span>"+
		            "</li>"+
		            "<li class=\"th th-op\">"+
		              "<a href=\"javascript:;\"><span class=\"dele-btn\" >删除</span></a>"+
		            "</li>"+
		          "</ul>" 
		          )
		}); 
		 
	},"json") ;
});
 
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
              <input class="check-all check" id="allCheckked" type="checkbox" value="true">
            </div>
          <label>&nbsp;&nbsp;全选</label>
          </div>
        </div>
        <div class="th th-item">
          <div class="th-inner">
            商品
          </div>
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
          <div class="th-inner">
            操作
          </div>
        </div>  
      </div>
      <div class="OrderList">
        <div class="order-content" id="list-cont">
        
        </div>
      </div>

      <div class="FloatBarHolder layui-clear">
        <div class="th th-chk">
          <div class="select-all">
            <div class="cart-checkbox">
              <input class="check-all check" id="" name="select-all" type="checkbox"  value="true">
            </div>
            <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
          </div>
        </div>
        <div class="th batch-deletion">
          <span class="batch-dele-btn">批量删除</span>
        </div>
        <div class="th Settlement">
          <button class="layui-btn">结算</button>
        </div>
        <div class="th total">
          <p>应付：<span class="pieces-total">0</span></p>
        </div>
      </div>
    </div>
  </div>

<script type="text/javascript">
  layui.config({
    base: './res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery','element','car'],function(){
    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
    
    // 模版导入数据
    // var html = demo.innerHTML,
    // listCont = document.getElementById('list-cont');
    // mm.request({
    //   url: '../json/shopcart.json',
    //   success : function(res){
    //     listCont.innerHTML = mm.renderHtml(html,res)
    //     element.render();
    //     car.init()
    //   },
    //   error: function(res){
    //     console.log(res);
    //   }
    // })
    // 
    car.init()


});
</script>
</body>
</html>