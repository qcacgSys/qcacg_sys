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
<title>XXXXX</title>
<jsp:include page="/common/js_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/common/head.jsp"></jsp:include>
	<div class="container clearfix">
		<jsp:include page="/common/left.jsp"></jsp:include>
		<!--/sidebar-->
		<div class="main-wrap">
			<jsp:include page="/common/right_head.jsp"></jsp:include>
			<div class="result-wrap">
				<div class="result-title">
					<h1>保存审核结果</h1>
				</div>
				<div class="result-content">
					<ul class="sys-info-list">
						<li><label class="res-lab">作品信息</label><span class="res-info"><a
								id="aId" target="view_window">${bookDTO.bookName}书本详情</a></span></li>
						<form id="formId" method="post" action="#">
							<input id="bookId" type="hidden" value="${bookDTO.bookId}" name="bookId">
							<li><label class="res-lab">对作者说的话</label><span
								class="res-info"><textarea id="reply" style="width: 400" rows="5"
										name="reply"></textarea></span></li>
							<li><label class="res-lab">审核结果</label><span
								class="res-info"><input type="radio" id="status2" name="status"
									value="2">审核通过&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" id="status3" name="status" value="3">拒绝通过</span></li>
							<li><label class="res-lab">操作</label><span class="res-info"><input
									id="submitId" type="button" value="提交保存">&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="reset" value="重置"></span></li>
						</form>
					</ul>
				</div>
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<!--/main-->
	</div>
</body>
<script type="text/javascript"> 
	var status ;
	$("#aId").attr("href", HtmlList.catalog + "?bookId=${bookDTO.bookId}");
	$("#status2").click(function(){
		status=2;
	});
	$("#status3").click(function(){
		status=3;
	});
	$("#submitId").click(function() {
		var statusMessage = '';
		if(status==2){
			statusMessage = '(审核已通过)';
		}else if(status==3){
			statusMessage = '(审核未通过)';
		}else{
			alert('填选择审核结果');
			return;
		}
		var formData = {
			bookId : Number($("#bookId").val()),
			reply : $("#reply").val()+statusMessage,
			status : Number(status)
		};
		var data = JSON.stringify(formData);
		var url = PathList.adminUpdateBookStatus;
		console.log(data);
		$.ajax({
			type : 'POST',
			data : data,
			contentType : 'application/json',
			dataType : 'json',
			url : url,
			success : function(result) {
				console.log(result);
				alert(result.msg);
			},
			error : function(e) {
				console.log(e);
				alert("保存失败");
			}
		});
	});
</script>
</html>