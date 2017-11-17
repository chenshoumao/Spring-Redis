<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">
	//TODO   初始化加载开始
	$(function() {
		$('#dg')
				.treegrid(
						{
							parentField :'parentDeptNum',
							title : '',
							url : '${pageContext.request.contextPath}/console/department/shows.action',
							height : "100%",
							method : 'POST',
							striped : true,
							nowrap : true,
							fit : true,
							singleSelect : false,
							checkOnSelect : false,
							selectOnCheck : false,
							idField : 'deptNum',
							treeField : 'deptName',
							loadMsg : '数据加载中请稍后……',
							toolbar : "#toolbar",
							columns : [ [
									{
										field : 'ck',
										checkbox : true
									},
									{
										title : '部门id',
										field : 'deptNum',
										hidden:true,
										width : 100
									},
									{
										title : '上级部门',
										field : 'parentDeptNum',
										hidden:true,
										width : 100
									},
									{
										title : '部门名称',
										field : 'deptName',
										width : 300
									},
									{
										field : 'deptLeaderName',
										title : '部门领导人',
										width : 200
									},
										{
										field : 'deptLeader',
										title : '部门领导人',
										hidden:"true",
										width : 200
									},
									
									{
										field : 'createTime',
										title : '创建时间',
										width : 150,
										formatter : function(value, rec, index) {
											var s = new Date(value)
													.pattern("yyyy-MM-dd hh:mm:ss");
											return s;
										}
									},
									{
										field : 'creator',
										title : '创建者',
										width : 150
									},
									{
										field : 'updateTime',
										title : '最后更新时间',
										width : 150,
										formatter : function(value, rec, index) {
											var s = new Date(value)
													.pattern("yyyy-MM-dd hh:mm:ss");
											return s;
										}
									}, {
										field : 'updateBy',
										title : '更新者',
										width : 150
									} ] ],
							onSelect : function(rowData) {
								$('#dg').treegrid("unselectAll");
							},
							onDblClickRow : function(rowData) {
							if(rowData.parentDeptNum=="0"){
							editDepartment(rowData,"顶级部门");
							}else{
							var parentNode=$(this).treegrid('getParent', rowData.deptNum);
							var deptName=parentNode.deptName;
						    editDepartment(rowData,deptName);
							}
							}
						});

	});

	function destroyDepartment() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length > 0) {
			$.messager
					.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var departmentIds = [];
									var jsonData = {
										departmentIds : []
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.departmentIds
												.push(rows[i].deptNum);
									}
									$
											.ajax({
												url : "${pageContext.request.contextPath}/console/department/delete.action",
												type : "post",
												data : jsonData,
												dataType : "json",
												success : function(result) {
													if (result.state == true) {
														$('#dg').treegrid(
																'load');
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

	function editDepartment(row,deptName) {
		if (row) {
			$('#department_dlg').dialog('open').dialog('setTitle', ' ');
			$('#fm').form('clear');
			console.log(row);
			$('#fm').form('load', row);
           $("#parentOrgDepartment").textbox('setValue',deptName);
		}
	}
</script>
</head>
<body>
	<div id="dg" style="width: 100%; height: 100%"></div>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="openDlg()">创建</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyDepartment()">删除</a>
	</div>
		
	<jsp:include page="./add.jsp"></jsp:include>

</body>
</html>