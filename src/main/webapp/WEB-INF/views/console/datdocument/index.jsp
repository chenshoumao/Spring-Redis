<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>文档列表</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<script type="text/javascript">
	$(function() {
		$("a[name=deldoc]").click(function(evt) {
			if (!confirm("是否删除该文档？")) {
				evt.preventDefault();
				return false;
			}
		});
	});
	</script>
</head>
<body>
	<table border="1" cellpadding="1" cellspacing="1" style="width:100%">
		<tr>
			<th>文档ID</th>
			<th>表单名称</th>
			<th>创建时间</th>
			<th>更新时间</th>
			<th>用户操作</th>
		</tr>
		<c:forEach var="data" items="${docList}">
		<tr>
			<td><c:out value="${data.documentId}" /></td>
			<td><c:out value="${data.formName}" /></td>
			<td><c:out value="${data.createTime}" /></td>
			<td><c:out value="${data.updateTime}" /></td>
			<td>
				<a href="${pageContext.request.contextPath }/console/datdoc/edit/<c:out value="${data.datApplication.appId}" />/<c:out value="${data.documentId}" />.xsp" target="_blank">编辑</a>
				<a name="deldoc" href="${pageContext.request.contextPath }/console/datdoc/delete/<c:out value="${data.datApplication.appId}" />/<c:out value="${data.documentId}" />.action">删除</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>