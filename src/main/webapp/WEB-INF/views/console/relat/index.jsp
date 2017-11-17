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
							url : '${pageContext.request.contextPath}/console/relat/shows.action',
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
										field : 'relationId',
										title : '信息id',
										width : 100,
										align : 'center',
										hidden : true
									},
									{
										field : 'relationName',
										title : '关系名',
										width : 200,
										align : 'center',
									//hidden : true
									},
									{
										field : 'relationCode',
										title : '关系编码',
										width : 200,
										align : 'center',
									},

									/* {
										field : 'roleCode',
										title : '角色编码',
										width : 200,
										align : 'center'
									}, */
									{
										field : 'relationCls',
										title : '实现类名',
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
			$('#rela_dlg').dialog('open').dialog('setTitle', ' ');
			$('#fm').form('clear');
			$('#fm').form('load', row);
			
		
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
											relationIds : []
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.relationIds.push(rows[i].relationId);
									}
									$
											.ajax({
												url : "${pageContext.request.contextPath}/console/relat/delete.action",
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
	
	</div>
	<jsp:include page="./add.jsp"></jsp:include>
	<jsp:include page="./permission.jsp"></jsp:include>
</body>
</html>