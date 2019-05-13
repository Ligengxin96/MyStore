<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>商品列表</title>
  <link rel="icon" href="./res/static/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script src="./res/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
//异步查询书的总数
 $(function() {
 	$.post("book_findBookCount.action",{"serchBookName": $("#bookName").val(),"serchCategory":window.sessionStorage.getItem("category")},function(data){
 		window.sessionStorage.setItem("bookCount",data);
 	},"json") ;
 });
</script>


<script>
//分类列表
    $(document).on('click', '.sort a', function(){	
      //$(this).addClass('active').siblings().removeClass('active');
    })
    $(document).on('click', '.list-box dd a', function(){	
    	var category = $(this).attr("id");
    	window.sessionStorage.setItem("category",category);
    	location.reload();
    })
    $(document).on('click', '.list-box dt', function(){	
      if($(this).attr('off')){
        $(this).removeClass('active').siblings('dd').show()
        $(this).attr('off','')
      }else{
        $(this).addClass('active').siblings('dd').hide()
        $(this).attr('off',true)
      }

});
</script>

<script type="text/javascript">
 //异步查询图书分类
$(function() {
	$.post("category_findCategory.action",{},function(data){
		 $(data).each(function(i, n) {
          if (n.pid == 0) {
			$("#category").append(
					"<dl id="+n.categoryId+">"+
					"<dt off=\"true\" class=\"active\">"+n.categoryName+"</dt>"+
					"</dl>");
			}
          
          if(n.pid > 0){
        	  $("#"+n.pid).append("<dd style=\"display: none;\"><a herf=\"seByCa\" id=\""+n.categoryId+"\">"+n.categoryName+"</a></dd>");
          }
         
		}); 
		 
	},"json") ;
});
 
</script>

<script>
//分页显示所有图书
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  //总页数大于页码总数
  laypage.render({
    elem: 'demo0'
    ,count: window.sessionStorage.getItem("bookCount") //数据总数
    ,jump: function(obj){
    	var sort = window.sessionStorage.getItem("sort");
    	if(sort == null){
    		sort = "sortByPrice";
    	}
    	$.ajax({
    		 url :'book_findAllBooks.action',
    		 data:{"currPage":obj.curr,"serchBookName":$("#bookName").val(),"serchCategory":window.sessionStorage.getItem("category"),"sort":window.sessionStorage.getItem("sort")},
			 cache : false,
			 async : true,
		     type : "POST",
			 dataType : 'json',
	        success : function (data){	
	 		$("#list-cont").empty();
	 		//window.sessionStoorage.removeItem("category");
			$(data).each(function(i, n) {
				$("#list-cont").append(
			   "<div class=\"item\">"+
			   "<div class=\"img\">"+
			   "<a href=\"book_bookDetails.action?bookId="+n.bookId+"\" > <img src=\"./res/static/bookImgs/"+n.smallImage+"\"></a>"+
			   "</div>"+
	           "<div class=\"text\">"+
	             "<p class=\"title\">"+n.bookName+"</p>"+
	             "<p class=\"title\">作者:"+n.author+"</p>"+
	             "<p class=\"price\">"+
	             "<span class=\"pri\">¥"+(n.price*n.discount/10).toFixed(1)+"</span>"+
	               "<span class=\"nub\">"+n.discount+"折价</span>"+
	             "</p>"+
	           "</div>"+
	         "</div>");
			});
	    }
  		});
    }
  });
});
  
</script>

<script>
//书名查找图书
$("#searchBook").click(function() {
	//var serchBookName = $("#bookName").val();
	//window.sessionStorage.setItem("serchBookName",serchBookName);
	location.reload();

}); 
</script>

<script type="text/javascript">
$(document).on('click', '.list-box dd a', function(){
	var category = $(this).attr("id");
	window.sessionStorage.setItem("category",category);
	location.reload();
});
</script>

<script type="text/javascript">
	function removeAttr() {
	window.sessionStorage.removeItem("category");
	window.location.href="book_goodsListUI.action";
}
</script>

<script type="text/javascript">
function sort(sort) {
	if(sort == 1){
		var sort = "sortByPrice";
		window.sessionStorage.setItem("sort",sort);
		location.reload();
	}
	if(sort == 2){
		var sort = "sortByDiscount";
		window.sessionStorage.setItem("sort",sort);
		location.reload();
		
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
          <form action="" class="layui-form"  novalidate >
            <input type="text" id="bookName" name="bookName" value="<s:property value="bookName"/>" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button id="searchBook" class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base commodity-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
           <a href="" onclick="removeAttr()"  class="active">所有商品</a>
           <a href="buytoday.html">今日团购</a>
           <a href="information.html">图书资讯</a>
           <a href="about.html">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="left-nav">
          <div class="title">所有分类</div>
          <div id="category"  class="list-box">
          
          </div>
        </div>
        <div class="right-cont-wrap">
          <div class="right-cont">
            <div class="sort layui-clear">
              <a  href="" onclick="sort(1)" event = 'volume'>价格</a>
              <a  href="javascript:;" onclick="sort(2)" event = 'price'>折扣</a>
              <a  href="javascript:;" event = 'newprod'>销量</a>
              <a  href="javascript:;" event = 'collection'>收藏</a>
            </div>
            <div class="prod-number">
              <span>&nbsp;</span>
            </div>
            <div class="cont-list layui-clear" id="list-cont">
            
            </div>
            <div id="demo0" style="text-align: center;"></div>
            
          </div>
        </div>
      </div>
    </div>
  </div>

</body>

</html>