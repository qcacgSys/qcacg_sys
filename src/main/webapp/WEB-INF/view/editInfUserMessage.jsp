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

<title>editInfUserMessage page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div align="center">
		<form action="${pageContext.request.contextPath}/InfUserMessage/system" method="post">
			标题：<input name="messagetitle"><br>
			内容：<input name="message"><br>
			//选择添加userid<input type="button" id="selectUsers"><br>
			<input type="submit" value="发送官方公告">
		</form><br>
		<form action="${pageContext.request.contextPath}/InfUserMessage/official" method="post">
			标题：<input name="messagetitle"><br>
			内容：<input name="message"><br>
			<input type="submit" value="发送系统消息">
		</form><br>
	</div>
</body>
</html>
