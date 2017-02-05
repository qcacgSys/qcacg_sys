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
<title>后台签约管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/modernizr.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/conf.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/doShtml.js"></script>
</head>
<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<h1 class="topbar-logo none">
					<a href="index.jsp" class="navbar-brand">后台管理</a>
				</h1>
				<ul class="navbar-list clearfix">
					<li><a class="on" href="index.jsp">首页</a></li>
					<li><a href="#" target="_blank">网站首页</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li><a href="#">管理员</a></li>
					<li><a href="#">修改密码</a></li>
					<li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath}/admin/sysInfo"><i class="icon-font">&#xe008;</i>公告管理</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/allStatus"><i class="icon-font">&#xe005;</i>审核管理</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/allSign"><i class="icon-font">&#xe006;</i>作品管理</a></li>
							<li><a href="design.jsp"><i class="icon-font">&#xe004;</i>用户管理</a></li>
							<li><a href="design.jsp"><i class="icon-font">&#xe012;</i>评论管理</a></li>
							<li><a href="design.jsp"><i class="icon-font">&#xe052;</i>友情链接</a></li>
							<li><a href="design.jsp"><i class="icon-font">&#xe033;</i>广告管理</a></li>
						</ul></li>
					<li><a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统设置</a></li>
							<li><a href="system.jsp"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
							<li><a href="system.jsp"><i class="icon-font">&#xe046;</i>数据备份</a></li>
							<li><a href="system.jsp"><i class="icon-font">&#xe045;</i>数据还原</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">
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
						<a href="#"><i class="icon-font">&#xe001;</i>*</a> <a href="#"><i
							class="icon-font">&#xe005;</i>*</a> <a href="#"><i
							class="icon-font">&#xe048;</i>*</a> <a href="#"><i
							class="icon-font">&#xe041;</i>*</a> <a href="#"><i
							class="icon-font">&#xe01e;</i>*</a>
					</div>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-title">
					<h1>保存签约结果</h1>
				</div>
				<div class="result-content">
					<ul class="sys-info-list">
						<li><label class="res-lab">作品信息</label><span
								class="res-info"><a id="aId" target="view_window">${bookDTO.bookName}书本详情</a></span></li>
						<form method="post" action="#">
							<input type="hidden" value="${bookDTO.bookId}" id="bookId" name="bookId">
							<li><label class="res-lab">是否签约</label><span
								class="res-info"><input type="radio" id="status2" name="status"
									value="2">签约通过&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="status3" name="status"
									value="3">拒绝签约</span></li>
									<li><label class="res-lab">操作</label><span
								class="res-info"><input type="button" id="submitId" value="提交保存">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></span></li>
						</form>
					</ul>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-title">
					<h1>使用帮助</h1>
				</div>
				<div class="result-content">
					<ul class="sys-info-list">
						<li><label class="res-lab">官方交流网站：</label><span
							class="res-info"><a href="#" target="_blank">#</a></span></li>
						<li><label class="res-lab">官方交流QQ群：</label><span
							class="res-info"><a class="qq-link" target="_blank"
								href="#"><img border="0"
									src="http://pub.idqqimg.com/wpa/images/group.png" alt="JS-前端开发"
									title="JS-前端开发"></a> </span></li>
					</ul>
				</div>
			</div>
		</div>
		<!--/main-->
	</div>
</body>
<script type="text/javascript"> 
	$("#aId").attr("href", HtmlList.catalog + "?bookId=${bookDTO.bookId}");
	var status ;
	$("#status2").click(function(){
		status = 2;
	});
	$("#status3").click(function(){
		status = 3;
	});
	$("#submitId").click(function() {
		var formData = {
			bookId : $("#bookId").val(),
			status : status
		};
		var data = formData;
		var url = PathList.adminUpdateBookSign;
		console.log(data);
		$.ajax({
			type : 'POST',
			data : data,
			url : url,
			success : function(result) {
				console.log(result);
				alert("保存成功");
			},
			error : function(e) {
				console.log(e);
				alert("保存失败");
			}
		});
	});
</script>
</html>