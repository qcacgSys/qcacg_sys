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
<title>后台审核管理</title>
<jsp:include page="/common/js_css.jsp"></jsp:include>
<script type="text/javascript">
	$(getBookForCheck(0, 10));
</script>
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
							<a href="#"><i class="icon-font"></i>显示状态(无)</a> <a
								id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除(无)</a>
							<a id="updateOrd" href="javascript:void(0)"><i
								class="icon-font"></i>更新排序(无)</a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th class="tc" width="5%"><input class="allChoose" name=""
										type="checkbox"></th>
									<th>审核ID</th>
									<th>作品ID</th>
									<th>作品名</th>
									<th>申请次数</th>
									<th>最后审核时间</th>
									<th>审核状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tttt">
								<tr>
									<td class="tc"><input name="name" value="value"
										type="checkbox"></td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td><a id="aaaa" href="#">通过</a> <a id="bbbb" href="#">拒绝</a>
										<a id="cccc" href="#">查看</a></td>
								</tr>
							</tbody>
						</table>
						<div id="review_msg" class="reviewMSG_YC">
							
						</div>
						<div id="fenyed" class="list-page">
							<input type="hidden" id="pageNum" value="0"> <input
								type="hidden" id="pageSize" value="10"> <span
								id="fenyes"><a id="lastPage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								id="nextPage">下一页</a></span>
						</div>
					</div>
				</form>
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<!--/main-->
	</div>
</body>
<script type="text/javascript">
	$("#nextPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) + 1);
		getBookForCheck($("#pageNum").val(), $("#pageSize").val());
	});
	$("#lastPage").click(function() {
		$("#pageNum").val(parseInt($("#pageNum").val()) - 1);
		getBookForCheck($("#pageNum").val(), $("#pageSize").val());
	});
</script>
</html>