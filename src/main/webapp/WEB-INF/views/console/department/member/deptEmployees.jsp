<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../resources.jsp"></jsp:include>
<script type="text/javascript">
	function datagrid() {
		$('#datagrid')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/orgDept/member/deptMember.action',
							method : 'POST',
							queryParams : {
								"deptId" : "${deptId}",
								"name":$("#searchName").val()
							},
							striped : true,
							nowrap : true,
							pageSize : 20,
							pageNumber : 1,
							pageList : [ 10, 20, 30, 40, 50, 60, 70 ],
							showFooter : true,
							loadMsg : '数据加载中请稍候……',
							pagination : true,
							toolbar : "#toolbar",
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
							},

							{
								field : 'ldapName',
								title : 'LDAP DN NAME',
								width : 250,
								align : 'center'
							} ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							}
						});
	}

	function searchByName() {
		datagrid();
	}

	$(function() {
		datagrid();
		$('#SearchEmpNo').keydown(function(e) {
			if (e.keyCode == 13) {
				doSearch();
			}
		});
		
		$('#searchName').keydown(function(e) {
			if (e.keyCode == 13) {
				searchByName();
			}
		});
	});
</script>
<div id="datagrid" style="width: 100%; height: 100%"></div>
<div id="toolbar">
	<div>
	    <c:if test="${deptId ne '0'}">
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="openAddUserDlg()"> 添加 </a> <a href="javascript:void(0)"
			class="easyui-linkbutton " plain="true" onclick="removeDeptUser()">
			移除</a> 
			</c:if>
			<a href="javascript:void(0)" class="easyui-linkbutton "
			plain="true"> 姓名/别名:</a> <input type="text" id="searchName"
			style="width: 90px;"> <a href="javascript:void(0)"
			class="easyui-linkbutton " plain="true" onclick="searchByName()">
			查询 </a>
	</div>
</div>
<jsp:include page="./add.jsp"></jsp:include>

