<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<title>提交订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	 
	
</script>
<style type="text/css">
	.goodsItemTop{
		width:100%;
		height:50px;
		box-sizing: border-box;
		padding:10px;
		padding-left:30px;
		font-size:14px;
		font-weight:bold;
		margin-bottom:10px;
	}
	.goodsItemTop .goodsTopTitle305{
		width:305px;
		height:50px;
		line-height:50px;
		float:left;
		margin-right:20px;
	}
	.goodsItemTop .goodsTopTitle150{
		width:150px;
		height:50px;
		float:left;
		line-height:50px;
		margin-right:20px;
		text-align:center;
	}
	
	.goodsItem{
		width:100%;
		height:125px;
		box-sizing: border-box;
		padding:10px;
		padding-left:30px;
		background-color:#F5F5F5;
		border-radius:10px;
		margin-bottom:10px;
	}
	.goodsItem img{
		width:85px;
		height:85px;
		float:left;
		margin-top:20px;
		margin-right:20px;
		border-radius:10px;
	}
	.goodsItem .goodsTitle{
		width:200px;
		height:85px;
		line-height:25px;
		float:left;
		margin-top:20px;
		margin-right:20px;
	}
	.goodsItem a{
		color:#000;
		text-decoration: none;
		border:0px;
	}
	.goodsItem a:hover{
		color:#FF4400;
	}
	.goodsItem .goodsPrice{
		width:150px;
		height:125px;
		line-height:125px;
		float:left;
		font-weight:bold;
		margin-right:20px;
		text-align:center;
	}
	.goodsItem .goodsCount{
		width:150px;
		height:125px;
		line-height:125px;
		float:left;
		margin-right:20px;
		text-align:center;
	}
	.btnAdd{
		CURSOR: pointer;
		COLOR: white;
		HEIGHT: 40px;
		background-repeat: repeat-x;
		border: 1px solid #FF5000;
		background-color:#FF5000;
		vertical-align:text-bottom;
		border-radius: 20px;
		font-size:14px;
	}
	
	.goodsItemTotal{
		width:100%;
		height:60px;
		line-height:40px;
		box-sizing: border-box;
		padding:10px;
		padding-left:30px;
		background-color:#F5F5F5;
		border-radius:10px;
		margin-bottom:10px;
		text-align:right;
		font-size:14px;
		font-weight:bold;
	}
	
	.inputclass{
		width:250px;
		height:40px;
		float:left;
		margin-right:40px;
		margin-bottom:10px;
		box-sizing: border-box;
		border: 0px solid #56ACFF;
		background-color:white;
		border-radius:2px;
		padding-left:50px;
		color:#000;
	}
	.inputclass:focus{
		box-shadow:none;
		outline: none;
	}
	input::-webkit-input-placeholder{
		color:#E9E9F2;
	}
	
	#mask{
		position:absolute;
		zIndex:1;
		width:100%;
		height:100%;
		top:0px;
		left:0px;
		background-color:#000;
		filter:alpha(opacity=40);
		opacity:0.40;
		display:none;
	}
	#hbzj{
		position:absolute;
		zIndex:999;
		width:700px;
		height:300px;
		box-sizing:border-box;
		top: calc(50% - 150px);
		left: calc(50% - 350px);
		border:1px solid #dbcdbd;
		background-color:white; 
		border-radius:20px;
		padding:10px;
		display:none;
	}	
	.zffs img{
		margin-left:30px;
		cursor:pointer;
	}
	.zffs img.active{
		border-bottom:2px solid #FF5000;
	}
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="card" /></jsp:include>
<div class="middle">
<form name="info" id="info" style="width:100%;height:100%" action="LoginRegSystem.action" method="post">
<input type="hidden" name="user_id" value="${userFront.user_id}"/>
<input type="hidden" name="real_money" value="${real_money}"/>
<input type="hidden" name="user_discard" value="${user_discard}"/>
	<div class="goodsItemTop">
		<div class="goodsTopTitle305">
			商品信息
		</div>
		<div class="goodsTopTitle150">
			商品单价
		</div>
		<div class="goodsTopTitle150">
			商品数量
		</div>
		<div class="goodsTopTitle150">
			商品金额
		</div>
	</div>
	<c:forEach items="${ordersDetails}" var="ordersDetail">
	<div class="goodsItem">
		<img src="images/goodss/${ordersDetail.goods_pic}" />
		<div class="goodsTitle">
			<a href="page_queryGoods.action?goods_id=${ordersDetail.goods_id}">${ordersDetail.goods_name}</a>
		</div>
		<div class="goodsPrice"  id="goods_price-${ordersDetail.goods_id}">￥${ordersDetail.goods_price}</div>
		<div class="goodsCount">
			${ordersDetail.goods_count}
		</div>
		<div class="goodsPrice" style="color:#FF4400"  id="goods_money-${ordersDetail.goods_id}">
			￥${ordersDetail.goods_money}
		</div>
	</div>
	</c:forEach>
	<div class="goodsItemTotal">
		订单总额：<span style="color:#FF4400">￥${orders_money}</span>　　
		会员折扣：${user_discard * 10} 折　　
		实付金额：<span style="color:#FF4400">￥${real_money}</span>
	</div>
	<div class="goodsItemTotal" style="text-align:left">
		<input type="text" placeholder="请填写收件人"  name="real_name" id="real_name" value="${userFront.real_name}" class="inputclass"/>
		<input type="text" placeholder="请输入联系电话" name="user_phone" id="user_phone" value="${userFront.user_phone}" class="inputclass"/>
		<input type="text" placeholder="请输入收货地址" name="user_address" id="user_address" value="${userFront.user_address}" class="inputclass"/>
	</div>
	<div class="goodsItemTotal">
		<input type="button" id="addBtnBefore" class="btnAdd" style="width:200px" value="提交订单"/>
	</div>
</form>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	$("#addBtnBefore").bind("click",function(){
		$("#hbzj").show();
		$("#mask").show();
	});
	
	var addBtn = $("#addBtn");
	//提交订单
	addBtn.bind("click",function(){
		if($("#real_name").val()==''){
			alert("收件人不能为空");
			return;
		}
		if($("#user_phone").val()==''){
			alert("联系电话不能为空");
			return;
		}
		if($("#user_address").val()==''){
			alert("收货地址不能为空");
			return;
		}
		var aQuery = $("#info").serialize();  
		$.post('page_addOrders.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('支付成功！');
						 window.location.href="page_listMyOrderss.action";
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
	});
	
	$(".zffs img").bind("click",function(){
		$(".zffs img").removeClass("active")
		$(this).addClass("active");
	});
	
	$(".closeImg").bind("click",function(){
		$("#hbzj").hide();
		$("#mask").hide();
	});
});
</script>

<div id="mask"></div>
<div id="hbzj">
<div style="width:calc(100% - 20px);height:60px;line-height:60px;;font-weight:bold;font-size:18px;padding-left:20px;border-bottom:1px solid #F5F5F5">
	　选择支付方式进行支付
	  <div class="closeImg" style="width:25px;height:25px;line-height:25px;text-align:center;float:right;margin-right:5px;cursor:pointer">X</div>
</div>
<div class="zffs" style="width:100%;height:140px;margin:10px 0px 10px 0px;line-height:120px;">
	<img src="images/zffswx.png" width="120" class="active"/>
	<img src="images/zffszfb.png" width="120" />
	<img src="images/zffsyl.png" width="120" />
	<img src="images/zffsysf.png" width="120" />
</div>
<div style="width:100%;height:60px;line-height:60px;text-align:center;">
	<input type="button" id="addBtn" class="btnAdd" value="确认支付" style="width:200px"/>
</div>
</div>
</body>
</html>