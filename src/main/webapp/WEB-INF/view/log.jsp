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
	var logData = {
		beginTime : undefined,
		endTime : undefined,
		firstType : undefined,
		secondType : undefined
	};
	$(getLogList(pageNum, pageSize, logData));
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
								<button type="button" id="year_and_mouth"
									class="btn btn-default" value="提交">提交</button>
							</div>
						</div>
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
						<!-- 
					 -->
					<div id="fenyed" class="list-page">
						<span id="fenyes"> <span id="fenyes"><a
								id="lastPage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								id="nextPage">下一页</a></span></span>
					</div>
						<jsp:include page="/common/fenyed.jsp"></jsp:include>
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
		getLogList(pageNum, pageSize, logData);
	});
	$("#lastPage").click(function() {
		pageNum--;
		getLogList(pageNum, pageSize, logData);
	});
</script>
<script type="text/javascript">
	var closeBottomNav = function() {
		$("#tDiv").hide();
		$("#f").empty();
		$("#t").empty();
	}
</script>
<script type="text/javascript">
	//日期选择控件
	$("#datetimeStart").datetimepicker({
		format : 'yyyy-mm-dd',
		minView : 'month',
		language : 'zh-CN',
		autoclose : true
	}).on("changeDate", function() {
		logData.beginTime = $("#datetimeStart").val();
	});
	$("#datetimeEnd").datetimepicker({
		format : 'yyyy-mm-dd',
		minView : 'month',
		language : 'zh-CN',
		autoclose : true
	}).on("changeDate", function() {
		logData.endTime = $("#datetimeEnd").val();
	});

	//分页控件
	fenyedView = function() {
		//console.log(model.result);
		var element = $('#bp-3-element-test'); //获得数据装配的位置
		//初始化所需数据
		var options = {
			bootstrapMajorVersion : 3, //版本号。3代表的是第三版本
			currentPage : 1, //当前页数
			numberOfPages : 5, //显示页码数标个数
			totalPages : model.result.lastPage, //总共的数据所需要的总页数
			itemTexts : function(type, page, current) {
				//图标的更改显示可以在这里修改。
				switch (type) {
				case "first":
					return "<<";
				case "prev":
					return "<";
				case "next":
					return ">";
				case "last":
					return ">>";
				case "page":
					return page;
				}
			},
			tooltipTitles : function(type, page, current) {
				//如果想要去掉页码数字上面的预览功能，则在此操作。例如：可以直接return。
				switch (type) {
				case "first":
					return "Go to first page";
				case "prev":
					return "Go to previous page";
				case "next":
					return "Go to next page";
				case "last":
					return "Go to last page";
				case "page":
					return (page === current) ? "Current page is " + page : "Go to page " + page;
				}
			},
			onPageClicked : function(e, originalEvent, type, page) {
				//单击当前页码触发的事件。若需要与后台发生交互事件可在此通过ajax操作。page为目标页数。
				//console.log(e);
				//console.log(originalEvent);
				// console.log(type);
			}
		};
		element.bootstrapPaginator(options); //进行初始化
	}
</script>
</html>