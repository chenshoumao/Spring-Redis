<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.gzsolartech.smartforms.utils.DateFmtUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../resources.jsp"></jsp:include>
<title>流程业务办公平台</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

#baseContainer {
	width: 100%;
}

#contentPanel {
	width: 95%;
	margin: 0px auto;
}

#leftBar {
	width: 160px;
	height: 500px;
	background-color: #f6f6f6;
	color: #666;
	float: left;
}

.leftTitle {
	height: 50px;
	background-color: #1d84dd;
	color: white;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	font-weight: bold;
}

#leftBar li {
	height: 40px;
	line-height: 40px;
	font-size: 14px;
	text-align: center;
	font-weight: bold;
}

#leftBar li a {
	font-size: 14px;
	text-align: center;
	color: #666;
	text-decoration: none;
}

#contentList {
	float: left;
	width: 80%;
	height: 1000px;
	margin-left: 50px;
}

#contentList thead {
	color: white;
	background-color: #1f8cdc;
	height: 50px;
}

#contentList thead tr {
	color: white;
	background-color: #1f8cdc;
	height: 35px;
}

#contentList tbody tr {
	height: 40px;
}
</style>
</head>
<body>
	<div id="baseContainer">
		<div style="height: 30px; border-bottom: solid 2px #0065b1"></div>
		<div id="contentPanel">
			<div id="leftBar">
				<p class="leftTitle">测试流程1</p>
				<ul>
					<li><a href="index.xsp">我的待办</a></li>
					<li><a
						href="${pageContext.request.contextPath}/console/template/engine/openform/appid:95be00fc-e61d-45ee-9729-0b81220503a4/formid:39a81a69-32f0-41f5-9322-3bbe47c6d402.xsp"
						target="_blank">起草申请</a></li>
				</ul>
			</div>
			<div id="contentList">
				<table width="100%" cellpadding="0" cellspacing="0">
					<thead>
						<tr>
							<th>标题</th>
							<th>当前状态</th>
							<th>申请人</th>
							<th>申请时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${data}" varStatus="status">
							<tr>
								<th><a target="_blank"
									href="${pageContext.request.contextPath}/console/template/engine/opendocument/${item.appId}/${item.documentId}.xsp?mode=edit&taskId=${item.taskId}">
									
									<c:if test="${empty item.docTitle}">
									无标题
									</c:if>
										<c:if test="${!empty item.docTitle}">
									${item.docTitle}
									</c:if>
									</a></th>
								<th>${item.taskActivityName}</th>
								<th>${item.creatorName}</th>
								<th>${item.instanceCreateDate}</th>
							</tr>
						</c:forEach>
				</table>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>