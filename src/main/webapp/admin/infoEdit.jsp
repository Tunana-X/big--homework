<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${info!=null && info.info_id!=''?'编辑':'添加'}新闻资讯信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="editor2/kindeditor-all-min.js"></script>
<script charset="utf-8" src="editor2/lang/zh-CN.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 var num1 = /^\d+(\.\d+)?$/;
	 var num2 = /^\d+$/;
	 $("#addBtn").bind('click',function(){
		editor.sync();
		if($("#info_title").val()==''){
			alert("标题不能为空！");
			return;
		}
		if($("#info_admin").val()==''){
			alert("发布人不能为空！");
			return;
		}
		if($("#noticeContent").val()==''){
			alert("内容不能为空！");
			return;
		}
		$("#info_id").val(0);
		$("#info").attr('action','Admin_addInfo.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		editor.sync();
		if($("#info_title").val()==''){
			alert("标题不能为空！");
			return;
		}
		if($("#info_admin").val()==''){
			alert("发布人不能为空！");
			return;
		}
		if($("#noticeContent").val()==''){
			alert("内容不能为空！");
			return;
		}
		$("#info").attr('action','Admin_updateInfo.action').submit();
			 
	});
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	<span id="MainTitle"><span style="color:gray">新闻资讯管理&nbsp;&nbsp;/&nbsp;&nbsp;</span>${info!=null && info.info_id!=''?'编辑':'添加'}新闻资讯信息</span>
</div>
<form id="info" name="info" action="Admin_addInfo.action" method="post">   
<input type="hidden" id="info_id" name="info_id" value="${info.info_id}" /> 
<input type="hidden" id="info_file" name="info_file" value="${info.info_file}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="150" align="right" style="padding-right:5px"><font color="#000">*</font> 标题：</td>
          <td width="*" >
          	<input type="text" name="info_title" id="info_title" value="${info.info_title}" Style="width:345px;"/>
          </td>
		</tr> 
		<tr>
          <td align="right" style="padding-right:5px"><font color="#000">*</font> 发布人：</td>
          <td>
            <input type="text" style="width:345px;" name="info_admin" id="info_admin" value="${info.info_admin}"/> 
          </td>  
        </tr> 
		 <tr> 
          <td align="right" style="padding-right:5px"><font color="#000">*</font> 内容：</td>
          <td>
            <textarea style="width:500px;height:200px" name="info_content"  id="noticeContent">${info.info_contentShow}</textarea>
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
            <c:if test="${info!=null && info.info_id!=''}">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</c:if>
          	<c:if test="${info==null || info.info_id==''}">
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</c:if>
            &nbsp;<label style="color:red">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
<script>        
KindEditor.ready(function(K) {
	window.editor = K.create('#noticeContent',{
		width : '95%',
		items:[
			'fullscreen','|','undo', 'redo', '|', 'code', 'cut', 'copy', 'paste',
			'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
			'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
			'superscript', 'quickformat', 'selectall', '/',
			'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
			'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
			 'table', 'hr', 'emoticons', 'pagebreak','anchor', 'link', 'unlink'
		],
		uploadJson : 'editor2/jsp/upload_json.jsp',
        fileManagerJson : 'editor2/jsp/file_manager_json.jsp',
        allowFileManager : true

	});
});
	   
</script>
</body>
</html>