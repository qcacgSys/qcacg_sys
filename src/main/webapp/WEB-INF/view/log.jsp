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
<title>后台日志管理</title>
<jsp:include page="/common/js_css.jsp"></jsp:include>
</head>
<script type="text/javascript">
	var pageNum = 1;
	var pageSize = 10;
	$(getLogList(pageNum, pageSize));
</script>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<div class="container-fluid clearfix">
	  <div class="row">
		<jsp:include page="/common/left.jsp"></jsp:include>
		<!--/sidebar-->
		<div class="main-wrap">
			<jsp:include page="/common/right_head.jsp"></jsp:include>
			<div class="result-wrap">
				<div class="result-title">
					<h1>日志一览</h1>
				</div>
				<div class="result-content">
					<table class="result-tab" width="100%">
						<thead class="myThead">
							<tr id="topic">
								<th>日志编号</th>
								<th>一级分类</th>
								<th>二级分类</th>
								<th>日志概述</th>
								<th>时间</th>
								<th>详情</th>
								<th>查看</th>
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
							</tr>
						</tbody>
					</table>
					<div id="fenyed" class="list-page">
						<span id="fenyes"> <span id="fenyes"><a
								id="lastPage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								id="nextPage">下一页</a></span></span>
					</div>
				</div>
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<div id="bottomNav">
			<div class="result-content">
				<div id="tDiv"
					style="background-color:white;border-color:#000;border-style:solid;border-width:1px;display:none;">
					<div align="right">
						<input type="button" onclick="closeBottomNav()" value="关闭">
					</div>
					<table id="t" class="result-tab" width="100%">
					</table>
					<div id="f" class="list-page"></div>
				</div>
			</div>
		</div>
		<!--/main-->
	  </div>
	</div>
	<style type="text/css">
body {
	background-image: url(text.txt);
	background-attachment: fixed;
	height: 1000px;
}

#bottomNav {
	z-index: 999;
	position: fixed;
	bottom: 200;
	left: 150;
	width: 80%;
	_position: absolute;
	_top: expression_r(documentElement.scrollTop +  
		 documentElement.clientHeight-this.offsetHeight);
	overflow: visible;
}
</style>
</body>
<script type="text/javascript">
	$("#nextPage").click(function() {
		pageNum++;
		getLogList(pageNum, pageSize);
	});
	$("#lastPage").click(function() {
		pageNum--;
		getLogList(pageNum, pageSize);
	});
</script>
<script type="text/javascript">
	var closeBottomNav = function() {
		$("#tDiv").hide();
		$("#f").empty();
		$("#t").empty();
	}
</script>
</html>