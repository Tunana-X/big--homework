<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品销售趋势</title>
    <!-- ✅ 使用本地 ECharts 文件 -->
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <!-- ✅ 使用本地 jQuery 和 jQuery UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js     "></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js     "></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css     ">
    <!-- 自定义样式 -->
    <style>
        .pageTitle {
            font-size: 18px;
            margin: 20px 0;
        }
        .inputstyle {
            padding: 5px;
            margin-right: 10px;
        }
        .btnstyle {
            padding: 5px 15px;
            background-color: #FF4400;
            color: white;
            border: none;
            cursor: pointer;
        }
        .error-tip {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
        .sales-table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }
        .sales-table th, .sales-table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="pageTitle">
    <span id="MainTitle"><span style="color:gray">销售趋势分析&nbsp;&nbsp;/&nbsp;&nbsp;</span>销量折线图</span>
</div>

<!-- 搜索条件 -->
<form id="salesForm" method="get" action="Admin_salesChart.action">
    <label for="goodsSelect">选择商品：</label>
    <input type="text" id="goodsSelect" name="goodsSelect" placeholder="输入商品ID或名称" class="inputstyle"/>&nbsp;

    <input type="hidden" id="goods_id" name="goods_id" value="${goodsId}"/>
    <input type="hidden" id="goods_name" name="goods_name" value="${goodsName}"/>

    开始日期：
    <input type="date" name="startDate" value="${startDate}" class="inputstyle"/>&nbsp;

    结束日期：
    <input type="date" name="endDate" value="${endDate}" class="inputstyle"/>&nbsp;

    <input type="button" id="searchBtn" value="查询" class="btnstyle"/>
</form>

<!-- ✅ 无销售记录时提示 -->
<c:if test="${noSales}">
    <div class="error-tip">该时间段内无销售记录</div>
</c:if>

<!-- ✅ 有销售记录时显示图表 -->
<!-- ✅ 在图表标题中显示商品名称 -->
<c:if test="${not empty salesHistory and not noSales}">
    <div id="main" style="width: 1000px; height:500px;"></div>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));

        // ✅ 历史销量数据（使用 saleDateStr 字段）
        var dates = [
            <c:forEach items="${salesHistory}" var="sale" varStatus="status">"${sale.saleDateStr}"<c:if test="${!status.last}">,</c:if></c:forEach>
        ];
        var sales = [
            <c:forEach items="${salesHistory}" var="sale" varStatus="status">${sale.totalSales}<c:if test="${!status.last}">,</c:if></c:forEach>
        ];

        // ✅ 预测销量数据
        var futureDates = [
            <c:forEach items="${predictions}" var="pred" varStatus="status">"未来${status.index+1}天"<c:if test="${!status.last}">,</c:if></c:forEach>
        ];
        var futureSales = [
            <c:forEach items="${predictions}" var="pred" varStatus="status">${pred}<c:if test="${!status.last}">,</c:if></c:forEach>
        ];

        // ✅ 在图表标题中显示商品名称
        var goodsName = "${goodsName}";
        var option = {
            title: { text: '商品【' + goodsName + '】销售趋势' }, // ✅ 动态显示商品名称
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

<!-- ✅ 表格展示原始数据 -->
<c:if test="${not empty salesHistory}">
    <table class="sales-table">
        <thead>
        <tr>
            <th>日期</th>
            <th>销量</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${salesHistory}" var="sale">
            <tr>
                <td>${sale.saleDate}</td>
                <td>${sale.totalSales}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- ✅ 商品选择器脚本 -->
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
            minLength: 1,
            select: function(event, ui) {
                $("#goods_id").val(ui.item.goodsId);
                $("#goods_name").val(ui.item.goodsName);
            }
        });

        // ✅ 绑定点击事件，手动提交表单
        $("#searchBtn").on("click", function() {
            var goods_id = $("#goods_id").val();
            var goods_name = $("#goods_name").val();

            if (!goods_id && !goods_name.trim()) {
                alert("必须输入商品ID或商品名称");
                return;
            }

            // ✅ 手动提交表单
            var form = document.getElementById("salesForm");
            form.submit();
        });

        // ✅ 禁用回车键自动提交
        $("#salesForm input").on("keydown", function(e) {
            if (e.key === "Enter") {
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>