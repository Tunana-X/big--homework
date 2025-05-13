<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<!DOCTYPE html>
<html>
<head>
<title>修改个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/store.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="self" /></jsp:include>
<div class="middle">
	 <div id="product_menu">
	 	 <jsp:include page="leftMenu.jsp"><jsp:param name="leftMenu" value="myPwd" /></jsp:include>
	 </div>
	 <!--  购物车 -->
	 <div id="product_info">
			<div>
				 <form id="info" name="info" action="page_saveUserFrontPass.action" method="post">    
				 <input type="hidden" name="paramsUser.user_id" value="${userFront.user_id}"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="25%" align="right" style="padding-right:5px"><font color="#000">*</font> 输入原密码：</td>
			          <td width="75%">
			            <input type="password" class="inputclass" id="paramsUser.user_passOld" name="paramsUser.user_passOld"  style="width:350px"/>
			          </td>
			        </tr>
					<tr>
			          <td align="right" style="padding-right:5px"><font color="#000">*</font> 输入新密码：</td>
			          <td>
			            <input type="password" class="inputclass" id="paramsUser.user_pass" name="paramsUser.user_pass"  style="width:350px"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right" style="padding-right:5px"><font color="#000">*</font> 确认新密码：</td>
			          <td>
			            <input type="password" class="inputclass" id="user_rpass" name="user_rpass"  style="width:350px"/>
			          </td>
			        </tr>
			        <tr class="">
			          <td align="center" height="30" colspan="2">
			            <input type="button" id="saveBtn" Class="btnAdd" value="修 改"/>&nbsp;
			            <span style="color:red">${tip }</span>
			          </td>
			        </tr>
				 </table>
				 </form>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 
	 $("#saveBtn").bind('click',function(){
		if($("#paramsUser\\.user_passOld").val()==''){
			alert('原密码不能为空');
			return;
		}
		if($("#paramsUser\\.user_pass").val()=='' || $("#user_rpass").val()==''){
			alert('新密码和确认密码不能为空');
			return;
		}
		if($("#paramsUser\\.user_pass").val() != $("#user_rpass").val()){
			alert('两次输入密码不一致');
			return;
		}
		var aQuery = $("#info").serialize();  
		$.post('page_saveUserFrontPass.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('修改成功！');
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
		 
	 });
	
});	 
</script>
</body>
</html>