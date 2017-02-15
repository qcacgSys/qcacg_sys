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
<title>作品推荐管理</title>
<jsp:include page="/common/js_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="/common/left.jsp"></jsp:include>
		<!--/sidebar-->
		<div class="main-wrap">
			<jsp:include page="/common/right_head.jsp"></jsp:include>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							说明: 界面为已通过审核的! 主页显示状态: 1? 2? 3? 4? 5? 6?<a href="#"><i class="icon-font"></i></a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th>用户ID</th>
									<th>作品ID</th>
									<th>作品名</th>
									<th>签约状态</th>
									<th>推荐状态</th>
									<th>主页显示</th>
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
									<td><button id="anniu" type="button">按钮</button></td>
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
</body>
<script type="text/javascript">
	$(getBookRecomList(0, 10));
	$("#nextPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) + 1);
		getBookRecomList($("#pageNum").val(), $("#pageSize").val());
	});
	$("#lastPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) - 1);
		getBookRecomList($("#pageNum").val(), $("#pageSize").val());
	});
</script>
</html>