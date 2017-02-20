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
<title>后台提现管理</title>
<jsp:include page="/common/js_css.jsp"></jsp:include>
<script type="text/javascript">
	var pageNum = 1;
	var pageSize = 10;
	$(getWithdrawals(pageNum, pageSize));
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
					<div class="result-title">
						<h1>提现记录一览</h1>
					</div>
					<div class="result-content">
						<ul class="sys-info-list">
							<li><table class="result-tab" width="100%">
									<thead>
										<tr>
											<th>提现申请编号</th>
											<th>提现金额</th>
											<th>用户名</th>
											<th>用户手机号</th>
											<th>用户邮箱</th>
											<th>提现时间</th>
											<th>交易状态</th>
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
								</table></li>
						</ul>
					</div>
					<div id="fenyed" class="list-page">
						<span id="fenyes"><ul class="pagination" id="paginationUl">
							</ul></span>
					</div>
					<div class="result-content">
						<table class="result-tab" id="t" width="100%">
						</table>
						<div id="f" class="list-page"></div>
					</div>
				</div>
				<jsp:include page="/common/right_foot.jsp"></jsp:include>
			</div>
			<!--/main-->
		</div>
	</div>
</body>
<script type="text/javascript">
	var nextPage = function() {
		if(pageNum<$("#pages").val()){
			pageNum++;
			getLogList(pageNum, pageSize, logData);
			$('body,html').animate({ scrollTop: 0 }, 200);
		}
	};
	var lastPage = function() {
		if(pageNum>1){
			pageNum--;
			getLogList(pageNum, pageSize, logData);
			$('body,html').animate({ scrollTop: 0 }, 200);
		}
	};
	var setPageNum = function(s){
		pageNum = s;
		getLogList(pageNum, pageSize, logData);
	};
</script>
</html>