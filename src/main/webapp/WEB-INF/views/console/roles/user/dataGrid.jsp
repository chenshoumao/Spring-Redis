<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../resources.jsp"></jsp:include>
<script type="text/javascript">
	function datagrid(name, roleId) {
		$('#datagrid')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/role/user/shows.action',
							method : 'POST',
							queryParams : {
								"name" : name,
								"roleId" : roleId
							},
							striped : true,
							nowrap : true,
							pageSize : 10,
							pageNumber : 1,
							pageList : [ 10,20,30,40,50,60,70 ],
							showFooter : true,
							loadMsg : '数据加载中请稍候……',
							pagination : true,
							toolbar : "#toolbar",
							singleSelect : false,
							checkOnSelect : false,
							selectOnCheck : false,
							columns : [ [
							 {
								field : 'ck',
								checkbox : true
							},
									{
										field : 'empNum',
										title : '员工id',
										width : 100,
										align : 'center',
										hidden : true
									},
									{
										field : 'empName',
										title : '姓名',
										width : 100,
										align : 'center'
									},
									{
										field : 'ldapUid',
										title : 'LDAP UID',
										width : 100,
										align : 'center'
									},
									{
										field : 'nickName',
										title : '账号别名',
										width : 100,
										align : 'center'
									},
									{
										field : 'empPosition',
										title : '职位ID',
										width : 100,
										align : 'center'
									},
									{
										field : 'email',
										title : '邮件',
										width : 100,
										align : 'center'
									},
									{
										field : 'mobile',
										title : '手机号码',
										width : 100,
										align : 'center'
									},
								
									{
										field : 'ldapName',
										title : 'LDAP DN NAME',
										width : 250,
										align : 'center'
									}
									 ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							}
						});
	}

	function searchByName() {
		var name = $('#name').val();
			datagrid(name, "${roleId}");
	}

	$(function(){
	datagrid("", "${roleId}");
	});
	
	function removeRoleUser() {
			var arr = $('#datagrid').datagrid('getChecked');
			if (arr.length > 0) {
				var ids = [];
				for (var i = 0; i < arr.length; i++) {
					ids.push(arr[i].empNum);
				}
				$.ajax({
							url : "${pageContext.request.contextPath}/console/role/member/remove.action",
							type : "post",
							data : {
							roleId:"${roleId}",
						    ids : ids
							},
							dataType : "json",
							success : function(result) {
								if (!result.state) {
									$.messager.show({
										title : '温馨提示',
										msg : result.msg
									});
								} else {
									$('#datagrid').datagrid('reload');
								}
							}
						});
			}else{
			$.messager.show({
			title : '温馨提示',
		    msg : "请选择要移除的用户"
			});
			
			}
		}
</script>
<div id="datagrid" style="width: 100%; height: 100%"></div>
<div id="toolbar">
<div>
			<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="openAddUserDlg()"> 添加用户 </a> <a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="removeRoleUser()"> 移除用户 </a> <a
				href="javascript:void(0)" class="easyui-linkbutton " plain="true">
				姓名/别名:</a> <input type="text" id="name" style="width: 90px;">
			
			<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="searchByName()"> 查询 </a>
			
		</div>
	</div>
<jsp:include page="./add.jsp"></jsp:include>
