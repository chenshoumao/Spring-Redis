<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />  

<link href="${pageContext.request.contextPath}/images/login/logo.ico" rel="shortcut icon" type="image/x-icon" />

<link rel="icon" href="${pageContext.request.contextPath}/images/login/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/login/logo.ico" type="image/x-icon" />  
<title>智能表单</title>
<script type="text/javascript">

function closeDeptWin(){
    $('#deptWin').dialog('close'); 
}

	function openDepartment() {
		$('#departmentTree').tree({
			checkbox: false,
			url : '${pageContext.request.contextPath}/console/department/parentOrgDepartmentTree.action?id=0&type=0',
			onBeforeExpand : function(node, param) {
				$('#departmentTree').tree('options').url = '${pageContext.request.contextPath}/console/department/parentOrgDepartmentTree.action?parentItemId='+ node.id;
			},
			onDblClick: function(node) {
		    		saveDepartment();
		    }  

		});
		//保存选中用于回显
		$('#deptWin').window('open');
	}

	/**
	保存选中的公司信息
	 */
	function saveDepartment() {
		var nodes = [];
		var names = '';
		var ids = '';
		var deptDataId = [];
		node = $('#departmentTree').tree('getSelected');
			deptDataId.push(node.id);
			names = node.text;
			ids = node.id;
			nodes[0] = node;
     	$("#deptNum").textbox('setValue',deptDataId);
		$("#deptName").textbox('setValue',names);
		closeDeptWin();
	}
</script>

<div id="deptWin" class="easyui-dialog" title="选择部门"
		style="width: 500px; height: 500px; padding: 0px 0px" closed="true"
		buttons="#deptButton">
	<div id="departmentTree"></div>
</div>
<div id="deptButton" style="display:none">
	<a id="dlg_deptbtnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveDepartment()" style="width: 90px">确定</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:closeDeptWin()"
		style="width: 90px">取消</a>
</div>
