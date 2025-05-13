<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
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
 	width:420px;
 	height:330px;
 	box-sizing: border-box;
 	padding:20px;
 	position:absolute;
 	right:calc(50% - 210px);
 	top:calc(50% - 140px);
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
 #user_name{
	background-image:url('images/loginicouser.png');
	background-repeat:no-repeat;
	background-position:0px center;
	background-size:40px 40px;
 }
 #user_pass{
	background-image:url('images/loginicopass.png');
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
		<div class="theme">登录网站</div>
		<div class="logincon">
			<input type="text" class="inputclass" id="user_name" name="user_name" value="${params.user_name}"  autocomplete="off" placeholder="请输入您的用户名"/>
			<input type="password" class="inputclass" id="user_pass" name="user_pass" autocomplete="new-password" placeholder="请输入您的密码"/>
			<input type="text" class="inputclass" style="width:180px" id="random" name="random"  autocomplete="off" placeholder="请输入验证码"/>
			<img src="Random.jsp" style="float:right;margin-right:50px;vertical-align:middle" width="100" height="40"style="cursor:pointer;vertical-align:middle" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>
			<input type="button" id="loginInBtn" class="inputclass btn-info" value="安全登录"/> 
		</div>
		<div class="loginreg">
			没有账号？<a href="reg.jsp" style="color:red">点我注册</a>一个吧。
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
	var loginInBtn = $("#loginInBtn");
	var user_name = $("#user_name");
	var user_pass = $("#user_pass");
	var random = $("#random");

	var name=/^[a-z][a-z0-9_]{3,15}$/;
    var pass=/^[a-zA-Z0-9]{3,15}$/;
    var num= /^\d+$/;
    var email=/^[\w]+[@]\w+[.][\w]+$/;
    var IdCard=/^\d{15}(\d{2}[A-Za-z0-9])?$/;
    var Phone=/^\d{11}$/;
    loginInBtn.bind("click",function(){
		if(user_name.val()==''||user_pass.val()==''){
			alert("用户名或密码不能为空");
			return;
		}
		if(random.val()==''){
			alert("验证码不能为空");
			return;
		}
		var aQuery = $("#info").serialize();
		$.post('LoginInSystem.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {
						 alert('登录成功！');
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