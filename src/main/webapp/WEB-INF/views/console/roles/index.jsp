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
	function datagrid(name) {
		$('#dg')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/role/shows.action',
							method : 'POST',
							queryParams : {
								"name" : name
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
										field : 'roleNum',
										title : '角色id',
										width : 100,
										align : 'center',
										hidden : true
									},
									{
										field : 'appTitle',
										title : 'appTitle',
										width : 100,
										align : 'center',
										hidden : true
									},

									{
										field : 'roleCode',
										title : '角色编码',
										width : 200,
										align : 'center'
									},
									{
										field : 'roleName',
										title : '名称',
										width : 200,
										align : 'center'
									},
									{
										field : 'roleType',
										title : '角色类型',
										width : 200,
										align : 'center'
									},
									{
										field : 'creator',
										title : '创建者',
										width : 200,
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
										width : 200,
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
									} ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							},
							onDblClickRow : function(rowIndex, rowData) {
								editRole(rowData);
							}
						});
	}
	function editRole(row) {
		if (row) {
			$('#role_dlg').dialog('open').dialog('setTitle', ' ');
			$('#fm').form('clear');
			$('#fm').form('load', row);
			var appTitle = row.appTitle;
			var opts = "";
			if (appTitle != null) {
				var titles = appTitle.split(";");
				for (var i = 0; i < titles.length; i++) {
					opts += "<option value='"+titles[i]+"' style='margin-top: 4px;'>"
							+ titles[i] + "</option>";
				}
			}

			$("#appName")
					.html(
							"<label>已使用于应用库:</label>&nbsp;<select disabled='disabled' multiple='multiple' style='width:283px;height:100px'>"
									+ opts + "</select>");
		}
	}
	function destroyDepartment() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length > 0) {
			$.messager
					.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var jsonData = {
										roleIds : []
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.roleIds.push(rows[i].roleNum);
									}
									$
											.ajax({
												url : "${pageContext.request.contextPath}/console/role/delete.action",
												type : "post",
												data : jsonData,
												dataType : "json",
												success : function(result) {
													if (result.state == true) {
														$('#dg').datagrid(
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

	$(function() {
		datagrid("");

	});
</script>
</head>
<body>
	<div id="dg" style="width: 100%; height: 100%"></div>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="openDlg()">创建</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyDepartment()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="open_permission_dlg()"> 权限 </a>
	</div>
	<jsp:include page="./add.jsp"></jsp:include>
	<jsp:include page="./permission.jsp"></jsp:include>
</body>
</html>