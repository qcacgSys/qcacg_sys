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
<jsp:include page="/common/js_css.jsp"></jsp:include>
<style type="text/css">
.userlist {
	overflow: scroll;
	width: 400px;
	height: 700px;
	position: absolute;
	right: 0px;
	top: 90px;
	border: 1px solid red;
	display: block;
	background: #fff
}

.userlist_close {
	overflow: scroll;
	width: 400px;
	height: 700px;
	position: absolute;
	right: 0px;
	top: 90px;
	border: 1px solid red;
	display: none;
}
</style>
<script type="text/javascript">
	var displayUserList = function() {
		$("#userListDiv").removeClass("userlist_close").addClass("userlist");
	};

	var closeUserList = function() {
		$("#userListDiv").removeClass("userlist").addClass("userlist_close");
	};
</script>
</head>
<body>
	<script type="text/javascript">
		var userListPageNum = 1;
		var getUserlist = function(pageNum, pageSize) {
			var sendData = {
				pageNum : pageNum,
				pageSize : pageSize
			};
			userListPageNum++;
			$.post(PathList.userlist, sendData, function(result) {
				var ulEle = $("#user");
				var userList = result.data.list;
				for (var x = 0; x < userList.length; x++) {
					console.log(userList[x]);
					var liEle = '<li><input name="userId" id="checkboxId" type="checkbox" value="' + userList[x].userId + '">用户名:' + userList[x].userName + '</li>';
					ulEle.append(liEle);
				}
			});
		};
	</script>
	<div id="userListDiv" class="userlist_close">
		<ul id="user">
		</ul>
		<ul>
			<button onclick="getUserlist(userListPageNum,20)">更多用户</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="closeUserList()">关闭</button>
		</ul>
	</div>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<div class="container-fluid clearfix">
		<div class="row">
			<jsp:include page="/common/left.jsp"></jsp:include>
			<!--/sidebar-->
			<div class="main-wrap">
				<jsp:include page="/common/right_head.jsp"></jsp:include>
				<div class="result-wrap">
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
				<jsp:include page="/common/right_foot.jsp"></jsp:include>
				<div class="result-title">
					<h1>用户列表</h1>
				</div>
			</div>
			<!--/main-->
		</div>
	</div>
</body>
<script type="text/javascript">
	var formData;
	var data;
	var url = PathList.saveInfo;
	var userIds = new Array();
	$("#productionButton").click(function() {
		userIds = new Array();
		$('#checkboxId:checked').each(function() {
			console.log($(this).val());
			userIds.push($(this).val()); //向数组中添加元素 
			console.log(userIds);
		});
		if (userIds != null && userIds.length > 0) {
			formData = {
				messageTitle : $("#messageTitle0").val(),
				message : $("#message0").val(),
				messageType : 0,
				userId : userIds
			};
		} else {
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
		$('input[name="userId"]:checked').each(function() {
			userIds.push($(this).val()); //向数组中添加元素  
		});
		if (userIds != null && userIds.length > 0) {
			formData = {
				messageTitle : $("#messageTitle1").val(),
				message : $("#message1").val(),
				messageType : 1,
				userId : userIds
			};
		} else {
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