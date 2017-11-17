<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script>
	function addRoleUserGride(name) {
      $('#addRoletUser').datagrid(
                        {
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/role/member/unAdd.action',
							method : 'POST',
							queryParams : {
								"name" : name,
								"roleId" : "${roleId}"
							},
							striped : true,
							nowrap : true,
							pageSize : 10,
							pageNumber : 1,
							pageList : [ 10,20,30,40,50,60,70 ],
							showFooter : true,
							loadMsg : '数据加载中请稍候……',
							pagination : true,
							toolbar : "#addRoleUser_dlgToolbar",
							singleSelect : false,
							checkOnSelect : false,
							selectOnCheck : false,
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
								title : '登录账号',
								width : 200,
								align : 'center'
							}, {
								field : 'ldapUid',
								title : 'LDAP UID',
								width : 200,
								align : 'center'
							}, {
								field : 'nickName',
								title : '姓名',
								width : 200,
								align : 'center'
							},/*  {
								field : 'empPosition',
								title : '职位ID',
								width : 100,
								align : 'center'
							}, */ {
								field : 'email',
								title : '邮件',
								width : 300,
								align : 'center'
							}/* , {
								field : 'mobile',
								title : '手机号码',
								width : 100,
								align : 'center'

							} */ ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							}
						});
	}

	function openAddUserDlg() {
		$('#addRoleUser_dlg').dialog('open').dialog('setTitle', ' ');
		addRoleUserGride("");
	}

	function roleUserSearchByName() {
		var name = $("#addUserName").val();
			addRoleUserGride(name);
		
	}
	


	function addDepartmentUser(){
	 var arr = $('#addRoletUser').datagrid('getChecked');
		if(arr.length>0){
		 var ids =[];
		for(var i =0 ;i<arr.length;i++){
		ids.push(arr[i].empNum);
		}
		
		$.ajax({
		url:"${pageContext.request.contextPath}/console/role/member/add.action",
		type:"post",
		data:{
		roleId:"${roleId}",
		ids:ids
		},
		dataType:"json",
		success:function(result){
			   if (!result.state){
	                $.messager.show({
	                    title: '温馨提示',
	                    msg: result.msg
	                });
	            } else {
	                 // $('#dlg').dialog('close');        // close the dialog
	                $('#addRoletUser').datagrid('reload');    // reload the user data
	                 $('#datagrid').datagrid('load');
	            }
		   }
	        });
	   }else{
			$.messager.show({
			title : '温馨提示',
		    msg : "请选择要添加的用户"
			});
			
			}		
	}				
	
	function closeAddRoleUserDlg(){
	   $('#addRoleUser_dlg').dialog('close');   
	   $('#datagrid').datagrid('load');
	}
</script>
<div id="addRoleUser_dlg" class="easyui-dialog"
	style="width: 680px; height: 400px;" closed="true"
	buttons="#addRoleUser_dlg_btn">
	<div id="addRoletUser"></div>
</div>



<div id="addRoleUser_dlgToolbar">
	<div>
		
			<a
			href="javascript:void(0)" class="easyui-linkbutton " plain="true">
			姓名/账号:</a> <input type="text" id="addUserName" style="width: 90px;">
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="roleUserSearchByName()"> 查询 </a>
			<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="addDepartmentUser()"> 添加 </a> 
	</div>
</div>


<div id="addRoleUser_dlg_btn">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="closeAddRoleUserDlg()" style="width: 90px">关闭</a>
</div>

