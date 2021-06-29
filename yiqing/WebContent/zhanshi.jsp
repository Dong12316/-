<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
 <%@page import="java.text.SimpleDateFormat"%>
		<%@page import="java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <link rel="stylesheet" type="text/css" href="a.css"> 
<!DOCTYPE html>
<html>
<head>

  <!-- 引入 ECharts 文件 -->
    <script src="js/echarts.min.js"></script>
<title>数据统计</title>
</head>
<style type="text/css">
 #main{
 	position:relative;
  left: 300px;
 }
 .cha{
 	position:relative;
  left: 50px;
 }
 td{
 text-align:center;vertical-align:middle;
  margin-left: 200px;
 }
#cont 
 {
     width: 1200px;

 }
 #test1 {
     width: 400px; 
     position:relative;
     margin: 10px 30px;
     float: left;
 }
 #test2 {
     width: 400px;
     position:relative;
     float: right;
 }
 </style>
<body>
 
  <%String pname[] =(String[]) session.getAttribute("name");%>
  <%String cnum[] =(String[]) session.getAttribute("num");%>
  <%int as =(int) session.getAttribute("as");%>
   <div id="main" style="width: 600px;height:400px;"></div>
   <div id="cont"> 
   <div id="test1">
    <table style="border-collapse:separate; border-spacing:400px 10px;">
    <tr>
    <th>tarffic</th><th>数量</th>
    </tr>  
    <c:forEach items="${list}" var="course" >
		<tr>
		<td>${course.ip}</td><td>${course.number}</td>
		</tr>
		</c:forEach>
    </table>
    </div> 
    </div>
</body>
 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var option = {
        		title: {
                    text: '数量统计'
                },
                tooltip: {},
                legend: {
                    data:['数量']
                },
        	    xAxis: {
        	        type: 'category',
        	    	axisLabel: {  
             		   interval:0,  
             		   rotate:40  
             		}  ,
                 data: ["<%=pname[0]%>","<%=pname[1]%>","<%=pname[2]%>","<%=pname[3]%>","<%=pname[4]%>","<%=pname[5]%>","<%=pname[6]%>","<%=pname[7]%>","<%=pname[8]%>"]
        	    },
        	    yAxis: {
        	        type:'value'
        	    },
        	    series: [{
        	    	name: '数量',
                    data: [<%=cnum[0]%>,<%=cnum[1]%>,<%=cnum[2]%>,<%=cnum[3]%>,<%=cnum[4]%>,<%=cnum[5]%>,<%=cnum[6]%>,<%=cnum[7]%>,<%=cnum[8]%>],
        	        type: 'bar',
        	        smooth: true
        	    }]
        	};
        // 指定图表的配置项和数据    
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</html>