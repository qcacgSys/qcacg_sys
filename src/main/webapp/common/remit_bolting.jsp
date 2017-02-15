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
						 		核算说明:操作是对上个月的!这个月底会生成记录,每月核算时间为月底23点57分.<br>
								<input id="idstj" type="button" value="批量打款">
								<a href="${pageContext.request.contextPath}/admin/allLevelAccounts">历史记录</a>
						</div>
					</div>
					