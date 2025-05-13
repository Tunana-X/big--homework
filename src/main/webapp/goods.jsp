<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<title>商品列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
 	$("a[id^='serchGoodsType_']").bind("click",function(){
		var goods_type_id = $(this).attr("id").split("_")[1];
		$("#goods_type_id").val(goods_type_id);
		$("#pageNo").val(1);
		$("#info").submit();
	});
 	$("a[id^='serchGoodsFlag_']").bind("click",function(){
		var goods_flag = $(this).attr("id").split("_")[1];
		$("#goods_flag").val(goods_flag);
		$("#pageNo").val(1);
		$("#info").submit();
	});
 	$("a[id^='serchOrderFlag_']").bind("click",function(){
		var order_flag = $(this).attr("id").split("_")[1];
		$("#order_flag").val(order_flag);
		$("#pageNo").val(1);
		$("#info").submit();
	});
 	$("#priceBtn").bind("click",function(){
		$("#pageNo").val(1);
		$("#info").submit();
	});
}); 
</script>
<style type="text/css">
.inputPrice{
	width:80px;
	height:25px;
	border:0px solid #F04844;
	border-radius:20px;
	background-color:#F3F3F3;
	text-align:center;
	margin-right:10px;
}
.inputPrice:focus{
   outline:none;
   box-shadow: none;
}
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="goods" /></jsp:include>
<div class="middle">
	<!--  产品检索展示 -->
	 <div id="product_info">
	 		<!--  产品列表 -->
	 		<form name="info" id="info" action="page_goods.action" method="post">
	 		<input type="hidden" id="pageNo" name="pageNo" value="${pageNo}"/>
	 		<input type="hidden" id="goods_name" name="goods_name" value="${paramsGoods.goods_name}"/>
	 		<input type="hidden" id="goods_type_id" name="goods_type_id" value="${paramsGoods.goods_type_id}"/>
	 		<input type="hidden" id="goods_flag" name="goods_flag" value="${paramsGoods.goods_flag}"/>
	 		<input type="hidden" id="order_flag" name="order_flag" value="${paramsGoods.order_flag}"/>
	 		<div class="sign">
				<div class="signline">
					<div class="signleft">
						商品类型：
					</div>
					<div class="signright">
						<a href="javascript:void(0)" id="serchGoodsType_0" class="${paramsGoods.goods_type_id==0?'active':''}">全部类型</a>
						<c:forEach items="${goodsTypes}" var="goodsType">
						<a href="javascript:void(0)" id="serchGoodsType_${goodsType.goods_type_id}" class="${goodsType.goods_type_id==paramsGoods.goods_type_id?'active':''}">${goodsType.goods_type_name}</a>
				      	</c:forEach>
					</div>
				</div>
				<div class="signline">
					<div class="signleft">
						是否促销：
					</div>
					<div class="signright">
						<a href="javascript:void(0)" id="serchGoodsFlag_0" class="${paramsGoods.goods_flag==0?'active':''}">全部类型</a>
						<a href="javascript:void(0)" id="serchGoodsFlag_1" class="${paramsGoods.goods_flag==1?'active':''}">正常</a>
						<a href="javascript:void(0)" id="serchGoodsFlag_2" class="${paramsGoods.goods_flag==2?'active':''}">促销</a>
					</div>
				</div>
				<div class="signline">
					<div class="signleft">
						排序方式：
					</div>
					<div class="signright">
						<a href="javascript:void(0)" id="serchOrderFlag_4" class="${paramsGoods.order_flag==4?'active':''}">综合排序</a>
						<a href="javascript:void(0)" id="serchOrderFlag_1" class="${paramsGoods.order_flag==1?'active':''}">销量从高到低</a>
						<a href="javascript:void(0)" id="serchOrderFlag_2" class="${paramsGoods.order_flag==2?'active':''}">价格从低到高</a>
						<a href="javascript:void(0)" id="serchOrderFlag_3" class="${paramsGoods.order_flag==3?'active':''}">价格从高到低</a>
					</div>
				</div>
				<div class="signline">
					<div class="signleft">
						价格范围：
					</div>
					<div class="signright">
						<input type="text" class="inputPrice" id="goods_priceMin" name="goods_priceMin" value="${paramsGoods.goods_priceMin}"/>
						-　
						<input type="text" class="inputPrice" id="goods_priceMax" name="goods_priceMax" value="${paramsGoods.goods_priceMax}"/>
						<input type="button" id="priceBtn" class="btn-org" value=" 搜 索 " style="background-color:#E7EAED;color:#000"/>
					</div>
				</div>
			</div>
			<div class="list">
				<c:if test="${goodss!=null && fn:length(goodss)>0 }">
				<c:forEach items="${goodss}" var="goods" varStatus="status">
				<div class="product">
					<div class="productPic"><a href="page_queryGoods.action?goods_id=${goods.goods_id}"><img src="images/goodss/${goods.goods_pic}" /></a></div>
					<div class="productText"><span class="title">${goods.goods_name}</span>
					<br/><c:if test="${goods.goods_flag==2}"><span style="text-decoration: line-through;">￥${goods.goods_price1}</span>　<span style="color:#FF5000;font-weight:bold;">￥${goods.goods_price2}</span></c:if>
						 <c:if test="${goods.goods_flag==1}"><span style="color:#FF5000;font-weight:bold;">￥${goods.goods_price2}</span></c:if>
					</div>
				</div>
				</c:forEach>
				</c:if> 
			</div>
			<!--  产品分页 -->
			<jsp:include page="page.jsp"></jsp:include>
		    <!--  产品分页 -->
			</form>
			<!--  产品列表 -->
			
	 </div>
	 <!--  产品检索展示 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
function GoPage()
{
  var pagenum=document.getElementById("goPage").value;
  var patten=/^\d+$/;
  if(!patten.exec(pagenum))
  {
    alert("页码必须为大于0的数字");
    return false;
  }
  document.getElementById("pageNo").value=pagenum;
  document.info.submit();
}
function ChangePage(pagenum)
{
	 document.getElementById("pageNo").value=pagenum;
	 document.info.submit();
}	 
function serch()
{
   document.info.action="page_goods.action";
   document.getElementById("pageNo").value=1;
   document.info.submit();
}
</script>
</body>
</html>