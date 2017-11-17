<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/frameset.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/wfAuthorizationRule/process.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<input type="hidden" id="workflowCataId" value="${workflowCataId}" />
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}" />
<input type="hidden" name="authorizationRuleId" id="authorizationRuleId" value="${authorizationRuleId}">
<body>
	<div id="datagrid" style="width: 100%; height:100%"></div>
</body>
</html>