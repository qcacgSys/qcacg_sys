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
	loadBookAccountsAction(1,100);
});

//加载本页方法
var loadBookAccountsAction = function(pageNum, pageSize){
	var param = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	$.ajax({
		type : "GET",
		url : PathList.adminListBookAccounts,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//加入模型
			model.result=result;
			//更新视图层
			model.updateBookAccountsView();
			//激活分页组件(传入请求url, 更新视图方法名)
			model.fenyedView(PathList.adminListBookAccounts,model.updateBookAccountsView);
		}
	});
};

//绑定-日期提交
$('#year_and_mouth').click(function(){
	//console.log(2);
	var yearAndMouthStart=$('#datetimeStart').val();
	var yearAndMouthEnd=$('#datetimeEnd').val();
	if (yearAndMouthStart=='' || yearAndMouthEnd=='') {
		alert('轻选择日期!');
		return;
	}
	var param = {
		pageNum : 1,
		pageSize : 100,
		yearAndMouthStart:yearAndMouthStart,
		yearAndMouthEnd:yearAndMouthEnd
	};
	$.ajax({
		type : "GET",
		url : PathList.adminListBookAccounts,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//替换模型
			model.result=result;
			//保存日期选择, 分页组件取中日期start
			model.yearAndMouthStart=yearAndMouthStart;
			//保存日期选择, 分页组件取中日期end
			model.yearAndMouthEnd=yearAndMouthEnd;
			//更新视图层
			model.updateBookAccountsView();
		}
	});
});

//绑定-日期控件
$("#datetimeStart").datetimepicker({
	language: 'zh-CN',
	format: 'yyyy-mm',
	autoclose: true,
	todayBtn: true,
	startView: 'year',
	minView:'year',
	maxView:'decade'
}).on("click",function(){
    $("#datetimeStart").datetimepicker("setEndDate",$("#datetimeEnd").val())
});
$("#datetimeEnd").datetimepicker({
	language: 'zh-CN',
	format: 'yyyy-mm',
	autoclose: true,
	todayBtn: true,
	startView: 'year',
	minView:'year',
	maxView:'decade'
}).on("click",function(){
    $("#datetimeEnd").datetimepicker("setStartDate",$("#datetimeStart".val()))
});

//绑定-显示上月核算
$('#xianshishangyue').click(function(){
	history.go(0);
});

//绑定-全选
$('#quanxuan').click(function(){
	$('input[name="sc"]').attr("checked","checked"); 
});

//绑定-取消全选
$('#quxiaoquanxuan').click(function(){
	$('input[name="sc"]').removeAttr("checked"); 
});

//绑定-批量打钱
$('#piliangdaqian').click(function(){
	var obj=document.getElementsByName('sc');//input集合
	var resultList = [];//空集合
	var option = null;
	for(var i=0;i<obj.length;i++){
		option=obj[i];//input
		if(option.checked){//input存在选中
			resultList.push(Number(option.value));
		}
	}
	if (resultList=="") {
		alert("禁止提交为空!");
		return;
	}
	model.updateManyCashAndWelfare(resultList);//发送打钱请求
});


//绑定-打款
var dakuan = function(thisObj){
	var tr = $(thisObj).parent().parent();
	var index = tr.data('index');
	model.index = index;
	var id = model.result.list[model.index].bookAccountsId;
	console.log(id);
	model.updateCashAndWelfare(id);//发起打款请求
	$(thisObj).attr('disabled','disabled');//按钮变灰
	tr.children('td:contains(未打款)').text('已打款');//改变状态
};

//单用户打款方法
model.updateCashAndWelfare=function(bookAccountsId){
	//console.log(bookAccountsId);
	var url=PathList.adminRemitBookAccounts;
	var result = [];
	result.push(bookAccountsId);
	var param={"bookAccountsIds":result};
	$.post(url, param, function(result){
		alert(result.msg);
	});
}

//多用户打款方法
model.updateManyCashAndWelfare=function(resultIdList){
	var url=PathList.adminRemitBookAccounts;
	var param={"bookAccountsIds":resultIdList};
	$.post(url, param, function(result){
		alert(result.msg);
		history.go(0);
	});
}

</script>
</html>