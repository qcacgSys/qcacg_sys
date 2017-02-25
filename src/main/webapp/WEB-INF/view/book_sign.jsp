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
						<div class="result-content">
							<table class="result-tab" width="100%">
								<thead>
									<tr>
										<th>作品ID</th>
										<th>姓名</th>
										<th>作品名</th>
										<th>申请次数</th>
										<th>最后申请时间</th>
										<th>签约方式</th>
										<th>签约状态</th>
										<th>QQ</th>
										<th>邮箱</th>
										<th>手机</th>
										<th>地址</th>
										<th>申请原因</th>
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
										<td>aaaa</td>
										<td>aaaa</td>
										<td>aaaa</td>
										<td>aaaa</td>
										<td>aaaa</td>
										<td>aaaa</td>
										<td>aaaa</td>
										<td>aaaa</td>
										<td><a id="aaaa" href="#">通过</a> <a id="bbbb" href="#">拒绝</a></td>
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
$(function() {
	loadBookSignAction(1, 100);
});

//加载本页方法
var loadBookSignAction = function(pageNum, pageSize) {
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryBookSign,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateSignView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminQueryBookSign, model.updateSignView);
		}
	});
};

//取消签约
var quxiaoqianyue = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	model.status = 0;
	model.updateSign();
}

//恢复签约通过
var tongguohuifu = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	model.status = 2;
	model.updateSign();
}

//恢复签约不通过
var butongguo = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	model.status = 6;
	model.updateSign();
};

//管理员解除签约
model.updateSign=function(id,status){
	var param = {
		bookId : model.bookId,
		status : model.status
	};
	$.post(PathList.adminRemoveBookSign, param, function(result){
		alert(result.msg);
		history.go(0);
	});
}

</script>
</html>