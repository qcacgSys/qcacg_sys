//生成json格式
$.fn.serializeObject = function()  
{  
   var o = {};  
   var a = this.serializeArray();  
   $.each(a, function() {  
       if (o[this.name]) {  
           if (!o[this.name].push) {  
               o[this.name] = [o[this.name]];  
           }  
           o[this.name].push(this.value || '');  
       } else {  
           o[this.name] = this.value || '';  
       }  
   });  
   return o;  
};
//核算统计-视图更新方法
model.updateBookAccountsView=function(){
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
						'<td><button type="button" id="" class="btn btn-primary btn-check" onclick="dakuan(this)">打款</button></td>'+
					'</tr>';
	for(var i=0;i<model.result.list.length;i++){
		var data=model.result.list[i];
		if(data.status==0){
			data.status='未打款';
			model.buttonStatus='';
		}
		if(data.status==1){
			data.status='已打款';
			model.buttonStatus='disabled = "disabled"';
		}
		var tr=$(template.replace('xzid',data.bookAccountsId)
							.replace('#{bookAccountsId}',data.bookAccountsId)
							.replace('#{bookId}',data.bookId)
							.replace('#{userId}',data.userId)
							.replace('#{signLevel}',data.signLevel)
							.replace('#{state}',data.state)
							.replace('#{drawWelfare}',data.drawWelfare)
							.replace('#{fullWelfare}',data.fullWelfare)
							.replace('#{accountsDate}',getMyDate(data.accountsDate))
							.replace('#{status}',data.status)
							.replace('id=""',model.buttonStatus));
		tr.data('index',i);
		tbody.append(tr);
	}
}


//审核管理-查看
var bookReviewMsg = new Array();
var bookList = new Array();
var book = {
		bookId:null,
		bookName:null
};

//审核管理-视图更新方法
model.updateReviewView = function() {
	var tbody = $('#tbo');
	tbody.empty();
	var template = '<tr>' +
		'<td class="tc"><input name="name" value="value" type="checkbox"></td>' +
		'<td>#{reviewId}</td>' +
		'<td>#{bookId}</td>' +
		'<td>#{reviewName}</td>' +
		'<td>#{many}</td>' +
		'<td>#{lastTime}</td>' +
		'<td>#{status}</td>' +
		'<td>' +
		'<a id="aaaa" class="btn btn-info" href="#1">审核</a>' +
		"  " +
		'<input type="button" id="cccc" class="btn btn-info" value="查看" onclick="displayDate()"></input>' +
		'</td>' +
		'</tr>';
	var template2 = '<tr>' +
		'<td>#{sort}</td>' +
		'<td>#{message}</td>' +
		'<td>#{reply}</td>' +
		'</tr>';
	for (var i = 0; i < model.result.list.length; i++) {
		var r = model.result.list[i];
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
		var tr = $(template.replace('#{reviewId}', r.reviewId)
			.replace('#{bookId}', r.bookId)
			.replace('#{reviewName}', r.reviewName)
			.replace('#{many}', r.many)
			.replace('#{lastTime}', getMyDate(r.lastTime))
			.replace('#{status}', r.status)
			.replace('href="#1"', 'href="' + adminPath + '/admin/status?bookId=' + r.bookId + '"')
			.replace('onclick="displayDate()"', 'onclick="displayDate('+i+')"'));
		book = {
			bookId:null,
			bookName:null
		};
		book.bookId = r.bookId;
		book.bookName = r.reviewName;
		bookList[i] = book;
		bookReviewMsg[i] = r.reviewMSG;
		tbody.append(tr);
	}
	var a = $('a:contains(审核)');
	for(var i=0;i<a.length;i++){
		var a_one = a[i];
		var td_status= $(a_one).parent().prev().text();
		if(td_status=='已通过审核'){
			$(a_one).attr('disabled',"true");
			$(a_one).removeAttr('href');//去掉a标签中的href属性
			console.log($(a_one));
		}
		console.log(td_status);
	}

	
	//console.log(bookReviewMsg);
	//console.log(bookList);
}


//作品签约等级-更新视图
model.updateSignLevelView = function() {
	var tb = $('#tbo').empty();
	var template = '<tr>' +
		'<td>#{signId}</td>' +
		'<td>#{bookId}</td>' +
		'<td>#{signName}</td>' +
		'<td>#{updateType}</td>' +
		'<td>#{status}</td>' +
		'<td>#{signLevel}</td>' +
		'<td>#{isEntry}</td>' +
		'<td><button type="button" class="btn btn-info" onclick="tongguodengji(this);">通过</button>&nbsp;&nbsp;<button type="button" class="btn btn-info" onclick="butongguodengji(this);">不通过</button>&nbsp;&nbsp;<input type="button" value="降级" class="btn btn-info" onclick="jiangji(this);"/></td>'+
		'</tr>';
	for (var i = 0; i < model.result.list.length; i++) {
		var s = model.result.list[i];
		if(s.isEntry == 0){
			s.isEntry = '未申请';
		}
		if(s.isEntry == 1){
			s.isEntry = '申请中';
		}
		if(s.isEntry == 2){
			s.isEntry = '每月申请过了';
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
		if(s.status == 4){
			s.status = '解除签约';
		}
		if(s.status == 5){
			s.status = '恢复签约中';
		}
		if(s.status == 6){
			s.status = '每月申请过了';
		}
		tr = $(template.replace('#{signId}', s.signId)
			.replace('#{bookId}', s.bookId)
			.replace('#{signName}', s.signName)
			.replace('#{updateType}', s.updateType)
			.replace('#{status}', s.status)
			.replace('#{signLevel}', s.signLevel)
			.replace('#{isEntry}', s.isEntry)
			.replace('href="#"', 'href="' + adminPath + 'admin/sign?bookId=' + s.bookId + '"'));
		tr.data('index',i);
		tb.append(tr);
	}
	//更改按钮样式
	var a = $('td button');
	for(var i=0;i<a.length;i++){
		var a_one = a[i];
		var td_status= $(a_one).parent().prev().text();
		console.log(s.isEntry);
		if(td_status=='未申请' || td_status=='每月申请过了'){
			$(a_one).attr('disabled','disabled');
		}
	}
}


//作品签约-更新视图
model.updateSignView = function() {
	var tb = $('#tbo').empty();
	var template = '<tr>' +
		'<td>#{bookId}</td>' +
		'<td>#{uname}</td>' +
		'<td>#{signName}</td>' +
		'<td>#{many}</td>' +
		'<td>#{lastTime}</td>' +
		'<td>#{updateType}</td>' +
		'<td>#{status}</td>' +
		'<td>#{qq}</td>' +
		'<td>#{email}</td>' +
		'<td>#{phone}</td>' +
		'<td>#{address}</td>' +
		'<td>#{message}</td>' +
		'<td><a id="aaaa" class="btn btn-info" href="#">签约操作</a>' +
		'</tr>';
	for (var i = 0; i < model.result.list.length; i++) {
		var s = model.result.list[i];
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
		if(s.status == 4){
			s.status = '解除签约';
		}
		if(s.status == 5){
			s.status = '恢复签约中';
		}
		if(s.status == 6){
			s.status = '每月恢复过了';
		}
		tr = $(template.replace('#{bookId}', s.bookId)
			.replace('#{uname}', s.uname)
			.replace('#{signName}', s.signName)
			.replace('#{many}', s.many)
			.replace('#{lastTime}', getMyDate(s.lastTime))
			.replace('#{updateType}', s.updateType)
			.replace('#{status}', s.status)
			.replace('#{qq}', s.qq)
			.replace('#{email}', s.email)
			.replace('#{phone}', s.phone)
			.replace('#{address}', s.address)
			.replace('#{message}', s.message)
			.replace('href="#"', 'href="' + adminPath + 'admin/sign?bookId=' + s.bookId + '"'));
		tr.data('index',i);
		tb.append(tr);
	}
	//更改按钮状态
	var a = $('a:contains(签约操作)');
	for(var i=0;i<a.length;i++){
		var a_one = a[i];
		var td_status= $(a_one).parent().prev().prev().prev().prev().prev().prev().text();
		console.log(td_status);
		if(td_status=='已签约'){
			$(a_one).text('取消签约');
			$(a_one).removeAttr('href');//去掉a标签中的href属性
			$(a_one).attr('onclick','quxiaoqianyue(this)');
		}
	}
	//更改按钮状态
	var a = $('a:contains(签约操作)');
	for(var i=0;i<a.length;i++){
		var a_one = a[i];
		var td_status= $(a_one).parent().prev().prev().prev().prev().prev().prev().text();
		console.log(td_status);
		if(td_status=='解除签约'){
			$(a_one).text('等待申请');
			$(a_one).removeAttr('href');//去掉a标签中的href属性
			$(a_one).attr("disabled","disabled");
		}
	}
	//更改按钮状态
	var a = $('a:contains(签约操作)');
	for(var i=0;i<a.length;i++){
		var a_one = a[i];
		var td_status= $(a_one).parent().prev().prev().prev().prev().prev().prev().text();
		console.log(td_status);
		if(td_status=='恢复签约中'){
			$(a_one).text('通过');
			$(a_one).removeAttr('href');//去掉a标签中的href属性
			$(a_one).attr("onclick","tongguohuifu(this)");
			var btn=$("<input type='button' value='不通过' class='btn btn-info' onclick='butongguo(this)'>");
			$(a_one).parent().append(btn);
		}
	}
	//更改按钮状态
	var a = $('a:contains(签约操作)');
	for(var i=0;i<a.length;i++){
		var a_one = a[i];
		var td_status= $(a_one).parent().prev().prev().prev().prev().prev().prev().text();
		console.log(td_status);
		if(td_status=='每月恢复过了'){
			$(a_one).text('签约操作');
			$(a_one).removeAttr('href');//去掉a标签中的href属性
			$(a_one).attr("disabled","disabled");
		}
	}
}


//作品推荐-视图更新
model.updateBookRecomView = function(){
	var tbody=$('#tbo');
	tbody.empty();
	var template=	'<tr>'+
						'<td>#{userId}</td>'+
						'<td>#{bookId}</td>'+
						'<td>#{bookName}</td>'+
						'<td>#{bookIsSign}</td>'+
						'<td>#{isRecommended}</td>'+
						'<td>#{bookOnIndex}</td>'+
						'<td><button id="" onclick="tuijian(this)" type="button" class="btn btn-info">推荐</button> <button id="" onclick="butuijian(this)" type="button" class="btn btn-info">取消推荐</button></td>'+
					'</tr>';
	for(var i=0;i<model.result.list.length;i++){
		var data=model.result.list[i];
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
		var tr=$(template.replace('#{userId}',data.userId)
					.replace('#{bookId}',data.bookId)
					.replace('#{bookName}',data.bookName)
					.replace('#{bookIsSign}',data.bookIsSign)
					.replace('#{isRecommended}',data.isRecommended)
					.replace('#{bookOnIndex}',data.bookOnIndex));
		tr.data('index',i);
		tbody.append(tr);
	}
}


//评论举报-更新视图
model.updateReportView=function(){
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
						'<td><button type="button" class="btn btn-info" onclick="shenliAction(this);">审理</button>&nbsp;&nbsp;<button type="button" class="btn btn-info" onclick="bushenliAction(this);">不审理</button></td>'+
					'</tr>';
	for(var i=0;i<model.result.list.length;i++){
		var data=model.result.list[i];
		//console.log(data);
		//console.log(tr);
		if(data.reportStatus=='0'){
			data.reportStatus='待处理';
		}
		if(data.reportContent == "" || data.reportContent == undefined || data.reportContent == null){
			data.reportContent='';
		}
		var tr=$(template.replace('#{reportId}',data.reportId)
		.replace('#{reportTypeName}',data.reportTypeName)
		.replace('#{reportContent}',data.reportContent)
		.replace('#{reportText}',data.reportText)
		.replace('#{reporterId}',data.reporterId)
		.replace('#{reportDate}',getMyDate(data.reportDate))
		.replace('#{reportStatus}',data.reportStatus));
		tr.data('index',i);
		tbody.append(tr);
	}
}


//日更统计-更新视图
model.updateDaysBookAccountsView = function(){
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
						'<td><button type="button" class="btn btn-info" onclick="rigengquxiaodengji(this)">取消等级</button></td>'+
					'</tr>';
	for(var i=0;i<model.result.list.length;i++){
		var data=model.result.list[i];
		var tr=$(template.replace('#{daysUpdateCountId}',data.daysUpdateCountId)
					.replace('#{userId}',data.userId)
					.replace('#{bookId}',data.bookId)
					.replace('#{signLevel}',data.signLevel)
					.replace('#{factDaysNum}',data.factDaysNum)
					.replace('#{supplementNum}',data.supplementNum)
					.replace('#{totalWords}',data.totalWords)
					.replace('#{countDay}',getMyDate(data.countDay)));
		tr.data('index',i);
		tbody.append(tr);
	}
}


//月更统计-更新视图
model.updateMouthBookAccountsView = function(){
	var tbody=$('#tbo');
	tbody.empty();
	var template=	'<tr>'+
						'<td>#{mouthUpdateCountId}</td>'+
						'<td>#{userId}</td>'+
						'<td>#{bookId}</td>'+
						'<td>#{signLevel}</td>'+
						'<td>#{totalWords}</td>'+
						'<td>#{countDay}</td>'+
						'<td><button type="button" class="btn btn-info" onclick="yuegengquxiaodengji(this)">取消等级</button></td>'+
					'</tr>';
	for(var i=0;i<model.result.list.length;i++){
		var data=model.result.list[i];
		var tr=$(template.replace('#{mouthUpdateCountId}',data.mouthUpdateCountId)
					.replace('#{userId}',data.userId)
					.replace('#{bookId}',data.bookId)
					.replace('#{signLevel}',data.signLevel)
					.replace('#{totalWords}',data.totalWords)
					.replace('#{countDay}',getMyDate(data.countDay)));
		tr.data('index',i);
		tbody.append(tr);
	}
}


//审核查看详情
displayDate=function(id){
	console.log(",,"+id);
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
				var pageLi = pageTemplate.replace('<li>','<li class="active">').replace('onclick="setPageNum(页数)', '').replace('页数', s);
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