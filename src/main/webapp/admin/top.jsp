<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部页面</title>
<link type="text/css" href="css/style.css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
	 
	 $("#logOut").bind('click',function(){
		if(confirm("确认退出？")){
			window.parent.location.href="LoginOutSystem.action";
		}
		 
	 });

	 var flag = 1;
	 var LeftMenu = $("#LeftMenu", window.parent.document);
	 var LeftMenuW = LeftMenu.width()
	 var MainFrame = $("#MainFrame", window.parent.document);
	 var MainFrameW = MainFrame.width()
	 $("#openclose").bind("click",function(){
		if(flag==1){
			flag=2;
			LeftMenu.parent().css("width","0px");
			MainFrame.parent().css("width",(MainFrameW + LeftMenuW)+"px");
			$("#openclose").attr("src","images/opopen.png").attr("title","展开菜单");
		}else{
			flag=1;
			LeftMenu.parent().css("width",LeftMenuW+"px");
			MainFrame.parent().css("width",MainFrameW+"px");
			$("#openclose").attr("src","images/opclose.png").attr("title","收起菜单");
		}
	 });
});	 
	
</script>
</head>

<body>
<div class="top">
    <div class="logo" style="height:70px;line-height:70px;">
		<div style="float:left;width:180px;height:70px;line-height:70px;font-size: 26px;color: white;font-family: "微软雅黑";">
			网上购物商城
		</div>
		<div style="float:left;width:34px;height:34px;line-height:34px;margin-top:18px;background-color:#393939;border-radius:2px;text-align:center">
			<img id="openclose" src="images/opclose.png" title="收起菜单" width="20" style="vertical-align:middle;cursor:pointer"/>
		</div>
	</div>
    <div class="top_info">
    	管理员：<span style="color:gold">${admin.real_name}</span>
    	&nbsp;&nbsp;<a id="logOut" href="#">注销</a></div>
</div>
</body>
</html>
<script language="javascript">
</script>
