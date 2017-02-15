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
<title>月更统计管理</title>
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
							说明:月更总字数达到8W字即可.<a href="#"><i class="icon-font"></i></a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th>统计ID</th>
									<th>用户ID</th>
									<th>作品ID</th>
									<th>签约等级</th>
									<th>总字数</th>
									<th>统计时间</th>
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
									<td><button id="qxdjy" type="button">取消等级</button></td>
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
	$(getMouthBookAccountsList(0, 10));
	$("#nextPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) + 1);
		getMouthBookAccountsList($("#pageNum").val(), $("#pageSize").val());
	});
	$("#lastPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) - 1);
		getMouthBookAccountsList($("#pageNum").val(), $("#pageSize").val());
	});
</script>
</html>