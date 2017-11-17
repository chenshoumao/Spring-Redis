<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/frameset.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/console/formPrototype/index.js" type="text/javascript"></script>
	
</head>
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}" />
<div id="toolbar">
	<div>
		<a href="javascript:void(0)" iconCls="icon-add"
			class="easyui-linkbutton " plain="true"
			onclick="newPrototype()">创建 </a> <a
			href="javascript:void(0)" iconCls="icon-remove"
			class="easyui-linkbutton " plain="true"
			onclick="destroy()"> 删除 </a>
			 <a
			href="javascript:void(0)" class="easyui-linkbutton " plain="true">
			标题/编码:</a> <input type="text" id="name" style="width: 150px;">
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="searchByName()"> 查询 </a>
	</div>
</div>
<div id="datagrid" style="width: 100%; height: 100%"></div>
</body>
</html>