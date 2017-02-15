<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body>
	<div class="crumb-wrap">
		<div class="crumb-list">
			<i class="icon-font">&#xe06b;</i><span>欢迎使用</span>
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-title">
			<h1>快捷操作</h1>
		</div>
		<div class="result-content">
			<div class="short-wrap">
				<a><i class="icon-font">&#xe001;</i>*</a> <a><i
					class="icon-font">&#xe005;</i>*</a> <a><i class="icon-font">&#xe048;</i>*</a>
				<a><i class="icon-font">&#xe041;</i>*</a> <a><i
					class="icon-font">&#xe01e;</i>*</a>
			</div>
		</div>
	</div>
</body>
</html>
