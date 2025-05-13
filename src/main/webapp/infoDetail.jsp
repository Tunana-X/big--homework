<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>新闻资讯内容</title>
<meta http-equiv="X-UA-Compatible" content="IE=8"/>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/info.css">
<link rel="stylesheet" type="text/css" href="css/message.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	  
	
</script>
<style type="text/css">
 body,td,div
 {
   font-size:14px;
 }
 #list .title{
	line-height:50px;
	width:100%;
	margin-left:10px;
	color:#A88D5A;
	font-size:16px;
	font-weight:bold;
	overflow:hidden;
}

#list .typehr{
    height:5px;
	width:100%;
	margin-left:10px;
	background:url('images/yun_hr.gif') repeat-x left center; 
	overflow:hidden;
}
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="info" /></jsp:include>
<div class="middle">
	<div id="list">
		 <div class="nav">当前位置: 主页 > 新闻资讯详情 >  </div>
		 <div class="article_title">${info.info_title}</div>
		 <div class="article_time">发布人：${info.info_admin}　发布时间：${info.info_date}</div>
		 <div class="article_con">
		 	${info.info_contentShow}
		 	<c:if test="${info.info_file!=null && info.info_file!=''}">
		 	<br/><br/>附件信息：<a href='DownLoad.jsp?fileName=${info.info_file}' >${info.info_file}</a>
		 	</c:if>
		 </div>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
 
</body>
</html>