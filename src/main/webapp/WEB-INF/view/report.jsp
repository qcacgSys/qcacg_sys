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
<title>后台评论管理</title>
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
							<i class="icon-font"></i>说明:审理成功前台评论或回复替换为"您的内容中存在违规信息!".
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th>举报ID</th>
									<th>举报类型</th>
									<th>举报内容</th>
									<th width="35%">举报文本</th>
									<th width="7%">举报人ID</th>
									<th width="23%">举报时间</th>
									<th width="8%">状态</th>
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
									<td><a id="shenli" href="#">审理</a>&nbsp;&nbsp;<a id="bushenli" href="#">不审理</a></td>
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
	loadReportAction(1,100);
});

//加载本页方法
var loadReportAction = function(pageNum, pageSize) {
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminListReport,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateReportView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminListReport,model.updateReportView);
		}
	});
};

//审理按钮-事件
var shenliAction = function (thisObj) {
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var reportId = model.result.list[model.index].reportId;
	console.log(reportId);
	model.updateReport(reportId,1);
};

//不审理按钮-事件
var bushenliAction = function (thisObj) {
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var reportId = model.result.list[model.index].reportId;
	console.log(reportId);
	model.updateReport(reportId,2);
};

//事件-操作
model.updateReport=function(id,status){
	var param = {
		reportId : Number(id),
		status : Number(status)
	};
	var paramJSON = JSON.stringify(param);
	$.ajax({
		type : "POST",
		data : paramJSON,
		contentType : 'application/json',
		dataType : 'json',
		url : PathList.adminUpdateReport,
		success : function(result) {
			alert(result.msg);
			history.go(0);
		}
	});
}

</script>
</html>