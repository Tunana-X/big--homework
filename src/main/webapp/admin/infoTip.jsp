<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示信息</title>
<style type="text/css">
BODY { 
	FONT-SIZE: 14px; 
	color: #000000; 
	font-size: 75%; 
	background-color:#ffffff;    
	background-position:right bottom;
	background-repeat:no-repeat;
	overflow-y:auto;
}
.btnstyle {
	CURSOR: pointer;
	COLOR: white;
	PADDING-TOP: 2px;
	HEIGHT: 22px;
	background-repeat: repeat-x;
	background-color:#189F92;
	vertical-align:text-bottom;
	border:none;
	border-radius:2px;
	box-sizing: border-box;
}
.editbody
{
    
}
.editbody td
{
    font-size:14px;
    color:#000000;
    background-color:#e9e9f4;
}
.edittitleleft
{
    width:8px;
    color:#000000;
    background-color:#000;
}
.edittitle
{
    font-size:14px;
    color:white;
    background-color:#000;
}
.edittitleright
{
    width:8px;
    color:#000000;
    background-color:#000;
}
</style>
</head>
<body>
    <Table border="0" cellspacing="0" cellpadding="0" align="center" width=400> 
        <TR><TD height="50"></TD></TR>
        <TR><TD>
          <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
            <TR>
              <TD class="edittitleleft" style="height:40px">&nbsp;</TD>
              <TD class="edittitle">提示信息</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
          </TABLE>  
        </TD></TR>
        <TR><TD>
          <Table border="0" cellspacing="0" cellpadding="0" width="100%" align="center" valign="top">
            <TR class="editbody">
              <c:if test="${tipType=='success'}"><TD id="htmlsuccess" height="60">&nbsp;&nbsp;&nbsp;&nbsp;${tip}</TD></c:if>
              <c:if test="${tipType!='success'}"><TD id="htmlerror"><br/>&nbsp;&nbsp;&nbsp;&nbsp;操作失败，请您检测以下错误：<br><UL><LI>${tip}</LI></UL></TD></c:if>
            </TR>
          </table>
        </TD></TR>
        <TR class="editbody"><TD style="height:40px;line-height:40px" align="center">
          <c:if test="${url1!=null && url1!=''}"><input type='button' value='${value1}' name='BtnRet1' class='btnstyle' onclick="window.location='${url1}'" /></c:if>
	      <c:if test="${url2!=null && url2!=''}"><input type='button' value='${value2}' name='BtnRet2' class='btnstyle' onclick="window.location='${url2}" /></c:if>
	      <c:if test="${url3!=null && url3!=''}"><input type='button' value='${value3}' name='BtnRet3' class='btnstyle' onclick="window.location='${url3}'" /></c:if>
        </TD></TR>
      </TABLE> 
  </body>
</html>