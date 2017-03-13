<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

	<div>
		<form id="sendform" action="${pageContext.request.contextPath}/InfUserMessage/system" method="post">
			标题：<br/><input type="text" name="messagetitle"><br><br/>
			内容：<br/><textarea id="desc" name="message" cols=40 rows=4></textarea><br/>
			用户id:<span id="user_id"></span><br> <input type="hidden" name="userId" value=""/>
			<input id="sendGO" class="btn btn-mini btn-primary" type="button" value="发送">
		</form>
	</div>
