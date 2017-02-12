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
	$('button').click(function() {
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
	$('button').next().click(function() {
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
		'<td>#{qq}</td>' +
		'<td>#{email}</td>' +
		'<td>#{phone}</td>' +
		'<td>#{address}</td>' +
		'<td>#{message}</td>' +
		'<td><a id="aaaa" href="#">签约操作</a>' +
		'</tr>';
	for (var i = 0; i < signData.length; i++) {
		var s = signData[i];
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
			.replace('#{qq}', s.qq)
			.replace('#{email}', s.email)
			.replace('#{phone}', s.phone)
			.replace('#{address}', s.address)
			.replace('#{message}', s.message)
			.replace('href="#"', 'href="' + adminPath + 'admin/sign?bookId=' + s.bookId + '"')
		tb.append(tr);
	}
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