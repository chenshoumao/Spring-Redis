<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>视图列表</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/styles/console/pagetable.css">
	<script src="${pageContext.request.contextPath}/scripts/console/detview_index.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<table id="grid1" class="easyui-datagrid">
	        <thead>
	            <tr>
	            	<th field="viewId" checkbox="true"></th>
	                <th field="viewName" width="15%">视图名称</th>
	                <th field="viewTitle" width="15%">视图标题</th>
	                <th field="createTime" width="18%" formatter="gridDateFmt">创建时间</th>
	                <th field="creatorName" width="10%">创建人</th>
	                <th field="updateTime" width="18%" formatter="gridDateFmt">更新时间</th>
	                <th field="updateByName" width="10%">更新人</th>
	                <th field="col1" widht="10%" formatter="gridOpenLinkFmt"></th>
	            </tr>
	        </thead>
   		</table>
   		<div id="toolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnnew" iconCls="icon-add" plain="true">新建</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" id="btndel" iconCls="icon-remove" plain="true">删除</a>
	    </div>
	    <div id="dlgNewView" class="easyui-dialog" style="width: 570px; height: 478px"
			closed="true" buttons="#dlg-buttons"  modal="true">
			<form id="form1" method="post">
			 	<input type="hidden" id="datAppId" value="${appid }" name="datApplication.appId" />
				<input type="hidden" id="datAppName" value="${appname }" />
			 	<table class="prop_table">
			 		<tr>
			 			<th>视图名称(<span style="color:red">*</span>)</th>
			 			<td><input class="easyui-textbox" type="text" name="viewName" id="viewName" 
			 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,25]}"></input></td>
			 		</tr>
			 		<tr>
			 			<th>视图标题(<span style="color:red">*</span>)</th>
			 			<td><input class="easyui-textbox" type="text" name="viewTitle" id="viewTitle" style="width:300px" data-options="required:true"></input></td>
			 		</tr>
			 	</table>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnsave"
				iconCls="icon-ok" style="width: 90px">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="dlg_btncancel"
				iconCls="icon-cancel" style="width: 90px">取消</a>
		</div>
		<div id="dlgEditView" class="easyui-window" style="width: 800px; height: 500px"
			 closed="true" modal="true" collapsible="false" minimizable="false">
			 <iframe id="iframe1" width="100%" height="100%" frameborder="0"></div>
		</div>
	</div>
</body>
</html>