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
 </style>
<body>
 
     
    <div class="cha">
	<form  method="post" action="index" name="from1" id="from1" >
	请输入查询时间段:&nbsp;&nbsp;&nbsp;<input name="start" id="start" placeholder="yyyy-mm-dd hh:mm:ss">
	&nbsp;&nbsp;&nbsp;
	至
	&nbsp;&nbsp;&nbsp;
	<input name="end" id="end" placeholder="yyyy-mm-dd hh:mm:ss">
	&nbsp;&nbsp;&nbsp;
	<input class="button" type="submit" name="submit" id="submit" value="提交" >
	</form>
    </div>
     <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
</body>

</html>