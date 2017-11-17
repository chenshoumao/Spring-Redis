
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/processCata/index.js"></script>

<div class="easyui-accordion" data-options="fit:true,border:false">
	<div>
		<ul id="processCata" class="ztree"></ul>
		
		<div id="process_cata_dlg" class="easyui-dialog"
			style="width: 400px; height: 250px;" closed="true"
			buttons="#process_cata_dlg_buttons" modal="true">
			<div id="tabs" class="easyui-tabs" fit="true" border="false">
				<div title="流程分类">
					<form id="fm" method="post">
						<br>
						<div class="fitem">
							<input id="parentCataId" name="parentCataId" type="hidden"> 
							<input id="parentCataName" name="parentCataName" type="hidden"> 
							<input id="cataId" name="cataId" type="hidden"> 
							<label>分类名称:</label>
							<input class="easyui-textbox" required="true" name="cataName"
								id="cataName" />
						</div>
					</form>
				</div>
			</div>
		</div>

		<div id="process_cata_dlg_buttons">
			<a id="process_cata_dlg_btnsave" href="javascript:void(0)"
				class="easyui-linkbutton c6" iconCls="icon-ok"
				onclick="createOrUpdateProcessCata()" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel"
				onclick="javascript:$('#process_cata_dlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
	</div>

	<div id="tabsMenu" class="easyui-menu" style="width: 120px;">
		<div id="createPage" onclick="createProcessCata()">新建</div>
		<div onclick="deletBpmProcessCata()">删除</div>
		<div onclick="updateProcessCata()">更新</div>
	</div>

</div>