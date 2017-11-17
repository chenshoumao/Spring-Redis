<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../../resources.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/processmeta/show.js"></script>
<style type="text/css">
.fitem label {
    display: inline-block;
    width: 110px;
}
</style>
</head>
   <input type="hidden" id="workflowCataId" value="${workflowCataId}" />
   <input type="hidden" id="basePath"  value="${pageContext.request.contextPath}" />
<body>

	<div id="toolbar">
		<div>
		<c:if test="${not empty workflowCataId}">
			<a href="javascript:void(0)" iconCls="icon-add"  class="easyui-linkbutton " plain="true"onclick="openProcessmetaDlg()">
			添加 
			</a> 
			<a href="javascript:void(0)" iconCls="icon-remove"  class="easyui-linkbutton " plain="true"onclick="destroyProcessmeta()">
			 删除 
			 </a>
			 </c:if>
			
			  流程名称:<input type="text"id="name" style="width: 150px;">
			  
			  <a href="javascript:void(0)"class="easyui-linkbutton " plain="true" onclick="searchByName()">
				查询
				</a>
				
		</div>
	</div>
	
	<div id="datagrid" style="width: 100%; height: 100%"></div>


	<div id="processmeta_dlg" class="easyui-dialog"
		style="width: 600px; height: 400px;" closed="true"
		buttons="#processmeta_dlg_buttons" modal="true">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="流程元数据">
				<form id="fm" method="post">
					<br> 
					<input name="workflowId"type="hidden"/> 
					<input id="fm_workflowCataId"name="workflowCataId" type="hidden"/> 
					<div class="fitem">
						<label>流程名称(<font style="color:red">*</font>):</label> 
						<input class="easyui-textbox" required="true"
							name="workflowName" id="workflowName"  style="width:280px"/>
					</div>
					<div class="fitem">
						<label>流程应用库id(<font style="color:red">*</font>):</label> 
						<input class="easyui-textbox" required="true"  name="processAppId" id="processAppId" style="width:280px"/>
					</div>
					<div class="fitem">
						<label>流程图id(<font style="color:red">*</font>):</label> 
						<input class="easyui-textbox" required="true" name="bpdId" id="bpdId" style="width:280px"/>
					</div>
					<div class="fitem">
						<label>表单页面路径:</label> 
						<input class="easyui-textbox" name="formPath" id="formPath" style="width:280px"/>
					</div>
					<div class="fitem">
						<label>流程编号(<font style="color:red">*</font>):</label> 
						<input class="easyui-textbox" required="true" name="workflowCode" id="workflowCode" style="width:280px"/>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="processmeta_dlg_buttons">
		<a id="process_meta_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok"
			onclick="createOrUpdateProcessmeta()" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#processmeta_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>