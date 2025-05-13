<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<div id="logoTop">
		<div style="width:250px;height:70px;line-height:70px;float:left;margin-left:calc(50% - 480px);">
	    	<img src="images/logo.png" style="vertical-align:middle" width="250"/>
		</div>
	    <div style="width:400px;height:70px;line-height:70px;float:right;margin-right:calc(50% - 480px);">
	    	<form name="infoTop" id="infoTop" action="page_goods.action" method="post">
	    	<input type="text" id="food_name" name="goods_name" value="${paramsGoods.goods_name}" placeHolder="输入商品名称回车搜索"/>
	    	</form>
		</div>
</div>
<div id="top" style="margin-top:10px">
	<div id="navMenu">
		<ul>
			 <li class="${param.menu==null || param.menu=='home'?'hover':''}"><a href="page_index.action">  首 页</a></li>
	  		 <li style="margin-left:20px" class="${param.menu=='goods'?'hover':''}"><a href="page_goods.action">  商品浏览</a></li>
	  		 <c:if test="${userFront!=null}">
	  		 <li class="${param.menu=='hobby'?'hover':''}"><a href="page_goodsHobby.action">  商品推荐</a></li>
	  		 </c:if>
	  		 <li class="${param.menu=='info'?'hover':''}"><a href="page_listInfos.action">新闻资讯</a></li>
	  		 <c:if test="${userFront!=null}">
	  		 <li class="${param.menu=='card'?'hover':''}"><a href="page_listCard.action">购物车</a></li>
			 </c:if>
		</ul>
	</div>
	<div id="navMenu2">
		<ul>
	    <c:if test="${userFront==null}">
		<li class="${param.menu=='login'?'hover':''}"><a href="login.jsp" title="登录"> 登 录 </a></li>
		<li class="${param.menu=='reg'?'hover':''}"><a href="reg.jsp" title="注册"> 注 册 </a></li>
		</c:if>
	    <c:if test="${userFront!=null}">
	    <li class="${param.menu=='self'?'hover':''}" style="min-width:80px;max-width:150px;overflow:hidden;" title="单击进入个人中心"><a href="page_myInfo.action"><img src="images/self.png" style="width:20px;height:20px;vertical-align:middle"/> ${userFront.user_name} </a></li>  
	    <li id="loginOutBtn" title="退出登录" style="min-width:30px;max-width:150px;overflow:hidden;border:0px;text-align:right;cursor:pointer"><img src="images/logotc.png" style="width:20px;height:20px;vertical-align:text-bottom;"/> <span style="font-weight:bold;color:green"></span></li>
		</c:if>
		</ul>
	</div>
</div>
<script type="text/javascript" src="js/login.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
	var EHeight = document.documentElement.clientHeight;
	var BHeight = document.body.clientHeight;
	var Height1 = Math.max(EHeight,BHeight);
	var ESHeight = document.documentElement.scrollHeight;
	var Height2 = Math.min(BHeight,ESHeight);
	var bottomM = Math.max(Height1 - Height2,5);
	var middleDiv = $(".middle");
	if(middleDiv.length>0 && bottomM > 5){
		middleDiv.height(middleDiv.height()+bottomM+40);
	}else{
		$("#bottom").css("margin-top", bottomM);
	}
});
</script>
