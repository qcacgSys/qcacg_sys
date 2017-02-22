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
							<a href="#"><i class="icon-font"></i>显示状态(无)</a> <a
								id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除(无)</a>
							<a id="updateOrd" href="javascript:void(0)"><i
								class="icon-font"></i>更新排序(无)</a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab table-condensed" width="100%">
							<thead>
								<tr>
									<th width="7%" class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
									<th width="10%">审核ID</th>
									<th width="10%">作品ID</th>
									<th width="25%">作品名</th>
									<th width="7%">申请次数</th>
									<th width="20%">最后审核时间</th>
									<th width="12%">审核状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbo">
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
	loadBookReviewAction(1,100);
});

//加载本页方法
var loadBookReviewAction = function(pageNum, pageSize) {
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.queryBookForCheck,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//更新视图层
			model.updateReviewView(result.data.list);
			//返回结果(包含分页长度)加入model,分页组件中取总页
			model.result=result.data;
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.queryBookForCheck,model.updateReviewView);
		}
	});
};

</script>
</html>