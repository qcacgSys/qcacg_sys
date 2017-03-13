var signData ;
var review ;
var rootPath ;
var htmlPath ;
var adminPath ;

//本项目端口路径
//adminPath = 'http://127.0.0.1:777/qcacg_sys/';
adminPath = 'http://121.196.194.211:80/qcacg_sys/';
//adminPath = 'http://www.qcacg.com/qcacg_sys/';

//调用跳转项目html域名与端口
//htmlPath = 'http://127.0.0.1:3000/';
htmlPath = 'http://121.196.194.211:80/';
//htmlPath = 'http://www.qcacg.com:8080/';

//调用shtml域名与端口
//rootPath = 'http://127.0.0.1:8080/';
//rootPath = 'http://192.168.126.40:8080/';
rootPath = 'http://121.196.194.211:80/Controller/';
//rootPath = 'http://www.qcacg.com/Controller/';

var PathList = {
		//管理员查询作品详细
		adminQueryDetailBook : rootPath + 'book/adminQueryDetailBook.shtml',
		//管理员操作作品
		adminUpdateBookCore : rootPath + 'book/adminUpdateBookCore.shtml',
		//管理员查询作品信息
		adminQueryBookCore : rootPath + 'book/adminQueryBookCore.shtml',
		//管理员发送用户消息
		adminSendMessageForUser : rootPath + 'info/adminSaveInfo.shtml',
		//管理员查询用户详细
		adminQueryDetailUserForUser : rootPath + 'user/adminQueryDetailUserForUser.shtml',
		//管理员查询用户界面
		adminQuerySimpleUsers : rootPath + 'user/adminQuerySimpleUsers.shtml',
		//管理员降签约等级
		adminDownBookSignLevel : rootPath + 'book/adminDownBookSignLevel.shtml',
		//管理员解除签约
		adminRemoveBookSign : rootPath + 'book/adminRemoveBookSign.shtml',
		//推荐作品界面
		adminQueryBookRecom : rootPath + 'book/adminQueryBookRecom.shtml',
		//推荐操作
		adminUpdateBookRecom : rootPath + 'book/adminUpdateBookRecom.shtml',
		//取消签约等级
		adminCancelSignLevel : rootPath + 'account/adminCancelSignLevel.shtml',
		//管理员日更统计界面
		adminQueryDaysUpdateCount : rootPath + 'account/adminQueryDaysUpdateCount.shtml',
		//管理员月更统计界面
		adminQueryMonthUpdateCount : rootPath + 'account/adminQueryMonthUpdateCount.shtml',
		//签约等级核算界面
		adminListBookAccounts : rootPath + 'account/adminQueryBookAccounts.shtml',
		//签约等级处理
		adminUpdateSignLevel : rootPath + 'book/adminUpdateSignLevel.shtml',
		//管理员查看签约等级
		adminQueryBookSignLevel : rootPath + 'book/adminQueryBookSignLevel.shtml',
		//管理员签约等级核算打款
		adminRemitBookAccounts : rootPath + 'account/adminRemitBookAccounts.shtml',
		//评论操作界面
		adminListReport : rootPath + 'report/adminListReport.shtml',
		//评论操作
		adminUpdateReport : rootPath + 'report/adminUpdateReport.shtml',
		//审核操作界面
		queryBookForCheck : rootPath + 'book/adminQueryBookForCheck.shtml',
		//编辑操作审核
		adminUpdateBookStatus : rootPath + 'book/adminUpdateBookStatus.shtml',
		//管理员查看签约
		adminQueryBookSign : rootPath + 'book/adminQueryBookSign.shtml',
		//管理员操作签约
		adminUpdateBookSign : rootPath + 'book/adminUpdateBookSign.shtml',
		//管理员发送系统消息或者官方公告
		saveInfo : rootPath + 'info/adminSaveInfo.shtml',
		//管理员撤销系统消息或者官方公告
		cancelSend : rootPath + 'info/adminCancelSend.shtml',
		//管理员查看日志
		adminQueryLog : rootPath + 'log/adminList.shtml',
		//查看日志详情
		logDetail : rootPath + 'log/adminDetail.shtml',
		//管理员查看提现
		withdrawals : rootPath + 'pay/adminFindWithdrawals.shtml',
		//管理员查看单个用户账户信息
		sysCashAccount : rootPath + 'pay/adminFindSysCashAccount.shtml',
		//管理员处理提现结果
		finishWithdrawals : rootPath + 'pay/adminFinishWithdrawals.shtml',
		//获取日志等级分类
		findLogGrade : rootPath + 'log/adminGrade.shtml',
		//获取日志等级分类
		userlist : rootPath + 'user/adminUserIdAndUsernameList.shtml',
		//获取日志概述分类
		findLogDescription : rootPath + 'log/adminDescription.shtml'
};
var htmlList = {
		//跳转到书页面
		catalog : htmlPath + 'view/catalog.html'
};
var LocalPath = {
		statusDetails : adminPath + 'admin/statusDetails'
};