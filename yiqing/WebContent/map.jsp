<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
 <%@page import="java.text.SimpleDateFormat"%>
		<%@page import="java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <link rel="stylesheet" type="text/css" href="a.css"> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <title>疫情数据统计</title>
    <script src="js/echarts.min.js"></script>
    <script src="js/china.js"></script>
    <script src="js/china2.js"></script>
    <script src=" https://geo.datav.aliyun.com/areas/bound/100000.json"></script>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
 
</head>
<body>
    <%String pname[] =(String[]) session.getAttribute("name");%>
    <%String cnum[] =(String[]) session.getAttribute("num");%>
    <div id="main" style="width: 1000px;height:800px;"></div> <!-- 第2步：引入绘图容器 -->
    
</body>
<script type="text/javascript">

        // 第3步: 基于容器，创建一个echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var option = {
        	    title: {
        	        text: '中国疫情图',
        	        left: 'center'
        	    },
        	    tooltip: {
        	        trigger: 'item'
        	        	
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['中国疫情图']
        	    },
        	    visualMap: {
        	        type: 'piecewise',
        	        pieces: [
        	            {min: 1000, max: 1000000, label: '大于等于1000人', color: '#372a28'},
        	            {min: 500, max: 999, label: '确诊500-999人', color: '#4e160f'},
        	            {min: 100, max: 499, label: '确诊100-499人', color: '#974236'},
        	            {min: 10, max: 99, label: '确诊10-99人', color: '#ee7263'},
        	            {min: 1, max: 9, label: '确诊1-9人', color: '#f5bba7'},
        	        ],
        	        color: ['#E0022B', '#E09107', '#A3E00B']
        	    },
        	    toolbox: {
        	        show: true,
        	        orient: 'vertical',
        	        left: 'right',
        	        top: 'center',
        	        feature: {
        	            mark: {show: true},
        	            dataView: {show: true, readOnly: false},
        	            restore: {show: true},
        	            saveAsImage: {show: true}
        	        }
        	    },
        	    roamController: {
        	        show: true,
        	        left: 'right',
        	        mapTypeControl: {
        	            'china': true
        	        }
        	    },
        	    series: [
        	        {
        	            name: '确诊数',
        	            type: 'map',
        	            mapType: 'china',
        	            roam: false,
        	            label: {
        	                show: true,
        	                color: 'rgb(249, 249, 249)'
        	            },
        	            data: [
        	            	 {
        	                     name: '北京',
        	                     value: <%=cnum[10]%>
        	                   }, {
        	                     name: '天津',
        	                     value: <%=cnum[21]%>
        	                   }, {
        	                     name: '上海',
        	                     value: <%=cnum[12]%>
        	                   }, {
        	                     name: '重庆',
        	                     value: <%=cnum[7]%>
        	                   }, {
        	                     name: '河北',
        	                     value: <%=cnum[13]%>
        	                   }, {
        	                     name: '河南',
        	                     value: <%=cnum[3]%>
        	                   }, {
        	                     name: '云南',
        	                     value: <%=cnum[16]%>
        	                   }, {
        	                     name: '辽宁',
        	                     value: <%=cnum[19]%>
        	                   }, {
        	                     name: '黑龙江',
        	                     value: <%=cnum[11]%>
        	                   }, {
        	                     name: '湖南',
        	                     value: 593
        	                   }, {
        	                     name: '安徽',
        	                     value: <%=cnum[4]%>
        	                   }, {
        	                     name: '山东',
        	                     value: <%=cnum[8]%>
        	                   }, {
        	                     name: '新疆',
        	                     value: <%=cnum[26]%>
        	                   }, {
        	                     name: '江苏',
        	                     value: <%=cnum[6]%>
        	                   }, {
        	                     name: '浙江',
        	                     value: <%=cnum[2]%>
        	                   }, {
        	                     name: '江西',
        	                     value: <%=cnum[5]%>
        	                   }, {
        	                     name: '湖北',
        	                     value: <%=cnum[0]%>
        	                   }, {
        	                     name: '广西',
        	                     value: <%=cnum[15]%>
        	                   }, {
        	                     name: '甘肃',
        	                     value: 55
        	                   }, {
        	                     name: '山西',
        	                     value: <%=cnum[18]%>
        	                   }, {
        	                     name: '内蒙古',
        	                     value: <%=cnum[24]%>
        	                   }, {
        	                     name: '陕西',
        	                     value: <%=cnum[14]%>
        	                   }, {
        	                     name: '吉林',
        	                     value: <%=cnum[23]%>
        	                   }, {
        	                     name: '福建',
        	                     value: 179
        	                   }, {
        	                     name: '贵州',
        	                     value: <%=cnum[20]%>
        	                   }, {
        	                     name: '广东',
        	                     value: <%=cnum[1]%>
        	                   }, {
        	                     name: '青海',
        	                     value: <%=cnum[28]%>
        	                   }, {
        	                     name: '西藏',
        	                     value: <%=cnum[31]%>
        	                   }, {
        	                     name: '四川',
        	                     value: <%=cnum[9]%>
        	                   }, {
        	                     name: '宁夏',
        	                     value: <%=cnum[25]%>
        	                   }, {
        	                     name: '海南',
        	                     value: <%=cnum[17]%>
        	                   }, {
        	                     name: '台湾',
        	                     value: <%=cnum[29]%>
        	                   }, {
        	                     name: '香港',
        	                     value: <%=cnum[27]%>
        	                   }, {
        	                     name: '澳门',
        	                     value: <%=cnum[30]%>
        	                   }
        	            ]
        	        }
        	    ]
        	};
       
        myChart.setOption(option);
		

    </script>
</html>
