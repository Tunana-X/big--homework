<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
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
		if($("#paramsUser\\.user_passOld").val()==$("#paramsUser\\.user_pass").val()){
			alert('新密码不能设置和原密码一样');
			return;
		}
		$("#info").submit();
		 
	 });
	
});	 
	
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	<span id="MainTitle"><span style="color:gray">个人信息中心&nbsp;&nbsp;/&nbsp;&nbsp;</span>修改密码</span>
</div>
<form id="info" name="info" action="Admin_saveAdminPass.action" method="post">    
<input type="hidden" name="user_id" value="${admin.user_id}"/>
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="200" align="right" style="padding-right:5px"><font color="#000">*</font> 输入您的原密码：</td>
          <td>
            <input type="password" id="paramsUser.user_passOld" name="user_passOld" style="width:300px" />
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="#000">*</font> 输入您的新密码：</td>
          <td>
            <input type="password" id="paramsUser.user_pass" name="user_pass"  style="width:300px"  />
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="#000">*</font> 再次输入新密码：</td>
          <td>
            <input type="password" id="user_rpass" name="user_rpass"  style="width:300px"  />
          </td>
        </tr>
         
     </table>
     </td>
   </tr>  
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td width="200" style="padding-right:5px"></td>
          <td width="*" align="left">
            <input type="button" id="saveBtn" Class="btnstyle" value="保存提交"/> 
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>