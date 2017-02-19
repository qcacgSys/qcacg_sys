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
<title>欢迎进入后台管理</title>
<jsp:include page="/common/js_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<div class="container-fluid clearfix">
	  <div class="row">
		<jsp:include page="/common/left.jsp"></jsp:include>
		<!--/sidebar-->
		<div class="main-wrap">
			<jsp:include page="/common/right_head.jsp"></jsp:include>
			<div class="result-wrap">
				<div class="result-title">
					<h1></h1>
				</div>
				<div class="result-content">
					<ul class="sys-info-list">
						<li><label class="res-lab">操作信息</label><span class="res-info"><a
								id="aId" target="view_window">${message}</a></span></li>
					</ul>
				</div>
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<!--/main-->
	  </div>
	</div>
</body>
</html>