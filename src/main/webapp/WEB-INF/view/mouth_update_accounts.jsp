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
							说明:月更总字数达到8W字即可.<a href="#"><i class="icon-font"></i></a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab table table-condensed" width="100%">
							<thead>
								<tr>
									<th width="12%">统计ID</th>
									<th width="12%">用户ID</th>
									<th width="12%">作品ID</th>
									<th width="12%">签约等级</th>
									<th width="15%">总字数</th>
									<th width="30%">统计时间</th>
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
	</div>
</body>
<script type="text/javascript">

//页面显示完成加载
$(function(){
	loadMouthBookAccountsAction(1,100);
});

//加载本页方法
var loadMouthBookAccountsAction = function(pageNum, pageSize) {
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryMonthUpdateCount,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateMouthBookAccountsView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminQueryMonthUpdateCount,model.updateMouthBookAccountsView);
		}
	});
};

//月更取消签约等级
var yuegengquxiaodengji = function(thisObj){
	tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var id=model.result.list[model.index].bookId;
	var url=PathList.adminCancelSignLevel;
	var param={"bookId":id};
	$.post(url, param, function(result){
		model.result.list[model.index].signLevel = 0;
		model.updateMouthBookAccountsView();
		alert(result.msg);
	});
};

</script>
</html>