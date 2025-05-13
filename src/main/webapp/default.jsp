<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/jquery.slideBox.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"> 
jQuery(function($){
	$('#demo2').slideBox({
		direction : 'left',//left,top#方向
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 10,
		startIndex : 1//初始焦点顺序
	});
}); 
</script>
<style type="text/css">
 body,td,div
 {
   font-size:14px;
 }
 #topBg{
 	width:100%;
 	height:200px;
 	background-color:#FFFFFF;
 	background-image:url('images/topbg.jpg');
 	background-repeat:no-repeat;
 	background-position: 50% center;
 }
 .kindflash{
 	width:100%;
 	height:380px;
 	overflow:hidden;
 }
 .leftkind{
 	width:265px;
 	height:380px;
 	box-sizing: border-box;
 	padding:20px;
 	float:left;
 	background-color:#F7F9FA;
	border-radius:10px;
	color:#999C9A;
	overflow:hidden;
 }
 .leftkind .lititle{
 	font-size:16px;
 	color:#000;
 	height:50px;
 	line-height:50px;
 	letter-spacing: 5px;
 }
 #leftContentBTS{
	width:100%;
	height:380px;
	overflow-x:hidden;
	overflow-y:auto;
 }
 #leftContentBTS::-webkit-scrollbar {/*滚动条整体样式*/
        width: 4px; /*高宽分别对应横竖滚动条的尺寸*/
        height: 4px;
 }
 #leftContentBTS::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
        border-radius: 5px;
        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        background: rgba(128,128,128,0.5);
 }
 #leftContentBTS::-webkit-scrollbar-track {/*滚动条里面轨道*/
        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        border-radius: 0;
        background: rgba(0,0,0,0.1);
 }
 .leftkind ul{
 	margin:0;
 	padding:0;
 }
 .leftkind li{
 	list-style:none;
 	width:100%;
	height: 40px;
	line-height: 40px;
	padding-left: 30px;
	background-image:url('images/typeimg.png');
 	background-repeat:no-repeat;
 	background-position: 0 center;
 	background-size: 15px 15px;
 }
 .leftkind li a{
 	color:#999C9A;
 	text-decoration: none;
 }
 .leftkind li a:hover{
 	color:red;
 	text-decoration: none;
 }
 .rightflash{
 	width:640px;
 	height:380px;
 	float:right;
	overflow:hidden;
 }
 .salehottitle{
 	width:100%;
 	height:50px;
 	margin-top:10px;
 	line-height:50px;
 	font-size:16px;
 	color:#000;
 	letter-spacing: 5px;
 }
 .salehot{
 	width:100%;
 	height:720px;
    overflow:hidden;
 }
 .salehot .hotitem{
 	width:300px;
 	height:170px;
 	box-sizing: border-box;
 	float:left;
 	margin-right:8px;
 	margin-bottom:10px;
 	background-color:#F7F9FA;
 	border-radius:10px;
 	padding:10px;
 }
 .salehot .hotitem3{
 	margin-right:0px!important;
 }
 .salehot .hotitemimg{
 	width:120px;
 	height:120px;
 	float:left;
 	margin-top:15px;
 }
 .salehot .hotitemimg img{
 	width:120px;
 	height:120px;
 	border-radius:20px;
 }
 .salehot .hotitemtxt{
 	width:150px;
 	height:120px;
 	float:right;
 	margin-top:15px;
 }
 .salehot .hotitemtxt1{
 	width:100%;
 	min-height:30px;
 	max-height:90px;
 	line-height:30px;
 	overflow:hidden;
 }
 .salehot .hotitemtxt1 a{
 	color:#000;
 }
 .salehot .hotitemtxt1 a:hover{
 	color:#FF5000;
 }
 .salehot .hotitemtxt2{
 	width:100%;
 	min-height:30px;
 	max-height:60px;
 	line-height:30px;
 	color:#FF5000;
 	font-weight:bold;
 	overflow:hidden;
 }
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="home" /></jsp:include>
<div class="middle">
	<div class="kindflash">
		<div class="leftkind">
			<div class="lititle">分类</div>
			<div class="leftContentBTS">
			<ul>
				<c:forEach items="${goodsTypes}" var="goodsType">
				<li><a href="page_goods.action?goods_type_id=${goodsType.goods_type_id}">${goodsType.goods_type_name}</a></li>
				</c:forEach>
			</ul>
			</div>
		</div>
		<div class="rightflash">
			<div id="demo2" class="slideBox">
			  <ul class="items">
			    <li><a href="#" title="这里是测试标题一"><img src="img/a1.jpg"></a></li>
			    <li><a href="#" title="这里是测试标题二"><img src="img/a2.jpg"></a></li>
			    <li><a href="#" title="这里是测试标题三"><img src="img/a3.jpg"></a></li>
			    <li><a href="#" title="这里是测试标题四"><img src="img/a4.jpg"></a></li>
			  </ul>
			</div>
		</div>
	</div>
	<div class="salehottitle">　热销商品 <img src="images/gexingtuijian.png" height="20" style="vertical-align:text-bottom;"></div>
	<div class="salehot">
		<c:forEach items="${goodss1}" var="goods" varStatus="status">
		<div class="hotitem ${(status.index+1)%3==0?'hotitem3':''}">
			<div class="hotitemimg"><img src="images/goodss/${goods.goods_pic}"/></div>
			<div class="hotitemtxt">
				<div class="hotitemtxt1">
					<a href="page_queryGoods.action?goods_id=${goods.goods_id}">${goods.goods_name}</a>
					<br/>销量：${goods.orders_count}
				</div>
				<div class="hotitemtxt2">
					￥${goods.goods_price2}
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
 
</script>
</body>
</html>