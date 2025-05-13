<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/product.css">
<link rel="stylesheet" type="text/css" href="css/message.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">
 $(document).ready(function(){
	 
	 //点击预定
	 var user_id = "${userFront.user_id}";
	 var goods_id = "${goods.goods_id}";
	 var num = /^\d+$/;
	 $("#addCard").bind('click',function(){
		 if(user_id==''){
			 alert('请先登录');
			 return;
		 }
		 if(!num.exec($("#goods_count").val())){
			 alert('购买数量必须为数字');
			 return;
		 }
		 if(Number($("#goods_count").val()) > Number($("#goods_count_real").val())){
			 alert('购买数量大于库存数量');
			 return;
		 }
		 $("#info").submit();
	 });

	 $("#addBtn").bind("click",function(){
		if(user_id==''){
			alert('请先登录后在进行留言！')
			return;
		}
		if($("#noticeContent").val()==''){
			alert('留言内容不能为空！')
			return;
		}
		var aQuery = $("#infoSblog").serialize();  
		$.post('page_addSblog.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('感谢您的留言！');
						 window.location.reload();
					}else  if(responseObj.err.msg){
						 alert('留言失败：'+responseObj.err.msg);
					}else{
						 alert('留言失败：服务器异常！');
					}	
		},'json');
	});

	$("#replyBtn").bind("click",function(){
		if(user_id==''){
			alert('请先登录后在进行回复！')
			return;
		}
		if($("#noticeContent2").val()==''){
			alert('回复内容不能为空！')
			return;
		}
		var aQuery = $("#infoSblogReply").serialize();  
		$.post('page_addSblogReply.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('回复成功！');
						 window.location.reload();
					}else  if(responseObj.err.msg){
						 alert('回复失败：'+responseObj.err.msg);
					}else{
						 alert('回复失败：服务器异常！');
					}	
		},'json');
	});

	$("#cancelReply").bind("click", function () {
        $("#addSblogReply").hide();
        //$("#addSblog").fadeIn();
    });

	$("#addCollect").bind('click',function(){
		 if(user_id==''){
			 alert('请先登录');
			 return;
		 }
		var aQuery = {
			'user_id':user_id,
		    'goods_id':goods_id
		};  
		$.post('page_addCollect.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('收藏成功！');
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
	 });
}); 
 function initForm(obj,sblog_id) {
	    let leftV = $('#'+obj).offset().left;
	    let topV = $('#'+obj).offset().top + 30;
	    $("#addSblogReply").css("left", leftV+"px").css("top", topV+"px")
	    $("#addSblogReply").fadeIn();
	    $("#sblog_id").val(sblog_id);
}
</script>
<style type="text/css">
 .inputPrice{
	width:80px;
	height:25px;
	border:0px solid #F04844;
	border-radius:20px;
	background-color:#F3F3F3;
	text-align:center;
	margin-right:10px;
}
.inputPrice:focus{
   outline:none;
   box-shadow: none;
}
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="goods" /></jsp:include>
<div class="middle">
	<!--  产品检索介绍 -->
	 <div id="product_info">
			<div class="productShow">
					<div class="pictext">
							<div class="leftpic"><img src="images/goodss/${goods.goods_pic}"/></div>
							<div class="righttext">
									<form name="info" id="info" action="page_addCard.action" method="post">
									<input type="hidden" name="goods_id" id="goods_id" value="${goods.goods_id}"/>
									<input type="hidden" name="goods_name" id="goods_name" value="${goods.goods_name}"/>
									<input type="hidden" name="goods_pic" id="goods_pic" value="${goods.goods_pic}"/>
									<input type="hidden" name="goods_price" id="goods_price" value="${goods.goods_price2}"/>
									<input type="hidden" id="goods_count_real" value="${goods.goods_count}"/>
									<div class="textTitle">${goods.goods_name}</div>
									<div class="textTop" style="">
											商品类型：<span style="color:black">${goods.goods_type_name}</span>
											<br/>商品价格：<c:if test="${goods.goods_flag==2}"><span style="text-decoration: line-through;">￥${goods.goods_price1}</span>　<span style="color:#FF5000;font-weight:bold;">￥${goods.goods_price2}</span></c:if>
						 						 <c:if test="${goods.goods_flag==1}"><span style="color:#FF5000;font-weight:bold;">￥${goods.goods_price2}</span></c:if>
											<br/>累计销量：<span style="color:black">${goods.orders_count}</span>
											<br/>商品评分：<span style="color:black">${goods.evaluate_score} 分</span>
											<br/>购买数量：<input class="inputPrice" type="text" id="goods_count" name="goods_count" value="1" style="width:80px"/>（库存：${goods.goods_count}）
									</div>
									<div class="textBtn">
										<input type="button" id="addCard" class="btnAdd" style="width:160px;" value="加入购物车"/>　
										<input type="button" id="addCollect" class="btnAdd" style="width:160px;" value="加入收藏"/>
									</div>
									</form>
							</div>
					</div>
					<div class="typehr"></div>
					<div class="introTitle">商品详情介绍</div>
					<div class="typehr"></div>
					<div class="intro">
						${goods.goods_descShow}
					</div>
					
					<div class="typehr"></div>
					<div class="introTitle">
						用户评价（${fn:length(evaluates)} 条）
					</div>
					<div class="typehr"></div>
					
					<!-- 评价信息开始 -->
					 <div id="pjxx" style="width:100%;max-height:500px;overflow:auto;margin-bottom:10px">
					 <c:if test="${evaluates!=null && fn:length(evaluates)>0}">
					 <c:forEach items="${evaluates}" var="sblog">
					 <div class="messages2" style="width:calc(100% - 10px);margin-left:10px;margin-top:5px;border-bottom:1px solid whitesmoke">
							<div class="messages_left" style="width:65px">
							</div>
							<div class="messages_right" style="width:calc(100% - 70px)">
								<div class="nickName">
										${sblog.real_name}
										<div class="time" style="float:right;font-size:14px;color:#666;font-weight:normal">
											<img src="images/xcp_evaluate.png" valign="middle" style="width:20px;height:20px"/>
												${sblog.evaluate_levelDesc}（${sblog.evaluate_level}分）
											&nbsp;&nbsp;&nbsp;&nbsp;
											<img src="images/xcp-time.png" valign="middle" style="width:14px;height:14px"/>
												${fn:substring(sblog.evaluate_date,0,19)}
										</div>
								</div>
								<div class="message_content">
										${sblog.evaluate_content}
								</div>
							</div>
						</div>
					 </c:forEach>
   					 </c:if>
					</div>
					<!-- 评价信息结束 -->
					
					 <!-- 回复留言结束 -->
					<div class="typehr"></div>
					<div class="introTitle">
						留言列表（${fn:length(sblogs)} 条）
					</div>
					<div class="typehr"></div>
					
					<!-- 发布留言开始 -->
					<div id="addSblog" style="width:calc(100% - 65px);margin-left:10px">
						<form name="infoSblog" id="infoSblog" action="Admin_addSblog.action" method="post">
							<input type="hidden" name="user_id" value="${userFront.user_id}"/>
							<input type="hidden" name="goods_id" value="${goods.goods_id}"/>
							<table class="reply_add">
								<tr>
									<td align="left" colspan="2">
										<textarea name="sblog_content" id="noticeContent" style="width:500px;height:80px;padding:10px"
												  class="inputstyle" placeholder="收入留言内容"></textarea>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="2" style="height: 50px;line-height: 50px">
										<input type="button" id="addBtn" class="btnstyle" style="width: 80px;"
											   value="发表留言"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" id="resetBtn" class="btnstyle" style="width: 80px;" value="清空"/>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<a name="link"></a>
					<!-- 发布留言结束 -->

					<!-- 回复留言开始 -->
					<div id="addSblogReply" style="width:600px;margin:0 auto;display:none;position: absolute;z-index:999; background-color:#f3f3f3">
						<form name="infoSblogReply" id="infoSblogReply" action="page_addSblogReply.action" method="post">
							<input type="hidden" name="sblog_id" id="sblog_id" value="0"/>
							<input type="hidden" name="user_id" value="${userFront.user_id}"/>
							<table class="reply_add">
								<tr>
									<td width="10px"></td>
									<td align="left" colspan="2">
										<textarea name="reply_content" id="noticeContent2" style="width:500px;height:80px;padding:10px"
												  class="inputstyle" placeholder="发表神妙回复"></textarea>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="2" style="padding-left:65px;height: 50px;line-height: 50px">
										<input type="button" id="replyBtn" class="btnstyle" style="width: 80px;"
											   value="发表回复"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" id="cancelReply" class="btnstyle" style="width: 80px;"
											   value="取消"/>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<!-- 回复留言结束 -->
					
					<!-- 留言信息开始 -->
					<div id="lyxx" style="width:100%;">
						<c:if test="${sblogs!=null && fn:length(sblogs)>0}">
							<c:forEach items="${sblogs}" var="sblog" varStatus="status">
								<div class="messages2" style="width:900px;margin-left:10px;margin-top:5px;border-bottom:1px solid whitesmoke">
									<div class="messages_left" style="width:65px">
									</div>
									<div class="messages_right" style="width:calc(100% - 70px)">
										<div class="nickName">
												${sblog.user_name}
										</div>
										<div class="message_content">
												${sblog.sblog_contentShow}
										</div>
										<div class="time" style="text-align:right">
											<img src="images/xcp-time.png" valign="middle" style="width:14px;height:14px"/>
												${fn:substring(sblog.sblog_date,0,19)}
											&nbsp;&nbsp;&nbsp;&nbsp;
											<img src="images/xcp-reply.png" valign="middle" style="width:18px;height:18px"/>
											<a id="sblog_${status.index}" href="#link" onclick="initForm('sblog_${status.index}','${sblog.sblog_id}')">[回复]</a>
										</div>
										<c:if test="${sblog.replys != null && fn:length(sblog.replys) >0}">
											<c:forEach items="${sblog.replys}" var="sblogReply" varStatus="status2">
												<div class="reply">
													<div class="messages_left" style="width:50px">&nbsp;</div>
													<div class="messages_right" style="width:calc(100% - 60px);border-top:1px solid whitesmoke">
														<div class="nickName" style="color:green">
																${sblogReply.user_id==0?'管理员':sblogReply.user_name}
														</div>
														<div class="message_content">
																${sblogReply.reply_contentShow}
														</div>
														<div class="time" style="text-align:right">
															<img src="images/xcp-time.png" valign="middle"
																 style="width:14px;height:14px"/>
																${fn:substring(sblogReply.reply_date,0,19)}
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<!-- 留言信息结束 -->
					 
			</div>

			 
			
	 </div>
	 <!--  产品检索 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>