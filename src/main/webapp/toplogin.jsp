<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<div id="logoTop">
		<div style="width:250px;height:70px;line-height:70px;float:left;margin-left:20px">
	    	<a href="page_index.action" title="返回首页"><img src="images/logo.png" style="vertical-align:middle" width="250"/></a>
		</div>
</div>
<script language="javascript" type="text/javascript">
$(function(){
	var EHeight = document.documentElement.clientHeight;
	var BHeight = document.body.clientHeight;
	var Height1 = Math.max(EHeight,BHeight);
	var ESHeight = document.documentElement.scrollHeight;
	var Height2 = Math.min(BHeight,ESHeight);
	var bottomM = Math.max(Height1 - Height2,5);
	$("#bottom").css("margin-top", bottomM);
});
</script>
