<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
					<!-- 
					<div id="fenyed" class="list-page">
						<span id="fenyes"><input type="hidden" id="pageNum"
							value="0"> <input type="hidden" id="pageSize" value="10">
							<span id="fenyes"><a id="afterPage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								id="nextPage">下一页</a></span></span>
					</div>
					 -->
					<div class="div_fenyed">
					    <ul id='bp-3-element-test' 	style="cursor:hand;"></ul>
					</div>