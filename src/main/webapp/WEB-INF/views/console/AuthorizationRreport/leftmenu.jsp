
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()+path+"/";
%>
<link href="${pageContext.request.contextPath}/scripts/jquery/loadmask/jquery.loadmask.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery/loadmask/jquery.loadmask.min.js'></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

//初始化菜单
function menu(authorType,empNum){
	MaskUtil.mask();
	//如果未传值，则赋值为空
	if(!empNum){
		empNum = "";
	}
	if(authorType=="write"){
		method = "byWriteAuthorization";
	}else{
		method = "byReadAuthorization";
	}
	//左边菜单栏
	$('#leftmenuTree').tree({   //${menu.menuId}
		url: '${pageContext.request.contextPath}/console/authorizationRreport/getAppTree/'+method+'.action?parentId=0&empNum='+empNum,   //&menuId=${menu.menuId}
	    onBeforeExpand:function(node,param){  //${menu.menuId}
	    	$('#leftmenuTree').tree('options').url = "${pageContext.request.contextPath}/console/authorizationRreport/getAppTree/"+method+".action?parentId=0"
	    		+ node.id;//+ "&menuId=${menu.menuId}"
		},
		onClick : function(node) {
			if(authorType==undefined){
				authorType = "read";
			}
			var id = node.id;
			var title = node.text
			var parentNode = $('#leftmenuTree').tree('getParent', node.target);  //${menu.menuId}
			if (parentNode == null) {
				authorType = authorType;
				setField(authorType,"AppId","appId="+id+"&empNum="+getSelectedEmp());
			} else {
				setField(authorType,"FormId","formId="+id+"&empNum="+getSelectedEmp());
			}
		},
		onLoadSuccess : function(){
			MaskUtil.unmask();
		}

	});
}

function setField(authorType,type,parmas){
	if ($('#tabs').tabs('exists', 'Home')){
		$('#tabs').tabs('select', 'Home');//选中并刷新
		var currTab = $('#tabs').tabs('getSelected');
// 		var url = $(currTab.panel('options').content).attr('src');
		var url = ""; 
		//根据所要查询的权限类型，所选的菜单项选择对应的方法
		if(authorType=="write"){
			//如果选择的是表单项，则带出表单下的所有信息
			if(type=="FormId"){
				authorTypeMethod = "getNodeByFormId";
			}else{
			//如果选择的是应用库项，则带出应用库下的所有信息
				authorTypeMethod = "getNodeByAppId";
			}
		}else{
			//如果选择的是表单项，则带出表单下的所有信息
			if(type=="FormId"){
				authorTypeMethod = "getBizPanelByFormId";
			}else{
			//如果选择的是应用库项，则带出应用库下的所有信息
				authorTypeMethod = "getBizPanelByAppId";
			}
		}
		url = "${pageContext.request.contextPath}/console/authorizationRreport/"+authorTypeMethod+".action?"+parmas;
		if(url != undefined) {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					//如果是查询阅读权限，则显示阅读权限的详细列表，否则显示审批权限的详细列表
					content:authorType=="read"?readDatagrid(url):writeDatagrid(url)
				}
			})
		}
	}
}

//--------遮罩层
var MaskUtil = (function(){  
    
    var $mask,$maskMsg;  
      
    var defMsg = '正在处理，请稍待。。。';  
      
    function init(){  
        if(!$mask){  
            $mask = $("<div class=\"datagrid-mask mymask\"></div>").appendTo("body");  
        }  
        if(!$maskMsg){  
            $maskMsg = $("<div class=\"datagrid-mask-msg mymask\">"+defMsg+"</div>")  
                .appendTo("body").css({'font-size':'12px'});  
        }  
          
        $mask.css({width:"100%",height:$(document).height()});  
          
        var scrollTop = $(document.body).scrollTop();  
          
        $maskMsg.css({  
            left:( $(document.body).outerWidth(true) - 190 ) / 2  
            ,top:( ($(window).height() - 45) / 2 ) + scrollTop  
        });   
                  
    }  
      
    return {  
        mask:function(msg){  
            init();  
            $mask.show();  
            $maskMsg.html(msg||defMsg).show();  
        }  
        ,unmask:function(){  
            $mask.hide();  
            $maskMsg.hide();  
        }  
    }  
      
}());  
$(function(){
	menu();
	
})

</script>
<div class="easyui-accordion" data-options="fit:true,border:false">
	<div id="leftmenuTree"></div>
</div>
