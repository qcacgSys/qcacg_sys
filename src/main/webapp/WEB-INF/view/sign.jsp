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
					<div class="result-title">
						<h1>保存签约结果</h1>
					</div>
					<div class="result-content">
						<ul class="sys-info-list">
							<li><label class="res-lab">作品信息</label><span
								class="res-info"><a id="aId" target="view_window">${bookDTO.bookName}书本详情</a></span></li>
							<form method="post" action="#">
								<input type="hidden" value="${bookDTO.bookId}" id="bookId"
									name="bookId">
								<li><label class="res-lab">对作者说的话</label><span
									class="res-info"><textarea id="signReply"
											style="width: 400" rows="5" name="reply"></textarea></span></li>
								<li><label class="res-lab">是否签约</label><span
									class="res-info"><input type="radio" id="status0" name="status" value="2">签约通过&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" id="status1" name="status" value="3">拒绝签约&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" id="status2" name="status" value="1">申请通过&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" id="status3" name="status" value="5">申请拒绝</span></li>
								<li><label class="res-lab">操作</label><span class="res-info"><input
										type="button" id="submitId" value="提交保存">&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="reset" value="重置"></span></li>
							</form>
						</ul>
					</div>
				</div>
				<jsp:include page="/common/right_foot.jsp"></jsp:include>
			</div>
			<!--/main-->
		</div>
	</div>
</body>
<script type="text/javascript"> 
$("#aId").attr("href", htmlList.catalog + "?bookId=${bookDTO.bookId}");

$('#submitId').click(function() {
	var obj = document.getElementsByTagName("input");
	var status;
    for(var i=0; i<obj.length; i ++){
        if(obj[i].checked){
			console.log(22);
			if (obj[i].value==1) {//通过等级申请
				status = 1;
				updateSignLevel(status);
				return;
			}
			if (obj[i].value=='5') {//拒绝等级申请
				status = 5;
				updateSignLevel(status);
				return;
			}
			if (obj[i].value=='2') {//通过签约申请
				status = 2;
				updateSign(status);
				return;
			}
			if (obj[i].value=='3') {//拒绝签约申请
				status = 3;
				updateSign(status);
				return;
			}
        };
    }});
	    
updateSignLevel=function(status){
	//alert(bookId+','+status);
	var formData = {
			bookId : $("#bookId").val(),
			status : status
	};
	var data = formData;
	var url = PathList.adminUpdateSignLevel;
	$.ajax({
		type : 'POST',
		data : data,
		url : url,
		success : function(result) {
			console.log(result);
			alert("保存成功");
		},
		error : function(e) {
			console.log(e);
			alert("保存失败");
		}
	});
};

updateSign=function(status){  
	var formData = {
		bookId : $("#bookId").val(),
		status : status,
		reply : $("#signReply").val()
	};
	var data = formData;
	var url = PathList.adminUpdateBookSign;
	console.log(data);
	$.ajax({
		type : 'POST',
		data : data,
		url : url,
		success : function(result) {
			console.log(result);
			alert("保存成功");
		},
		error : function(e) {
			console.log(e);
			alert("保存失败");
		}
	});
};
</script>
</html>