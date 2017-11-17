<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>业务区块显示权限配置</title>
 <link href="${pageContext.request.contextPath }/images/LOGO.ico" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
</head>
<script type="text/javascript">
function datagrid(url) {
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
							pageList : [20,50,100,200,500],
							showFooter : true,
							loadMsg : '数据加载中请稍候……',
							pagination : true,
							toolbar : "#toolbar",
							singleSelect : true,
							checkOnSelect : true,
							selectOnCheck : true,
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
									}
									,
									{
										field : 'authorizedrecord',
										title : '是否授权',
										align : 'center',
										sortable:true,
										width : 150,
										formatter : function (value, row, index){
											if("false"==value){
												return "否";
											}else{
												return "是";
											}
										}
									}
									] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							},
							onLoadSuccess:function(){
								$(this).datagrid("fixRownumber");
							},
							onDblClickRow: function (index, row) {
								//获取选中的字段对应的授权信息
								
								getDetails(row);
								
							}
						});
	}
//区段授权列表
function panelDatagrid(url) {
	$('#datagrid').datagrid(
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
				pageList : [20,50,100,200,500],
				showFooter : true,
				loadMsg : '数据加载中请稍候……',
				pagination : true,
				toolbar : "#toolbar",
				singleSelect : false,
				checkOnSelect : false,
				selectOnCheck : false,
				columns : [ [ {
					field : 'ck',
					checkbox : true
				}, {
					field : 'conditionId',
					title : '授权ID',
					width : 100,
					align : 'center',
					hidden : true
				}, {
					field : 'bizPanelId',
					title : 'bizPanelId',
					width : 100,
					align : 'center',
					hidden : true
				}, {
					field : 'agentEmpName',
					title : '授权对象',
					width : 200,
					align : 'center'
				}, {
					field : 'companys',
					title : '授权公司',
					width : 300,
					align : 'center'
				}, {
					field : 'depts',
					title : '授权部门',
					width : 300,
					align : 'center'
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 200,
					align : 'center',
					formatter : function(value, rec, index) {
						var s = new Date(value).pattern("yyyy-MM-dd hh:mm:ss");
						return s;
					}
				},{
					field : 'updateTime',
					title : '更新时间',
					width : 200,
					align : 'center',
					formatter : function(value, rec, index) {
						var s = new Date(value).pattern("yyyy-MM-dd hh:mm:ss");
						return s;
					}
				}, {
					field : 'isPush',
					title : '是否推送',
					width : 300,
					align : 'center',
					formatter : function(value, rec, index) {
						if("false"==value){
							return "否";
						}
						return "是";
					}
				} ] ],
				onSelect : function(rowData) {
					$('#datagrid').datagrid("unselectAll");
				},
				onLoadSuccess:function(){
					$(this).datagrid("fixRownumber");
				}
			});
}

$(function(){
	datagrid();
});
//增加授权
function addRecord(){
	var selectedNode = $("#leftmenuTree").tree('getSelected');
	//如果没有选中节点，则提示请选中业务区块
	if(selectedNode!=null){
		var parentNode = $('#leftmenuTree').tree('getParent',selectedNode.target);
		var isEndLeaf = $('#leftmenuTree').tree('getChildren', selectedNode.target);
		var row = {};
		//如果节点为业务区块节点，则赋值到打开的窗口
		if(isEndLeaf.length==0&&parentNode!=null){
			var panelNameDesc = selectedNode.text;
			var panelName = panelNameDesc.substring(0,panelNameDesc.indexOf("("));
			var bizFieldDescr = panelNameDesc.substring(panelNameDesc.indexOf("(")+1,panelNameDesc.indexOf(")"));
			
			row.conditionId="";
			row.bizpanelId = selectedNode.id;
			row.panelName = panelName;
			row.bizFieldDescr = bizFieldDescr;
			//打开窗口
			getDetails(row);
		}else{
			//如果表格选中了业务区块，则打开
			var rows = $('#datagrid').datagrid('getChecked');
			if(rows.length!=0){
				getDetails(rows[0]);
			}else{
				alert("请选择业务区块");
			}
		}
	}else{
		alert("请选择业务区块");
	}
}
//获取选中的字段的详细信息
function getDetails(row){
	$.ajax({
		url : "${pageContext.request.contextPath}/console/panelBizctrl/getPanelBizctrlBylId.action",
		type : "post",
		data : {conditionId : row.conditionId},
		dataType : "json",
		success : function(result) {
			//如果已经授权，则将授权信息加入行信息
			if(result.length!=0){
				$.each(row, function(i) {
					if("bizFieldDescr"==i){
						result.panelDescr = row[i];
					}else if(""!=row[i]){
						result[i] = row[i];
					}
				});
				//为打开的表单赋值
				editRole(result);
			}else{
				editRole(row);
			}
		},
		error : function(result) {
               $.messager.show({
                   title: '温馨提示',
                   msg: JSON.stringify(result)
               });
		}
	});
	
}


//为打开的表单赋值
function editRole(row) {
	if (row) {
		$('#field_dlg').dialog('open').dialog('setTitle', ' ');
		$('#fm').form('clear');
		$('#fm').form('load', row);
		$("fm").find("input").attr('disable','disable');
		if(""!=row.districtName&&row.districtName!=undefined){
			$("input:checkbox[value='district']").prop('checked','true');
		}
		if(""!=row.companyNum&&row.companyNum!=undefined){
			$("input:checkbox[value='company']").prop('checked','true');
		}
		if(""!=row.deptNum&&row.deptNum!=undefined){
			$("input:checkbox[value='dept']").prop('checked','true');
		}
		if(""!=row.empNum&&row.empNum!=undefined){
			$("input:checkbox[value='emp']").prop('checked','true');
		}
		$("#agentEmployee").val(row.empName);
		//处理被授权人的回显
		var empName = row.empName;
		var empNum = row.empNum;
		if(""!=empName&&empName!=undefined&&""!=empNum&&empNum!=undefined){
			var empNames = empName.split(";");
			var empNums = empNum.split(",");
			for(v in empNums){
				empNums[v] = empNames[v]+"("+empNums[v]+");";
			}
			//XXX(empid:86352723-xxx-49b2-8821-369dd2c3e0f8),XXX(empid:dcb327c8-xxx-4aa1-a58e-2d44e16edaaf)
			//admin(empid:f9370be7-522e-4a96-bcf4-2e5765a59024);黄嘉辉(empid:47f2fa87-95c3-40f8-b53f-ca661ec008a6);
			$("#agentEmployee_num").val(empNums.toString().replace(/,/g, ""));
			$("#empNum").textbox("setValue",row.empNum);
		}
		
		//触发change事件
		$("#conditionType [type=checkbox]").trigger("change");
	}
}

//删除授权记录
function deleteRecord(){
	var rows = $('#datagrid').datagrid('getChecked');
	  if (rows.length > 0) {
		  $.messager.confirm(
			'温馨提示',
			'你真的要删除授权么?',
			function(r) {
				if (r) {
					var jsonData = {
							conditionId : []
					};
					for (var i = 0; i < rows.length; i++) {
						jsonData.conditionId.push(rows[i].conditionId);
					}
					$.ajax({
							url : "${pageContext.request.contextPath}/console/panelBizctrl/delete.action",
							type : "post",
							data : jsonData,
							dataType : "json",
							success : function(result) {
								if (result.state == true) {
									$('#datagrid').datagrid(
											'reload');
								} else {
									$.messager.show({ // show error message
										title : '温馨提示',
										msg : result.msg
									});
	
								}
							}
					});
				}
			});
	}
}
</script>
<body class="easyui-layout">
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
			<div style="margin-bottom:5px">
			<a href="#" class="easyui-linkbutton" 
			iconCls="icon-remove" onclick="deleteRecord()" plain="true">取消授权</a>
			<a href="#" class="easyui-linkbutton" 
			iconCls="icon-remove" onclick="addRecord()" plain="true">新增授权</a>
		</div>
</div>
	<jsp:include page="./config.jsp"></jsp:include>
	<jsp:include page="./selectCompany.jsp"></jsp:include>
	<jsp:include page="./selectDepartment.jsp"></jsp:include> 
</body>

</html>