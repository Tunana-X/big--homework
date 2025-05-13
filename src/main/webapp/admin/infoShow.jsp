<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻资讯信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
var tempClassName="";
function tr_mouseover(obj) 
{ 
	tempClassName=obj.className;
	obj.className="list_mouseover";
}
function tr_mouseout(obj)      
{ 
	obj.className=tempClassName;
}      
function CheckAll(obj) 
{
	var checks=document.getElementsByName("chkid");
    for (var i=0;i<checks.length;i++)
	{
	    var e = checks[i];
	    e.checked = obj.checked;
	}
    
}


function serch()
{
   document.info.action="Admin_listInfos.action";
   document.info.submit();
}
function del()
{
	var checks=document.getElementsByName("chkid");
    var ids="";
	for (var i=0;i<checks.length;i++)
    {
        var e = checks[i];
		if(e.checked==true)
		{
		  if(ids=="")
		  {
		    ids=ids+e.value;
		  }
		  else
		  {
		    ids=ids+","+e.value;
		  }
		}
    }
    if(ids=="")
    {
       alert("请至少选择一个要删除的新闻资讯！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delInfos.action?ids="+ids;
       document.info.submit();
    }
    
}
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
  document.info.action="Admin_listInfos.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listInfos.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	<span id="MainTitle"><span style="color:gray">新闻资讯管理&nbsp;&nbsp;/&nbsp;&nbsp;</span>新闻资讯查询</span>
</div>
<form name="info" id="info" action="Admin_listInfos.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${paperUtil.pageNo}"/>
<table width="95%" align="center" class="table_top" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" align="center">
            标题：
      <input type="text" id="info_title" name="info_title" value="${paramsInfo.info_title}" class="inputstyle" style="width:300px"/>&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btnstyle"/>&nbsp;
      <input type="button" value="删除" onclick="del();" class="btnstyle"/>
    </td>
  </tr>
</table>
<table width="95%" align="center" class="table_list" cellpadding="0" cellspacing="0">
   <tr class="listtitle">
     <td width="40" align="center"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></td>
     <td width="40" align="center">序号</td>
     <td width="" align="center">标题</td>
     <td width="" align="center">发布人</td>
     <td width="" align="center">发布时间</td>
     <td width="" align="center">操作</td>
   </tr>
   <c:if test="${infos!=null &&  fn:length(infos)>0}">
   <c:forEach items="${infos}" var="info" varStatus="status">
   <tr class="list0" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)"> 
     <td width="" align="center"><input type="checkbox" name="chkid" value="${info.info_id}" style="vertical-align:text-bottom;"/></td>
     <td width="" align="center">${status.index+1+paramsInfo.start}</td>
     <td width="" align="center">${info.info_title}</td>
     <td width="" align="center">${info.info_admin}</td>
     <td width="" align="center">${info.info_date}</td>
     <td width="" align="center">
     	<input type="button" value="查看"  onclick="window.location.href='Admin_queryInfo.action?info_id=${info.info_id}'" class="btngreen"/>
     	<input type="button" value="编辑"  onclick="window.location.href='Admin_editInfo.action?info_id=${info.info_id}'" class="btnstyle"/>
     </td>
   </tr> 
   </c:forEach>
   </c:if>
   <c:if test="${infos==null ||  fn:length(infos)==0}">
   <tr>
     <td height="60" colspan="13" align="center"><b>&lt;不存在新闻资讯信息&gt;</b></td>
   </tr>
   </c:if>
   
</table>
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>