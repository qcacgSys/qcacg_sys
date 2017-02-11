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
	<div class="container clearfix">
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
						<table class="result-tab" width="100%">
							<thead>
								<tr>
									<th class="tc" width="5%"><input class="allChoose" name=""
										type="checkbox"></th>
									<th>作品id</th>
									<th>作品名</th>
									<th>第几次申请</th>
									<th>对编辑说的话</th>
									<th>编辑的回复</th>
								</tr>
							</thead>
							<tbody id="tbodyId">
							</tbody>
						</table>
						<div id="fenyed" class="list-page"></div>
					</div>
				</form>
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<!--/main-->
	</div>
</body>
<script type="text/javascript">
	var bookReviewMsgFormData = JSON.parse(localStorage.getItem("bookReviewMsgData"));
	var bookFormData = JSON.parse(localStorage.getItem("bookData"));
	console.log(bookFormData.bookId);
	var newTr = '';
	for (var x = 0; x < bookReviewMsgFormData.length; x++) {
		newTr = '<tr><td></td>'
		var bookIdTd = '<td>' + bookFormData.bookId + '</td>';
		var bookNameTd = '<td>' + bookFormData.bookName + '</td>';
		var numTd = '<td>' + (x + 1) + '</td>';
		var messgaeTd = '<td>' + bookReviewMsgFormData[x].message + '</td>';
		var replyTd = '<td>' + bookReviewMsgFormData[x].reply + '</td>';
		newTr = newTr + bookIdTd + bookNameTd + numTd + messgaeTd + replyTd + '</tr>';
		$('#tbodyId').append(newTr);
	}
</script>
</html>