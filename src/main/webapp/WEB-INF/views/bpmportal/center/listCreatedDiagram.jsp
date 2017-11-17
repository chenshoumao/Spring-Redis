<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我创建的流程图列表</title>
<jsp:include page="../resources.jsp"></jsp:include>

<script type="text/javascript"
		src="${pageContext.request.contextPath}/bpmportal/scripts/center/listCreatedDiagram.js"></script>
</head>
<body>
<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
<div id="datagrid" style="width: 100%; height: 100%"></div>
</body>
</html>