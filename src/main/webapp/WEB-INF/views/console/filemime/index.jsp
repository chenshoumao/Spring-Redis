<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>附件MIME类型管理</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/console/pagetable.css">
	<script src="${pageContext.request.contextPath}/scripts/console/filemime_index.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
	<div data-options="region:'center'">
		<table id="grid1" class="easyui-datagrid">
	        <thead>
	            <tr>
	            	<th field="mimeId" checkbox="true"></th>
	                <th field="fileExtName" width="20%">文件扩展名</th>
	                <th field="mimeType" width="70%">MIME类型</th>
	            </tr>
	        </thead>
   		</table>
   		<div id="toolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnnew" iconCls="icon-add" plain="true">新建</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btndel" iconCls="icon-remove" plain="true">删除</a>
	    </div>
	    
	    <div id="dlgDatMime" class="easyui-dialog" style="width: 570px; height: 478px"
		 closed="true" buttons="#dlg-buttons"  modal="true">
		 <form id="form1" method="post">
		 	<input type="hidden" id="mimeId" name="mimeId" />
		 	<table class="prop_table">
		 		<tr>
		 			<th>文件扩展名(<span style="color:red">*</span>)</th>
		 			<td><input class="easyui-textbox" type="text" name="fileExtName" id="fileExtName" 
		 				style="width:300px" data-options="required:true"></input></td>
		 		</tr>
		 		<tr>
		 			<th>MIME类型(<span style="color:red">*</span>)</th>
		 			<td><input class="easyui-textbox" type="text" name="mimeType" id="mimeType" 
		 				style="width:300px" data-options="required:true"></input></td>
		 		</tr>
		 	</table>
		 </form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnsave"
			iconCls="icon-ok" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="dlg_btncancel"
			iconCls="icon-cancel" style="width: 90px">取消</a>
	</div>
	</div>
</body>
</html>