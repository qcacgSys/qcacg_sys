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
									<th>举报文本</th>
									<th>举报人ID</th>
									<th>举报时间</th>
									<th>状态</th>
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
						<div id="fenyed" class="list-page">
							<span id="fenyes"><input type="hidden" id="pageNum"
								value="0"> <input type="hidden" id="pageSize" value="10">
								<span id="fenyes"><a id="lastPage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									id="nextPage">下一页</a></span></span>
						</div>
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
$(getReportList(0, 10));

$("#nextPage").click(function() {
	$("#pageNum").val(parseInt($("#pageNum").val()) + 1);
	getReportList($("#pageNum").val(), $("#pageSize").val());
});

$("#lastPage").click(function() {
	$("#pageNum").val(parseInt($("#pageNum").val()) - 1);
	getReportList($("#pageNum").val(), $("#pageSize").val());
});
</script>
</html>