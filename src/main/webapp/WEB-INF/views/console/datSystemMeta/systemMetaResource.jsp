<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../resources.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/datSystemMeta/systemMetaResource.js"></script>
<style type="text/css">
.fitem label {
	display: inline-block;
	width: 110px;
}
</style>
</head>
<body>
	<input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />

	<!-- 工具栏 -->
	<div id="toolbar">
		<div>
				<a href="javascript:void(0)" iconCls="icon-add"
					class="easyui-linkbutton " plain="true"
					onclick="openSystemMetaResourceDlg()"> 添加 </a>
				<a href="javascript:void(0)" iconCls="icon-remove"
					class="easyui-linkbutton " plain="true"
					onclick="deleteSystemMetaResourceDlg()"> 删除 </a>

			系统元数据名称:<input type="text" id="name" style="width: 150px;"> <a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="searchByName()"> 查询 </a>

		</div>
	</div>
	<!-- 工具栏 -->

	<div id="datagrid" style="width: 100%; height: 100%"></div>
	
	<!-- 添加或更新的弹出窗 -->
	
	<div id="systemMetaResource_dlg" class="easyui-dialog"
		style="width: 450px; height: 280px;" closed="true"
		buttons="#systemMetaResource_dlg_buttons" modal="true">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="系统元数据资源实体">
				<form id="fm" method="post" style="margin-left: 15px;padding: 0px 36px;">
					<br> 
					 <input id="metaResId" name="metaResId" type="hidden" />
					<div class="fitem">
						<label>资源实体名称(<font style="color: red">*</font>):
						</label> <input class="easyui-textbox" required="true" name="resourceName"
							id="resourceName" style="width: 250px" />
					</div>
					<div class="fitem">
						<label>元数据分类:</label> 
						<input class="easyui-textbox" required="true" name="metaCataId"
							id="metaCataId" style="width: 250px" data-options="readonly:true" />
							<a href="javascript:void(0)"
							class="easyui-linkbutton" iconCls="icon-save"
							onclick="openCataTree()">选择分类</a>
					</div>
					<div class="fitem">
						<label>资源实体描述:</label> <input class="easyui-textbox"
							name="description" id="description" style="width: 250px" />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="systemMetaResource_dlg_buttons">
		<a id="system_meta_resource_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok"
			onclick="createOrUpdate()" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#systemMetaResource_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
	
	<!-- 添加或更新的弹出窗 -->
	
	<!-- 分类树弹出窗 -->
	
	<div id="cataTreeDlg" class="easyui-dialog"
		style="width: 250px; height: 400px;" closed="true"
		buttons="#tree_dlg_buttons" modal="true">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
				<ul style="margin-left: 5px;height: 330px;" id="cata" name="metaCataId"/>
		</div>
	</div>
	
	<div id="tree_dlg_buttons">
		<a id="tree_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok"
			onclick="saveCata()" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#cataTreeDlg').dialog('close')"
			style="width: 90px">关闭</a>
	</div>
	
	<!-- 分类树弹出窗 -->
</body>
</html>