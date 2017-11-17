<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>
</head>
<body class="easyui-layout">
<script type="text/javascript">

	function editRule(row) {
		if (row) {
			$('#rule_dlg').dialog('open').dialog('setTitle', ' ');
			$('#rule_fm').form('clear');
			$('#rule_fm').form('load', row);
			$("#ruleNum_value").val(row.ruleNum);
			getAlldeptsData("");
			getAllRolesData("");
		}
	}

	function datagrid(name, deparmentId) {
		$('#datagrid')
				.datagrid(
						{
							height : '95%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/detRuleDefinition/findByPage.action',
							method : 'POST',
							queryParams : {
								"typeId" :"${typeId}",
								"name":name
							},
							striped : true,
							nowrap : true,
							pageSize : 17,
							pageNumber : 1,
							pageList : [ 17 ],
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
										field : 'ruleNum',
										title : 'ruleNum',
										width : 100,
										align : 'center',
										hidden : true
									},
									{
										field : 'ruleName',
										title : '规则名称',
										width : 200,
										align : 'center'
									},
									{
										field : 'visible',
										title : '是否可见',
										width : 100,
										align : 'center'
									},
								
									{
										field : 'creator',
										title : '创建者',
										width : 100,
										align : 'center'
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 200,
										align : 'center',
										formatter : function(value, rec, index) {
											var s = new Date(value)
													.pattern("yyyy-MM-dd hh:mm:ss");
											return s;
										}
									},
									{
										field : 'updateBy',
										title : '更新者',
										width : 100,
										align : 'center'
									},
									{
										field : 'updateTime',
										title : '更新时间',
										width : 200,
										align : 'center',
										formatter : function(value, rec, index) {
											var s = new Date(value)
													.pattern("yyyy-MM-dd hh:mm:ss");
											return s;
										}
									}
									] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							},
								onDblClickRow :function(rowIndex,rowData){
						        editRule(rowData);
							}
						});
	}

   
	function searchByName() {
		var name = $('#name').val();
			datagrid(name);
		
	}
	
	function destroyDepartment() {
		var rows = $('#datagrid').datagrid('getChecked');
		if (rows.length > 0) {
			$.messager
					.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var jsonData = {
										ruleNum:[]
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.ruleNum.push(rows[i].ruleNum);
									}
									$.ajax({
												url : "${pageContext.request.contextPath}/console/detRuleDefinition/delete.action",
												type : "post",
												data : jsonData,
												dataType : "json",
												success : function(result) {
													if (result.state == true) {
														$('#datagrid').datagrid('reload');
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
	
	
	$(function() {
			datagrid("");
		});

</script>
<div id="toolbar">
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton " plain="true" onclick="openRuleDlg()">添加 </a>
			<a href="javascript:void(0)" class="easyui-linkbutton " plain="true" onclick="destroyDepartment()"> 删除 </a>
			 <a href="javascript:void(0)" class="easyui-linkbutton " plain="true">名称:</a><input type="text" id="name" style="width: 90px;">
			 <a href="javascript:void(0)" class="easyui-linkbutton " plain="true"onclick="searchByName()"> 查询 </a>
		</div>
	</div>
<div id="datagrid" style="width: 100%; height: 100%"></div>
<input id="ruleNum_value" value="">
<jsp:include page="./detRuleDefinition.jsp"></jsp:include>
</body>
</html>