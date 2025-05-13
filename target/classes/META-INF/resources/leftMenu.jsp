<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="ptable_menu">
	<tr class="ptable_menu_title">
		<td>个人中心</td>
	</tr>
	<tr class="ptable_menu_text ${param.leftMenu=='myInfo'?'ptable_menu_active':''}">
		<td><a href="page_myInfo.action">修改个人信息</a></td>
	</tr>
	<tr class="ptable_menu_text ${param.leftMenu=='myPwd'?'ptable_menu_active':''}">
		<td><a href="page_myPwd.action">修改登录密码</a></td>
	</tr>
	<tr class="ptable_menu_text ${param.leftMenu=='orders'?'ptable_menu_active':''}">
		<td><a href="page_listMyOrderss.action">我的订单信息</a></td>
	</tr>
	<tr class="ptable_menu_text ${param.leftMenu=='collect'?'ptable_menu_active':''}">
		<td><a href="page_listMyCollects.action">我的商品收藏</a></td>
	</tr>
	<tr class="ptable_menu_text ${param.leftMenu=='sblog'?'ptable_menu_active':''}">
		<td><a href="page_listMySblogs.action">我的留言信息</a></td>
	</tr>
</table>

<script language="javascript" type="text/javascript"> 
$(function(){
	$("#bottom").css("margin-top", 0);
	var EHeight = document.documentElement.clientHeight;
	var BHeight = document.body.clientHeight;
	var Height1 = Math.max(EHeight,BHeight);
	var middleHeight = $("#middle").height();
	$("#middle").height(Math.max(Height1 - 130, Math.max(middleHeight, 400)));

	var ESHeight = document.documentElement.scrollHeight;
	var Height2 = Math.min(BHeight,ESHeight);
	var bottomM = Math.max(Height1 - Height2, 0);
	$("#bottom").css("margin-top", bottomM);
});
</script>
