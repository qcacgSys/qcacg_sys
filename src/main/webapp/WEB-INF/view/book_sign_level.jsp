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
						<div class="result-content">
							<table class="result-tab" width="100%">
								<thead>
									<tr>
										<th width="10%">签约ID</th>
										<th width="10%">作品ID</th>
										<th width="12%">作品名</th>
										<th width="12%">签约方式</th>
										<th width="12%">签约状态</th>
										<th width="10%">签约等级</th>
										<th width="10%">等级申请</th>
										<th width="15%">操作</th>
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
										<td><a id="aaaa" href="#">通过</a> <a id="bbbb" href="#">拒绝</a></td>
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
$(function() {
	loadBookSignLevelAction(1, 100);
});

//加载本页方法
var loadBookSignLevelAction = function(pageNum, pageSize) {
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryBookSignLevel,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateSignLevelView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminQueryBookSignLevel, model.updateSignLevelView);
		}
	});
};

//等级申请通过
var tongguodengji = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	model.status = 1;
	model.updateSignLevel();
}

//等级申请不通过
var butongguodengji = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	model.status = 5;
	model.updateSignLevel();
}

//降等级
var jiangji = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	model.downSignLevel();
}

//管理员-降级
model.downSignLevel = function(){
	var param = {
		bookId : model.bookId
	};
	$.post(PathList.adminDownBookSignLevel, param, function(result){
		alert(result.msg);
		history.go(0);
	});
}

//管理员-操作
model.updateSignLevel = function(){
	var param = {
		bookId : model.bookId,
		status : model.status
	};
	$.post(PathList.adminUpdateSignLevel, param, function(result){
		alert(result.msg);
		history.go(0);
	});
}

</script>
</html>