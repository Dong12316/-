
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
<title>疫情数据统计</title>
</head>
<style type="text/css">
 #main{
 	position:relative;
  left: 100px;
 }
 .cha{
 	position:relative;
  left: 50px;
 }
 td{
 text-align:center;vertical-align:middle;
 
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
   
    <div class="cha">
	<form  method="post" action="index" name="from1" id="from1" >
	请输入查询时间段:&nbsp;&nbsp;&nbsp;<input name="start" id="start" placeholder="yyyy-mm-dd hh:mm:ss">
	&nbsp;&nbsp;&nbsp;
	至
	&nbsp;&nbsp;&nbsp;
	<input name="end" id="end" placeholder="yyyy-mm-dd hh:mm:ss">
	&nbsp;&nbsp;&nbsp;
	<input class="button" type="submit" name="submit" id="submit" value="提交" onclick="return check(this.form);">
	</form>
    </div>
    <div id="main" style="width: 600px;height:400px;"></div>
    
    <div id="cont"> 
    <div id="test2">
    <table>
    <tr>
    <th>日期</th><th>省份</th><th>城市</th><th>确诊人数</th><th>治愈人数</th><th>死亡人数</th>
    </tr>
    
    <c:forEach items="${list}" var="use" >
		<tr>
		<td>${use.date}</td><td>${use.province}</td><td>${use.city}</td><td>${use.quezhen}</td><td>${use.zhiyu}</td><td>${use.dead}</td>
		</tr>
		</c:forEach>
    </table>
    </div>
    <div id="test1">
    <table>
    <tr>
    <th>日期</th><th>洲</th><th>国家</th><th>确诊人数</th><th>治愈人数</th><th>死亡人数</th>
    </tr>
    
    <c:forEach items="${list2}" var="use2" >
		<tr>
		<td>${use2.date}</td><td>${use2.province}</td><td>${use2.city}</td><td>${use2.quezhen}</td><td>${use2.zhiyu}</td><td>${use2.dead}</td>
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
                    text: '疫情确诊人数统计'
                },
                tooltip: {},
                legend: {
                    data:['确诊人数']
                },
        	    xAxis: {
        	        type: 'category',
        	    	axisLabel: {  
             		   interval:0,  
             		   rotate:40  
             		}  ,
                 data: ["<%=pname[0]%>","<%=pname[1]%>">"]
        	    },
        	    yAxis: {
        	        type:'value'
        	    },
        	    series: [{
        	    	name: '确诊人数',
                    data: [<%=cnum[0]%>,<%=cnum[1]%>],
        	        type: 'line',
        	        smooth: true
        	    }]
        	};
        // 指定图表的配置项和数据    
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</html>