<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	
</script>
<style type="text/css">
 body,td,div
 {
   font-size:12px;
 }
 #infoField,#loginField{
 	line-height:35px;
 }
 
#leftContent{
	float:left;
	width:280px;
	overflow:hidden;
}
#rightContent{
	float:right;
	width:673px;
	overflow:hidden;
}

#left_type{
	width:calc(100% - 2px);
 	border:1px solid #dc851b;
 	margin-top:10px;
 	min-height:140px;
 	max-height:none;
}
#left_type .goods_type{
	width:95%;
	margin:0 auto;
 	margin-top:5px;
 	margin-bottom:5px;
	height:30px;
 	line-height:30px;
 	text-align:center;
 	border:1px solid #dc851b;
 	border-radius:5px;
 	font-size:16px;
}
#left_type .goods_type2{
	width:95%;
	margin:0 auto;
 	margin-top:5px;
	height:30px;
 	line-height:30px;
 	text-align:center;
 	background-color:#dc851b;
 	color:white;
 	border-radius:5px;
 	font-size:16px;
}
#left_type .goods_type2 a{
	color:white;
}

#left_price{
	width:calc(100% - 2px);
 	border:1px solid #dc851b;
 	margin-top:10px;
 	height:160px;
 	line-height:30px;
 	text-align:center;
	overflow:hidden;
}

#topSearch{
	width:calc(100% - 12px);
 	border:1px solid #dc851b;
 	height:50px;
 	line-height:50px;
 	text-align:left;
 	padding-left:10px;
	overflow:hidden;
}
#topResult{
	width:100%;
 	margin-top:10px;
	overflow:hidden;
}
.btnstyle2{
	CURSOR: pointer;
	COLOR: white;
	height:25px;
	PADDING-TOP: 2px;
	background-color:#dc851b;
	BORDER:1px solid #dc851b;
	BORDER-radius:5px;
	vertical-align:text-bottom;
	
}
.products{
	height:540px;
	overflow:hidden;
}
.product{
	float:left;
	width:155px;
	height:160px;
	margin-top:5px;
	padding:5px;
	overflow:hidden;
}
.productPic{
	width:155px;
	height:120px;
	line-height:120px;
	text-align:center;
	overflow:hidden;
}
.productPic img{
	width:120px;
	height:120px;
	border:0px;
}
.productText{
	width:120px;
	text-align:left;
	padding-left:30px;
	line-height:25px;
	color:#A88D5A;
	overflow:hidden;
}
.productText .title{
	color:black;
	font-weight:bold;
}
#page{
	width:95%;
	height:30px;
	line-height:30px;
	margin-top:20px;
	text-align:right;
}
#page a{
	color:#000;
}
#page a:hover{
	color:#dc851b;
}
</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div id="middle">
	<div id="leftContent">
	   <div id="middle_login">
			<div class="titleBg">用户登录</div>
			<div class="login_con">
				<div id="infoField"  <c:if test="${userFront==null}">style="display:none;"</c:if>>
					${userFront.nick_name}，欢迎您登录！
					<br/><input type="button" id="loginOutBtn" class="btnstyle2" value="退出"/>&nbsp;&nbsp;
					<input type="button" id="selfCenterBtn" class="btnstyle2" value="个人中心"/>
				</div>
				<div id="loginField" <c:if test="${userFront!=null}">style="display:none;"</c:if>>
					用户名：<input type="text" id="user_nameTop" class="inputstyle" name="user_name"  style="width:100px"/>
					<br/>密　码：<input type="password" id="user_passTop" class="inputstyle" name="user_pass"  style="width:100px"/>
					<br/>验证码：<input type="text" id="randomTop" name="random" style="width:45px;" class="inputstyle"/>
						&nbsp;<img src="Random.jsp" width="50" valign="middle" style="cursor:pointer;vertical-align:middle" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>
					<br/>　　　<input type="button" id="loginInBtn" class="btnstyle2" value="登录"/>&nbsp;&nbsp;
					<input type="button" id="regBtn" class="btnstyle2" value="注册"/>
				</div>
			</div>
		</div>
		
		<div id="left_type">
			<div class="titleBg">商品类型</div>
			<c:if test="${goodsTypes!=null &&  fn:length(goodsTypes)>0}">
	   	    <c:forEach items="${goodsTypes}" var="goodsType">
	   	    <div class="${paramsGoods.goods_type_id==goodsType.goods_type_id?'goods_type2':'goods_type'}">
	   	    	<a href="page_index2.action?goods_type_id=${goodsType.goods_type_id}">※ ${goodsType.goods_type_name}</a>
	   	    </div>
	   	    </c:forEach>
	   	    </c:if>
		</div>
		
		<div id="left_price">
		  <div class="titleBg" style="text-align:left">价格筛选</div>
		    价格范围
		    <br/><a href="page_index2.action?goods_priceMin=0&goods_priceMax=100">￥0-100</a>　　
		    <a href="page_index2.action?goods_priceMin=100&goods_priceMax=200">￥100-200</a>　
		    　<a href="page_index2.action?goods_priceMin=200">￥200以上</a>　
			<br/><input type="text" id="goods_priceMinV" value="${paramsGoods.goods_priceMin}" class="inputstyle" style="width:100px;height:20px;border-radius:5px;text-align:center"  placeHolder="输入最低价"/>
			&nbsp;-&nbsp;<input type="text" id="goods_priceMaxV" value="${paramsGoods.goods_priceMax}" class="inputstyle" style="width:100px;height:20px;border-radius:5px;text-align:center"  placeHolder="输入最高价"/>
	    	<br/><input type="button" id="searchBtn2" class="btnstyle2" value="搜 索"/>
		</div>
    </div>
    
	<div id="rightContent">
	     <div id="topSearch">
	        <form name="infoTop" id="infoTop" action="page_index2.action" method="post">
	 		<input type="hidden" id="pageNo" name="pageNo" value="${paperUtil.pageNo}"/>
	 		<input type="hidden" id="goods_priceMin" name="goods_priceMin" value="${paramsGoods.goods_priceMin}"/>
	 		<input type="hidden" id="goods_priceMax" name="goods_priceMax" value="${paramsGoods.goods_priceMax}"/>
	 		
	    	<input type="text" id="goods_name" name="goods_name" value="${paramsGoods.goods_name}" class="inputstyle" style="width:300px;height:25px;border-radius:5px;margin-top:10px;" placeHolder="输入名称搜索"/>
	    	<input type="button" id="searchBtn1" class="btnstyle2" value="搜 索" style="width:80px;height:30px;"/>
	    	</form>
	    </div>
	    <div id="topResult">
		    <div id="info">
				<div class="titleBg">搜索结果</div>
				<div class="info_con" style="width:660px;height:590px;">
					<div class="products">
					<c:if test="${goodss!=null && fn:length(goodss)>0}">
   					<c:forEach items="${goodss}" var="goods" varStatus="status">
					<div class="product">
						<div class="productPic"><a href="page_queryGoods.action?goods_id=${goods.goods_id}"><img src="images/goodss/${goods.goods_pic}" /></a></div>
						<div class="productText"><span class="title">${goods.goods_name}</span></div>
						<div style="text-align:center">商品单价：￥${goods.goods_price2}</div>
					</div>
					</c:forEach>
					</c:if> 
					</div>
					
					<!--  产品分页 -->
					<jsp:include page="page.jsp"></jsp:include>
				    <!--  产品分页 -->
				    
				</div>
			</div>
			
			 
	    
	    </div>
    </div>

</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript" src="js/login.js"></script>
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
  document.infoTop.submit();
}
function ChangePage(pagenum)
{
	 document.getElementById("pageNo").value=pagenum;
	 document.infoTop.submit();
}	 
//实现验证码点击刷新
function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','Random.jsp?'+Math.random());
}
</script>
</body>
</html>