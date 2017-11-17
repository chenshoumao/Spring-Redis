<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script>
    //打开添加部门成员的对话框
	function openAddUserDlg() {
		$('#addRoleUser_dlg').window('open').window('resize', {
			top : 80,
			left : 10
		});
		$("#addUserName").searchbox('setValue', "");
		$("#empIds").val("");
	}
   //关闭成员对话框
	function closeAddRoleUserDlg() {
		$('#empWin').dialog('close');
		$('#addRoleUser_dlg').dialog('close');
	}
	
	
	function openEmployeeDlg() {
		openEmployee();
	}
    //根据账户或名称查询
	function doSearch() {
		$('#empDlg').datagrid("load", {
			name : $("#SearchEmpNo").val()
		});
	}
    
    //加载人员的信息
	function openEmployee() {
		var url = "${pageContext.request.contextPath}/console/user/shows.action";
		$('#empDlg').datagrid({
			queryParams : {
				deparmentId : 0
			},
			url : url + "?" + Math.random().toString()
		});

		var top = 80;
		var left = 410;
		$('#empWin').window('open').window('resize', {
			top : top,
			left : left
		});
	}

	function closeAddUserDlg() {
		$('#empWin').dialog('close');
	}
    //获取选中的人员
	function confirmSelectUser() {
		var rows = $('#empDlg').datagrid('getSelections');
		var empNum = "";
		var names = "";
		for (var i = 0; i < rows.length; i++) {
			//console.log();
			names += rows[i].nickName + ";";
			empNum += rows[i].empNum + ";";
		}

		$('#addUserName').searchbox('setValue', names);
		$("#empIds").val(empNum);
		$('#empWin').dialog('close');
	}
    //保存部门的成员
	function saveDeptUser() {
		var mainPostiton = $('input[name="mainPostiton"]:checked ').val();
		var addUserName = $("#addUserName").searchbox('getValue');
		var empIds = $("#empIds").val();
		if (addUserName == "") {
			$.messager.show({
				title : '温馨提示',
				msg : '请选择要添加的人员'
			});
		} else {
			$.ajax({
						url : "${pageContext.request.contextPath}/console/orgDept/member/addDeptEmp.action",
						type : "post",
						data : {
							empIds : empIds,
							majorDept : mainPostiton,
							deptId : "${deptId}"
						},
						dataType : "json",
						success : function(result) {
							if (result.state == false) {
								$.messager.show({
									title : '温馨提示',
									msg : result.msg
								});
							} else {
								closeAddRoleUserDlg();
								$('#datagrid').datagrid('load'); // reload the user data
							}
						},
						error : function() {
						}
					});
		}
	}
    //移除部门的成员
	function removeDeptUser() {
		var rows = $('#datagrid').datagrid('getChecked');
		if (rows.length <=0) {
			$.messager.show({
				title : '温馨提示',
				msg : '请选择要移除的人员'
			});
		} else {
			var empNum = "";
			for (var i = 0; i < rows.length; i++) {
				empNum += rows[i].empNum + ";";
			}
				$.ajax({
						url : "${pageContext.request.contextPath}/console/orgDept/member/removeDeptEmp.action",
						type : "post",
						data : {
							empIds : empNum,
							deptId : "${deptId}"
						},
						dataType : "json",
						success : function(result) {
							if (result.state == false) {
								$.messager.show({
									title : '温馨提示',
									msg : result.msg
								});
							} else {
								$('#datagrid').datagrid('reload'); // reload the user data
							}
						},
						error : function() {
						}
					});
		}
	}
</script>


<div id="empWin" class="easyui-dialog" title="选择人员"
	style="width: 450px; height: 300px;" closed="true" buttons="#empButton">
	<table id="empDlg" class="easyui-datagrid"
		style="width: 100% px; height: 100%" pageNumber="1" pageSize="20"
		checkOnSelect="true" pagination="true" toolbar="#tb2"
		rownumbers="true" remoteSort="false"
		pageList="[20,50,100,200,500,1000]">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true,width:120">序号</th>
				<th data-options="field:'empNum',width:120,hidden:true">员工id</th>
				<th data-options="field:'empName',width:100">登录账号</th>
				<th data-options="field:'ldapUid',width:110,hidden:true">LDAP
					UID</th>
				<th data-options="field:'nickName',width:100">姓名</th>
				<th data-options="field:'email',width:110">邮件</th>
			</tr>
		</thead>
	</table>
</div>

<div id="empButton">
	<a class="easyui-linkbutton" iconCls="icon-ok"
		onclick="confirmSelectUser();">确认</a> <a class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="closeAddUserDlg();">取消</a>
</div>
<div id="tb2">
	<div>
		<table>
			<tr>
				<td>关键字：</td>
				<td><input type="text" id="SearchEmpNo" />
					<button onclick="doSearch();">查询</button></td>
			</tr>
		</table>
	</div>
</div>

<div id="addRoleUser_dlg" class="easyui-dialog"
	style="width: 400px; height: 300px;" closed="true"
	buttons="#addRoleUser_dlg_btn" title="添加">
	<table cellspacing="4px;"
		style="border-collapse: separate; border-spacing: 15px; width: 90%">
		<tr>
			<td width="30%">人员</td>
			<td width="70%"><input type="text" id="addUserName"
				style="width: 100%" class="easyui-searchbox"
				searcher="openEmployeeDlg"> <input id="empIds" type="hidden">
			</td>
		</tr>
		<tr>
			<td width="30%">是否主职位</td>
			<td width="70%"><input name="mainPostiton" type="radio"
				value="yes" />是 <input name="mainPostiton" type="radio" value="no"
				checked="ckecked" />否</td>
		</tr>
	</table>
</div>

<div id="addRoleUser_dlg_btn">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="saveDeptUser()" style="width: 90px">确认</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="closeAddRoleUserDlg()"
		style="width: 90px">取消</a>
</div>