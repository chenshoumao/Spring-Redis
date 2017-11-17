<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/images/LOGO.ico" rel="shortcut icon"
	type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../../resources.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/processSnapshot/index.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/processSnapshot/processmetaDialog.js"></script>
<style type="text/css">
.fitem label {
	display: inline-block;
	width: 100px;
}
</style>
</head>
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}" />
<body>
	<div id="toolbar">
		<div>
			<a href="javascript:void(0)" iconCls="icon-add"
				class="easyui-linkbutton " plain="true"
				onclick="openProcessSnapshotDlg()"> 添加 </a> <a
				href="javascript:void(0)" iconCls="icon-remove"
				class="easyui-linkbutton " plain="true"
				onclick="destroyProcessSnapshot()"> 删除 </a> <a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="sysncActivityMeta()"> 环节同步 </a>
				<a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="getVisualProcessModel()"> 同步快照流程图 </a>
				<a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="openProcessModel()">快照流程图</a>
				 <a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="activityMetaCfg()"> 环节配置 </a>
				<a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="startPerssion()"> 起草权限配置 </a>
				 <a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true">
				快照名称:</a><input type="text" id="name" style="width: 150px;">
			 <a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="searchByName()"> 查询 </a>


		</div>
	</div>

	<div id="datagrid" style="width: 100%; height: 100%"></div>


	<div id="bpmProcessSnapshot_dlg" class="easyui-dialog"
		style="width: 700px; height: 450px;" closed="true"
		buttons="#bpmProcessSnapshot_dlg_buttons" modal="true">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="快照管理">
				<form id="fm" method="post">
					<br> <input name="snapshotId" type="hidden" />
					<div class="fitem">
						<label>流程快照名称:</label> <input class="easyui-textbox"
							required="true" name="snapshotName" id="snapshotName"
							style="width: 350px" />
					</div>
					<br>

					<div class="fitem">
						<label>流程图快照ID:</label> <input class="easyui-textbox"
							name="snapshotBpdId" id="snapshotBpdId"
							style="width: 350px" />
					</div>
					<br>

					<div class="fitem">
						<label>流程图名称:</label>
						<!-- <input class="easyui-textbox" required="true"  name="bpdName" id="bpdName" style="width:250px"/> -->
						<input class="easyui-textbox " required="true"
							data-options="prompt:'请选择流程图名称'
                  , icons:[{
				 iconCls:'icon-search',
				handler: function(e){
			     _openProcessMetaDlg();
				}
			}]"
							type="text" name="bpdName" id="bpdName" style="width: 350px" />
					</div>
					<br>

					<div class="fitem">
						<label>流程图ID:</label> <input class="easyui-textbox" name="bpdId"
							id="bpdId" style="width: 350px" readonly="readonly" required="true"/>
					</div>
					<br>

					<div class="fitem">
						<label>流程图应用库ID:</label> <input class="easyui-textbox"
							name="processAppId" readonly="readonly" id="processAppId" required="true" style="width: 350px" />
					</div>
					<br>

					<div class="fitem">
						<label>表单页面路径:</label> <input class="easyui-textbox"
							name="formPath" id="formPath" style="width: 350px" />
					</div>
					<br>

					<!-- <div class="fitem">
						<label>快照创建时间:</label> 
						<input class="easyui-textbox" name="snapshotCreateTime" id="snapshotCreateTime" style="width:250px"/>
					</div> -->
				</form>
			</div>
		</div>
	</div>
	<div id="bpmProcessSnapshot_dlg_buttons">
		<a id="bpmProcessSnapshot_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok"
			onclick="createOrUpdateProcessSnapshot()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#bpmProcessSnapshot_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>


	<jsp:include page="./processmetaDialog.jsp"></jsp:include>
	<div id="activityMetaCfgWin"></div>
</body>
</html>