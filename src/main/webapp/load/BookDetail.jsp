<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
							<i class="icon-font"></i>--
						</div>
					</div>
					<div class="result-content">
					  <div id="fanhui" style="margin-bottom: 10px;"></div>
						<table class="result-tab" width="100%">
							<tbody id="tbo2">
								<tr>
									<td width="2">所属用户ID</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">种类</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">分类</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">作品简介</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">更新日期</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">创建时间</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说字数</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说状态</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">点击率</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">收藏数</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">好人币数</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">白银币数</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说字数上周统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说点击上周统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说上周好人币数统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说字数上月统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说点击上月统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说上月好人币数统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说字数每周统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说点击每月统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说每周好人币数统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说字数每月统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说点击每月统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">小说每月好人币数统计</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">是否是被推荐作品</td>
									<td width="50"></td>
								</tr>
								<tr>
									<td width="2">在主页显示的小说</td>
									<td width="50"></td>
								</tr>
							</tbody>
						</table>
						
					</div>
				</form>
			</div>
			<jsp:include page="/common/right_foot.jsp"></jsp:include>
		</div>
		<!--/main-->
	  </div>
	</div>
