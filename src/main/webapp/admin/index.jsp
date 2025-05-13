<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>网上购物商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script language="javascript" type="text/javascript" src="js/index.js"></script>
<script language="javascript" type="text/javascript"> 
var admin = "${admin.real_name}";
if(admin==null||admin=='')
{
  window.location.href="login.jsp";
} 
	
</script>
<style type="text/css">
html,body{
	margin:0px;
	padding:0px;
	height:100%;
	overflow:hidden;
}
body{
	/* background-color:#F2F3F5; */
	background-color:white;
}
table{
 	padding: 0;
 	margin:0px;
 	border-spacing: 0px;
 	border:0px;
 }
 table tr{
 	padding: 0;
 	margin:0px;
 }
 table td{
 	padding: 0;
 	margin:0px;
 	border:0px;
 }
</style>
</head>

<body onload="setIframeWH()" style="margin:0px; padding:0px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td colspan="2" height="70" style="background-color:#F5F5F5;overflow:hidden">
		<iframe width="100%" height="100%" style="margin:0px; padding:0px;border:none;" scrolling="no" src="top.jsp" marginheight="0" frameborder="0"></iframe>
    </td>
  </tr>
  <tr>
    <td width="190" style="height:calc(100% - 70px)">
		<iframe name="LeftMenu" id="LeftMenu" width="100%" style="margin:0px; padding:0px;" height="100%" scrolling="no" src="left.jsp" frameborder="0"></iframe>
	</td>
    <td width="*">
		<iframe id="MainFrame" name="MainFrame" width="100%" style="margin:0px; padding:0px;" height="100%" scrolling="yes" src="main.jsp" frameborder="0"></iframe>
	</td>
  </tr>
</table>
</body>
</html>