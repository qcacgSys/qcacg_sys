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

//全局变量
var model={};

//1.页面显示完成加载
$(function(){
	var param = {
		pageNum : 1,
		pageSize : 100
	};
	$.ajax({
		type : "GET",
		url : PathList.adminListBookAccounts,
		contentType : "application/json; charset=utf-8",
		data : param,
		dataType : "json",
		success : function(result) {
			//更新视图层
			updateBookAccountsView(result.list);
			//返回分页长度并加入model,和加载分页组件
			model.result=result;
			fenyedView();
		}
	});
});

//2.分页控件
fenyedView = function(){
		//console.log(model.result);
    	var element = $('#bp-3-element-test');//获得数据装配的位置
    	//初始化所需数据
    var options = {
        bootstrapMajorVersion:3,//版本号。3代表的是第三版本
        currentPage: 1, //当前页数
        numberOfPages: 5, //显示页码数标个数
        totalPages:model.result.lastPage, //总共的数据所需要的总页数
        itemTexts: function (type, page, current) {  
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
                    return  page;  
            }                 
        }, 
        tooltipTitles: function (type, page, current) {
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
        onPageClicked: function (e, originalEvent, type, page) {  
            //单击当前页码触发的事件。若需要与后台发生交互事件可在此通过ajax操作。page为目标页数。
            //console.log(e);
            //console.log(originalEvent);
            //console.log(type);
            //点击页码数发起ajax
            //如果没有选择时间
            if (model.YMStart == "" || model.YMStart == undefined || model.YMStart == null) {
            	model.YMStart='0';
			}
            if (model.YMEnd == "" || model.YMEnd == undefined || model.YMEnd == null) {
            	model.YMEnd='0';
			}
        	var param = {
       			pageNum : page,
       			pageSize : 100,
       			yearAndMouthStart:model.YMStart,
       			yearAndMouthEnd:model.YMEnd
       		};
       		$.ajax({
       			type : "GET",
       			url : PathList.adminQueryAllBookAccounts,
       			contentType : "application/json; charset=utf-8",
       			data : param,
       			dataType : "json",
       			success : function(result) {
       				console.log(param);
       				adminListBookAccounts(result.list);
       			}
       		});
        }
    };
    element.bootstrapPaginator(options);	//进行初始化
}

//other.点击日期选择-提交
$('#year_and_mouth').click(function(){
	//console.log(2);
	var yearAndMouthStart=$('#datetimeStart').val();
	var yearAndMouthEnd=$('#datetimeEnd').val();
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
			//更新视图层
			updateBookAccountsView(result.list);
			//保存此次操作,加入model,保存日期选择-start
			model.YMStart=yearAndMouthStart;
			//保存此次操作,加入model,保存日期选择-end
			model.YMEnd=yearAndMouthEnd;
		}
	});
});

//日期选择控件
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
</script>
</html>