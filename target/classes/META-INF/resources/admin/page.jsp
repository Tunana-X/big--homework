<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="pagetable" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="5px"></td></tr>
  <tr>
  	<td colspan="2">
  		<c:if test="${paperUtil.pageNo > 1 }">
			<div class="prepage">&lt;上一页</div>
		</c:if>
		<c:if test="${paperUtil.pageNo <= 1 }">
			<div class="prepage" style="color:gray">&lt;上一页</div>
		</c:if>
  		
  		<div class="${paperUtil.pageNo==1?'pageitem2':'pageitem'}">1</div>
  		<c:if test="${paperUtil.pageNo-2-1 > 1}">..</c:if>
  		<c:if test="${paperUtil.pageNo <= 2 }">
  		<c:forEach begin="2" end="5" var="item">
  		<c:if test="${item >1 && item < paperUtil.pageCount}">
  			<div class="${paperUtil.pageNo==item?'pageitem2':'pageitem'}">${item}</div>
  		</c:if>
  		</c:forEach>
  		</c:if>
  		
  		<c:if test="${paperUtil.pageNo > 2}">
  		<c:forEach begin="${paperUtil.pageNo-2}" end="${paperUtil.pageNo+2}" var="item">
  		<c:if test="${item >1 && item < paperUtil.pageCount}">
  			<div class="${paperUtil.pageNo==item?'pageitem2':'pageitem'}">${item}</div>
  		</c:if>
  		</c:forEach>
  		</c:if>
  		
  		<c:if test="${paperUtil.pageNo+2+1 < paperUtil.pageCount}">..</c:if>
  		<c:if test="${paperUtil.pageCount > 1}">
  		<div class="${paperUtil.pageNo==paperUtil.pageCount?'pageitem2':'pageitem'}">${paperUtil.pageCount}</div>
  		</c:if>
  		
  		<c:if test="${paperUtil.pageNo < paperUtil.pageCount}">
	        <div class="nextpage">下一页&gt;</div>
	    </c:if> 
	    <c:if test="${paperUtil.pageNo >= paperUtil.pageCount}">
			<div class="nextpage" style="color:gray">下一页&gt;</div>
		</c:if>

		<div class="pageitemtip">共 ${paperUtil.totalCount} 条，共 ${paperUtil.pageCount} 页数据</div>
  	</td>
     
  </tr>
  <tr><td colspan="2" height="5px"></td></tr>
</table>  
<script type="text/javascript">
$(function(){
	var pageNo = Number("${paperUtil.pageNo}");
	var pageCount = Number("${paperUtil.pageCount}");
	$(".pageitem").bind("click",function(){
		ChangePage($(this).text());
	});
	$(".prepage").bind("click",function(){
		if(pageNo > 1){
			ChangePage(pageNo - 1);
		}
	});
	$(".nextpage").bind("click",function(){
		if(pageNo < pageCount){
			ChangePage(pageNo + 1);
		}
	});
});
</script>
	 