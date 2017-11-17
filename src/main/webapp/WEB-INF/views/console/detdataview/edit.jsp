<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑视图</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/styles/console/pagetable.css">
	<script src="${pageContext.request.contextPath}/scripts/console/detview_edit.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<div id="menubar" class="easyui-panel" style="width:100%;height:30px;" border="false">
			<a href="#" id="btnsave" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
			<a href="#" id="btnclose" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true">关闭</a>
		</div>
		<form method="post" name="form1" id="form1">
			<input type="hidden" id="datAppId" value="${appId }" />
			<input type="hidden" id="viewId" value="${detView.viewId }" />
			<div class="easyui-tabs" style="width:100%; height:auto" id="tabpanel">
				<div title="视图属性" style="padding:10px" id="tab1">
					<table class="prop_table">
				 		<tr>
				 			<th>视图名称(<span style="color:red">*</span>)</th>
				 			<td><input class="easyui-textbox" type="text" name="viewName" id="viewName" 
				 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[]}"
				 				value="${detView.viewName}"></input></td>
				 		</tr>
				 		<tr>
				 			<th>视图标题</th>
				 			<td><input class="easyui-textbox" type="text" name="viewTitle" id="viewTitle"
				 				value="${detView.viewTitle }" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>每页大小</th>
				 			<td><input class="easyui-textbox" type="text" name="pageSize" id="pageSize"
				 				value="${detView.pageSize }" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>说明</th>
				 			<td><input class="easyui-textbox" type="text" name="description" id="description" 
				 				value="${detView.description }" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>创建时间</th>
				 			<td><fmt:formatDate value="${detView.createTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>创建人</th>
				 			<td>${detView.creatorName }</td>
				 		</tr>
				 		<tr>
				 			<th>更新时间</th>
				 			<td><fmt:formatDate value="${detView.updateTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>更新人</th>
				 			<td>${detView.updateByName }</td>
				 		</tr>
				 	</table>
				</div>
				<div title="过滤条件" style="padding:10px" id="tab2">
					<textarea style="width:99%; height:300px" name="queryFilter" id="queryFilter">${detView.queryFilter }</textarea>
				</div>
				<div title="数据列" style="height:400px" id="tab3">
					<div class="easyui-layout" data-options="fit:true">
						<div data-options="region:'center',border:false">
							<table id="columnGrid" class="easyui-datagrid">
						        <thead>
						            <tr>
						            	<th field="columnId" hidden="true"></th>
						            	<th field="detDataView.viewId" hidden="true"></th>
						                <th field="columnName" width="15%">列名称</th>
						                <th field="columnTitle" width="15%">列标题</th>
						                <th field="dataBinding" width="25%">列数据绑定</th>
						                <th field="columnWidth" width="10%">列宽度</th>
						                <th field="isSort" width="10%">是否排序</th>
						                <th field="columnOrder" width="10%">列序号</th>
						                <th field="col1" widht="10%" formatter="gridDeleteLinkFmt"></th>
						            </tr>
						        </thead>
					   		</table>
					   		<div id="toolbar">
						        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnnew" iconCls="icon-add" plain="true">新建</a>
						    </div>
						</div>
					</div>
				</div>
				<div title="视图头部" style="padding:10px" id="tab4">
					<textarea style="width:99%; height:350px" name="viewHead" id="viewHead">${detView.viewHead }</textarea>
				</div>
			</div>
		</form>
		<div id="dlgColumn" class="easyui-dialog" style="width: 550px; height: 350px"
			closed="true" buttons="#dlg-buttons"  modal="true">
			<form id="form2" name="form2" method="post">
				<input type="hidden" id="columnId" name="columnId" />
			 	<table class="prop_table">
			 		<tr>
			 			<th>视图列名称(<span style="color:red">*</span>)</th>
			 			<td><input class="easyui-textbox" type="text" name="columnName" id="columnName" 
			 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,25]}"></input></td>
			 		</tr>
			 		<tr>
			 			<th>视图列标题(<span style="color:red">*</span>)</th>
			 			<td><input class="easyui-textbox" type="text" name="columnTitle" id="columnTitle" style="width:300px" data-options="required:true"></input></td>
			 		</tr>
			 		<tr>
			 			<th>列数据绑定(<span style="color:red">*</span>)</th>
			 			<td><input class="easyui-textbox" type="text" name="dataBinding" id="dataBinding" style="width:300px" data-options="required:true"></input></td>
			 		</tr>
			 		<tr>
			 			<th>列宽度</th>
			 			<td><input class="easyui-textbox" type="text" name="columnWidth" id="columnWidth" style="width:300px" /></td>
			 		</tr>
			 		<tr>
			 			<th>是否排序</th>
			 			<td><input type="checkbox" name="isSort" id="isSort" value="true" /></td>
			 		</tr>
			 		<tr>
			 			<th>列序号</th>
			 			<td><input type="text" class="easyui-numberspinner" name="columnOrder" id="columnOrder"
			 				data-options="min:0,max:999" /></td>
			 		</tr>
			 		<tr>
			 			<th>扩展属性</th>
			 			<td><input type="text" class="easyui-textbox" name="extAttrs" id="extAttrs" style="width:300px" /></td>
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
	</div>
</body>
</html>