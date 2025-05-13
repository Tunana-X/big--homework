<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	 
	
</script>
<style type="text/css">
 html,body{
 	margin:0;
 	padding:0;
 	height:100%;
 }
 body,td,div
 {
   font-size:14px;
 }
 .loginDiv{
 	width:100%;
 	height:calc(100% - 125px);
 	background-image:url('images/loginbg.jpg');
 	background-size:100% 100%;
 	overflow:hidden;
 }
 .regTable{
 	width:800px;
 	height:410px;
 	box-sizing: border-box;
 	padding:20px;
 	position:absolute;
 	right:calc(50% - 400px);
 	top:calc(50% - 205px);
 	background-color:#E9E9F2;
 	border-radius:20px;
 }
 .regTable .theme{
 	height:40px;
 	line-height:40px;
 	font-size:18px;
 	font-weight:bold;
 }
 .regTable .logincon{
	width:100%;
	height:220px;
  }
  .inputclass{
	width:290px;
	height:40px;
	margin-left:40px;
	margin-bottom:10px;
	box-sizing: border-box;
	border: 0px solid #56ACFF;
	background-color:white;
	border-radius:2px;
	padding-left:50px;
	color:#000;
  }
  .inputclass:focus{
	box-shadow:none;
	outline: none;
  }
  input::-webkit-input-placeholder{
	color:#E9E9F2;
  }
  .btn-info{
    margin-top:10px;
    font-size:18px!important;
	padding-left:0px!important;
	letter-spacing:4px;
    CURSOR: pointer;
	COLOR: white;
	border: 0px solid #56ACFF;
	background-color:#FF4400;
	vertical-align:text-bottom;
 }
 .btn-info:hover{
	background-color:#FF4400;
 }
 #user_name,#nick_name{
	background-image:url('images/loginicouser.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #user_pass,#user_rpass{
	background-image:url('images/loginicopass.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #real_name{
	background-image:url('images/loginiconame.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #user_sex{
	background-image:url('images/loginicosex.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #user_phone{
	background-image:url('images/loginicophone.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #user_mail{
	background-image:url('images/loginicomail.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #user_address{
	background-image:url('images/loginicoaddress.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #random{
	background-image:url('images/loginicorandom.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 input:-webkit-autofill {
   transition: background-color 5000s ease-in-out 0s;
 }
 .loginreg{
 	width:290px;
	height:40px;
	margin-left:40px;
	text-align:right;
	color:#000;
 }
</style>
</head>
<body>
<jsp:include page="toplogin.jsp"><jsp:param name="menu" value="login" /></jsp:include>
<div class="loginDiv" style="">
 	 <form name="info" id="info" style="width:100%;height:450px" action="LoginRegSystem.action" method="post">
	 <div class="regTable">
		<div class="theme">注册网站</div>
		<div class="logincon">
			<input type="text" class="inputclass" id="user_name" name="user_name" value="${params.user_name}"  autocomplete="off" placeholder="请输入您的用户名"/>
			<input type="text" class="inputclass" id="real_name" name="real_name" value="${params.real_name}"  autocomplete="off" placeholder="请输入您的姓名"/>
			<input type="password" class="inputclass" id="user_pass" name="user_pass" autocomplete="new-password" placeholder="请输入您的密码"/>
			<input type="password" class="inputclass" id="user_rpass" name="user_rpass" autocomplete="new-password" placeholder="请确认您的密码"/>
			<div id="user_sex" class="inputclass" style="line-height:40px;float:left">
				<input type="radio" name="user_sex" checked="checked" value="1" /> 男
				<input type="radio" name="user_sex" value="2" /> 女
			</div>
			<input type="text" class="inputclass" id="nick_name" name="nick_name" value="${params.nick_name}" style="margin-left:44px;" autocomplete="off" placeholder="请输入您的昵称"/>
			<input type="text" class="inputclass" id="user_phone" name="user_phone" value="${params.user_phone}"  autocomplete="off" placeholder="请输入您的电话"/>
			<input type="text" class="inputclass" id="user_address" name="user_address" value="${params.user_address}"  autocomplete="off" placeholder="请输入您的地址，选填"/>
			<input type="text" class="inputclass" id="user_mail" name="user_mail" value="${params.user_mail}"  autocomplete="off" placeholder="请输入您的邮箱，选填"/>
			<input type="text" class="inputclass" style="width:180px" id="random" name="random"  autocomplete="off" placeholder="请输入验证码"/>
			<img src="Random.jsp" style="float:right;margin-right:100px;vertical-align:middle" width="100" height="40"style="cursor:pointer;vertical-align:middle" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>
			<input type="button" id="addBtn" class="inputclass btn-info" style="float:left;" value="提交注册"/> 
			<div class="inputclass" style="height:40px;line-height:40px;float:left;margin-top:10px;background-color:#E9E9F2;padding-left:0px">
				已有账号？<a href="login.jsp" style="color:red">点我登录</a>网站。
			</div>
		</div>
 	 </div>
 	 </form>
 </div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
//实现验证码点击刷新
function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','Random.jsp?'+Math.random());
}
$(document).ready(function(){
	var addBtn = $("#addBtn");
	var user_name = $("#user_name");
	var user_pass = $("#user_pass");
	var user_rpass = $("#user_rpass");
	var real_name = $("#real_name");
	var nick_name = $("#nick_name");
	var user_phone = $("#user_phone");
	var random = $("#random");
	
	var name=/^[a-z][a-z0-9_]{3,15}$/;
    var pass=/^[a-zA-Z0-9]{3,15}$/;
    var num= /^\d+$/;
	addBtn.bind("click",function(){
		
		if(user_name.val()==''||user_pass.val()==''){
			alert("用户名或密码不能为空");
			return;
		}
		/*
		if(!name.exec(user_name.val())){
			window.alert("用户名必须为字母开头 、字母数字4-16位！");
			return false;
		}
		if(!pass.exec(user_pass.val())){
			window.alert("密码必须为字母数字4-16位！");
			return false;
		}
		*/
		
		if(user_pass.val()!=user_rpass.val()){
			alert("两次输入密码不一致");
			return;
		}
		if(real_name.val()==''){
			alert("姓名不能为空");
			return;
		}
		if(nick_name.val()==''){
			alert("昵称不能为空");
			return;
		}
		if(user_phone.val()==''){
			alert("联系电话不能为空");
			return;
		}
		if(random.val()==''){
			alert("验证码不能为空");
			return;
		}
		var aQuery = $("#info").serialize();  
		$.post('LoginRegSystem.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('注册成功！');
						 window.location.href="page_index.action";
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