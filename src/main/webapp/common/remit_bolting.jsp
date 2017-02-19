<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

					<div class="result-title">
						<div class="result-list">

							<!-- 
							<i class="icon-font"></i>筛选:
								<button id="weidakuan" type="button">未打</button>
								<button id="yidakuan" type="button">已打</button> 
								输入用户ID:<input id="sryhid" type="text" value=""><input id="sryhidtj" type="button" value="确定">
								<br><br>
						 	-->
						 	
						 	<div class="datetime_datetime">
						 		筛选:
								<input size="16" type="text" id="datetimeStart" readonly class="form_datetime">
								--
								<input size="16" type="text" id="datetimeEnd" readonly class="form_datetime">
								<button type="button" id="year_and_mouth" class="btn btn-default" value="提交">提交</button>
							</div>
						 	
								<input id="idstj" type="button" value="批量打款">
								<a href="${pageContext.request.contextPath}/admin/allLevelAccounts">历史记录</a>
						</div>
					</div>
					