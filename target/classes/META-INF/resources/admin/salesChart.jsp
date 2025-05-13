<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品销售趋势</title>
    <script src="https://cdn.jsdelivr.net/npm/echarts   @5.4.2/dist/echarts.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js   "></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js   "></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css   ">
</head>
<body>
<div class="pageTitle">
    <span id="MainTitle"><span style="color:gray">销售趋势分析&nbsp;&nbsp;/&nbsp;&nbsp;</span>销量折线图</span>
</div>

<!-- 搜索条件 -->
<form id="salesForm" action="Admin_salesChart.action" method="get">
    <label for="goodsSelect">选择商品：</label>
    <input type="text" id="goodsSelect" name="goodsSelect" placeholder="输入商品ID或名称" class="inputstyle"/>&nbsp;

    <input type="hidden" id="goods_id" name="goods_id" value="${goodsId}"/>
    <input type="hidden" id="goods_name" name="goods_name" value="${goodsName}"/>

    开始日期：
    <input type="date" name="startDate" value="${startDate}" class="inputstyle"/>&nbsp;

    结束日期：
    <input type="date" name="endDate" value="${endDate}" class="inputstyle"/>&nbsp;

    <input type="submit" value="查询" class="btnstyle"/>
</form>

<!-- 销售折线图 -->
<c:if test="${not empty salesHistory}">
    <div id="main" style="width: 1000px; height:500px;"></div>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));

        // 历史销量数据
        var dates = [
            <c:forEach items="${salesHistory}" var="sale" varStatus="status">"${sale.saleDate}"<c:if test="${!status.last}">,</c:if></c:forEach>
        ];
        var sales = [
            <c:forEach items="${salesHistory}" var="sale" varStatus="status">${sale.totalSales}<c:if test="${!status.last}">,</c:if></c:forEach>
        ];

        // 预测销量数据
        var futureDates = [
            <c:forEach items="${predictions}" var="pred" varStatus="status">"未来${status.index+1}天"<c:if test="${!status.last}">,</c:if></c:forEach>
        ];
        var futureSales = [
            <c:forEach items="${predictions}" var="pred" varStatus="status">${pred}<c:if test="${!status.last}">,</c:if></c:forEach>
        ];

        // ECharts 配置
        var option = {
            title: { text: '商品销售趋势' },
            tooltip: { trigger: 'axis' },
            legend: { data: ['历史销量', '预测销量'] },
            xAxis: { type: 'category', data: dates.concat(futureDates) },
            yAxis: { type: 'value' },
            series: [
                {
                    name: '历史销量',
                    type: 'line',
                    data: sales,
                    itemStyle: { color: '#409EFF' } // 蓝色
                },
                {
                    name: '预测销量',
                    type: 'line',
                    data: [null, null, null].concat(futureSales), // 前3个为 null
                    itemStyle: { color: '#FF9900' } // 橙色
                }
            ]
        };
        myChart.setOption(option);
    </script>
</c:if>

<!-- ✅ 仅在用户提交空搜索时显示错误提示 -->
<c:if test="${not empty goodsName or not empty goodsId}">
    <c:if test="${empty salesHistory}">
        <div class="error-tip">必须输入商品ID或商品名称</div>
    </c:if>
</c:if>

<!-- 商品选择器脚本 -->
<script>
    $(function() {
        $("#goodsSelect").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "Admin_listGoodssForSelect.action",
                    dataType: "json",
                    data: { keyword: request.term },
                    success: function(data) {
                        response($.map(data, function(item) {
                            return {
                                label: item.goodsName + " (ID: " + item.goodsId + ")",
                                value: item.goodsName,
                                goodsId: item.goodsId,
                                goodsName: item.goodsName
                            };
                        }));
                    }
                });
            },
            minLength: 1, // ✅ 英文冒号+逗号
            select: function(event, ui) { // ✅ 英文冒号+分号
                $("#goods_id").val(ui.item.goodsId);
                $("#goods_name").val(ui.item.goodsName);
                $("#salesForm").submit(); // ✅ 分号结尾
            } // ✅ 不需要多余括号
        }); // ✅ 英文分号结尾
    });
</script>
</body>
</html>e
点击搜索后,不管时间范围内商品是否有销售，都没有提示，只会刷新一遍，我需要在没有销售的时候有提示，有销售的时候产生趋势图