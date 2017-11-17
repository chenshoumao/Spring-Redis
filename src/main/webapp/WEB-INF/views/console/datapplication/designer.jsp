<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>表单应用库-设计</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/scripts/console/datapp_designer.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="datAppId" value="${appid }" />
	<input type="hidden" id="datAppName" value="${appname }" />
	<input type="hidden" id="datAppTitle" value="${apptitle }" />
	<div data-options="region:'west',split:true,title:'设计端导航'" 
		style="width:200px">
		<ul class="easyui-tree" id="navtree"></ul>
	</div>
	<div data-options="region:'center'">
		<iframe id="iframe1" width="100%" scrolling="auto" height="100%" frameborder="0"></iframe>
	</div>
</body>
</html>