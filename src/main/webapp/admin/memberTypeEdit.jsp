<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${memberType!=null && memberType.member_type_id!=0?'编辑':'添加'}会员分类信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 
	 var num1 = /^\d+$/;
	 var num2 = /^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
		if($("#member_type_name").val()==''){
			alert('类型名称不能为空');
			return;
		}
		if(!num1.exec($("#credit_start").val())){
			alert('积分起始必须为数字');
			return;
		}
		if(!num1.exec($("#credit_end").val())){
			alert('积分截止必须为数字');
			return;
		}
		if(!num2.exec($("#member_discard").val())){
			alert('折扣系数必须为数字');
			return;
		}
		$("#member_type_id").val(0);
		$("#info").attr('action','Admin_addMemberType.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#member_type_name").val()==''){
			alert('类型名称不能为空');
			return;
		}
		if(!num1.exec($("#credit_start").val())){
			alert('积分起始必须为数字');
			return;
		}
		if(!num1.exec($("#credit_end").val())){
			alert('积分截止必须为数字');
			return;
		}
		if(!num2.exec($("#member_discard").val())){
			alert('折扣系数必须为数字');
			return;
		}
		$("#info").attr('action','Admin_saveMemberType.action').submit();
			 
	});
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	<span id="MainTitle"><span style="color:gray">会员分类管理&nbsp;&nbsp;/&nbsp;&nbsp;</span>${memberType!=null && memberType.member_type_id!=0 ?'编辑':'添加'}会员分类信息</span>
</div>
<form id="info" name="info" action="Admin_addMemberType.action" method="post">   
<input type="hidden" id="member_type_id" name="member_type_id" value="${memberType.member_type_id}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="#000">*</font> 类型名称：</td>
          <td width="65%">
          	<input type="text" name="member_type_name" id="member_type_name" value="${memberType.member_type_name}" style="width:300px"/>
          </td>
        </tr> 
        <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="#000">*</font> 积分开始：</td>
          <td width="65%">
          	<input type="text" name="credit_start" id="credit_start" value="${memberType.credit_start}" style="width:300px"/>
          </td>
        </tr> 
        <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="#000">*</font> 积分截止：</td>
          <td width="65%">
          	<input type="text" name="credit_end" id="credit_end" value="${memberType.credit_end}" style="width:300px"/>
          </td>
        </tr> 
        <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="#000">*</font> 折扣系数：</td>
          <td width="65%">
          	<input type="text" name="member_discard" id="member_discard" value="${memberType.member_discard}" style="width:300px"/>
          </td>
        </tr> 
        <tr>
          <td width="35%" align="right" style="padding-right:5px"></td>
          <td width="65%">
          	<span style="color:#000">（0.8表示八折， 0.85表示85八五折， 1表示十折。）</span>
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
            <c:if test="${memberType!=null && memberType.member_type_id!=0}">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</c:if>
          	<c:if test="${memberType==null || memberType.member_type_id==0}">
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