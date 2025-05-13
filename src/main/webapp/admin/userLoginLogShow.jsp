<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录日志</title>
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript">
        var tempClassName="";
        function tr_mouseover(obj) { tempClassName=obj.className; obj.className="list_mouseover"; }
        function tr_mouseout(obj) { obj.className=tempClassName; }
        function GoPage() {
            var pagenum=document.getElementById("goPage").value;
            var patten=/^\d+$/;
            if(!patten.exec(pagenum)) {
                alert("页码必须为大于0的数字");
                return false;
            }
            document.getElementById("pageNo").value=pagenum;
            document.forms[0].action="Admin_listUserLoginLogs.action";
            document.forms[0].submit();
        }
        function ChangePage(pagenum) {
            document.getElementById("pageNo").value=pagenum;
            document.forms[0].action="Admin_listUserLoginLogs.action";
            document.forms[0].submit();
        }
    </script>
</head>
<body>
<div class="pageTitle">
    <span id="MainTitle"><span style="color:gray">用户登录日志&nbsp;&nbsp;/&nbsp;&nbsp;</span>日志查询</span>
</div>

<form name="logForm" id="logForm" action="Admin_listUserLoginLogs.action" method="post">
    <input type="hidden" name="pageNo" id="pageNo" value="${paperUtil.pageNo}"/>

    <!-- 搜索条件 -->
    <table width="95%" align="center" class="table_top" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2" align="center">
                用户ID：
                <input type="text" name="userId" value="${paramsLog.userId == 0 ? '' : paramsLog.userId}" class="inputstyle"/>&nbsp;

                登录IP：
                <input type="text" name="ipAddress" value="${paramsLog.ipAddress}" class="inputstyle"/>&nbsp;

                登录状态：
                <select name="status" class="selectstyle" style="width:155px;">
                    <option value="0">全部</option>
                    <option value="1" ${paramsLog.status == 1 ? 'selected' : ''}>成功</option>
                    <option value="2" ${paramsLog.status == 2 ? 'selected' : ''}>失败</option>
                    <option value="3" ${paramsLog.status == 3 ? 'selected' : ''}>超时</option>
                    <option value="4" ${paramsLog.status == 4 ? 'selected' : ''}>登出</option>
                </select>&nbsp;

                <input type="button" value="搜索" onclick="document.forms[0].submit();" class="btnstyle"/>
            </td>
        </tr>
    </table>

    <!-- 日志表格 -->
    <table width="95%" align="center" class="table_list" cellpadding="0" cellspacing="0">
        <tr class="listtitle">
            <td width="40" align="center"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></td>
            <td width="40" align="center">序号</td>
            <td width="" align="center">用户ID</td>
            <td width="" align="center">用户名</td>
            <td width="" align="center">登录时间</td>
            <td width="" align="center">退出时间</td>
            <td width="" align="center">持续时间（秒）</td>
            <td width="" align="center">登录IP</td>
            <td width="" align="center">状态</td>
        </tr>

        <c:if test="${logs != null && fn:length(logs) > 0}">
            <c:forEach items="${logs}" var="log" varStatus="status">
                <tr class="list0" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)">
                    <td align="center"><input type="checkbox" name="chkid" value="${log.logId}" style="vertical-align:text-bottom;"/></td>
                    <td align="center">${status.index + 1 + paramsLog.start}</td>
                    <td align="center">${log.userId}</td>
                    <td align="center">${log.userName}</td>
                    <td align="center">
                        <c:if test="${log.loginTime != null}">
                            <fmt:formatDate value="${log.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:if>
                    </td>
                    <td align="center">
                        <c:if test="${log.logoutTime != null}">
                            <fmt:formatDate value="${log.logoutTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:if>
                    </td>
                    <td align="center">${log.duration}</td>
                    <td align="center">${log.ipAddress}</td>
                    <td align="center">${log.statusDesc}</td>
                </tr>
            </c:forEach>
        </c:if>

        <c:if test="${logs == null || fn:length(logs) == 0}">
            <tr>
                <td height="60" colspan="9" align="center">
                    <b>无登录日志</b>
                </td>
            </tr>
        </c:if>
    </table>

    <!-- 分页 -->
    <jsp:include page="page.jsp"></jsp:include>
</form>
</body>
</html>