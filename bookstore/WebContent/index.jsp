<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>   
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Protoss书城</title>
  <link rel="stylesheet" type="text/css" href="./res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="./res/layui/css/layui.css">
  <script type="text/javascript" src="./res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>  
  
</head>
<body id="list-cont">
  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="user_index.action">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login">
        	<s:if test="#session.user != null">
        		<a href="user_informationUI.action">欢迎你,<s:property value="#session.user.username"/></a>	
        	</s:if>
        	<s:if test="#session.user == null">
        		<a href="user_loginUI.action">登录</a>
        	</s:if>
        </div>
        <div class="sp-cart"><a href="shopcart.html">购物车</a><span>2</span></div>
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
          <form action="book_goodsListUI.action" class="layui-form"  novalidate >
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


  <div class="content">
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
    <div class="category-con">
      <div class="category-inner-con w1200">
        <div class="category-type">
          <h3>全部分类</h3>
        </div>
        <div class="category-tab-content">
          <div class="nav-con">
            <ul class="normal-nav layui-clear">
              <li class="nav-item">
                <div class="title">教育</div>
                <p><a href="#">教材<a href="#">考试</a><a href="#">外语</a><a href="#">工具书</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">小说</div>
                <p><a href="#">中国小说</a><a href="#">外国小说</a><a href="#">悬疑推理</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">青春文学</div>
                <p><a href="#">校园</a><a href="#">情感</a><a href="#">热血</a><a href="#">科幻</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">童书</div>
                <p><a href="#">儿童文学</a><a href="#">科普/百科</a><a href="#">启蒙读物</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">人文社科</div>
                <p><a href="#">历史文化</a><a href="#">政治/军事</a><a href="#">心理学</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">经管</div>
                <p><a href="#">经济</a><a href="#">管理</a><a href="#">投资理财</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">生活</div>
                <p><a href="#">旅游</a><a href="#">美食</a><a href="#">休闲</a><a href="#">手工</a><a href="#">运动</a></p>
								<i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item nobor">
                <div class="title">科技</div>
                <p><a href="#">计算机</a><a href="#">科普</a><a href="#">建筑</a><a href="#">医学</a><a href="#">农林</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div>
        <div class="w1200">
          <img src="./res/static/img/longzu.png">
        </div>
      </div>
    </div>
    <div class="floors">
      <div class="sk">
        <div class="sk_inner w1200">
          <div class="sk_hd">
            <a href="javascript:;">
              <img src="./res/static/img/s_img1.jpg">
            </a>
          </div>
          <div class="sk_bd">
            <div class="layui-carousel" id="test1">
              <div carousel-item>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_1.jpg"></a>
                    <div class="title"><font size="3" color="">魏坤琳的科学养育宝</font></div>
						<font size="2" color="#c2c2c2">魏坤琳 著</font>
                    <div class="price" >
                      <span><font size="3" color="">￥58.00</font></span>
                      <del><font size="3" color="">￥88.00</font></del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_4.jpg"></a>
                    <div class="title"><font size="3" color="">认知尺度</font></div>
                    	<font size="2" color="#c2c2c2">魏坤琳等 著</font>
                    <div class="price" >
                      <span><font size="3" color="">￥29.90</font></span>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_5.jpg"></a>
                    <div class="title"><font size="3" color="">拥有一个你想要的人生</font></div>
                    	<font size="2" color="#c2c2c2">武志红 著，磨铁图</font>
                    <div class="price" >
                      <span><font size="3" color="">￥60.20</font></span>
                      <del><font size="3" color="">￥68.00</font></del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_6.jpg"></a>
                    <div class="title"><font size="3" color="">流浪地球-电影制作</font></div>
                    	<font size="2" color="#c2c2c2">朔方等 著</font>
                    <div class="price" >
                      <span><font size="3" color="">￥53.20</font></span>
                      <del><font size="3" color="">￥59.80</font></del>
                    </div>
                  </div>
                </div>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_7.jpg"></a>
                    <div class="title"><font size="3" color="">夏摩山谷</font></div>
                    	<font size="2" color="#c2c2c2">庆山（安妮宝贝）果麦文化 出品</font>
                    <div class="price" >
                      <span><font size="3" color="">￥48.00</font></span>
                      <del><font size="3" color="">￥58.00</font></del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_8.jpg"></a>
                    <div class="title"><font size="3" color="">	我爱这三分欣喜七分哀伤的世界</font></div>
                    	<font size="2" color="#c2c2c2">[黎巴嫩]纪伯伦 著</font>
                    <div class="price" >
                      <span><font size="3" color="">￥36.80</font></span>
                      <del><font size="3" color="">￥39.80</font></del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_2.jpg"></a>
                   <div class="title"><font size="3" color="">米米没问题</font></div>
                   	<font size="2" color="#c2c2c2">周逸芬/文 陈致元 和英美术团队/图</font>
                   <div class="price" >
                     <span><font size="3" color="">￥118.80</font></span>
                     <del><font size="3" color="">￥139.80</font></del>
                   </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="./res/static/img/must_3.jpg"></a>
                   <div class="title"><font size="3" color="">敢于孤独的勇气</font></div>
                   	<font size="2" color="#c2c2c2">周国平 著</font>
                   <div class="price" >
										 
                     <span><font size="3" color="">￥43.00</font></span>
                     <del><font size="3" color="">￥48.00</font></del>
                   </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>    
      </div>
    </div>






    <div class="hot-recommend-con">
       <div class="hot-con1 w1200 layui-clear">
          <div class="item">
            <h4>热销推荐</h4>
            <div class="big-img">
              <a href="javascript:;"><img src="./res/static/img/hot1.jpg"></a>
            </div>
            <div class="small-img">
              <a href="javascript:;"><img src="./res/static/img/hot2.jpg" alt=""></a>
            </div>
          </div>
          <div class="item">
            <div class="top-img">
              <a href="javascript:;"><img src="./res/static/img/hot3.jpg"></a>
            </div>
            <div class="bottom-img">
              <a href="javascript:;"><img src="./res/static/img/hot4.jpg"></a>
              <a class="baby-cream" href="javascript:;"><img src="./res/static/img/hot5.jpg"></a>
            </div>
          </div>
          <div class="item item1 margin0 padding0">
            <a href="javascript:;"><img src="./res/static/img/hot6.jpg"></a>
            <a href="javascript:;"><img class="btm-img" src="./res/static/img/hot7.jpg"></a>
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
  <script type="text/javascript">

layui.config({
    base: './res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel'],function(){
      var carousel = layui.carousel,
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      }
      carousel.render(option);
});
  </script>
</body>
</html>