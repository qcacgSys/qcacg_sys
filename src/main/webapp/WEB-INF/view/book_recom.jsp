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
<title>作品推荐管理</title>
<jsp:include page="/common/js_css.jsp"></jsp:include>
<style type="text/css">
#xialakuangqy{
	float:left;
	width: 125px;
}
#xialakuangtj{
	float:left;
	width: 125px;
}
</style>
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
							<!--  主页显示状态: 1? 2? 3? 4? 5? 6? -->
							说明: 界面为已通过审核的!<a href="#"><i class="icon-font"></i></a>
						</div>





    <div class="control-group">
        <div id="xialakuangqy" class="controls">
          <select id="1" onchange="funcqy()" class="input-xlarge">
            <option value="">签约状态选择</option>
            <option value="5">所有签约状态</option>
            <option value="0">未签约</option>
            <option value="1">已签约</option>
            <option value="2">签约失效</option>
          </select>
        </div>
		<span>&nbsp;</span>
        <div id="xialakuangtj" class="controls">
          <select id="2" onchange="functj()" class="input-xlarge">
            <option value="">推荐状态选择</option>
            <option value="5">所有推荐状态</option>
            <option value="0">未推荐</option>
            <option value="1">已推荐</option>
          </select>
        </div>
    </div>







					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th width="12%">用户ID</th>
									<th width="13%">作品ID</th>
									<th width="25%">作品名</th>
									<th width="13%">签约状态</th>
									<th width="13%">推荐状态</th>
									<th width="13%">主页显示</th>
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
									<td><button id="anniu" type="button">按钮</button></td>
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
	loadBookRecomAction(1,100);
});

//加载本页方法
var loadBookRecomAction = function(pageNum, pageSize) {
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryBookRecom,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateBookRecomView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminQueryBookRecom,model.updateBookRecomView);
		}
	});
};

//推荐-按钮
var tuijian = function(thisObj){
	tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var id=model.result.list[model.index].bookId;
	console.log(id);
	var param={
		"bookId":Number(id),
		"isRecommended":'1'
		};
	var param=JSON.stringify(param);
	$.ajax({
		type : "POST",
		url : PathList.adminUpdateBookRecom,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			model.result.list[model.index].isRecommended = 1;
			model.updateBookRecomView();
			alert(result.msg);
		}
	});
};
	
//不推荐-按钮
var butuijian = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var id=model.result.list[model.index].bookId;
	var param={
		"bookId":Number(id),
		"isRecommended":'0'
		};
	var param=JSON.stringify(param);
	$.ajax({
		type : "POST",
		url : PathList.adminUpdateBookRecom,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			model.result.list[model.index].isRecommended = 0;
			model.updateBookRecomView();
			alert(result.msg);
		}
	});
};
	
//下拉框-签约选择
function funcqy(){
	var vsqy = $('select[id=1]  option:selected').val();
	if (vsqy=="") {
		return;
	}
	var url = PathList.adminQueryBookRecom;
	var dataqy = {};
	dataqy.bookIsSign = vsqy;
	dataqy.isRecommended = model.isRecommended;
	console.log(vsqy);
	$.getJSON(url, dataqy, function(result){
		model.bookIsSign = dataqy.bookIsSign;
		model.result=result;
		model.updateBookRecomView();
	});
}  

//下拉框-推荐选择
function functj(){
	var vstj = $('select[id=2]  option:selected').val();
	if (vstj=="") {
		return;
	}
	var url = PathList.adminQueryBookRecom;
	var datatj = {};
	datatj.isRecommended = vstj;
	datatj.bookIsSign = model.bookIsSign;
	console.log(vstj);
	$.getJSON(url, datatj, function(result){
		model.isRecommended = datatj.isRecommended;
		model.result=result;
		model.updateBookRecomView();
	});
}  
	
</script>
</html>