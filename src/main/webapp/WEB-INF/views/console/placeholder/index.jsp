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
	src="${pageContext.request.contextPath}/scripts/console/ctpl/placeholder_index.js"></script>
</head>

<body>
	<input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />
	<div id="toolbar">
		<div>
			<a href="javascript:void(0)" iconCls="icon-add"
				class="easyui-linkbutton " plain="true"
				onclick="openPlaceholderDlg()"> 添加 </a> <a
				href="javascript:void(0)" iconCls="icon-remove"
				class="easyui-linkbutton " plain="true"
				onclick="destroy()"> 删除 </a> 
				<a href="javascript:void(0)" class="easyui-linkbutton " plain="true">占位符名称:</a>
				<input type="text" id="name" style="width: 150px;">
			 <a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="searchByName()"> 查询 </a>


		</div>
	</div>

	<div id="datagrid" style="width: 100%; height: 100%"></div>


	<div id="placeholder_dlg" class="easyui-dialog"
		style="width: 700px; height: 450px;" closed="true"
		buttons="#placeholder_dlg_buttons" modal="true">
		
			<form id="fm" method="post" style="padding:0px;">
			<div class="easyui-tabs" style="width:auto; height:auto" id="tabpanel">
				<div title="占位符配置" style="padding:10px;" id="tab1">
					<table class="prop_table" style="border-collapse:separate;border-spacing:20px;">
				 		<tr>
				 			<th>占位符名称:(<span style="color:red">*</span>)</th>
				 			<td><input name="placeHolderId" type="hidden" />
				 			<input class="easyui-textbox" type="text" name="placeHolderName" id="placeHolderName" 
				 				style="width:300px" data-options="required:true"></input></td>
				 		</tr>
				 		<tr>
				 			<th>占位符公式:(<span style="color:red">*</span>)</th>
				 			<td><input required="true" class="easyui-textbox" type="text" name="formula" id="formula" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>占位符描述:</th>
				 			<td><textarea id="description" name="description" style="width:300px; height:50px"></textarea></td>
				 		</tr>
				 		<tr>
				 			<th>创建时间:</th>
				 			<td><div id="createTime"></div></td>
				 		</tr>
				 		<tr>
				 			<th>创建人:</th>
				 			<td><div id="creator"></div></td>
				 		</tr>
				 		<tr>
				 			<th>更新时间:</th>
				 			<td><div id="updateTime"></div></td>
				 		</tr>
				 		<tr>
				 			<th>更新人:</th>
				 			<td><div id="updateBy"></div></td>
				 		</tr>
				 	</table>
				</div>
				</div>
				</form>
			</div> 
		
	<div id="placeholder_dlg_buttons">
		<a id="placeholder_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok"
			onclick="createOrUpdate()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#placeholder_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>