<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表单列表</title>
<jsp:include page="../resources.jsp"></jsp:include>
<script
	src="${pageContext.request.contextPath}/scripts/console/detformdef_index.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/scripts/console/zipFileImport.js"
	type="text/javascript"></script>

</head>
<body class="easyui-layout">
	<input type="hidden" id="ctxPath"
		value="${pageContext.request.contextPath }" />
	<input type="hidden" id="datAppId" value="${appid }" />
	<div data-options="region:'center'">
		<table id="grid1" class="easyui-datagrid">
			<thead>
				<tr>
					<th field="formId" checkbox="true"></th>
					<th field="formName" width="10%">表单名称</th>
					<th field="formTitle" width="10%">表单标题</th>
					<th field="formSqlViewName" width="15%">表单视图名称</th>
					<th field="description" width="10%">说明</th>
					<th field="createTime" width="15%" formatter="gridDateFmt">创建时间</th>
					<th field="creatorName" width="5%">创建人</th>
					<th field="updateTime" width="15%" formatter="gridDateFmt">更新时间</th>
					<th field="updateByName" width="5%">更新人</th>
					<th field="c1" width="5%" formatter="gridOpenLinkFmt"></th>
				</tr>
			</thead>
		</table>
		<div id="toolbar">
			<a href="javascript:void(0)" class="easyui-linkbutton" id="btnnew"
				iconCls="icon-add" plain="true">新建</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" id="btncopy"
				iconCls="icon-redo" plain="true">拷贝</a> 
			<!-- 	<a href="javascript:void(0)"
				class="easyui-linkbutton" id="btnnewTmp" iconCls="icon-remove"
				plain="true">模板</a> -->
				<a href="javascript:void(0)"
				class="easyui-linkbutton" id="importPrototypeBtn" iconCls="icon-mini-add"
				plain="true">导入表单原型</a>
				 <a href="javascript:void(0)"
				class="easyui-linkbutton" id="btndel" iconCls="icon-remove"
				plain="true">删除</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" id="btnFormExport" iconCls="icon-print"
				plain="true">导出</a> <a href="javascript:void(0)" id="zipFileImport"
				class="easyui-linkbutton" iconCls="icon-mini-add" plain="true">导入</a>
			<!-- <a href="javascript:void(0)" id="copyForm" class="easyui-linkbutton"
				iconCls="icon-mini-add" plain="true">拷贝</a> --> <a
				href="${pageContext.request.contextPath}/console/help/taglib.xsp"
				target="_blank" class="easyui-linkbutton" id="btndel"
				iconCls="icon-help" plain="true">帮助文档</a>

		</div>
	</div>
	<div id="dlgFormDef" class="easyui-window"
		style="width: 1100px; height: 600px" closed="true" modal="true"
		collapsible="false" minimizable="false">
		<iframe id="iframe1" width="100%" height="100%" frameborder="0"></iframe>
	</div>

	<div id="dlgFormProtype" class="easyui-window"
		style="width: 600px; height: 300px" closed="true" modal="true"
		collapsible="false" minimizable="false">
		<iframe id="iframeProtype" width="100%" height="100%" frameborder="0"></iframe>
	</div>
	
	
	<div id="form_copy_dlg" class="easyui-dialog"
		style="width: 500px; height: 300px;" closed="true"
		buttons="#form_copy_dlg_buttons" modal="true">
		<form action="#" method="post" id="copyFm">
		<div style="padding:15px;">
		<input type="hidden" id="sourceFormId" name="sourceFormId">
			<div class="fitem">
				<label>源表单名称:
				</label><span id="sourceFormName"></span>
			</div>
			<br>
			<div class="fitem">
				<label>源表单标题:
				</label><span id="sourceTitle"></span>
			</div>
			<br>
			<div class="fitem">
				<label>目标表单名称(<span style="color: red">*</span>)
				</label> <input class="easyui-textbox" type="text" name="formName"
					id="formName" style="width: 300px"
					data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,15]}"></input>
			</div>
			<br>
			<div class="fitem">
				<label>目标表单标题</label> <input class="easyui-textbox" type="text"
					name="formTitle" id="formTitle" style="width: 300px"></input>
			</div>
			</div>
		</form>
	</div>
	<div id="form_copy_dlg_buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" id="form_copy_dlg_saveBtn" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#form_copy_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>