<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<title>我的购物车</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script language="javascript" type="text/javascript" src=""></script>
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
	.goodsItemTop .goodsTopTitle80{
		width:80px;
		height:50px;
		float:left;
		line-height:50px;
		margin-right:20px;
	}
	.goodsItemTop .goodsTopTitle200{
		width:200px;
		height:50px;
		line-height:50px;
		float:left;
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
		width:80px;
		height:125px;
		line-height:125px;
		float:left;
		font-weight:bold;
		margin-right:20px;
	}
	.goodsItem .goodsCount{
		width:80px;
		height:125px;
		line-height:125px;
		float:left;
		margin-right:20px;
	}
	.goodsItem .goodsDeal{
		width:200px;
		height:125px;
		line-height:125px;
		float:left;
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
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="card" /></jsp:include>
<div class="middle">
	<div class="goodsItemTop">
		<div class="goodsTopTitle305">
			商品信息
		</div>
		<div class="goodsTopTitle80">
			商品单价
		</div>
		<div class="goodsTopTitle80">
			商品数量
		</div>
		<div class="goodsTopTitle80">
			商品金额
		</div>
		<div class="goodsTopTitle200">
			操作
		</div>
	</div>
	<c:if test="${ordersDetails!=null && fn:length(ordersDetails)>0}">
	<c:forEach items="${ordersDetails}" var="ordersDetail">
	<div class="goodsItem">
		<img src="images/goodss/${ordersDetail.goods_pic}" />
		<div class="goodsTitle">
			<a href="page_queryGoods.action?goods_id=${ordersDetail.goods_id}">${ordersDetail.goods_name}</a>
		</div>
		<div class="goodsPrice"  id="goods_price-${ordersDetail.goods_id}">￥${ordersDetail.goods_price}</div>
		<div class="goodsCount">
			<input type="text" id="goods_count-${ordersDetail.goods_id}" value="${ordersDetail.goods_count}" style="width:60px;text-align:center;"/>
		</div>
		<div class="goodsPrice" style="color:#FF4400"  id="goods_money-${ordersDetail.goods_id}">
			￥${ordersDetail.goods_money}
		</div>
		<div class="goodsDeal">
			<a href="page_delGoodsFromCard.action?goods_id=${ordersDetail.goods_id}">删除</a>
		</div>
	</div>
	</c:forEach>
	<div class="goodsItemTop" style="text-align:right">
		<input type="button" id="clearBtn" class="btnAdd" value="清空购物车"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="addBtn" class="btnAdd" value="提交订单"/>
	</div>
	</c:if>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	var num= /^\d+$/;
	var addBtn = $("#addBtn");
	var clearBtn = $("#clearBtn");
	//清空购物车
	clearBtn.bind("click",function(){
		if(confirm('确认清空购物车吗!?')){
	       window.location.href="page_clearCard.action";
	    }
	});
	
	//提交订单
	addBtn.bind("click",function(){
		let flag = true;
		$("input[id^='goods_count']").each(function(){
			var goods_count = $(this).val();
			if(Number(goods_count)<=0){
				alert('购物车内所有商品数量不能为空！');
				flag = false;
				return false;
			}
		});

		if(flag){
			window.location.href="page_addOrdersShow.action";
		}
	});
	
	//修改购物车
	var temp_count=0;
	$("input[id^='goods_count']").focus(function(){
		temp_count = $(this).val();
	});
	$("input[id^='goods_count']").blur(function(){
		var goods_id = $(this).attr('id').split('-')[1];
		var goods_count = $(this).val();
		if(Number(goods_count)!=Number(temp_count)){
			var aQuery = {
					'goods_id':goods_id,
					'goods_count':goods_count
			};  
			$.post('page_modifyCard.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 //alert('修改成功！');
							 var goods_price = Number($("#goods_price-"+goods_id).html().replace('￥',''));
							 $("#goods_money-"+goods_id).html('￥'+Number(goods_count)*goods_price);
						}else  if(responseObj.err.msg){
							 alert('失败：'+responseObj.err.msg);
						}else{
							 alert('失败：服务器异常！');
						}	
			 },'json');
		}
	});
});
</script>
</body>
</html>