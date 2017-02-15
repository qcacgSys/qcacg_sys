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
	<div class="sidebar-wrap">
		<div class="sidebar-title">
			<h1>菜单</h1>
		</div>
		<div class="sidebar-content">
			<ul class="sidebar-list">
				<li><a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
					<ul class="sub-menu">
						<li><a
							href="${pageContext.request.contextPath}/admin/sysInfo"><i
								class="icon-font">&#xe008;</i>公告管理</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/allStatus"><i
								class="icon-font">&#xe005;</i>作品管理</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/allSign"><i
								class="icon-font">&#xe006;</i>作品签约</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/allRecom"><i
								class="icon-font">&#xe006;</i>推荐管理</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/allReport"><i
								class="icon-font">&#xe012;</i>评论管理</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/allLog"><i
								class="icon-font">&#xe004;</i>日志管理</a></li>
						<li><a><i class="icon-font">&#xe052;</i>友情链接</a></li>
						<li><a><i class="icon-font">&#xe033;</i>广告管理</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/mouthLevelAccounts"><i
								class="icon-font">&#xe005;</i>等级核算</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/daysUpdateAccounts"><i
								class="icon-font">&#xe005;</i>日更统计</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/mouthUpdateAccounts"><i
								class="icon-font">&#xe005;</i>月更统计</a></li>
					</ul></li>
				<li><a><i class="icon-font">&#xe018;</i>系统管理</a>
					<ul class="sub-menu">
						<li><a><i class="icon-font">&#xe017;</i>系统设置</a></li>
						<li><a><i class="icon-font">&#xe037;</i>清理缓存</a></li>
						<li><a><i class="icon-font">&#xe046;</i>数据备份</a></li>
						<li><a><i class="icon-font">&#xe045;</i>数据还原</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</body>
</html>
