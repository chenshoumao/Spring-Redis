<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="${pageContext.request.contextPath}/images/LOGO.ico" rel="shortcut icon"
	type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/ctpl/contentTpl_index.js"></script>
</head>

<body>
	<input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />
	<div id="toolbar">
		<div>
			<a href="javascript:void(0)" iconCls="icon-add"
				class="easyui-linkbutton " plain="true"
				onclick="openContentTemplateDlg()"> 添加 </a> <a
				href="javascript:void(0)" iconCls="icon-remove"
				class="easyui-linkbutton " plain="true"
				onclick="destroy()"> 删除 </a> 
				模板名称:<input type="text" id="name" style="width: 150px;">
				模板编号：<input type="text" id="ctplCode" style="width: 150px;">
			<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="searchByName()"> 查询 </a>


		</div>
	</div>
	<jsp:useBean id="dtnow" class="java.util.Date" />
	<div id="datagrid" style="width: 100%; height: 100%"></div>

	<div id="contentTemplate_dlg" class="easyui-dialog"
		style="width: 800px; height: 500px;" closed="true"
		buttons="#contentTemplate_dlg_buttons" modal="true">
		
			<form id="fm" method="post" style="padding:0px">
			<div class="easyui-tabs" style="width:auto; height:420px" id="tabpanel">
				 <div title="模板配置" style="padding:5px" id="tab1">
					<table class="prop_table" align="left" style="border-collapse:separate;border-spacing:10px;margin-left:65px;">
				 		<tr>
				 			<th>模板名称:(<span style="color:red">*</span>)</th>
				 			<td><input name="ctplId" type="hidden" />
				 			&nbsp;<input class="easyui-textbox" type="text" name="ctplName" id="ctplName" 
				 				style="width:400px" data-options="required:true"></input></td>
				 		</tr>
				 		<tr>
				 			<th>模板编号:(<span style="color:red">*</span>)</th>
				 			<td>&nbsp;<input required="true" class="easyui-textbox" type="text" name="ctplCode" id="ctplCode" style="width:400px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题:</th>
				 			<td>&nbsp;<input class="easyui-textbox" type="text" name="title" id="title" style="width:400px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</th>
				 			<td></td>
				 		</tr>
				 		<tr>
				 			<th></th>
				 			<td><textarea id="description" name="description" style="width:404px; height:70px"></textarea></td>
				 		</tr>
				 		<tr>
				 			<th>创建时间:</th>
				 			<td><div id="createTime"></div></td>
				 		</tr>
				 		<tr>
				 			<th>创建人:</th>
				 			<td><div id="creator"></td>
				 		</tr>
				 		<tr>
				 			<th>更新时间:</th>
				 			<td><div id="updateTime"></div></td>
				 		</tr>
				 		<tr>
				 			<th>更新人:</th>
				 			<td><div id="updateBy"></td>
				 		</tr>
				 	</table>
				</div>
				
				<div title="模板内容" style="padding:5px" id="tab2">
					<div style="float:left">内容:</div>
					<div style="float:left;padding-left:540px;">
						占位符选择：
						<select id="placeholder_selector">
				 			<option selected="selected" value="">--请选择--</option>
						</select>
					</div>
					<div><textarea id="textContent" name="textContent" style="width:100%; height:365px"></textarea></div>
				</div> 
				</div>
				</form>
			</div> 
		
	<div id="contentTemplate_dlg_buttons">
		<a id="contentTemplate_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok"
			onclick="createOrUpdate()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#contentTemplate_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>