<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- /* 带权限控制的系统元数据管理页面 */ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=basePath%>images/LOGO.ico" rel="shortcut icon"
	type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<jsp:include page="../resources.jsp"></jsp:include>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/datSystemMeta/ownerIndex.js"></script>
<style type="text/css">
.fitem label {
	display: inline-block;
	width: 110px;
}
</style>
</head>
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}"/>
<body class="easyui-layout">
		 <div class="easyui-layout" data-options="fit:true">   
            <div data-options="region:'west',split:true,title:'元数据类目'" style="width:180px">
				<jsp:include page="./ownerSystemMetaCata.jsp" />
            </div>  
	         <div data-options="region:'center'" class="center">
				<div id="tabs" class="easyui-tabs" fit="true" border="false">
					<iframe  id="iframe_systemMeta"src="${pageContext.request.contextPath}/console/systemMeta/getOwnerSystemMetas.xsp" 
				      allowTransparency="true" scrolling="auto" width="100%" height="98%"
						frameBorder="0" name=""></iframe>
				</div>
			</div> 
        </div>   
</body>
</html>