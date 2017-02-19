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
<script type="text/javascript">
	$(getBookSign(0, 10));
</script>
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
							<a href="${pageContext.request.contextPath}/admin/recommend"><i class="icon-font"></i>选择签约推荐</a>
						</div>
					</div>
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
									<th>签约等级</th>
									<th>等级申请</th>
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
	$("#nextPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) + 1);
		getBookSign($("#pageNum").val(), $("#pageSize").val());
	});
	$("#lastPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) - 1);
		getBookSign($("#pageNum").val(), $("#pageSize").val());
	});
</script>
</html>