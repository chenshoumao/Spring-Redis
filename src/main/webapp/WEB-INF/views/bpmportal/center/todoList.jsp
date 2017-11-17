<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>待办中心</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/bpmportal/scripts/center/todoList.js"></script>
</head>
<body class="easyui-layout">
	<input type="hidden" id="ctxPath"
		value="${pageContext.request.contextPath }" />
	<div data-options="region:'center',title:'待办中心'">
		<table id="grid1" class="easyui-datagrid">
			<thead>
				<tr>
					<th field="docTitle" width="50%" formatter="gridOpenLinkFmt">标题</th>
					<th field="taskName" width="15%">当前状态</th>
					<th field="creatorName" width="15%">申请人</th>
					<th field="createTime" width="20%" formatter="gridDateFmt">申请时间</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>