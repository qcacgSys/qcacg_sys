<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>js_css.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/main.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/modernizr.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/conf.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/json2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/doShtml.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/init.js"></script>
</head>
</html>
