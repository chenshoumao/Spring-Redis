<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sot" uri="/WEB-INF/tlds/formCtrlsTag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/datSystemMeta/systemMeta.js"></script>
<style type="text/css">
.fitem label {
	display: inline-block;
	width: 110px;
}
</style>
</head>
<input type="hidden" id="metaCataId" value="${metaCataId}" />
<input type="hidden" id="cataName" value="${cataName}" />
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}" />
<body>

	<div id="toolbar">
		<div>
			<c:if test="${not empty metaCataId}">
				<a href="javascript:void(0)" iconCls="icon-add"
					class="easyui-linkbutton " plain="true"
					onclick="openSystemMetaDlg()"> 添加 </a>
				<a href="javascript:void(0)" iconCls="icon-remove"
					class="easyui-linkbutton " plain="true"
					onclick="deleteSystemMeta()"> 删除 </a>
				<a href="javascript:void(0)" class="easyui-linkbutton" id="export"
					iconCls="icon-print" plain="true" onclick="exprotExcel()"> 导出 </a>
				<a href="javascript:void(0)" id="import" class="easyui-linkbutton"
					iconCls="icon-mini-add" plain="true" onclick="openUploadDlg()">导入</a>
			</c:if>

			系统元数据名称:<input type="text" id="name" style="width: 150px;"> <a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="searchByName()"> 查询 </a>

		</div>
	</div>

	<div id="datagrid" style="width: 100%; height: 100%"></div>

	<div id="upload_dlg" class="easyui-dialog"
		style="width: 300px; height: 150px;" closed="true"
		buttons="#upload_dlg_buttons" modal="true">
		<form style="margin: 16px; padding: 0px;" id="uploadFm"
			enctype="multipart/form-data" method="post"
			target="hidden_frame">
			请选择要导入的excel文件（xls或xlsx格式）： <input type="file" id="file" name="file" />
			<input type="hidden" id="importMetaCataId" name="importMetaCataId" />
		</form>
	</div>

	<div id="upload_dlg_buttons">
		<a id="upload_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok" onclick="fileImport()"
			style="width: 90px">上传</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#upload_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>

	<div id="systemMeta_dlg" class="easyui-dialog"
		style="width: 550px; height: 360px;" closed="true"
		buttons="#systemMeta_dlg_buttons" modal="true">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="系统元数据">
				<form id="fm" method="post" style="margin-left: 35px;">
					<br> <input id="metaId" name="metaId" type="hidden" /> <input
						id="fm_metaCataId" name="metaCataId" type="hidden" />
					<div class="fitem">
						<label>元数据名称(<font style="color: red">*</font>):
						</label> <input class="easyui-textbox" required="true" name="metaName"
							id="metaName" style="width: 280px" />
					</div>
					<div class="fitem">
						<label>元数据值:</label> <input class="easyui-textbox"
							name="metaValue" id="metaValue" style="width: 280px" />
					</div>
					<div class="fitem">
						<label>元数据描述:</label> <input class="easyui-textbox"
							name="description" id="description" style="width: 280px" />
					</div>
					<div class="fitem">
						<label>扩展信息:</label> <input class="easyui-textbox" name="extMeta"
							id="extMeta" style="width: 280px; height: 130px;"
							data-options="multiline:true" />
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="systemMeta_dlg_buttons">
		<a id="system_meta_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok"
			onclick="createOrUpdate()" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#systemMeta_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
	<iframe name="hidden_frame" id="hidden_frame" style="display: none;"></iframe>



	<!-- 系统元数据管理员配置 -->

	<div id="systemMetaOwner_dlg" class="easyui-dialog"
		style="width: 450px; height: 230px;" closed="true"
		buttons="#systemMetaOwner_dlg_buttons" modal="true">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="系统元数据">
				<form id="ownerFm" method="post" style="margin:0px;padding: 0px;">
					<br /> <input id="smoId" name="smoId" type="hidden" /> <input
						id="ownerFm_metaId" name="metaId" type="hidden" /> 
						<input type="hidden" name="ownerNum" id="ownerNum"/>
						<input type="hidden" name="empIds" id="empIds"/>
						<input type="hidden" name="roleIds" id="roleIds"/>
					<div class="fitem" style="margin-left: 38px;">
						<label>系统元数据分类:</label> 
						<input type="text" name="cataName"  id="ownerFm_cataName"style="width: 175px;height:21px"/>
					</div>
					
					<div class="fitem" style="margin-left: 38px;">
						<label>绑定用户:</label> 
						<input type="text" readonly name="owners_people_value"  id="owners_people_value"style="width: 175px;height:21px"/>
						 <input type="hidden" name="owners_people_value_num" id="owners_people_value_num"/>    
						<a href="javascript:void(0)"
							class="easyui-linkbutton" iconCls="icon-save"
							onclick="_openUserDlg()">选择用户
						</a>
					</div>
					<div class="fitem" style="margin-left: 38px;">
						<label>绑定角色:</label> 
						<input type="text" readonly name="owners_role_value"  id="owners_role_value"style="width: 175px;height:21px"/>
						<input type="hidden" name="owners_role_value_num" id="owners_role_value_num"/> 
						<a href="javascript:void(0)"
							class="easyui-linkbutton" iconCls="icon-save"
							onclick="_openRoleDlg()">选择角色
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="systemMetaOwner_dlg_buttons">
		<a id="system_meta_owner_dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok" onclick="createOrUpdateOwner()"
			style="width: 90px">保存</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#systemMetaOwner_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>

	<!-- 系统元数据管理员配置 -->

</body>
</html>