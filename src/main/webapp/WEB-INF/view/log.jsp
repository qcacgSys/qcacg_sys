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
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="/common/left.jsp"></jsp:include>
		<!--/sidebar-->
		<div class="main-wrap">
			<jsp:include page="/common/right_head.jsp"></jsp:include>
			<div class="result-wrap">
				<div class="result-title">
					<h1>HHHHH</h1>
				</div>
				<div class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th>A</th>
									<th>B</th>
									<th>C</th>
									<th>D</th>
									<th>E</th>
									<th>F</th>
									<th>G</th>
									<th>H</th>
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
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<!--/main-->
	</div>
</body>
</html>