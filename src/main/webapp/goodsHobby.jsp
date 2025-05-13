<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品推荐</title>
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
 
}); 
</script>
<style type="text/css">
 body,td,div
 {
 }
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="hobby" /></jsp:include>
<div class="middle">
	<!--  商品检索展示 -->
	 <div id="product_info">
	 		<!--  商品列表 -->
	 		<form name="info" id="info" action="page_listGoodss.action" method="post">
	 		<input type="hidden" id="pageNo" name="pageNo" value="${paperUtil.pageNo}"/>
			<div class="list">
					<div class="products">
					<c:if test="${goodss!=null && fn:length(goodss)>0}">
   					<c:forEach items="${goodss}" var="goods" varStatus="status">
					<div class="product">
						<div class="productPic"><a href="page_queryGoods.action?goods_id=${goods.goods_id}"><img src="images/goodss/${goods.goods_pic}" /></a></div>
						<div class="productText"><span class="title">${fn:length(goods.goods_name)>12?fn:substring(goods.goods_name,0,11).concat('..'):goods.goods_name}</span>
					    <br/>类型：${goods.goods_type_name}
						<br/>单价：<span style="color:#FF5000;font-weight:bold;">￥${goods.goods_price2}</span>
						</div>
					</div>
					</c:forEach>
   					</c:if>
					</div>
					
					<!--  商品分页 -->
				    <!--  商品分页 -->

			</div>
			</form>
			<!--  商品列表 -->
			
	 </div>
	 <!--  商品检索展示 -->
	 
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
   document.info.action="page_listGoodss.action";
   document.info.submit();
}
</script>
</body>
</html>