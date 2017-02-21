var SUCCESS=0;
var ERROR=1;

///////////////////////////////////////////////////////////////////////////////////////////////////////
//全局变量
//存储页面中显示的数据,以及存储更新视图的方法
///////////////////////////////////////////////////////////////////////////////////////////////////////
var model={};


///////////////////////////////////////////////////////////////////////////////////////////////////////
//公共方法
///////////////////////////////////////////////////////////////////////////////////////////////////////

//分页控件 - 传入url, 更新视图方法名
model.fenyedView = function(url,method){
		//console.log(model.result);
    	var element = $('#bp-3-element-test');//获得数据装配的位置
    	//初始化所需数据
    var options = {
        bootstrapMajorVersion:3,//版本号。3代表的是第三版本
        currentPage: 1, //当前页数
        numberOfPages: 5, //显示页码数标个数
        totalPages:model.result.pages, //总共的数据所需要的总页数
        itemTexts: function (type, page, current) {  
        		//图标的更改显示可以在这里修改。
        switch (type) {  
                case "first":  
                    return "<<";  
                case "prev":  
                    return "<";  
                case "next":  
                    return ">";  
                case "last":  
                    return ">>";  
                case "page":  
                    return  page;  
            }                 
        }, 
        tooltipTitles: function (type, page, current) {
//如果想要去掉页码数字上面的预览功能，则在此操作。例如：可以直接return。
            switch (type) {
          case "first":
              return "Go to first page";
          case "prev":
              return "Go to previous page";
          case "next":
              return "Go to next page";
          case "last":
              return "Go to last page";
          case "page":
              return (page === current) ? "Current page is " + page : "Go to page " + page;
      }
        },
        onPageClicked: function (e, originalEvent, type, page) {  
            //单击当前页码触发的事件。若需要与后台发生交互事件可在此通过ajax操作。page为目标页数。
            //console.log(e);
            //console.log(originalEvent);
            //console.log(type);
            //点击页码, 才能发起ajax
        	var param = {
       			pageNum : page,
       			pageSize : 100,
       			yearAndMouthStart:model.yearAndMouthStart,
       			yearAndMouthEnd:model.yearAndMouthEnd
       		};
       		$.ajax({
       			type : "GET",
       			url : url,
       			contentType : "application/json; charset=utf-8",
       			data : param,
       			dataType : "json",
       			success : function(result) {
       				//console.log(param);
					//返回结果(包含分页长度)加入model,分页组件中取总页
					model.result=result;
       				method(result.list);
       			}
       		});
        }
    };
    element.bootstrapPaginator(options);	//进行初始化
}
