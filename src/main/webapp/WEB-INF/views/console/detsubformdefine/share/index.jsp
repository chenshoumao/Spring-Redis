<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>子表单列表</title>
	<jsp:include page="../../resources.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/scripts/console/detShareSubformdef/index.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/scripts/console/zipFileImport.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="datAppId" value="${appid }" />
	<input type="hidden" id="_dataGridId" value="grid1" />
	<div data-options="region:'center'">
		<table id="grid1" class="easyui-datagrid">
	        <thead>
	            <tr>
	            	<th field="subformId" checkbox="true"></th>
	                <th field="subformName" width="20%">子表单名称</th>
	                <th field="description" width="25%">说明</th>
	                <th field="createTime" width="15%" formatter="gridDateFmt">创建时间</th>
	                <th field="creatorName" width="10%">创建人</th>
	                <th field="updateTime" width="15%" formatter="gridDateFmt">更新时间</th>
	                <th field="updateByName" width="10%">更新人</th>
	            </tr>
	        </thead>
   		</table>
   		<div id="toolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnnew" iconCls="icon-add" plain="true">新建</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btndel" iconCls="icon-remove" plain="true">删除</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" id="subFormExport" iconCls="icon-print" plain="true">导出</a>
	     <a href="javascript:void(0)"   id="zipFileImport"  class="easyui-linkbutton"  iconCls="icon-mini-add" plain="true">导入</a>
	    	 <a href="${pageContext.request.contextPath}/console/help/taglib.xsp" target="_blank" class="easyui-linkbutton" id="btndel" iconCls="icon-help" plain="true">帮助文档</a>
	    </div>
	</div>
	<div id="dlgFormDef" class="easyui-window" style="width: 800px; height: 500px"
		 closed="true" modal="true" collapsible="false" minimizable="false">
		
		 <iframe id="iframe1" width="100%" height="100%" frameborder="0"></iframe>
       
	</div>
</body>
</html>