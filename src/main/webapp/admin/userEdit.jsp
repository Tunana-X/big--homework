<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user!=null && user.user_id!=0?'编辑':'添加'}会员信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 var user_sex = "${user.user_sex}";
	 if(user_sex!='' && user_sex!='0'){
		 $("#sex"+user_sex).attr('checked','checked');
	 }else{
		 $("#sex1").attr('checked','checked');
	 }
	 
	 var num=/^\d+$/;
	 var num2=/^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
		if($("#user_name").val()==''){
			alert('用户名不能为空');
			return;
		}
		if($("#real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if($("#nick_name").val()==''){
			alert('昵称不能为空');
			return;
		}
		if($("#user_phone").val()==''){
			alert('联系电话不能为空');
			return;
		}
		$("#user_id").val(0);
		$("#user_credit").val(0);
		$("#info").attr('action','Admin_addUser.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if($("#nick_name").val()==''){
			alert('昵称不能为空');
			return;
		}
		if($("#user_phone").val()==''){
			alert('联系电话不能为空');
			return;
		}
		$("#info").attr('action','Admin_saveUser.action').submit();
			 
	});
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	<span id="MainTitle"><span style="color:gray">用户信息管理&nbsp;&nbsp;/&nbsp;&nbsp;</span>${user!=null && user.user_id!=0 ?'编辑':'添加'}用户信息</span>
</div>
<form id="info" name="info" action="Admin_addUser.action" method="post">   
<input type="hidden" id="user_id" name="user_id" value="${user.user_id}" /> 
<input type="hidden" id="user_credit" name="user_credit" value="${user.user_credit}" /> 
<table width="1000" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
       <tr>
          <td width="15%" align="right" style="padding-right:5px"><font color="#000">*</font> 用户名：</td>
          <td width="35%" >
          	<c:if test="${user!=null && user.user_id!=0}">${user.user_name}</c:if>
          	<c:if test="${user==null || user.user_id==0}">
          	<input type="text" name="user_name" id="user_name" value="${user.user_name}" style="width:300px"/>
          	</c:if>
          </td>
          <td width="15%" align="right" style="padding-right:5px"><font color="#000">*</font> 密码：</td>
          <td width="35%">
            <c:if test="${user!=null && user.user_id!=0}">
          	<input type="password" name="user_pass" id="user_pass" value=""  style="width:300px"/>
          	</c:if>
          	<c:if test="${user==null || user.user_id==0}">
          	<input type="password" name="user_pass" id="user_pass" value=""  style="width:300px"/>
          	</c:if>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="#000">*</font> 姓名：</td>
          <td>
            <input type="text" name="real_name" id="real_name" value="${user.real_name}" style="width:300px"/>
          </td>
           <td align="right" style="padding-right:5px"><font color="#000">*</font> 性别：</td>
          <td>
            <input type="radio" id="sex1" name="user_sex" value="1"/>男&nbsp;&nbsp;
            <input type="radio" id="sex2" name="user_sex" value="2"/>女
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="#000">*</font> 昵称：</td>
          <td>
            <input type="text" name="nick_name" id="nick_name" value="${user.nick_name}" style="width:300px"/>
          </td>
          <td align="right" style="padding-right:5px"><font color="#000">*</font> 电话：</td>
          <td>
             <input type="text" id="user_phone" name="user_phone" value="${user.user_phone}" style="width:300px"/>
          </td>
        </tr>   
         <tr>
          <td align="right" style="padding-right:5px">地址：</td>
          <td>
          	 <input type="text" id="user_address" name="user_address" value="${user.user_address}" style="width:300px"/>
          </td>
          <td align="right" style="padding-right:5px">邮箱：</td>
          <td>
             <input type="text" id="user_mail" name="user_mail" value="${user.user_mail}" style="width:300px"/>
          </td>
        </tr>    
     </table>
     </td>
   </tr>  
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
          	<c:if test="${user!=null && user.user_id!=0}">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</c:if>
          	<c:if test="${user==null || user.user_id==0}">
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</c:if>
            &nbsp;<label style="color:#000">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>