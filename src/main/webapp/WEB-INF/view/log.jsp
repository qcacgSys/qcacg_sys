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
	var pageSize = 100;
	var logData = {
		beginTime : '',
		endTime : '',
		logFirstType : '',
		logSecondType : '',
		typeDescription : ''
	};
	var closeBottomNav = function() {
		$("#tDiv").hide();
		$("#f").empty();
		$("#t").empty();
	}
	//日志相关
	var getLogList = function(pageNum, pageSize, logData) {
		closeBottomNav();
		var sendData = {
			pageNum : pageNum,
			pageSize : pageSize,
		};
		sendData.beginTime = logData.beginTime;
		sendData.endTime = logData.endTime;
		sendData.logFirstType = logData.logFirstType;
		sendData.logSecondType = logData.logSecondType;
		sendData.typeDescription = logData.typeDescription;
		$.post(PathList.adminQueryLog, sendData, function(result) {
			var tbo = $("#tbo");
			tbo.empty();
			var template = '<tr><td>日志编号</td><td>日志一级分类</td><td>日志二级分类</td><td>日志概述</td><td>时间</td><td>查看</td><td>详情</td></tr>';
			var list = result.data.list;
			for (var x = 0; x < list.length; x++) {
				var s = list[x];
				var logFirstType = '';
				if (s.logFirstType == 1) {
					logFirstType = '系统日志';
				} else if (s.logFirstType == 2) {
					logFirstType = '财务日志';
				} else if (s.logFirstType == 3) {
					logFirstType = '操作日志';
				}
				var logSecondType = '';
				if (s.logSecondType == 21) {
					logSecondType = '钱包日志';
				} else if (s.logSecondType == 22) {
					logSecondType = '好人卡日志';
				} else if (s.logSecondType == 23) {
					logSecondType = '结算日志';
				} else if (s.logSecondType == 24) {
					logSecondType = '提现日志';
				}
				var typeDescription = '';
				if (s.typeDescription == 2100) {
					typeDescription = '用户提现';
				} else if (s.typeDescription == 2101) {
					typeDescription = '钱包模块充值';
				} else if (s.typeDescription == 2102) {
					typeDescription = '购买好人卡';
				} else if (s.typeDescription == 2103) {
					typeDescription = '画师模块充值';
				} else if (s.typeDescription == 2104) {
					typeDescription = '清空福利补贴';
				} else if (s.typeDescription == 2105) {
					typeDescription = '钱包到账稿费';
				} else if (s.typeDescription == 2107) {
					typeDescription = '购买画作';
				} else if (s.typeDescription == 2109) {
					typeDescription = '钱包到账福利';
				} else if (s.typeDescription == 2200) {
					typeDescription = '用户签到';
				} else if (s.typeDescription == 2201) {
					typeDescription = '用户打赏作品';
				} else if (s.typeDescription == 2202) {
					typeDescription = '购买好人卡';
				} else if (s.typeDescription == 2203) {
					typeDescription = '好人卡提现';
				} else if (s.typeDescription == 2205) {
					typeDescription = '改名消耗好人卡';
				} else if (s.typeDescription == 2111) {
					typeDescription = '好人卡转化到钱包';
				} else if (s.typeDescription == 2304) {
					typeDescription = '系统清空福利补贴';
				} else if (s.typeDescription == 2305) {
					typeDescription = '系统结算保底补贴';
				} else if (s.typeDescription == 2307) {
					typeDescription = '系统结算福利补贴';
				} else if (s.typeDescription == 2400) {
					typeDescription = '用户提现';
				}
				var trtd = template.replace('日志编号', s.logId)
					.replace('日志一级分类', logFirstType)
					.replace('日志二级分类', logSecondType)
					.replace('时间', getMyDate(s.createTime))
					.replace('日志概述', typeDescription)
					.replace('查看', s.logExplain)
					.replace('详情', '<a onclick="getLogDetail(' + '\'' + s.logId + '\'' + ',' + s.logSecondType + ')">查看</a>');
				tbo.append(trtd);
			}
			yPage(result, pageNum);
		});
	};

	var getLogGrade = function(firstType) {
		var sendData = {
			firstType : firstType
		};
		$.post(PathList.findLogGrade, sendData, function(result) {
			var list = result.data;
			var secondTypeSelect = $("#secondType");
			secondTypeSelect.empty();
			var template = '<option value=null>二级分类</option>';
			secondTypeSelect.append(template.replace('null', ''));
			for (var x = 0; x < list.length; x++) {
				var s = list[x];
				var o = template.replace('null', '"' + s.secondType + '"')
					.replace('二级分类', s.logName);
				secondTypeSelect.append(o);
			}
		});
	}
	
	var getLogDescription = function(logSecondType){
		var sendData = {
			secondType : logSecondType
		};
		$.post(PathList.findLogDescription, sendData, function(result) {
			var list = result.data;
			var typeDescriptionSelect = $("#typeDescription");
			typeDescriptionSelect.empty();
			var template = '<option value=null>日志概述</option>';
			typeDescriptionSelect.append(template.replace('null', ''));
			for (var x = 0; x < list.length; x++) {
				var s = list[x];
				var o = template.replace('null', '"' + s.typeDescription + '"')
					.replace('日志概述', s.description);
				typeDescriptionSelect.append(o);
			}
		});
	}

	var detail_21 = function(result) {
		var s = result.data;
		var t = $("#t");
		var f = $("#f");
		t.empty();
		f.empty();
		if (s.typeDescription == 2100) {
			s.typeDescription = '用户提现';
		} else if (s.typeDescription == 2101) {
			s.typeDescription = '钱包模块充值';
			var urlUl;
			if (s.tradeNo != null) {
				urlUl = '<ul class="sys-info-list">'
					+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
					+ '<li>交易订单号:' + s.tradeNo + '<span class="res-info"></span></li>';
			} else {
				urlUl = '<ul class="sys-info-list">'
					+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
					+ '<li><label class="res-lab">交易订单号:未生成</label><span class="res-info"></span></li>';
			}
			f.append(urlUl);
		} else if (s.typeDescription == 2102) {
			s.typeDescription = '购买好人卡';
			var urlUl = '<ul class="sys-info-list">'
				+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
				+ '<li><label class="res-lab"><a onclick="getLogDetail(' + '\'' + s.infCardLogId + '\'' + ',22' + ')">好人卡日志链接</a></label><span class="res-info"></span></li></ul>';
			f.append(urlUl);
		} else if (s.typeDescription == 2103) {
			s.typeDescription = '画师模块充值';
		} else if (s.typeDescription == 2105) {
			s.typeDescription = '作者稿费';
		} else if (s.typeDescription == 2107) {
			s.typeDescription = '购买画册';
		} else if (s.typeDescription == 2109) {
			s.typeDescription = '每月福利补贴';
		} else if (s.typeDescription == 2111) {
			s.typeDescription = '好人转换钱包';
			var urlUl = '<ul class="sys-info-list">'
				+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
				+ '<li><label class="res-lab"><a onclick="getLogDetail(' + '\'' + s.infCardLogId + '\'' + ',22' + ')">好人卡日志链接</a></label><span class="res-info"></span></li></ul>';
			f.append(urlUl);
		}
		if (s.orderStatus == 0) {
			s.orderStatus = "交易未完成";
		} else if (s.orderStatus == 1) {
			s.orderStatus = "交易已完成";
		} else if (s.orderStatus == 2) {
			s.orderStatus = "交易已取消";
		}
		var trth = '<thead><tr><th>日志编号</th><th>支付用户</th><th>接受支付用户</th><th>可兑换金额</th><th>不可兑换金额</th><th>福利补贴金额</th><th>交易状态</th><th>创建时间</th><th>IP地址</th><th>使用详情</th></tr></thead>';
		var template = '<tbody><tr><td>日志编号</td><td>支付用户</td><td>接受支付用户</td><td>可兑换金额</td><td>不可兑换金额</td><td>福利补贴金额</td><td>交易状态</td><td>创建时间</td><td>IP地址</td><td>使用详情</td></tr></tbody>';
		var trtd = template.replace('日志编号', s.logId)
			.replace('支付用户', s.payUserName)
			.replace('接受支付用户', s.paiedUserName)
			.replace('可兑换金额', s.exchangeableCashAmount)
			.replace('不可兑换金额', s.unexchangeableCashAmount)
			.replace('福利补贴金额', s.welfareCashAmount)
			.replace('交易状态', s.orderStatus)
			.replace('创建时间', getMyDate(s.createTime))
			.replace('IP地址', s.ip)
			.replace('使用详情', s.typeDescription);
		t.append(trth).append(trtd);
	};

	var detail_22 = function(result) {
		var s = result.data;
		var t = $("#t");
		var f = $("#f");
		t.empty();
		f.empty();
		if (s.typeDescription == 2200) {
			s.typeDescription = '签到获得好人卡';
		} else if (s.typeDescription == 2201) {
			s.typeDescription = '打赏:<a href="' + htmlList.catalog + '?bookId=' + s.bookId + '" target="view_window">作品</a>';
		} else if (s.typeDescription == 2202) {
			s.typeDescription = '购买好人卡';
			var urlUl = '<ul class="sys-info-list">'
				+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
				+ '<li><label class="res-lab"><a onclick="getLogDetail(' + '\'' + s.infCashLogId + '\'' + ',21)">钱包日志链接</a></label><span class="res-info"></span></li></ul>';
			f.append(urlUl);
		} else if (s.typeDescription == 2203) {
			s.typeDescription = '好人卡提现';
			var urlUl = '<ul class="sys-info-list">'
				+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
				+'</ul>';
			f.append(urlUl);
		} else if (s.typeDescription == 2205) {
			s.typeDescription = '改名消耗好人卡';
		}
		var trth = '<thead><tr><th>日志编号</th><th>支付好人卡用户</th><th>接受支付好人卡用户</th><th>充值好人卡数</th><th>福利好人卡数</th><th>时间</th><th>IP地址</th><th>使用详情</th></tr></thead>';
		var template = '<tbody><tr><td>日志编号</td><td>支付好人卡用户</td><td>接受支付好人卡用户</td><td>充值好人卡数</td><td>福利好人卡数</td><td>时间</td><td>IP地址</td><td>使用详情</td></tr></tbody>';
		var trtd = template.replace('日志编号', s.logId)
			.replace('支付好人卡用户', s.payUserName)
			.replace('接受支付好人卡用户', s.paiedUserName)
			.replace('充值好人卡数', s.payCardAmount)
			.replace('福利好人卡数', s.welfareCardAmount)
			.replace('时间', getMyDate(s.createTime))
			.replace('IP地址', s.ip)
			.replace('使用详情', s.typeDescription);
		t.append(trth).append(trtd);
	};

	var detail_23 = function(result) {
		var s = result.data;
		var t = $("#t");
		var f = $("#f");
		t.empty();
		f.empty();
		if (s.typeDescription == 2304) {
			s.typeDescription = '清空上月福利金额';
		} else if (s.typeDescription == 2305) {
			s.typeDescription = '发放稿费';
		} else if (s.typeDescription == 2307) {
			s.typeDescription = '发放福利补贴';
		}
		var trth = '<thead><tr><th>日志编号</th><th>作品名</th><th>用户名</th><th>稿费金额</th><th>福利金额</th><th>时间</th><th>IP地址</th><th>使用详情</th></tr></thead>';
		var template = '<tbody><tr><td>日志编号</td><td>作品名</td><td>用户名</td><td>稿费金额</td><td>福利金额</td><td>时间</td><td>IP地址</td><td>使用详情</td></tr></tbody>';
		var trtd = template.replace('日志编号', s.logId)
			.replace('作品名', s.bookName)
			.replace('用户名', s.userName)
			.replace('稿费金额', s.exchangeableCashAmount)
			.replace('福利金额', s.welfareCashAmount)
			.replace('时间', getMyDate(s.createTime))
			.replace('IP地址', s.ip)
			.replace('使用详情', s.typeDescription);
		t.append(trth).append(trtd);
	};

	var detail_24 = function(result) {
		var s = result.data;
		var t = $("#t");
		var f = $("#f");
		t.empty();
		f.empty();
		if (s.typeDescription == 2400) {
			s.typeDescription = '用户提现';
		}
		if (s.orderStatus == 1) {
			s.orderStatus = '交易已完成';
		} else if (s.orderStatus == 2) {
			s.orderStatus = '交易已失效';
		} else if (s.orderStatus == 0) {
			s.orderStatus = '交易未完成';
		}
		if (s.infCardLogId != null) {
			var urlUl = '<ul class="sys-info-list">'
				+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
				+ '<li><label class="res-lab"><a onclick="getLogDetail(' + '\'' + s.infCardLogId + '\'' + ',22' + ')">好人卡日志链接</a></label><span class="res-info"></span></li></ul>';
			f.append(urlUl);
		}
		if (s.infCashLogId != null) {
			var urlUl = '<ul class="sys-info-list">'
				+ '<li><label class="res-lab"></label><span class="res-info"></span></li>'
				+ '<li><label class="res-lab"><a onclick="getLogDetail(' + '\'' + s.infCashLogId + '\'' + ',21' + ')">钱包日志链接</a></label><span class="res-info"></span></li></ul>';
			f.append(urlUl);
		}
		var trth = '<thead><tr><th>日志编号</th><th>提现金额</th><th>用户名</th><th>交易状态</th><th>时间</th><th>IP地址</th><th>使用详情</th></tr></thead>';
		var template = '<tbody><tr><td>日志编号</td><td>提现金额</td><td>用户名</td><td>交易状态</td><td>时间</td><td>IP地址</td><td>使用详情</td></tr></tbody>';
		var trtd = template.replace('日志编号', s.logId)
			.replace('提现金额', s.cashAmount)
			.replace('交易状态', s.orderStatus)
			.replace('福利金额', s.welfareCashAmount)
			.replace('时间', getMyDate(s.createTime))
			.replace('IP地址', s.ip)
			.replace('使用详情', s.typeDescription);
		t.append(trth).append(trtd);
	};

	var getLogDetail = function(logId, logSecondType) {
		var sendData = {
			logId : logId
		};
		var url = (PathList.logDetail.split('.shtml'))[0] + '_' + logSecondType + '.shtml';
		$.post(url, sendData, function(result) {
			if (logSecondType == 21) {
				detail_21(result);
			} else if (logSecondType == 22) {
				detail_22(result);
			} else if (logSecondType == 23) {
				detail_23(result);
			} else if (logSecondType == 24) {
				detail_24(result);
			}
		});
		$("#tDiv").show();
	};
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
					<div class="result-title">
						<div class="result-list">
							<div class="datetime_datetime">
								筛选: <input size="16" type="text" id="datetimeStart" readonly
									class="form_datetime"> -- <input size="16" type="text"
									id="datetimeEnd" readonly class="form_datetime">
								<button type="button"
									onclick="getLogList(pageNum, pageSize, logData)"
									class="btn btn-default" value="提交">提交</button>
							</div>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<thead class="myThead">
								<tr id="topic">
									<th>日志编号</th>
									<th><div class="btn-group">
											<select id="firstType" onchange="setFirstType()">
												<option value="">一级分类</option>
												<option value=1>系统日志</option>
												<option value=2>财务日志</option>
												<option value=3>操作日志</option>
											</select>
										</div></th>
									<th><div class="btn-group">
											<select id="secondType" onchange="setSecondType()">
											</select>
										</div></th>
									<th><div class="btn-group">
											<select id="typeDescription" onchange="setTypeDescription()">
												<option value="">日志概述</option>
											</select>
										</div></th>
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
							<span id="fenyes"><ul class="pagination" id="paginationUl">
								</ul></span>
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
	var setFirstType = function() {
		var firstTypeSelect = $("#firstType");
		logData.logFirstType = firstTypeSelect.val();
		logData.logSecondType = '';
		logData.typeDescription = '';
		pageNum = 1;
		getLogGrade(logData.logFirstType);
		getLogDescription(logData.logSecondType);
		getLogList(pageNum, pageSize, logData);
	};
	var setSecondType = function() {
		var secondTypeSelect = $("#secondType");
		logData.logSecondType = secondTypeSelect.val();
		logData.logFirstType = '';
		logData.typeDescription = '';
		pageNum = 1;
		getLogDescription(logData.logSecondType);
		getLogList(pageNum, pageSize, logData);
	};
	var setTypeDescription = function(s){
		var typeDescriptionSelect = $("#typeDescription");
		logData.typeDescription = typeDescriptionSelect.val();
		logData.logFirstType = '';
		logData.logSecondType = '';
		pageNum = 1;
		getLogGrade(logData.logFirstType);
		getLogList(pageNum, pageSize, logData);
	}
</script>
<script type="text/javascript">
	var nextPage = function() {
		if (pageNum < $("#pages").val()) {
			pageNum++;
			getLogList(this.pageNum, this.pageSize, this.logData);
			$('body,html').animate({
				scrollTop : 0
			}, 200);
		}
	};
	var lastPage = function() {
		if (pageNum > 1) {
			pageNum--;
			getLogList(this.pageNum, this.pageSize, this.logData);
			$('body,html').animate({
				scrollTop : 0
			}, 200);
		}
	};
	var setPageNum = function(s) {
		pageNum = s;
		getLogList(this.pageNum, this.pageSize, this.logData);
		$('body,html').animate({
			scrollTop : 0
		}, 200);
	};
</script>
<script type="text/javascript">
	$(getLogGrade(undefined));
	$(getLogDescription(undefined));
	$(getLogList(pageNum, pageSize, logData));
	//日期选择控件
	$("#datetimeStart").datetimepicker({
		format : 'yyyy-mm-dd',
		minView : 'month',
		language : 'zh-CN',
		autoclose : true
	}).on("changeDate", function() {
		logData.beginTime = $("#datetimeStart").val();
		$("#datetimeEnd").datetimepicker("setStartDate", $("#datetimeStart").val());
	});
	$("#datetimeEnd").datetimepicker({
		format : 'yyyy-mm-dd',
		minView : 'month',
		language : 'zh-CN',
		autoclose : true
	}).on("changeDate", function() {
		logData.endTime = $("#datetimeEnd").val();
		$("#datetimeStart").datetimepicker("setEndDate", $("#datetimeEnd").val());
	});
</script>
</html>