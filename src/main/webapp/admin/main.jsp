<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html>
<html>
<head>
<title>主题页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<style type="text/css">
html,body{
	margin:0px;
	padding:0px;
	height:100%;
	overflow:hidden;
}
body{
	margin:0px; 
	padding:0px; 
	font-size:12px; 
	overflow:hidden;
 	/* background-image:url('images/mainbg.jpg'); */
 	background-repeat:no-repeat;
 	background-size:100% 100%;
 	box-sizing: border-box;
 	border-bottom: 1px solid white;
}
table tr td{ 
	font-size:12px; 
	font-family:Arial, Helvetica, sans-serif;
}
.content{
	width:60%;margin:0 auto;margin-top:50px;line-height:50px;font-size:16px;color:#000;
 	box-sizing: border-box;
 	padding:20px;
	box-shadow:0 2px 12px 0 rgb(0 0 0 / 10%);
}
</style>
</head>

<body>
<div class="content">
	服务器解译引擎： <% String publish=getServletContext().getServerInfo(); out.println(publish); %>

	<br/>服务器名（IP）： <%=request.getServerName() %>
	
	<br/>JAVA虚拟机名称： <%=System.getProperty("java.vm.name") %>
	
	<br/>服务器端口: <%=request.getServerPort() %>
	
	<br/>服务器操作系统： <%=System.getProperty("os.name"   )+" "+System.getProperty("os.version") %>
	
	<br/>网站所在磁盘物理位置： <%=System.getProperty("user.dir") %>
	
	<br/>服务器时区: <%=System.getProperty("user.timezone"  ) %>
	
	<br/>HTTP解译引擎: <%=request.getProtocol() %>
	
	<br/>你的IP： <%=request.getRemoteAddr() %>
	
	<br/>当前域名： <%=basePath %>
</div>
</body>
</html>
