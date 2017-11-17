<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script>
	function deptLeaderData(name) {
		$('#deptLeaderData')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/user/unDepartment.action',
							method : 'POST',
							queryParams : {
								"name" : name,
								"deparmentId" : "0"
							},
							striped : true,
							nowrap : true,
							pageSize : 10,
							pageNumber : 1,
							pageList : [ 10 ],
							showFooter : true,
							loadMsg : '数据加载中请稍候……',
							pagination : true,
							toolbar : "#deptLeaderToolbar",
							singleSelect : true,
							checkOnSelect : false,
							selectOnCheck : true,
							columns : [ [ {
								field : 'ck',
								checkbox : true
							}, {
								field : 'empNum',
								title : '员工id',
								width : 100,
								align : 'center',
								hidden : true
							}, {
								field : 'empName',
								title : '姓名',
								width : 100,
								align : 'center'
							}, {
								field : 'ldapUid',
								title : 'LDAP UID',
								width : 100,
								align : 'center'
							}, {
								field : 'nickName',
								title : '账号别名',
								width : 100,
								align : 'center'
							}, {
								field : 'empPosition',
								title : '职位ID',
								width : 100,
								align : 'center'
							}, {
								field : 'email',
								title : '邮件',
								width : 100,
								align : 'center'
							}, {
								field : 'mobile',
								title : '手机号码',
								width : 100,
								align : 'center'

							} ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							}
						});
	}

	function opendeptLeaderDlg() {
		$('#deptLeader_dlg').dialog('open').dialog('setTitle', ' ');
		deptLeaderData("");
	}

	function deptLeaderSearchByName() {
		var name = $("#departmentUserName").val();
		if (name == "") {
			alert("查询条件不能为空");
		} else {
			deptLeaderData(name);
		}
	}

	function claerDeptLeaderName() {
		$('#deptLeader').val('');
		$("#deptLeaderName").textbox('setValue', '');
		$('#deptLeader_dlg').dialog('close');
	}

	function addDeptLeaderName() {
		var arr = $('#deptLeaderData').datagrid('getChecked');
		if (arr.length > 0) {
				$('#deptLeader').val(arr[0].empNum);
				$("#deptLeaderName").textbox('setValue', arr[0].nickName);
				$('#deptLeader_dlg').dialog('close');
		}
	}
</script>


<div id="deptLeader_dlg" class="easyui-dialog"
	style="width: 750px; height: 400px;" closed="true">
	<div id="deptLeaderData"></div>
</div>

<div id="deptLeaderToolbar">
	<div>
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="addDeptLeaderName()"> 添加 </a> <a href="javascript:void(0)"
			class="easyui-linkbutton " plain="true"
			onclick="claerDeptLeaderName()">置空 </a> <a href="javascript:void(0)"
			class="easyui-linkbutton " plain="true"> 姓名/别名:<input type="text"
			id="departmentUserName" style="width: 90px;">
		</a> <a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="deptLeaderSearchByName()"> 查询 </a>
	</div>
</div>




