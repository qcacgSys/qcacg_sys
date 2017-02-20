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
						 	
							<input size="16" type="text" id="datetimeStart" readonly class="form_datetime">
							--
							<input size="16" type="text" id="datetimeEnd" readonly class="form_datetime">
							<button type="button" id="year_and_mouth" class="btn btn-default" value="显示历史">显示历史</button>
							  
							<button type="button" id="xianshidangyue" class="btn btn-default" value="显示当月">显示当月</button>
							  
							<button type="button" id="quanxuan" class="btn btn-default" value="全选">全选</button>
														  
							<button type="button" id="quxiaoquanxuan" class="btn btn-default" value="取消全选">取消全选</button>
																					  
							<button type="button" id="piliangdaqian" class="btn btn-default" value="批量打钱">批量打钱</button>
							

						 	
						 	
						</div>
					</div>
					