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
<title>后台用户管理</title>
<style type="text/css">
#sendMessage{
	border:1px solid red;
	text-align:center;
	position: absolute; 
	left: 670px; 
	top: 250px; 
	background: #FFFFFF;
}
</style>
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
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<i class="icon-font"></i>--
						</div>
					</div>
					<div id="sendMessage"></div>
					<div id="oneUser" class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th width="11%">用户ID</th>
									<th width="13%">用户名</th>
									<th width="15%">注册时间</th>
									<th width="15%">最后一次登录时间</th>
									<th width="9%">用户状态</th>
									<th width="25%">IP地址</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbo">
								<tr>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td><a id="xx" href="#">操作</a>&nbsp;&nbsp;</td>
								</tr>
							</tbody>
						</table>
						<jsp:include page="/common/fenyed.jsp"></jsp:include>
					</div>
				</form>
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<!--/main-->
	  </div>
	</div>
</body>
<script type="text/javascript">

//页面显示完成加载
$(function(){
	loadSimpleUsersAction(1,100);
});

//加载本页方法
var loadSimpleUsersAction = function(pageNum, pageSize){
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQuerySimpleUsers,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateSimpleUsersView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminQuerySimpleUsers,model.updateSimpleUsersView);
		}
	});
};

//绑定 查看用户详细
var queryUserDetailByUser = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var userId = model.result.list[model.index].userId;
	var one;
	queryDetailUser(userId, function(data) {
		one = data;	
		$('body').empty().load('load/UserDetail.jsp',function(){
			var template=	'<tr>'+
								'<td>telephone</td>'+
								'<td>email</td>'+
								'<td>sex</td>'+
								'<td>birthday</td>'+
								'<td>userAttention</td>'+
								'<td>invitePeople</td>'+
							'</tr>';
			if (one.telephone==undefined) {
				one.telephone='';
			}
			if (one.email==undefined) {
				one.email='';
			}
			if (one.sex==undefined) {
				one.sex='';
			}
			if (one.birthday==undefined) {
				one.birthday='';
			}
			if (one.userAttention==undefined) {
				one.userAttention='';
			}
			if (one.invitePeople==undefined) {
				one.invitePeople='';
			}
			var tr = template.replace('telephone',one.telephone).replace('email',one.email).replace('sex',one.sex).replace('birthday',one.birthday).replace('userAttention',one.userAttention).replace('invitePeople',one.invitePeople);
			$('#tbo2').empty().append(tr);
			//绑定 返回
			var btn=$("<input type='button' value='返回' class='btn btn-info' onclick='fanhui()'>");
			$('#fanhui').append(btn);
		});
	});
	
}

//查单个实体
var queryDetailUser = function(userId,fn){
	var param = {
		userId : userId
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryDetailUserForUser,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			fn(result);
		}
	});
}

//返回界面
var fanhui = function(){
	history.go(0);
}

//绑定 发送信息
var sendMessageForUser = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var userId = model.result.list[model.index].userId;
	model.userId = userId;
	$('#sendMessage').load('load/sendMeaasge.jsp',function(){
		$('#user_id').text(model.userId);
		$('#sendGO').click(function(){
			var div = $(this).parent().parent().attr("style","display:none;");
			console.log(div);
			var shuzu = [];
			var userId = model.userId;
			shuzu.push(userId);
			var param = {
					userId:shuzu,
					messageTitle:$('input[name="messagetitle"]').val(),
					message:$('#desc').val(),
					messageType:'1'
			};
			var param = JSON.stringify(param);
			$.ajax({
				type : "POST",
				url : PathList.adminSendMessageForUser,
				contentType : "application/json; charset=utf-8",
				data : param,
				dataType : "json",
				success : function(result) {
					alert(result.msg);
					
				}
			});
		});
	});
}

</script>
</html>