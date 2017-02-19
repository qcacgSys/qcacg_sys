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
<title>签约等级核算统计</title>
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
					<jsp:include page="/common/remit_bolting.jsp"></jsp:include>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th>选择</th>
									<th>核算ID</th>
									<th>作品ID</th>
									<th>用户ID</th>
									<th>签约等级</th>
									<th>等级说明</th>
									<th>插画补贴</th>
									<th>固定金额</th>
									<th>核算时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbo">
								<tr>
									<td><input type="checkbox"></td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td><a id="a" href="#">a</a>&nbsp;&nbsp;<a id="bushenli" href="#">a</a></td>
								</tr>
							</tbody>
						</table>
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
$(getAllBookAccountsList());
</script>
</html>