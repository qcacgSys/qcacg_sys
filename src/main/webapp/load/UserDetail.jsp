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
							<thead>
								<tr>
									<th>手机号</th>
									<th>邮箱</th>
									<th>性别</th>
									<th>生日</th>
									<th>用户关注数量</th>
									<th>邀请人</th>
								</tr>
							</thead>
							<tbody id="tbo2">
								<tr>
									<td id="aaaaa">aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
									<td>aaaa</td>
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
