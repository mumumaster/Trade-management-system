<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试Ajax查询List</title>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<script type="text/javascript" src="${APP_PATH}/js/jquery-1.12.4.js"></script>
<link href="${APP_PATH}/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${APP_PATH}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
	<section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>

	<div>
		<label for="birthday">出生日期：</label> <input type="text" Class="Wdate"
			id="birthday" name="birthday" readonly="readonly"
			onclick="WdatePicker();"> <font color="red"></font>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/time.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/calendar/WdatePicker.js"></script>


	
</body>
</html>







