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
	<div class="result-wrap">
		<div class="result-title">
			<h1>使用帮助</h1>
		</div>
		<div class="result-content">
			<ul class="sys-info-list">
				<li><label class="res-lab">官方交流网站：</label><span
					class="res-info"><a target="_blank">#</a></span></li>
				<li><label class="res-lab">官方交流QQ群：</label><span
					class="res-info"><a class="qq-link" target="_blank"><img
							border="0" src="http://pub.idqqimg.com/wpa/images/group.png"
							alt="JS-前端开发" title="JS-前端开发"></a> </span></li>
			</ul>
		</div>
	</div>
</body>
</html>
