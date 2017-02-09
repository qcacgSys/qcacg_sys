var signData ;
var review ;
var rootPath ;
var htmlPath ;
var adminPath ;

//本项目端口路径
//adminPath = 'http://127.0.0.1:777/qcacg_sys/';
adminPath = 'http://127.0.0.1:8090/qcacg_sys/';
//adminPath = 'http://121.196.194.211:8080/qcacg_sys/';
//adminPath = 'http://www.qcacg.com:8080/qcacg_sys/';

//调用跳转项目html域名与端口
//htmlPath = 'http://127.0.0.1:3000/';
htmlPath = 'http://127.0.0.1:8080/';
//htmlPath = 'http://121.196.194.211:8080/';
//htmlPath = 'http://www.qcacg.com:8080/';

//调用shtml域名与端口
//rootPath = '/Controller';
rootPath = 'http://127.0.0.1:8080/';
//rootPath = 'http://192.168.126.25:8080/';
//rootPath = 'http://127.0.0.1:8080/Controller/';
//rootPath = 'http://121.196.194.211:8080/Controller/';
//rootPath = 'http://www.qcacg.com/Controller/';

var PathList = {
		//评论操作界面
		adminListReport : rootPath + 'report/adminListReport.shtml',
		//评论操作
		adminUpdateReport : rootPath + 'report/adminUpdateReport.shtml',
		//审核操作界面
		queryBookForCheck : rootPath + 'book/queryBookForCheck.shtml',
		//编辑操作审核
		adminUpdateBookStatus : rootPath + 'book/adminUpdateBookStatus.shtml',
		//管理员查看签约
		adminQueryBookSign : rootPath + 'book/adminQueryBookSign.shtml',
		//管理员操作签约
		adminUpdateBookSign : rootPath + 'book/adminUpdateBookSign.shtml',
		//管理员发送系统消息或者官方公告
		saveInfo : rootPath + 'info/saveInfo.shtml',
		//管理员撤销系统消息或者官方公告
		cancelSend : rootPath + 'info/cancelSend.shtml'
};
var HtmlList = {
		//跳转到书页面
		catalog : htmlPath + 'view/catalog.html'
};

var LocalPath = {
		//获取用户
		userlist : adminPath + 'admin/userlist',
		statusDetails : adminPath + 'admin/statusDetails',
		recommend : adminPath + 'admin/recommend'
};
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