<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>阅读与审批权限列表</title>
 <link href="${pageContext.request.contextPath }/images/LOGO.ico" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
</head>
<script type="text/javascript">
//authorTypeb 权限类型
var authorType = "read";

//打开选人对话框
function openEmployee() {
	var url = "${pageContext.request.contextPath}/console/tag/user/index.xsp?id=employee"
			+ "&documentId=&singleSelect=true&showcurrent=true";
	window.open(encodeURI(url));
}

//列出所查人员拥有查看权限
function readAuthorization(){
	authorType = "read";
	$('#datagrid').datagrid('loadData', { total: 0, rows: [] }); 
	//更新左边属性菜单
	menu("read",getSelectedEmp());
	//更新详细列表
	readDatagrid("");
}

//列出所查人员拥有审批权限
function writeAuthorization(){
	authorType = "write";
	$('#datagrid').datagrid('loadData', { total: 0, rows: [] }); 
	//更新左边属性菜单
	menu("write",getSelectedEmp());
	//更新详细列表
	writeDatagrid("");
}

//获取所要查询的人
function getSelectedEmp(){
	var empNum = $("#employee_num").val();
	 var empArry = new Array();
	 if(empNum.indexOf("(")>0){
		var empList =  empNum.split(";");
		for(i in empList ){
			if(""!=empList[i]){
				empArry.push(empList[i].substring(empList[i].indexOf("(")+1,empList[i].indexOf(")")));
			}
		}
	 }
	//如果未传值，则赋值为空
	if(!empArry[0]){
		empNum = "";
		return empNum;
	}
	return empArry[0];
}

//阅读权限的详细列表
function readDatagrid(url){
	$('#datagrid')
	.datagrid(
			{
				height : '100%',
				fit : true,
				url : url,
				method : 'POST',
				striped : true,
				rownumbers:true,
				nowrap : true,
				pageSize : 20,
				pageNumber : 1,
				pageList : [1,20,50,100,200,500],
				showFooter : true,
				loadMsg : '数据加载中请稍候……',
				pagination : true,
				toolbar : "#toolbar",
				singleSelect : false,
				checkOnSelect : false,
				selectOnCheck : false,
				columns : [ [
				 {
					field : 'ck',
					checkbox : true
				},
				{
					field : 'formId',
					title : '表单ID',
					width : 100,
					align : 'center',
					sortable:true,
					hidden : true
				},
				{
					field : 'appId',
					title : '应用ID',
					width : 100,
					align : 'center',
					sortable:true,
					hidden : true
				},
				{
					field : 'bizpanelId',
					title : '区块ID',
					width : 150,
					sortable:true,
					align : 'center',
					hidden : true
				},
				{
					field : 'panelName',
					title : '区块名称',
					width : 150,
					sortable:true,
					align : 'center'
				},
					{
					field : 'bizFieldDescr',
					title : '区块描述',
					width : 150,
					sortable:true,
					align : 'center'
				},
				{
					field : 'formName',
					title : '所属流程',
					align : 'center',
					sortable:true,
					width : 150
				},
				{
					field : 'appName',
					title : '所属应用库',
					align : 'center',
					sortable:true,
					width : 150
				}
				] ],
				onSelect : function(rowData) {
					$('#datagrid').datagrid("unselectAll");
				},
				onLoadSuccess:function(){
					$(this).datagrid("fixRownumber");
				},
				onDblClickRow: function (index, row) {
					
				}
			});
}

//审批权限的详细列表
function writeDatagrid(url){
	$('#datagrid')
	.datagrid(
			{
				height : '100%',
				fit : true,
				url : url,
				method : 'POST',
				striped : true,
				rownumbers:true,
				nowrap : true,
				pageSize : 20,
				pageNumber : 1,
				pageList : [1,20,50,100,200,500],
				showFooter : true,
				loadMsg : '数据加载中请稍候……',
				pagination : true,
				toolbar : "#toolbar",
				singleSelect : false,
				checkOnSelect : false,
				selectOnCheck : false,
				columns : [ [
				 {
					field : 'ck',
					checkbox : true
				},
				{
					field : 'formId',
					title : '表单ID',
					width : 100,
					align : 'center',
					sortable:true,
					hidden : true
				},
				{
					field : 'appId',
					title : '应用ID',
					width : 100,
					align : 'center',
					sortable:true,
					hidden : true
				},
				{
					field : 'nodeId',
					title : '环节ID',
					width : 150,
					sortable:true,
					align : 'center',
					hidden : true
				},
				{
					field : 'nodeName',
					title : '环节名称',
					width : 150,
					sortable:true,
					align : 'center'
				},
				{
					field : 'formName',
					title : '所属流程',
					align : 'center',
					sortable:true,
					width : 150
				},
				{
					field : 'appName',
					title : '所属应用库',
					align : 'center',
					sortable:true,
					width : 150
				},
				{
					field : 'source',
					title : '权限来源',
					align : 'center',
					sortable:true,
					width : 250
				}
				] ],
				onSelect : function(rowData) {
					$('#datagrid').datagrid("unselectAll");
				},
				onLoadSuccess:function(){
					$(this).datagrid("fixRownumber");
				},
				onDblClickRow: function (index, row) {
					
				}
			});
}


$(function(){
	readDatagrid();
});


//导出datagrid
function exportExcel(){
	//设置导出的第一行标题
 	var columnNames =  {} ;
	//所有的列名
	var fieldNames = new Array();
 	//需要导出的表单ID
 	var searchIds = new Array();
 	//判断是否需要导出序号
 	var isNeedRowNum = true;
 	//获取需要导出的所有数据
 	var data = [];
 	var fileName = "";


 	
 	//获取datagird所有列field包括隐藏的
    var opts = $('#datagrid').datagrid('getColumnFields');
 	
 	//遍历获取的datagrid 中的所有列及列名（排除第一个，第一个为复选框）
 	for(var i=1;i<opts.length;i++){
    	var option = $('#datagrid').datagrid("getColumnOption", opts[i])
    	//获取所有非隐藏的列
    	if(!option.hidden){
    		//以 'formName' : '所属流程' 格式保存列名及列标题
    		columnNames[option.field] = option.title ;
    		//保存列名
    		fieldNames.push(option.field);
    	}
 	}
    
 	
 	//遍历选中的项
    var row = $('#datagrid').datagrid('getChecked');
    if (row.length>0){
    	//遍历每一行
    	for(var o in row){
	    	var param = {};
	    	//将每行中的列名及数据做对应匹配
			for(var i in fieldNames){
				var field = fieldNames[i];
				if(field != undefined){
					 param[field] = row[o][field];
				}
			}
	    	//将每行数据添加进集合
	   		data.push(param);
    	}
    }else{
    	var node = $('#leftmenuTree').tree('getSelected');
    	if(node){
    		if(authorType==undefined){
				authorType = "read";
			}
			
			var id = node.id;
			var title = node.text
			var parentNode = $('#leftmenuTree').tree('getParent', node.target);  //${menu.menuId}
			var parmas = "";
			var authorTypeMethod = "";
			parmas = "id="+id+"&empNum="+getSelectedEmp();
			if(authorType=="write"){
				fileName = "审批权限导出";
				//如果选择的是表单项，则带出表单下的所有信息
				if(parentNode != null){
					authorTypeMethod = "getNodeByFormId";
				}else{
				//如果选择的是应用库项，则带出应用库下的所有信息
					authorTypeMethod = "getNodeByAppId";
				}
			}else{
				fileName = "查看权限导出";
				//如果选择的是表单项，则带出表单下的所有信息
				if(parentNode != null){
					authorTypeMethod = "getBizPanelByFormId";
				}else{
				//如果选择的是应用库项，则带出应用库下的所有信息
					authorTypeMethod = "getBizPanelByAppId";
				}
			}
    	}
    }
	
	
	var type  = "read";
	//定义一个form表单
	var form=$("<form>");
	form.attr("style","display:none");
	form.attr("target","");
	form.attr("method","post");
	form.attr("action","${pageContext.request.contextPath}/console/authorizationRreport/exportExcel.action?type="+type+"&"+parmas);
	var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","fileName");
		input1.attr("value",fileName);
	var input2=$("<input>");
		input2.attr("type","hidden");
		input2.attr("name","columnNames");
		input2.attr("value",JSON.stringify(columnNames));
	var input3=$("<input>");
		input3.attr("type","hidden");
		input3.attr("name","rowNum");
		input3.attr("value",isNeedRowNum);
	var input4=$("<input>");
		input4.attr("type","hidden");
		input4.attr("name","data");
		input4.attr("value",JSON.stringify(data));
	var input5=$("<input>");
		input5.attr("type","hidden");
		input5.attr("name","method");
		input5.attr("value",authorTypeMethod);
	$("body").append(form);//将表单放置在web中
	
	form.append(input1);
	form.append(input2);
	form.append(input3);
	form.append(input4);
	form.append(input5);


	form.submit().remove();//表单提交 
}

</script>
<body class="easyui-layout">
	<div data-options="region:'north',split:true  " style="height: 50px">
		<div>
			<a href="#" class="easyui-linkbutton" 
			iconCls="icon-add" onclick="openEmployee()" plain="true">选择人员</a>
			<input id="employee"   name="employee"   type="text" readonly="readonly">
			<input type="hidden" id="employee_num" name="employee_num" /> 
			<a href="javascript:readAuthorization()" class="easyui-linkbutton" iconCls="icon-search" plain="false">查看权限</a>
			<a href="javascript:writeAuthorization()" class="easyui-linkbutton" iconCls="icon-search" plain="false">审批权限</a>
			<a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-search" plain="false">导出</a>
		</div>
	</div>
	<div data-options="region:'west',split:true,title:'  '  " class="west">
		<jsp:include page="./leftmenu.jsp" />
	</div>
	<div data-options="region:'center'" class="center">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="Home">
					<div id="datagrid" style="width: 100%; height: 100%"></div>
			</div>
		</div>
	</div>
	<div data-options="region:'south'">
		<p>版本：v1.0 beta  &nbsp; 更新日期：2016-8-18</p>
	</div>

	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
	<div id="toolbar">
	<!-- 查询字段：申请人  申请单号     标题   起草时间段-->
<!-- 			<div style="margin-bottom:5px"> -->
<!-- 			<a href="#" class="easyui-linkbutton"  -->
<!-- 			iconCls="icon-add" onclick="openEmployee()" plain="true">选择人员</a> -->
<!-- 			<input id="employee"   name="employee"   type="text" readonly="readonly"> -->
<!-- 			<input type="hidden" id="employee_num" name="employee_num" />  -->
<!-- 			<a href="javascript:readAuthorization()" class="easyui-linkbutton" iconCls="icon-search" plain="false">查看权限</a> -->
<!-- 			<a href="javascript:writeAuthorization()" class="easyui-linkbutton" iconCls="icon-search" plain="false">审批权限</a> -->
<!-- 		</div> -->
</div>
</body>

</html>