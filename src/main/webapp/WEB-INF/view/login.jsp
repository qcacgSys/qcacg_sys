<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>后台登录管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin_login.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/modernizr.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/conf.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/json2.js"></script>
</head>
<body>
	<div class="admin_login_wrap">
		<h1>后台管理</h1>
		<div class="adming_login_border">
			<div class="admin_input">
				<form action="${pageContext.request.contextPath}/login"
					method="post">
					<ul class="admin_items">
						<li><label for="user">用户名：</label> <input type="text"
							name="adminName" id="user" size="35"
							class="admin_input_style" /></li>
						<li><label for="pwd">密码：</label> <input type="password"
							name="adminPassword" id="pwd" size="35"
							class="admin_input_style" /></li>
						<li><input type="submit" tabindex="3" value="提交"
							class="btn btn-primary" /></li>
						<li>${message}</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>