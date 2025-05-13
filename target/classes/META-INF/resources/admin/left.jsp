<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<title>管理页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">  
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">
	var jq = jQuery.noConflict(true);
</script>
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
<style type="text/css">
html,body{
	margin:0px;
	padding:0px;
	height:100%;
}
body{
	/* background-color:#696969; */
	background-color:#F5F5F5;
	color:white;
	font-family: Arial, Helvetica, sans-serif;
	font-size:14px;
}
.left{width:190px; min-height:450px;max-height:600px;overflow-x:hidden;overflow-y:auto;}
div,td,a{ color:#000;font-family:Arial, Helvetica, sans-serif;}
#container {
	width: 190px;
}
#container img{
	width:18px;
	height:18px;
	vertical-align:text-bottom;
	margin-right:10px;
}
H1 {
	margin: 0px;
	width: 190px;
	cursor: pointer;
	height: 40px;
	line-height: 40px;	
	font-size:15px;
	font-weight:normal;
	background-image:url('img/larrow.png');
	background-repeat:no-repeat;
	background-position:165px center;
	background-size:18px 18px;
}
H1 a {
	display: block;
	width: 190px;
	height: 40px;
	box-sizing:border-box;
	text-decoration: none;
	moz-outline-style: none;
	line-height: 40px;
	text-align: left;
	padding-left:30px;
}
H1.active {
	background-image:url('img/darrow.png');
}
.content{
	width: 190px;
	height: 40px;
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	line-height: 40px;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 40px;
	width: 190px;
	box-sizing:border-box;
	padding-left: 60px;
	background-image:url('img/rarrow.png');
	background-repeat:no-repeat;
	background-position:40px center;
	background-size:18px 18px;
}
.MM {
	width: 190px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
	background-color:#F2F3F5;
}
.MM a:link {
	color:#000;
	text-decoration: none;
}
.MM a:visited {
	color:#000;
	text-decoration: none;
}
.MM a:active {
	color:#000;
	text-decoration: none;
}
.MM a:hover {
	font-weight: bold;
	color: #006600;
	text-decoration: none;
}
</style>
<script language="javascript" type="text/javascript">
	jq(function(){
		
	});
</script>
</head>

<body>
<table width="190" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td width="190" valign="top">
    	<div class="left">
			 <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td width="190" valign="top">
				<div id="container">
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/self.png"/>个人信息中心</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="modifyInfo.jsp" target="MainFrame">个人信息</a></li>
					  <li><a href="modifyPwd.jsp" target="MainFrame">修改密码</a></li>
					</ul>
				  </div>
				  
				   <h1 class="type"><a href="javascript:void(0)"><img src="img/depart.png"/>会员类型管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listMemberTypes.action" target="MainFrame">会员类型查询</a></li>
					  <li><a href="Admin_addMemberTypeShow.action" target="MainFrame">新增会员类型</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/usertype.png"/>会员信息管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listUsers.action" target="MainFrame">会员查询</a></li>
					  <li><a href="Admin_addUserShow.action" target="MainFrame">新增会员</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/sblogtype.png"/>商品类别管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listGoodsTypes.action" target="MainFrame">商品类别查询</a></li>
					  <li><a href="Admin_addGoodsTypeShow.action" target="MainFrame">新增商品类别</a></li>
					</ul>
				  </div>
					<h1 class="type"><a href="javascript:void(0)"><img src="img/chart.png"/>销售趋势分析</a></h1>
					<div class="content">
						<ul class="MM">
							<li><a href="Admin_salesChart.action" target="MainFrame">商品销售趋势</a></li>
						</ul>
					</div>
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/goods.png"/>商品信息管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listGoodss.action" target="MainFrame">商品信息查询</a></li>
					  <li><a href="Admin_addGoodsShow.action" target="MainFrame">新增商品信息</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/orders.png"/>商品订单管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listOrderss.action" target="MainFrame">商品订单查询</a></li>
					</ul>
				  </div>
					<h1 class="type"><a href="javascript:void(0)"><img src="img/log.png"/>用户登录日志</a></h1>
					<div class="content">
						<ul class="MM">
							<li><a href="Admin_listUserLoginLogs.action" target="MainFrame">用户登录日志查询</a></li>
						</ul>
					</div>
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/visit.png"/>商品销售统计</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listOrdersDetailsSum.action" target="MainFrame">商品销售统计</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/news.png"/>新闻信息管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listInfos.action" target="MainFrame">新闻信息查询</a></li>
					  <li><a href="Admin_addInfoShow.action" target="MainFrame">新增新闻信息</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)"><img src="img/msg.png"/>留言信息管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listSblogs.action" target="MainFrame">留言信息查询</a></li>
					</ul>
				  </div>
				  
					<script type="text/javascript">
						var contents = document.getElementsByClassName('content');
						var toggles = document.getElementsByClassName('type');
					
						var myAccordion = new fx.Accordion(
							toggles, contents, {opacity: true, duration: 400}
						);
						//myAccordion.showThisHideOpen(contents[0]);
					</script>
				</div>
				</td>
			  </tr>
			</table>       	
        </div>
    </td>
  </tr>
</table>
</body>
</html>
