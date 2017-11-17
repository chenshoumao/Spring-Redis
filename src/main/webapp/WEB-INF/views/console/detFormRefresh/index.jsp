<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>表单统一初始化</title>
<jsp:include page="../resources.jsp"></jsp:include>

<style type="text/css">
#fm {
	margin: 0;
	padding: 0px 0px;
}
</style>
<script type="text/javascript">
	//加载流程与表单的映射数据
	function datagrid() {
		$('#dg')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/form/refresh/findByPage.action',
							method : 'POST',
							striped : true,
							nowrap : true,
							pageSize : 20,
							pageNumber : 1,
							pageList : [ 10, 20, 30, 40, 50 ],
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
								field : 'refreshId',
								title : 'refreshId',
								width : 100,
								align : 'center',
								hidden : true
							}, {
								field : 'host',
								title : '服务器地址',
								width : 300,
								align : 'center'
							}, {
								field : 'context',
								title : 'WEB上下文',
								width : 300,
								align : 'center'
							}, {
								field : 'port',
								title : '端口',
								width : 200,
								align : 'center'
							} ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							},
							onDblClickRow : function(rowIndex, rowData) {
								edit(rowData);
							}
						});
	}

	//编辑
	function edit(row) {
		if (row) {
			$('#config_dlg').dialog('open').dialog('setTitle', ' ');
			$('#fm').form('clear');
			$('#fm').form('load', row);
		}
	}

	//打开新建对话框
	function openDlg() {
		$('#config_dlg').dialog('open').dialog('setTitle', ' ');
		$('#fm').form('clear');
	}

	//保存信息
	function save() {
		var values = $("#fm").serialize();
		if ($("#fm").form('validate')) {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/console/form/refresh/createOrUpdate.action",
						type : "post",
						data : values,
						dataType : "json",
						success : function(result) {
							if (result.state == true) {
								$('#dg').datagrid('reload');
								$('#config_dlg').dialog('close')
							} else {
								$.messager.show({ // show error message
									title : '温馨提示',
									msg : result.msg
								});
							}
						}
					});
		}
	}

	//删除
	function destroy() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length > 0) {
			$.messager
					.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var jsonData = {
										refreshIds : []
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.refreshIds
												.push(rows[i].refreshId);
									}
									$
											.ajax({
												url : "${pageContext.request.contextPath}/console/form/refresh/delete.action",
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

	//初始化表单
	function initAllForm() {
		$.messager.progress({
			title : '提示',
			msg : '表单初始化中，请稍候……',
			text : ''
		});
		$.ajax({
					url : "${pageContext.request.contextPath}/console/form/refresh/initAllForm.action",
					type : "post",
					dataType : "json",
					timeout:9000000,
					error : function() {
						$.messager.progress('close');
					},
					complete : function() {
						$.messager.progress('close');
					},
					success : function(result) {
						if (result.state == true) {
							$.messager.show({ // show error message
								title : '温馨提示',
								msg : "全部表单已初始化完成"
							});
						} else {
							$.messager.show({ // show error message
								title : '温馨提示',
								msg : result.msg
							});
						}
					}
				});
	}

	$(function() {
		datagrid();
	});
</script>
</head>
<body>
	<input type="hidden" id="ctxPath"
		value="${pageContext.request.contextPath }" />
	<input type="hidden" id="datAppId" value="" />
	<input type="hidden" id="_dataGridId" value="dg" />
	<div id="dg" style="width: 100%; height: 100%"></div>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="openDlg()">创建</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroy()">删除</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-mini-refresh" plain="true" onclick="initAllForm()">初始化全部表单</a>

	</div>

	<div id="config_dlg" class="easyui-dialog"
		style="width: 500px; height: 350px;" closed="true"
		buttons="#config_dlg_buttons" modal="true">
		<form action="#" method="post" id="fm">
			<div id="scriptTabs" class="easyui-tabs"
				style="width: 100%; height: 270px">
				<div title="配置" style="padding: 30px">
					<input id="refreshId" name="refreshId" type="hidden">
					<div class="fitem">
						<label>流服务器地址</label> <input class="easyui-textbox" id="host"
							style="width: 280px;" required="true" name="host" /> <span
							style="color: red">*</span>
					</div>
					<br>
					<div class="fitem">
						<label>WEB上下文</label> <input class="easyui-textbox" id="context"
							style="width: 280px;" required="true" name="context" /> <span
							style="color: red">*</span>
					</div>
					<br>
					<div class="fitem">
						<label>端口</label> <input class="easyui-textbox" id="port"
							style="width: 280px;" required="true" name="port" /> <span
							style="color: red">*</span>
					</div>
				</div>
			</div>
	</div>
	</form>
	</div>

	<div id="config_dlg_buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save()" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#config_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>