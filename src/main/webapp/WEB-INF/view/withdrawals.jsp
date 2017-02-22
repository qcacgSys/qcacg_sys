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
	//提现相关
	var getWithdrawals = function(pageNum, pageSize) {
		var t = $("#t");
		t.empty();
		var sendData = {
			pageNum : pageNum,
			pageSize : pageSize
		};
		$.post(PathList.withdrawals, sendData, function(result) {
			var tbo = $("#tbo");
			tbo.empty();
			var list = result.data.list;
			var template = '<tr><td>提现申请编号</td><td>提现金额</td><td>用户名</td><td>用户手机号</td><td>用户邮箱</td><td>提现时间</td><td>交易状态</td></tr>';
			for (x = 0; x < list.length; x++) {
				var s = list[x];
				if (s.orderStatus == 0) {
					s.orderStatus = '<a onclick="getSysCashAccount(' + s.userId + ',' + s.cashAmount + ',' + '\'' + s.logId + '\'' + ')">处理<a>';
				} else if (s.orderStatus == 1) {
					s.orderStatus = '已处理';
				} else if (s.orderStatus == 2) {
					s.orderStatus = '已拒绝';
				}
				var trtd = template.replace('提现申请编号', s.logId)
					.replace('提现金额', s.cashAmount)
					.replace('用户名', s.username)
					.replace('用户手机号', s.telphone)
					.replace('用户邮箱', s.email)
					.replace('提现时间', getMyDate(s.createTime))
					.replace('交易状态', s.orderStatus);
				tbo.append(trtd);
			}
			yPage(result, pageNum);
		});
	};

	var getSysCashAccount = function(userId, exchangeableCashAmount, logId) {
		var sendData = {
			userId : userId
		};
		$.post(PathList.sysCashAccount, sendData, function(result) {
			var s = result.data;
			var t = $("#t");
			t.empty();
			var trth = '<thead><tr><th>用户编号</th><th>用户名</th><th>支付宝账号</th><th>真实姓名</th><th>提现金额</th><th>处理结果</th></tr></thead>';
			t.append(trth);
			var template = '<tbody><tr><td>用户编号</td><td>用户名</td><td>支付宝账号</td><td>真实姓名</td><td>提现金额</td><td>处理结果</td></tr></tbody>';
			var trtd = template.replace('用户编号', s.userId)
				.replace('用户名', s.userName)
				.replace('支付宝账号', s.alipayAccount)
				.replace('真实姓名', s.realName)
				.replace('提现金额', exchangeableCashAmount)
				.replace('处理结果', '<a onclick="finishWithdrawals(' + '\'' + logId + '\'' + ',1,null)">完成打款</a>');
			t.append(trtd);
		});

	};

	var finishWithdrawals = function(logId, flag, str) {
		var f = $("#f");
		f.empty();
		var sendData = {
			logId : logId,
			flag : flag,
			str : str
		};
		$.post(PathList.finishWithdrawals, sendData, function(result) {
		});
		location.reload();
	};

	var doRefuseWithdrawals = function(logId) {
		var str = $("#refuse").val();
		finishWithdrawals(logId, 2, str);
	}

	var refuseWithdrawals = function(logId) {
		var f = $("#f");
		f.empty();
		var inputText = '拒绝理由：<input id="refuse"><input type="button" onclick="doRefuseWithdrawals(' + '\'' + logId + '\'' + ')" value="确定">';
		f.append(inputText);
	};
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
	$(getWithdrawals(pageNum, pageSize));
	var nextPage = function() {
		if (pageNum < $("#pages").val()) {
			pageNum++;
			getWithdrawals(this.pageNum, this.pageSize);
			$('body,html').animate({
				scrollTop : 0
			}, 200);
		}
	};
	var lastPage = function() {
		if (pageNum > 1) {
			pageNum--;
			getWithdrawals(this.pageNum, this.pageSize);
			$('body,html').animate({
				scrollTop : 0
			}, 200);
		}
	};
	var setPageNum = function(s) {
		pageNum = s;
		getWithdrawals(this.pageNum, this.pageSize);
		$('body,html').animate({
			scrollTop : 0
		}, 200);
	};
</script>
</html>