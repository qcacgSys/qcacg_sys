//核算统计-视图更新方法
model.updateBookAccountsView=function(result){
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
		model.updateCashAndWelfare(result[index].bookAccountsId);
		$(this).addClass('disabled');
		//未打款改成已打款
	});
}

//核算统计-单用户打款打款
model.updateCashAndWelfare=function(bookAccountsId){
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

//核算统计-批量打款
model.updateManyCashAndWelfare=function(resultId){
	var url=PathList.adminRemitBookAccounts;
	var param={"bookAccountsIds":resultId};
	$.post(url, param, function(result){
		alert(result.msg);
		history.go(0);
	});
}


//审核管理-查看
var bookReviewMsg = new Array();
var bookList = new Array();
var book = {
		bookId:null,
		bookName:null
};

//审核管理-视图更新方法
model.updateReviewView = function(review) {
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


//作品签约-更新视图
model.updateSignView = function(signData) {
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


//作品推荐-视图更新
model.updateBookRecomView = function(result){
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


//评论举报-更新视图
model.updateReportView=function(result){
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

//评论举报-操作
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


//日更统计-更新视图
model.updateDaysBookAccountsView = function(result){
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


//月更统计-更新视图
model.updateMouthBookAccountsView = function(result){
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
var yPage = function(result,pageNum){
	var paginationUl = $("#paginationUl");
	paginationUl.empty();
	paginationUl.append('<li><a onclick="lastPage()">&laquo;</a></li>');
	var pageTemplate = '<li><a onclick="setPageNum(页数)">页数</a></li>';
	var navigatepageNums = result.data.navigatepageNums;
	if(navigatepageNums.length>0){
		if(navigatepageNums[0]!=1){
			paginationUl.append('<li><a>..</a></li>');
		}
		for (var x = 0; x < navigatepageNums.length; x++) {
			var s = navigatepageNums[x];
			if(pageNum==s){
				var pageLi = pageTemplate.replace('onclick="setPageNum(页数)', '').replace('页数', '<font color="black">'+s+'</font>');
			}else{
				var pageLi = pageTemplate.replace('页数', s).replace('页数', s);
			}
			paginationUl.append(pageLi);
		}
		if(navigatepageNums[7]!=null&&navigatepageNums[7]!=result.data.pages){
			paginationUl.append('<li><a>..</a></li>')
		}
	}else{
		paginationUl.append('<li><a>1</a></li>');
	}
	paginationUl.append('<li><a onclick="nextPage()">&raquo;</a></li><input id="pages" type="hidden" value=' + result.data.pages + '>');
}