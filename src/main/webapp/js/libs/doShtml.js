/*核算统计功能开始*/
updateBookAccountsView=function(result){
	var tbody=$('#tbo');
	tbody.empty();
	var template=	'<tr>'+
						'<td><input type="checkbox" name="sc" value="xzid"></td>'+
						'<td>#{bookAccountsId}</td>'+
						'<td>#{bookId}</td>'+
						'<td>#{userId}</td>'+
						'<td>#{signLevel}</td>'+
						'<td>#{state}</td>'+
						'<td>#{drawWelfare}</td>'+
						'<td>#{fullWelfare}</td>'+
						'<td>#{accountsDate}</td>'+
						'<td>#{status}</td>'+
						'<td><button id="" type="button" class="btn btn-primary btn-check">打款</button></td>'+
					'</tr>';
	for(var i=0;i<result.length;i++){
		var data=result[i];
		if(data.status==1){
			var tr=template.replace('xzid',data.bookAccountsId)
							.replace('#{bookAccountsId}',data.bookAccountsId)
							.replace('#{bookId}',data.bookId)
							.replace('#{userId}',data.userId)
							.replace('#{signLevel}',data.signLevel)
							.replace('#{state}',data.state)
							.replace('#{drawWelfare}',data.drawWelfare)
							.replace('#{fullWelfare}',data.fullWelfare)
							.replace('#{accountsDate}',getMyDate(data.accountsDate))
							.replace('#{status}','已打款')
							.replace('id=""','disabled="disabled"');
							tbody.append(tr);
		}else{
			var tr=template.replace('xzid',data.bookAccountsId)
							.replace('#{bookAccountsId}',data.bookAccountsId)
							.replace('#{bookId}',data.bookId)
							.replace('#{userId}',data.userId)
							.replace('#{signLevel}',data.signLevel)
							.replace('#{state}',data.state)
							.replace('#{drawWelfare}',data.drawWelfare)
							.replace('#{fullWelfare}',data.fullWelfare)
							.replace('#{accountsDate}',getMyDate(data.accountsDate))
							.replace('#{status}','未打款');
			tbody.append(tr);
		}

	}
	
	$('button:contains("打款")').click(function(){
		$(this).attr("id","dakuan");
		tr = $(this).parent().parent();
		index = tr.index();
		updateCashAndWelfare(result[index].bookAccountsId);
		$(this).addClass('disabled'); // Disables visually
		console.log($(this).parent());
	});

}
//单用户打款打款
updateCashAndWelfare=function(bookAccountsId){
	console.log(bookAccountsId);
	var url=PathList.adminRemitBookAccounts;
	var result = [];
	result.push(bookAccountsId);
	var param={"bookAccountsIds":result};
	$.post(url, param, function(result){
		alert(result.msg);
		history.go(0);
		
	});
}
//批量打款
updateManyCashAndWelfare=function(result){
	var url=PathList.adminRemitBookAccounts;
	var param={"bookAccountsIds":result};
	$.post(url, param, function(result){
		alert(result.msg);
		history.go(0);
	});
}
/*核算统计功能结束*/


/*推荐功能开始*/
function getBookRecomList(pageNum, size){
	var pageData = {
		pageNum : pageNum,
		size : size
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryBookRecom,
		contentType : "application/json; charset=utf-8",
		data : pageData,
		dataType : "json",
		success : function(result) {
			updateBookRecomView(result);
		}
	});
}

updateBookRecomView = function(result){
	var tbody=$('#tbo');
	tbody.empty();
	var template=	'<tr>'+
						'<td>#{userId}</td>'+
						'<td>#{bookId}</td>'+
						'<td>#{bookName}</td>'+
						'<td>#{bookIsSign}</td>'+
						'<td>#{isRecommended}</td>'+
						'<td>#{bookOnIndex}</td>'+
						'<td><button id="" name="tuijian" type="button">推荐</button> <button id="" name="qxtuijian" type="button">取消推荐</button></td>'+
					'</tr>';
	for(var i=0;i<result.length;i++){
		var data=result[i];
		if(data.bookIsSign==1){
			data.bookIsSign='已签约';
		}
		if(data.bookIsSign==0){
			data.bookIsSign='未签约';
		}
		if(data.isRecommended==1){
			data.isRecommended='已推荐';
		}
		if(data.isRecommended==0){
			data.isRecommended='未推荐';
		}
		var tr=template.replace('#{userId}',data.userId)
					.replace('#{bookId}',data.bookId)
					.replace('#{bookName}',data.bookName)
					.replace('#{bookIsSign}',data.bookIsSign)
					.replace('#{isRecommended}',data.isRecommended)
					.replace('#{bookOnIndex}',data.bookOnIndex);
		tbody.append(tr);
	}
	$('button[name="tuijian"]').click(function(){
		tr = $(this).parent().parent();
		index = tr.index();
		var id=result[index].bookId;
		var param={
			"bookId":Number(id),
			"isRecommended":'1'
			};
		var param=JSON.stringify(param);
		$.ajax({
			type : "POST",
			url : PathList.adminUpdateBookRecom,
			contentType : "application/json; charset=utf-8",
			data : param,
			dataType : "json",
			success : function(result) {
				alert(result.msg);
				history.go(0);
			}
		});
	});
	$('button[name="qxtuijian"]').click(function(){
		tr = $(this).parent().parent();
		index = tr.index();
		var id=result[index].bookId;
		var param={
			"bookId":Number(id),
			"isRecommended":'0'
			};
		var param=JSON.stringify(param);
		$.ajax({
			type : "POST",
			url : PathList.adminUpdateBookRecom,
			contentType : "application/json; charset=utf-8",
			data : param,
			dataType : "json",
			success : function(result) {
				alert(result.msg);
				history.go(0);
			}
		});
	});
	$('button[name="xianshi"]').click(function(){
		tr = $(this).parent().parent();
		index = tr.index();
		var id=result[index].bookId;
		var param={
			"bookId":Number(id),
			"bookOnIndex":'1'
			};
		var param=JSON.stringify(param);
		$.ajax({
			type : "POST",
			url : PathList.adminUpdateBookRecom,
			contentType : "application/json; charset=utf-8",
			data : param,
			dataType : "json",
			success : function(result) {
				alert(result.msg);
				history.go(0);
			}
		});
	});
	$('button[name="buxianshi"]').click(function(){
		tr = $(this).parent().parent();
		index = tr.index();
		var id=result[index].bookId;
		var param={
			"bookId":Number(id),
			"bookOnIndex":'0'
			};
		var param=JSON.stringify(param);
		$.ajax({
			type : "POST",
			url : PathList.adminUpdateBookRecom,
			contentType : "application/json; charset=utf-8",
			data : param,
			dataType : "json",
			success : function(result) {
				alert(result.msg);
				history.go(0);
			}
		});
	});
}
/*推荐功能结束*/

/*月更统计功能开始*/
function getMouthBookAccountsList(pageNum, size){
	var pageData = {
		pageNum : pageNum,
		size : size
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryMonthUpdateCount,
		contentType : "application/json; charset=utf-8",
		data : pageData,
		dataType : "json",
		success : function(result) {
			updateMouthBookAccountsView(result);
		}
	});
}

updateMouthBookAccountsView = function(result){
	var tbody=$('#tbo');
	tbody.empty();
	var template=	'<tr>'+
						'<td>#{mouthUpdateCountId}</td>'+
						'<td>#{userId}</td>'+
						'<td>#{bookId}</td>'+
						'<td>#{signLevel}</td>'+
						'<td>#{totalWords}</td>'+
						'<td>#{countDay}</td>'+
						'<td><button id="" name="qxdjy" type="button">取消等级</button></td>'+
					'</tr>';
	for(var i=0;i<result.length;i++){
		var data=result[i];
		var tr=template.replace('#{mouthUpdateCountId}',data.mouthUpdateCountId)
					.replace('#{userId}',data.userId)
					.replace('#{bookId}',data.bookId)
					.replace('#{signLevel}',data.signLevel)
					.replace('#{totalWords}',data.totalWords)
					.replace('#{countDay}',getMyDate(data.countDay));
		tbody.append(tr);
	}
	$('button[name="qxdjy"]').click(function(){
		tr = $(this).parent().parent();
		index = tr.index();
		var id=result[index].bookId;
		//发送作品ID
		var url=PathList.adminCancelSignLevel;
		var param={"bookId":id};
		$.post(url, param, function(result){
			alert(result.msg);
			history.go(0);
		});
	});
}
/*月更统计功能结束*/

/*日更统计功能开始*/
function getDaysBookAccountsList(pageNum, size){
	var pageData = {
		pageNum : pageNum,
		size : size
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryDaysUpdateCount,
		contentType : "application/json; charset=utf-8",
		data : pageData,
		dataType : "json",
		success : function(result) {
			updateDaysBookAccountsView(result);
		}
	});
}

updateDaysBookAccountsView = function(result){
	var tbody=$('#tbo');
	tbody.empty();
	var template=	'<tr>'+
						'<td>#{daysUpdateCountId}</td>'+
						'<td>#{userId}</td>'+
						'<td>#{bookId}</td>'+
						'<td>#{signLevel}</td>'+
						'<td>#{factDaysNum}</td>'+
						'<td>#{supplementNum}</td>'+
						'<td>#{totalWords}</td>'+
						'<td>#{countDay}</td>'+
						'<td><button id="" name="qxdj" type="button">取消等级</button></td>'+
					'</tr>';
	for(var i=0;i<result.length;i++){
		var data=result[i];
		var tr=template.replace('#{daysUpdateCountId}',data.daysUpdateCountId)
					.replace('#{userId}',data.userId)
					.replace('#{bookId}',data.bookId)
					.replace('#{signLevel}',data.signLevel)
					.replace('#{factDaysNum}',data.factDaysNum)
					.replace('#{supplementNum}',data.supplementNum)
					.replace('#{totalWords}',data.totalWords)
					.replace('#{countDay}',getMyDate(data.countDay));
		tbody.append(tr);
	}
	$('button[name="qxdj"]').click(function(){
		tr = $(this).parent().parent();
		index = tr.index();
		var id=result[index].bookId;
		//发送作品ID
		var url=PathList.adminCancelSignLevel;
		var param={"bookId":id};
		$.post(url, param, function(result){
			alert(result.msg);
			history.go(0);
		});
	});
}
/*日更统计功能结束*/

/*举报功能开始*/
function getReportList(pageNum, size) {
	var pageData = {
		pageNum : pageNum,
		size : size
	};
	$.ajax({
		type : "GET",
		url : PathList.adminListReport,
		contentType : "application/json; charset=utf-8",
		data : pageData,
		dataType : "json",
		success : function(result) {
			updateReportView(result);
		}
	});
};

updateReportView=function(result){
	var tbody=$('#tbo');
	tbody.empty();
	var template=	'<tr>'+
						'<td>#{reportId}</td>'+
						'<td>#{reportTypeName}</td>'+
						'<td>#{reportContent}</td>'+
						'<td>#{reportText}</td>'+
						'<td>#{reporterId}</td>'+
						'<td>#{reportDate}</td>'+
						'<td>#{reportStatus}</td>'+
						'<td><button type="button">审理</button>&nbsp;&nbsp;<button type="button">不审理</button></td>'+
					'</tr>';
	for(var i=0;i<result.length;i++){
		var data=result[i];
		//console.log(data);
		//console.log(tr);
		var tr=template.replace('#{reportId}',data.reportId)
		.replace('#{reportTypeName}',data.reportTypeName)
		.replace('#{reportContent}',data.reportContent)
		.replace('#{reportText}',data.reportText)
		.replace('#{reporterId}',data.reporterId)
		.replace('#{reportDate}',getMyDate(data.reportDate))
		.replace('#{reportStatus}',data.reportStatus);
		tbody.append(tr);
	}
	//处理审理
	$('button:contains("审理")').click(function() {
		// 获取父元素取下标
		tr = $(this).parent().parent();
		index = tr.index();
		reportId = result[index].reportId;
		console.log(reportId);
		var param = {
			reportId : Number(reportId),
			status : Number(1)
		};
		var paramJSON = JSON.stringify(param);
		updateReport(paramJSON);
	});
	//不处理审理
	$('button:contains("不审理")').click(function() {
		// 获取父元素取下标
		tr = $(this).parent().parent();
		index = tr.index();
		reportId = result[index].reportId;
		console.log(reportId);
		var param = {
			reportId : Number(reportId),
			status : Number(2)
		};
		var paramJSON = JSON.stringify(param);
		updateReport(paramJSON);
	});
}

updateReport=function(paramJSON){
	$.ajax({
		type : "POST",
		data : paramJSON,
		contentType : 'application/json',
		dataType : 'json',
		url : PathList.adminUpdateReport,
		success : function(result) {
			console.log(result.msg);
			history.go(0);
		}
	});
}
/*举报功能结束*/

displayDate=function(id){
	localStorage.setItem("bookReviewMsgData", JSON.stringify(bookReviewMsg[id]));
	localStorage.setItem("bookData", JSON.stringify(bookList[id]));
	window.open(LocalPath.statusDetails);
};
function getzf(num) {
	if (parseInt(num) < 10) {
		num = '0' + num;
	}
	return num;
};
function getDateNow() {
	var oDate = new Date,
		oYear = oDate.getFullYear(),
		oMonth = oDate.getMonth() + 1,
		oTime = oYear + '-' + getzf(oMonth); //最后拼接时间  
	return oTime;
};
function getDateYM(str) {
	var oDate = new Date(str),
		oYear = oDate.getFullYear(),
		oMonth = oDate.getMonth() + 1,
		oTime = oYear + '-' + getzf(oMonth); //最后拼接时间  
	return oTime;
};
function getMyDate(str) {
	var oDate = new Date(str),
		oYear = oDate.getFullYear(),
		oMonth = oDate.getMonth() + 1,
		oDay = oDate.getDate(),
		oHour = oDate.getHours(),
		oMin = oDate.getMinutes(),
		oSen = oDate.getSeconds(),
		oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen); //最后拼接时间  
	return oTime;
};
var bookReviewMsg = new Array();
var bookList = new Array();
var book = {
		bookId:null,
		bookName:null
};
var updateReviewView = function(review) {
	var tt = $('#tttt');
	tt.empty();
	var tt2 = $('#tttt2');
	tt2.empty();
	var template = '<tr>' +
		'<td class="tc"><input name="name" value="value" type="checkbox"></td>' +
		'<td>#{reviewId}</td>' +
		'<td>#{bookId}</td>' +
		'<td>#{reviewName}</td>' +
		'<td>#{many}</td>' +
		'<td>#{lastTime}</td>' +
		'<td>#{status}</td>' +
		'<td>' +
		'<a id="aaaa" href="#1">审核</a>' +
		"  " +
		'<input type="button" id="cccc" value="查看" onclick="displayDate()"></input>' +
		'</td>' +
		'</tr>';
	var template2 = '<tr>' +
		'<td>#{sort}</td>' +
		'<td>#{message}</td>' +
		'<td>#{reply}</td>' +
		'</tr>';
	for (var i = 0; i < review.length; i++) {
		var r = review[i];
		if(r.status == 1){
			r.status = '申请审核中';
		}
		if(r.status == 2){
			r.status = '已通过审核';			
		}
		if(r.status == 3){
			r.status = '审核未通过';
		}
		if(r.status == 4){
			r.status = '再次申请审核中';
		}
		var tr = template.replace('#{reviewId}', r.reviewId)
			.replace('#{bookId}', r.bookId)
			.replace('#{reviewName}', r.reviewName)
			.replace('#{many}', r.many)
			.replace('#{lastTime}', getMyDate(r.lastTime))
			.replace('#{status}', r.status)
			.replace('href="#1"', 'href="' + adminPath + '/admin/status?bookId=' + r.bookId + '"')
			.replace('<input type="button" id="cccc" value="查看" onclick="displayDate()"></input>', '<input type="button" id="cccc" value="查看" onclick="displayDate('+i+')"></input>');
		book = {
			bookId:null,
			bookName:null
		};
		book.bookId = r.bookId;
		book.bookName = r.reviewName;
		bookList[i] = book;
		bookReviewMsg[i] = r.reviewMSG;
		tt.append(tr);
	}
	console.log(bookReviewMsg);
	console.log(bookList);
}

var getBookForCheck = function(pageNum, size) {
	var pageData = {
		pageNum : pageNum,
		size : size
	};
	$.ajax({
		type : "GET",
		url : PathList.queryBookForCheck,
		contentType : "application/json; charset=utf-8",
		data : pageData,
		dataType : "json",
		success : function(result) {
			review = result.data;
			updateReviewView(review);
		}
	});
};

/*签约开始*/
var getBookSign = function(pageNum, size) {
	var pageData = {
		pageNum : pageNum,
		size : size
	};
	$.ajax({
		type : "GET",
		url : PathList.adminQueryBookSign,
		contentType : "application/json; charset=utf-8",
		data : pageData,
		dataType : "json",
		success : function(result) {
			updateSignView(result);
		}
	});
};

var updateSignView = function(signData) {
	var tb = $('#tbo').empty();
	var template = '<tr>' +
		'<td>#{bookId}</td>' +
		'<td>#{uname}</td>' +
		'<td>#{signName}</td>' +
		'<td>#{many}</td>' +
		'<td>#{lastTime}</td>' +
		'<td>#{updateType}</td>' +
		'<td>#{status}</td>' +
		'<td>#{signLevel}</td>' +
		'<td>#{isEntry}</td>' +
		'<td>#{qq}</td>' +
		'<td>#{email}</td>' +
		'<td>#{phone}</td>' +
		'<td>#{address}</td>' +
		'<td>#{message}</td>' +
		'<td><a id="aaaa" href="#">签约操作</a>' +
		'</tr>';
	for (var i = 0; i < signData.length; i++) {
		var s = signData[i];
		if(s.isEntry == 0){
			s.isEntry = '未申请';
		}
		if(s.isEntry == 1){
			s.isEntry = '申请中';
		}
		if(s.updateType == 1){
			s.updateType = '日更';
		}
		if(s.updateType == 2){
			s.updateType = '月更';
		}
		if(s.status == 0){
			s.status = '未签约';
		}
		if(s.status == 1){
			s.status = '签约中';
		}
		if(s.status == 2){
			s.status = '已签约';
		}
		if(s.status == 3){
			s.status = '拒绝签约';
		}
		tr = template.replace('#{bookId}', s.bookId)
			.replace('#{uname}', s.uname)
			.replace('#{signName}', s.signName)
			.replace('#{many}', s.many)
			.replace('#{lastTime}', getMyDate(s.lastTime))
			.replace('#{updateType}', s.updateType)
			.replace('#{status}', s.status)
			.replace('#{signLevel}', s.signLevel)
			.replace('#{isEntry}', s.isEntry)
			.replace('#{qq}', s.qq)
			.replace('#{email}', s.email)
			.replace('#{phone}', s.phone)
			.replace('#{address}', s.address)
			.replace('#{message}', s.message)
			.replace('href="#"', 'href="' + adminPath + 'admin/sign?bookId=' + s.bookId + '"')
		tb.append(tr);
	}
}

/*签约结束*/
var getUserlist = function(pageNum,pageSize){
	var sendData = {
		pageNum : pageNum,
		pageSize : pageSize
	};
	userListPageNum++;
	$.post(LocalPath.userlist,sendData,function(result){
		var ulEle = $("#user");
		var userList = result.list;
		for(var x=0;x<userList.length;x++){
			console.log(userList[x]);
			var liEle = '<li><input name="userId" id="checkboxId" type="checkbox" value="'+userList[x].userid+'">用户名:'+userList[x].username+'</li>';
			ulEle.append(liEle);
		}
	});
};

//日志相关
var getLogList = function(pageNum,pageSize,logData){
	var sendData = {
			pageNum : pageNum,
			pageSize : pageSize,
			beginTime : logData.beginTime,
			endTime : logData.endTime,
			logFirstType : logData.logFirstType,
			logSecondType : logData.logSecondType
	};
	$.post(PathList.adminQueryLog,sendData,function(result){
		var tbo = $("#tbo");
		tbo.empty();
		var template = '<tr><td>日志编号</td><td>日志一级分类</td><td>日志二级分类</td><td>日志概述</td><td>时间</td><td>查看</td><td>详情</td></tr>';
		var list = result.data.list;
		console.log(list);
		for(var x=0;x<list.length;x++){
			var s = list[x];
			var logFirstType = '';
			if(s.logFirstType==1){
				logFirstType = '系统日志';
			}else if(s.logFirstType==2){
				logFirstType = '财务日志';
			}else if(s.logFirstType==3){
				logFirstType = '操作日志';
			}
			var logSecondType = '';
			if(s.logSecondType==21){
				logSecondType = '钱包日志';
			}else if(s.logSecondType==22){
				logSecondType = '好人卡日志';
			}else if(s.logSecondType==23){
				logSecondType = '结算日志';
			}else if(s.logSecondType==24){
				logSecondType = '提现日志';
			}
			var typeDescription = '';
			if(s.typeDescription==2100){
				typeDescription = '用户提现';
			}else if(s.typeDescription==2101){
				typeDescription = '钱包模块充值';
			}else if(s.typeDescription==2102){
				typeDescription = '购买好人卡';
			}else if(s.typeDescription==2103){
				typeDescription = '画师模块充值';
			}else if(s.typeDescription==2104){
				typeDescription = '清空福利补贴';
			}else if(s.typeDescription==2105){
				typeDescription = '钱包到账稿费';
			}else if(s.typeDescription==2107){
				typeDescription = '购买画作';
			}else if(s.typeDescription==2109){
				typeDescription = '钱包到账福利';
			}else if(s.typeDescription==2200){
				typeDescription = '用户签到';
			}else if(s.typeDescription==2201){
				typeDescription = '用户打赏作品';
			}else if(s.typeDescription==2202){
				typeDescription = '购买好人卡';
			}else if(s.typeDescription==2203){
				typeDescription = '好人卡提现';
			}else if(s.typeDescription==2205){
				typeDescription = '改名消耗好人卡';
			}else if(s.typeDescription==2111){
				typeDescription = '好人卡转化到钱包';
			}else if(s.typeDescription==2304){
				typeDescription = '系统清空福利补贴';
			}else if(s.typeDescription==2305){
				typeDescription = '系统结算保底补贴';
			}else if(s.typeDescription==2307){
				typeDescription = '系统结算福利补贴';
			}else if(s.typeDescription==2400){
				typeDescription = '用户提现';
			}
			console.log(typeof(s.logId));
			var trtd = template.replace('日志编号',s.logId)
			.replace('日志一级分类',logFirstType)
			.replace('日志二级分类',logSecondType)
			.replace('时间',getMyDate(s.createTime))
			.replace('日志概述',typeDescription)
			.replace('查看', s.logExplain)
			.replace('详情','<a onclick="getLogDetail('+'\''+s.logId+'\''+','+s.logSecondType+')">查看</a>');
			tbo.append(trtd);
		}
		var paginationUl = $("#paginationUl");
		paginationUl.empty();
		paginationUl.append('<li><a onclick="lastPage()">&laquo;</a></li>');
		var pageTemplate = '<li><a onclick="setPageNum(页数)">页数</a></li>';
		var navigatepageNums = result.data.navigatepageNums;
		for(var x=0;x<navigatepageNums.length;x++){
			var s = navigatepageNums[x];
			var pageLi = pageTemplate.replace('页数',s).replace('页数',s);
			paginationUl.append(pageLi);
		}
		paginationUl.append('<li><a onclick="nextPage()">&raquo;</a></li><input id="pages" type="hidden" value='+result.data.pages+'>');
	});
};

var getLogGrade = function(firstType){
	var sendData = {
			firstType : firstType
	};
	$.post(PathList.findLogGrade,sendData,function(result){
		var list = result.data;
		var secondTypeSelect = $("#secondType");
		secondTypeSelect.empty();
		var template = '<option value=0>二级分类</option>';
		secondTypeSelect.append(template);
		for(var x=0;x<list.length;x++){
			var s = list[x];
			var o = template.replace('0', s.secondType)
			.replace('二级分类', s.logName);
			secondTypeSelect.append(o);
		}
	});
}

var getLogDetail = function(logId,logSecondType){
	console.log(typeof(logId));
	var sendData = {
			logId : logId
	};
	console.log(sendData);
	$.post(PathList.logDetail,sendData,function(result){
		console.log(result);
		var s = result.data;
		var t = $("#t");
		var f = $("#f");
		t.empty();
		f.empty();
		if(logSecondType==21){
			if(s.typeDescription==2100){
				s.typeDescription = '用户提现';
			}else if(s.typeDescription==2101){
				s.typeDescription = '钱包模块充值';
				var urlUl;
				if(s.tradeNo!=null){
					urlUl = '<ul class="sys-info-list">'
					+'<li><label class="res-lab"></label><span class="res-info"></span></li>'
					+'<li><label class="res-lab">交易订单号:'+s.tradeNo+'</label><span class="res-info"></span></li>'
					+'<li><label class="res-lab"><a href="'+s.payUrl+'" target="view_window">支付链接</a></label><span class="res-info"></span></li></ul>';
				}else{
					urlUl = '<ul class="sys-info-list">'
						+'<li><label class="res-lab"></label><span class="res-info"></span></li>'
						+'<li><label class="res-lab">交易订单号:未生成</label><span class="res-info"></span></li>'
						+'<li><label class="res-lab"><a href="'+s.payUrl+'" target="view_window">支付链接</a></label><span class="res-info"></span></li></ul>';
				}
				f.append(urlUl);
			}else if(s.typeDescription==2102){
				s.typeDescription = '购买好人卡';
				var urlUl= '<ul class="sys-info-list">'
					+'<li><label class="res-lab"></label><span class="res-info"></span></li>'
					+'<li><label class="res-lab"><a onclick="getLogDetail('+'\''+s.infCardLogId+'\''+',22'+')">好人卡日志链接</a></label><span class="res-info"></span></li></ul>';
				f.append(urlUl);
			}else if(s.typeDescription==2103){
				s.typeDescription = '画师模块充值';
			}else if(s.typeDescription==2105){
				s.typeDescription = '作者稿费';
			}else if(s.typeDescription==2107){
				s.typeDescription = '购买画册';
			}else if(s.typeDescription==2109){
				s.typeDescription = '每月福利补贴';
			}else if(s.typeDescription==2111){
				s.typeDescription = '好人转换钱包';
				var urlUl= '<ul class="sys-info-list">'
					+'<li><label class="res-lab"></label><span class="res-info"></span></li>'
					+'<li><label class="res-lab"><a onclick="getLogDetail('+'\''+s.infCardLogId+'\''+',22'+')">好人卡日志链接</a></label><span class="res-info"></span></li></ul>';
				f.append(urlUl);
			}
			if(s.orderStatus == 0){
				s.orderStatus = "交易未完成";
			}else if(s.orderStatus == 1){
				s.orderStatus = "交易已完成";
			}else if(s.orderStatus == 2){
				s.orderStatus = "交易已取消";
			}
			var trth = '<thead><tr><th>日志编号</th><th>支付用户</th><th>接受支付用户</th><th>可兑换金额</th><th>不可兑换金额</th><th>福利补贴金额</th><th>交易状态</th><th>创建时间</th><th>IP地址</th><th>使用详情</th></tr></thead>';
			var template = '<tbody><tr><td>日志编号</td><td>支付用户</td><td>接受支付用户</td><td>可兑换金额</td><td>不可兑换金额</td><td>福利补贴金额</td><td>交易状态</td><td>创建时间</td><td>IP地址</td><td>使用详情</td></tr></tbody>';
			var trtd = template.replace('日志编号',s.logId)
			.replace('支付用户',s.payUserName)
			.replace('接受支付用户',s.paiedUserName)
			.replace('可兑换金额',s.exchangeableCashAmount)
			.replace('不可兑换金额',s.unexchangeableCashAmount)
			.replace('福利补贴金额',s.welfareCashAmount)
			.replace('交易状态',s.orderStatus)
			.replace('创建时间',getMyDate(s.createTime))
			.replace('IP地址',s.ip)
			.replace('使用详情',s.typeDescription);
			t.append(trth).append(trtd);
			}else if(logSecondType==22){
				if(s.typeDescription==2200){
					s.typeDescription = '签到获得好人卡';
				}else if(s.typeDescription==2201){
					s.typeDescription = '打赏:<a href="?bookId='+s.bookId+'" target="view_window">作品</a>';
				}else if(s.typeDescription==2202){
					s.typeDescription = '购买好人卡';
					var urlUl= '<ul class="sys-info-list">'
						+'<li><label class="res-lab"></label><span class="res-info"></span></li>'
						+'<li><label class="res-lab"><a onclick="getLogDetail('+'\''+s.infCashLogId+'\''+',21)">钱包日志链接</a></label><span class="res-info"></span></li></ul>';
					f.append(urlUl);
				}else if(s.typeDescription==2203){
					s.typeDescription = '好人卡提现';
					var urlUl= '<ul class="sys-info-list">'
						+'<li><label class="res-lab"></label><span class="res-info"></span></li>'
						+'<li><label class="res-lab"><a onclick="getLogDetail('+'\''+s.infCashLogId+'\''+',21)">钱包日志链接</a></label><span class="res-info"></span></li></ul>';
					f.append(urlUl);
				}else if(s.typeDescription==2205){
					s.typeDescription = '改名消耗好人卡';
				}
				var trth = '<thead><tr><th>日志编号</th><th>支付好人卡用户</th><th>接受支付好人卡用户</th><th>充值好人卡数</th><th>福利好人卡数</th><th>时间</th><th>IP地址</th><th>使用详情</th></tr></thead>';
				var template = '<tbody><tr><td>日志编号</td><td>支付好人卡用户</td><td>接受支付好人卡用户</td><td>充值好人卡数</td><td>福利好人卡数</td><td>时间</td><td>IP地址</td><td>使用详情</td></tr></tbody>';
				var trtd = template.replace('日志编号',s.logId)
				.replace('支付好人卡用户',s.payUserName)
				.replace('接受支付好人卡用户',s.paiedUserName)
				.replace('充值好人卡数',s.payCardAmount)
				.replace('福利好人卡数',s.welfareCardAmount)
				.replace('时间',getMyDate(s.createTime))
				.replace('IP地址',s.ip)
				.replace('使用详情',s.typeDescription);
				t.append(trth).append(trtd);
			}else if(logSecondType==23){
				if(s.typeDescription==2304){
					s.typeDescription = '清空上月福利金额';
				}else if(s.typeDescription==2305){
					s.typeDescription = '发放稿费';
				}else if(s.typeDescription==2307){
					s.typeDescription = '发放福利补贴';
				}
				var trth = '<thead><tr><th>日志编号</th><th>作品名</th><th>用户名</th><th>稿费金额</th><th>福利金额</th><th>时间</th><th>IP地址</th><th>使用详情</th></tr></thead>';
				var template = '<tbody><tr><td>日志编号</td><td>作品名</td><td>用户名</td><td>稿费金额</td><td>福利金额</td><td>时间</td><td>IP地址</td><td>使用详情</td></tr></tbody>';
				var trtd = template.replace('日志编号',s.logId)
				.replace('作品名',s.bookName)
				.replace('用户名',s.userName)
				.replace('稿费金额',s.exchangeableCashAmount)
				.replace('福利金额',s.welfareCashAmount)
				.replace('时间',getMyDate(s.createTime))
				.replace('IP地址',s.ip)
				.replace('使用详情',s.typeDescription);
				t.append(trth).append(trtd);
			}
		}
	);
	$("#tDiv").show();
};

//提现相关
var getWithdrawals = function(pageNum,pageSize){
	var sendData = {
			pageNum : pageNum,
			pageSize : pageSize
	};
	$.post(PathList.withdrawals,sendData,function(result){
		var tbo = $("#tbo");
		tbo.empty();
		var list = result.data.list;
		var template = '<tr><td>提现申请编号</td><td>提现金额</td><td>用户名</td><td>用户手机号</td><td>用户邮箱</td><td>提现时间</td><td>交易状态</td></tr>';
		for(x=0;x<list.length;x++){
			var s = list[x];
			if(s.orderStatus == 0){
				s.orderStatus = '<a onclick="getSysCashAccount('+s.userId+','+s.cashAmount+','+'\''+s.logId+'\''+')">处理<a>';
			}else if(s.orderStatus == 1){
				s.orderStatus = '已处理';
			}else if(s.orderStatus == 2){
				s.orderStatus = '已拒绝';
			}
			var trtd = template.replace('提现申请编号',s.logId)
			.replace('提现金额',s.cashAmount)
			.replace('用户名',s.username)
			.replace('用户手机号',s.telphone)
			.replace('用户邮箱',s.email)
			.replace('提现时间',getMyDate(s.createTime))
			.replace('交易状态',s.orderStatus);
			tbo.append(trtd);
		}
		var paginationUl = $("#paginationUl");
		paginationUl.empty();
		paginationUl.append('<li><a onclick="lastPage()">&laquo;</a></li>');
		var pageTemplate = '<li><a onclick="setPageNum(页数)">页数</a></li>';
		var navigatepageNums = result.data.navigatepageNums;
		for(var x=0;x<navigatepageNums.length;x++){
			var s = navigatepageNums[x];
			var pageLi = pageTemplate.replace('页数',s).replace('页数',s);
			paginationUl.append(pageLi);
		}
		paginationUl.append('<li><a onclick="nextPage()">&raquo;</a></li><input id="pages" type="hidden" value='+result.data.pages+'>');
	});
};

var getSysCashAccount = function(userId,exchangeableCashAmount,logId){
	var sendData = {
		userId : userId	
	};
	$.post(PathList.sysCashAccount,sendData,function(result){
		console.log(result);
		var s = result.data;
		var t = $("#t");
		t.empty();
		var trth = '<thead><tr><th>用户编号</th><th>用户名</th><th>支付宝账号</th><th>真实姓名</th><th>提现金额</th><th>处理结果</th></tr></thead>';
		t.append(trth);
		var template = '<tbody><tr><td>用户编号</td><td>用户名</td><td>支付宝账号</td><td>真实姓名</td><td>提现金额</td><td>处理结果</td></tr></tbody>';
		var trtd = template.replace('用户编号', s.userId)
		.replace('用户名', s.userName)
		.replace('支付宝账号', s.alipayAccount)
		.replace('真实姓名', s.realName)
		.replace('提现金额', exchangeableCashAmount)
		.replace('处理结果','<a onclick="finishWithdrawals('+'\''+logId+'\''+',1,null)">已打款</a>');
		t.append(trtd);
	});
	
};

var finishWithdrawals = function(logId,flag,str){
	var f = $("#f");
	f.empty();
	var sendData = {
			logId : logId,
			flag : flag,
			str : str
	};
	$.post(PathList.finishWithdrawals,sendData,function(result){
		console.log(result);
	});
	location.reload();
};

var doRefuseWithdrawals = function(logId){
	var str = $("#refuse").val();
	finishWithdrawals(logId,2,str);
}

var refuseWithdrawals = function(logId){
	var f = $("#f");
	f.empty();
	var inputText = '拒绝理由：<input id="refuse"><input type="button" onclick="doRefuseWithdrawals('+'\''+logId+'\''+')" value="确定">';
	f.append(inputText);
};