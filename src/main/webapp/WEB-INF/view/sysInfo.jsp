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
<title>后台公告管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/main.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/modernizr.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/conf.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/doShtml.js"></script>
<style type="text/css">
	.userlist {
		overflow: scroll;
		width: 400px;
		height: 700px;
		position: absolute;
		right: 0px;
		top: 90px;
		border:1px solid red;
		display:block;
		background: #fff
	}
	.userlist_close {
		overflow: scroll;
		width: 400px;
		height: 700px;
		position: absolute;
		right: 0px;
		top: 90px;
		border:1px solid red;
		display:none;
	}
</style>
<script type="text/javascript">
	var displayUserList = function(){
		$("#userListDiv").removeClass("userlist_close").addClass("userlist");
	};
	 
	var closeUserList = function(){
		$("#userListDiv").removeClass("userlist").addClass("userlist_close");
	};
</script>
</head>
<body>
	<script type="text/javascript">
		var userListPageNum = 1;
	</script>
	<div id="userListDiv" class="userlist_close">
		<ul id="user">
		</ul>
		<ul>
			<button onclick="getUserlist(userListPageNum,5)">更多用户</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="closeUserList()">关闭</button>
		</ul>
	</div>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<h1 class="topbar-logo none">
					<a href="#" class="navbar-brand">后台管理</a>
				</h1>
				<ul class="navbar-list clearfix">
					<li><a class="on" href="#">首页</a></li>
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
							<li><a
								href="${pageContext.request.contextPath}/admin/sysInfo"><i
									class="icon-font">&#xe008;</i>公告管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/allStatus"><i
									class="icon-font">&#xe005;</i>审核管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/allSign"><i
									class="icon-font">&#xe006;</i>作品管理</a></li>
							<li><a href="#"><i class="icon-font">&#xe004;</i>用户管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/allReport"><i
									class="icon-font">&#xe012;</i>评论管理</a></li>
							<li><a href="#"><i class="icon-font">&#xe052;</i>友情链接</a></li>
							<li><a href="#"><i class="icon-font">&#xe033;</i>广告管理</a></li>
						</ul></li>
					<li><a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="#"><i class="icon-font">&#xe017;</i>系统设置</a></li>
							<li><a href="#"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
							<li><a href="#"><i class="icon-font">&#xe046;</i>数据备份</a></li>
							<li><a href="#"><i class="icon-font">&#xe045;</i>数据还原</a></li>
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
				<div>
					<div class="result-title">
						<h1>发送作品相关</h1>
					</div>
					<div class="result-content">
						<ul class="sys-info-list">
							<form id="productionForm" method="post" action="#">
								<input type="hidden" value="0" name="messageType">
								<li><label class="res-lab">作品相关标题</label><span
									class="res-info"><input style="width: 400" type="text"
										id="messageTitle0" name="messageTitle"></span></li>
								<li><label class="res-lab">作品相关内容</label><span
									class="res-info"><textarea style="width: 400" rows="5"
											id="message0" name="message"></textarea></span></li>
								<li><label class="res-lab">选择用户</label><span
									class="res-info"><input type="button"
										id="selectUserButton" value="选择用户（必填）"
										onclick="displayUserList()"></span></li>
								<li><label class="res-lab">操作</label><span class="res-info"><input
										type="button" id="productionButton" value="提交发送">&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="reset" value="重置"></span></li>
							</form>
						</ul>
					</div>
					<div class="result-title">
						<h1>发送系统消息</h1>
					</div>
					<div class="result-content">
						<ul class="sys-info-list">
							<form id="systemForm" method="post" action="#">
								<input type="hidden" value="1" name="messageType">
								<li><label class="res-lab">系统消息标题</label><span
									class="res-info"><input style="width: 400" type="text"
										id="messageTitle1" name="messageTitle"></span></li>
								<li><label class="res-lab">系统消息内容</label><span
									class="res-info"><textarea style="width: 400" rows="5"
											id="message1" name="message"></textarea></span></li>
								<li><label class="res-lab">选择用户</label><span
									class="res-info"><input type="button"
										id="selectUserButton" value="选择用户（选填）"
										onclick="displayUserList()"></span></li>
								<li><label class="res-lab">操作</label><span class="res-info"><input
										type="button" id="systemButton" value="提交发送">&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="reset" value="重置"></span></li>
							</form>
						</ul>
					</div>
					<div class="result-title">
						<h1>发送官方公告</h1>
					</div>
					<div class="result-content">
						<ul class="sys-info-list">
							<form id="officialForm" method="post" action="#">
								<input type="hidden" value="2" name="messageType">
								<li><label class="res-lab">官方公告标题</label><span
									class="res-info"><input style="width: 400" type="text"
										id="messageTitle2" name="messageTitle"></span></li>
								<li><label class="res-lab">官方公告内容</label><span
									class="res-info"><textarea style="width: 400" rows="5"
											id="message2" name="message"></textarea></span></li>
								<li><label class="res-lab">操作</label><span class="res-info"><input
										type="button" id="officialButton" value="提交发送">&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="reset" value="重置"></span></li>
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
										src="http://pub.idqqimg.com/wpa/images/group.png"
										alt="JS-前端开发" title="JS-前端开发"></a> </span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="result-title">
				<h1>用户列表</h1>
			</div>
		</div>
		<!--/main-->
	</div>
</body>
<script type="text/javascript">
	var formData;
	var data;
	var url = PathList.saveInfo;
	var userIds = new Array();
	$("#productionButton").click(function() {
		userIds = new Array(); 
		$('#checkboxId:checked').each(function(){  
	    	console.log($(this).val());
	    	userIds.push($(this).val());//向数组中添加元素 
	    	console.log(userIds); 
		});
		if(userIds!=null&&userIds.length>0){
			formData = {
				messageTitle : $("#messageTitle0").val(),
				message : $("#message0").val(),
				messageType : 0,
				userId : userIds
			};
		}else{
			alert("请输入用户id");
			return;
		}
		data = JSON.stringify(formData);
		$.ajax({
			type : "POST",
			url : url,
			contentType : "application/json; charset=utf-8",
			data : data,
			dataType : "json",
			success : function(result) {
				console.log(result);
				alert(result.msg);
			},
			error : function(e) {
				console.log(e);
				alert("发送失败");
			}
		});
	});
	$("#systemButton").click(function() {
		userIds = new Array(); 
		$('input[name="userId"]:checked').each(function(){  
	    	userIds.push($(this).val());//向数组中添加元素  
		});
		if(userIds!=null&&userIds.length>0){
			formData = {
				messageTitle : $("#messageTitle1").val(),
				message : $("#message1").val(),
				messageType : 1,
				userId : userIds
			};
		}else{
			formData = {
				messageTitle : $("#messageTitle1").val(),
				message : $("#message1").val(),
				messageType : 1
			};
		}
		data = JSON.stringify(formData);
		$.ajax({
			type : "POST",
			url : url,
			contentType : "application/json; charset=utf-8",
			data : data,
			dataType : "json",
			success : function(result) {
				console.log(result);
				alert(result.msg);
			},
			error : function(e) {
				console.log(e);
				alert("发送失败");
			}
		});
	});
	$("#officialButton").click(function() {
		formData = {
			messageTitle : $("#messageTitle2").val(),
			message : $("#message2").val(),
			messageType : 2
		};
		data = JSON.stringify(formData);
		$.ajax({
			type : "POST",
			url : url,
			contentType : "application/json; charset=utf-8",
			data : data,
			dataType : "json",
			success : function(result) {
				console.log(result);
				alert(result.msg);
			},
			error : function(e) {
				console.log(e);
				alert("发送失败");
			}
		});
	});
</script>
</html>