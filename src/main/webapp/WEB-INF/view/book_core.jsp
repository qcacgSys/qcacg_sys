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
<title>作品管理</title>
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
							--<a href="#"><i class="icon-font"></i></a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab table table-condensed" width="100%">
							<thead>
								<tr>
									<th>作品ID</th>
									<th>作品名</th>
									<th>签约否</th>
									<th>更新类型</th>
									<th>状态</th>
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
	loadBookCoreAction(1,100);
});

//加载本页方法
var loadBookCoreAction = function(pageNum, pageSize) {
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryBookCore,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateBookCoreView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminQueryBookCore,model.updateBookCoreView);
		}
	});
};

//绑定 上架
var shangjia = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	updateBook(model.bookId,1);
}

//绑定 下架
var xiajia = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	updateBook(model.bookId,2);
}

//作品上 下架
var updateBook = function(bookId,num){
	var param = {
		bookId : bookId,
		num : num
	};
	$.post(PathList.adminUpdateBookCore, param, function(result){
		alert(result.msg);
		history.go(0);
	});
}

//绑定 查看详细
var chakanxiangxi = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	model.bookId =  model.result.list[model.index].bookId;
	queryDetailBook(model.bookId);
}

//查询 详情实体
var queryDetailBook = function(bookId){
	var param = {bookId:bookId};
	var url = PathList.adminQueryDetailBook;
	$.getJSON(url, param, function(result){
		model.updateDetailBookView(result);
	});
}

//加载 作品详细页
model.updateDetailBookView = function(result){
	$('body').empty().load('load/BookDetail.jsp',function(){
		var template =	'<tr>'+
							'<td width="2">所属用户ID</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">种类</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">分类</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">作品简介</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">更新日期</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">创建时间</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说字数</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说状态</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">点击率</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">收藏数</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">好人币数</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">白银币数</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说字数上周统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说点击上周统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说上周好人币数统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说字数上月统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说点击上月统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说上月好人币数统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说字数每周统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说点击每月统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说每周好人币数统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说字数每月统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说点击每月统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">小说每月好人币数统计</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">是否是被推荐作品</td>'+
							'<td width="50"></td>'+
						'</tr>'+
						'<tr>'+
							'<td width="2">在主页显示的小说</td>'+
							'<td width="50"></td>'+
						'</tr>';
	});
}

</script>
</html>