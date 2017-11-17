<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>表单应用库</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/console/pagetable.css">
	<script src="${pageContext.request.contextPath}/scripts/console/datapp_index.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/scripts/console/zipFileImport.js" type="text/javascript"></script>
</head>
   <input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="datAppId" value="" />
	<input type="hidden" id="_dataGridId" value="grid1" />
<jsp:include page="./datAppAclIndex.jsp"></jsp:include> 
<body class="easyui-layout">
	<div data-options="region:'center'">
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<table id="grid1" class="easyui-datagrid">
	        <thead>
	            <tr>
	            	<th field="appId" checkbox="true"></th>
	                <th field="appName" width="15%">应用库名称</th>
	                <th field="appTitle" width="25%">应用库标题</th>
	                <th field="createTime" width="25%" formatter="gridDateFmt">创建时间</th>
	                <th field="creatorName" width="15%">创建人</th>
	                <th field="c1" width="30" formatter="rowDesignFmt">表单</th>
	              <!--   <th field="c2" width="30" formatter="rowRunFmt">视图</th> -->
	            </tr>
	        </thead>
   		</table>
   		<div id="toolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnnew" iconCls="icon-add" plain="true">新建</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btndel" iconCls="icon-remove" plain="true">删除</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnExport" iconCls="icon-print" plain="true">导出</a>
	        <a href="javascript:void(0)"   id="zipFileImport"  class="easyui-linkbutton"  iconCls="icon-mini-add" plain="true">导入</a>
	         <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="authority_dlg();"iconCls="icon-reload" plain="true">权限</a>
	    </div>
	</div>
	<div id="dlgDatApp" class="easyui-dialog" style="width: 570px; height: 478px"
		 closed="true" buttons="#dlg-buttons"  modal="true">
		 <form id="form1" method="post">
		 	<input type="hidden" id="appId" name="appId" />
		 	<table class="prop_table">
		 		<tr>
		 			<th>应用库名称(<span style="color:red">*</span>)</th>
		 			<td><input class="easyui-textbox" type="text" name="appName" id="appName" 
		 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[2,10]}"></input></td>
		 		</tr>
		 		<tr>
		 			<th>应用库标题(<span style="color:red">*</span>)</th>
		 			<td><input class="easyui-textbox" type="text" name="appTitle" id="appTitle" style="width:300px" data-options="required:true"></input></td>
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
</body>
</html>