<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>后台所有审核数据管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/my.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/modernizr.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/conf.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/my.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/libs/doShtml.js"></script>
</head>
<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<h1 class="topbar-logo none">
					<a href="index.html" class="navbar-brand">后台管理</a>
				</h1>
				<ul class="navbar-list clearfix">
					<li><a class="on" href="#">首页</a></li>
					<li><a href="#" target="_blank">网站首页</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li><a href="#">管理员</a></li>
					<li><a href="#">修改密码</a></li>
					<li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
						<ul class="sub-menu">
							<li><a
								href="${pageContext.request.contextPath}/admin/sysInfo"><i
									class="icon-font">&#xe008;</i>公告管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/allStatus"><i
									class="icon-font">&#xe005;</i>审核管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/allSign"><i
									class="icon-font">&#xe006;</i>作品管理</a></li>
							<li><a href="#"><i class="icon-font">&#xe004;</i>用户管理</a></li>
							<li><a href="#"><i class="icon-font">&#xe012;</i>评论管理</a></li>
							<li><a href="#"><i class="icon-font">&#xe052;</i>友情链接</a></li>
							<li><a href="#"><i class="icon-font">&#xe033;</i>广告管理</a></li>
						</ul></li>
					<li><a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="#"><i class="icon-font">&#xe017;</i>系统设置</a></li>
							<li><a href="#"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
							<li><a href="#"><i class="icon-font">&#xe046;</i>数据备份</a></li>
							<li><a href="#"><i class="icon-font">&#xe045;</i>数据还原</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font">&#xe06b;</i><span>欢迎使用</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="#" method="post">
						<table class="search-tab">
							<tr>
								<th width="120">选择分类:</th>
								<td><select name="search-sort" id="">
										<option value="">全部</option>
										<option value="19">精品界面</option>
										<option value="20">推荐界面</option>
								</select></td>
								<th width="70">关键字:</th>
								<td><input class="common-text" placeholder="关键字"
									name="keywords" value="" id="" type="text"></td>
								<td><input class="btn btn-primary btn2" name="sub"
									value="查询" type="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
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
						<div id="fenyed" class="list-page">
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--/main-->
	</div>
</body>
<script type="text/javascript">
	var bookReviewMsgFormData = JSON.parse(localStorage.getItem("bookReviewMsgData"));
	var bookFormData = JSON.parse(localStorage.getItem("bookData"));
	console.log(bookFormData.bookId);
	var newTr = '';
	for(var x=0;x<bookReviewMsgFormData.length;x++){
		newTr = '<tr><td></td>'
		var bookIdTd = '<td>'+bookFormData.bookId+'</td>';
		var bookNameTd = '<td>'+bookFormData.bookName+'</td>';
		var numTd = '<td>'+(x+1)+'</td>';
		var messgaeTd = '<td>'+bookReviewMsgFormData[x].message+'</td>';
		var replyTd = '<td>'+bookReviewMsgFormData[x].reply+'</td>';
		newTr = newTr + bookIdTd + bookNameTd + numTd + messgaeTd + replyTd + '</tr>';
		$('#tbodyId').append(newTr);
	}
</script>
</html>