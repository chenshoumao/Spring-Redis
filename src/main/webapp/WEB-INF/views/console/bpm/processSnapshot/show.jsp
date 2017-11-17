<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../../resources.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/processSnapshot/show.js"></script>
</head>
   <input type="hidden" id="workflowCataId" value="${workflowCataId}" />
   <input type="hidden" id="basePath"  value="${pageContext.request.contextPath}" />
<body>

	<div id="toolbar">
		<div>
			  <a href="javascript:void(0)"  class="easyui-linkbutton " plain="true">
			  流程名称: </a> <input type="text"id="name" style="width: 150px;">
			 
			  <a href="javascript:void(0)"class="easyui-linkbutton " plain="true" onclick="searchByName()">
				查询
				</a>
				
		</div>
	</div>
	
	<div id="datagrid" style="width: 100%; height: 100%"></div>


</body>
</html>