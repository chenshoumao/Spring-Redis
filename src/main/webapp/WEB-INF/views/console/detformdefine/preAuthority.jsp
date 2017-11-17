<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	    <style>
    fieldset {
padding:10px;
margin:10px;
width:100%;
color:#333; 
border:#06c dashed 1px;
} 
legend {
color:#06c;
font-weight:800; 
} 
 </style>
		<script
	src="${pageContext.request.contextPath}/scripts/console/detformdef_preAuthority.js"
	type="text/javascript"></script>
    <div style="width: 100%; heigth: 100%">
    <input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />
	<div style="width: 40%; height: 480px; float: left;margin-right:5%">
	<fieldset> 
                   <legend>阅读权限</legend> 
	<div style="width: 100%; height: 400px; ">
		<div id="read_authority_datagrid" style="width: 100%; height: 400px">
		</div>
		</div>
		<div style="margin-top:2%">
		<!-- <input id="rRightPassOn" name="rRightPassOn"type="checkbox"  value="y"> 继承权限 -->
		</div>
		</fieldset>
	</div>
	<div style="width: 40%; height: 480px; float: left;margin-left:5%">
	<fieldset> 
                   <legend>写入权限</legend> 
		<div style="width: 100%; height: 400px; ">
		<div id="write_authority_datagrid" style="width: 100%; height: 400px">
		</div>
		</div>
		<div style="margin-top:2%">
		<!-- <input name="wRightPassOn" id="wRightPassOn"type="checkbox"  value="y"> 继承权限 -->
		</div>
		</fieldset>
	</div>
	
		<div id="read_authority_datagrid_toolbar">
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="openPreAuthorityDlg('read')"
				iconCls="icon-add" plain="true">新建</a> 
				<a href="javascript:void(0)"
				onclick="return destroy('read_authority_datagrid');"
				class="easyui-linkbutton" id="btndel" iconCls="icon-remove"
				plain="true">删除</a> 
		</div>
		
		<div id="write_authority_datagrid_toolbar">
			<a href="javascript:void(0)" class="easyui-linkbutton" 
				iconCls="icon-add" plain="true" onclick="openPreAuthorityDlg('write')">新建</a> 
				<a href="javascript:void(0)"
				onclick="return destroy('write_authority_datagrid');"
				class="easyui-linkbutton" id="btndel" iconCls="icon-remove"
				plain="true">删除</a> 
		</div>
		
		
		<div id="add_preAuthority_dlg" class="easyui-dialog"
		style="width: 400px; height: 300px;" closed="true"
		buttons="#add_preAuthority_dlg_buttons" modal="true">
		<div style="padding:15px;">
		<input type="hidden" id="preAuthority_wr">
			<input type="hidden" id="formId" value="${formDef.formId}">
		
			<div class="fitem">
				<label style="width:35px">类型:
				</label>
				<select onchange="preAuthority_type()"id="preAuthority_type" style="width: 233px;height: 25px;">
				<option value="employee">人员</option>
				<option value="role">角色</option>
				<option value="department">部门</option>
				</select>
			</div>
			<br>
			
			<div class="fitem" id="preAuthority_user">
				<label style="width:35px">人员:
				</label> 
			 <input type="text" name="owners_people_value"  id="owners_people_value"style="width: 175px;height:21px"/>
			<button onclick="_openUserDlg()" style="height:22px">选择人员</button>
			 <input type="hidden" name="owners_people_value_num" id="owners_people_value_num"/>        
			</div>
			
				<div class="fitem" id="preAuthority_dept">
				<label style="width:35px">部门:
				</label> 
			 <input type="text" name="owners_dept_value"  id="owners_dept_value"style="width: 175px;height:21px"/>
			<button onclick="_openDeptDlg()" style="height:22px">选择部门</button>
			 <input type="hidden" name="owners_dept_value_num" id="owners_dept_value_num"/>        
			</div>
			
				<div class="fitem" id="preAuthority_role">
				<label style="width:35px">角色:
				</label> 
			 <input type="text" name="owners_role_value"  id="owners_role_value"style="width: 175px;height:21px"/>
			<button onclick="_openRoleDlg()" style="height:22px">选择角色</button>
			 <input type="hidden" name="owners_role_value_num" id="owners_role_value_num"/>        
			</div>
			</div>
	</div>
	<div id="add_preAuthority_dlg_buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save_preAuthority();" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#add_preAuthority_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</div>