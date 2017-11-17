<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.gzsolartech.smartforms.constant.OperationType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>错误日志记录</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/scripts/console/syserrorlog_index.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<table class="easyui-datagrid" id="grid1">
			<thead>
				<tr>
					<th data-options="field:'logType',width:'10%',formatter:gridLogTypeFmt">日志类别</th>
					<th data-options="field:'logAction',width:'40%'">日志描述</th>
					<th data-options="field:'operateMan',width:'15%'">处理人</th>
					<th data-options="field:'createTime',width:'15%',formatter:gridDateFmt">处理时间</th>
					<th data-options="field:'ipAddr',width:'15%'">IP地址</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar1" style="padding:5px;height:auto">
			<div>
				开始日期: <input class="easyui-datebox" name="sdate" id="sdate" value="${sdate }" />
				结束日期: <input class="easyui-datebox" name="edate" id="edate" value="${edate }" />
				日志类型: 
				<select class="easyui-combobox" panelHeight="auto" id="optrtype">
					<option value="all">全部</option>
					<option value="<%=OperationType.APPLICATION_ACL_OPTR %>">应用库权限</option>
					<option value="<%=OperationType.APPLICATION_OPTR %>">应用库</option>
					<option value="<%=OperationType.DOCUMENT_ACTION_OPTR %>">文档修改更新</option>
					<option value="<%=OperationType.DOCUMENT_ACL_OPTR %>">文档权限</option>
					<option value="<%=OperationType.ORGANIZE_ACTION_OPTR %>">组织库</option>
					<option value="<%=OperationType.DET_FORM_ACTION_OPTR %>">表单修改更新</option>
					<option value="<%=OperationType.LOGIN_ACTION_OPTR %>">系统登录</option>
					<option value="<%=OperationType.BPM_ROUTING_OPTR %>">流程路由</option>
					<option value="<%=OperationType.BPM_INSTANCE_OPTR %>">流程实例</option>
				</select>
				<a href="javascript:void(0);" class="easyui-linkbutton" id="btnsearch" iconCls="icon-search">查询</a>
				<a href="javascript:void(0);" class="easyui-linkbutton" id="btnclear" iconCls="icon-clear">清除</a>
			</div>
		</div>
	</div>
</body>
</html>