<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>表单应用库-设计</title>
	<jsp:include page="../resources.jsp"></jsp:include>
</head>
<body >
<style>
.fitem {
	margin-bottom: 15px;
}
</style>
<script type="text/javascript">
function edit_authority_dlg(row) {
 	if (row) {
			$('#authority_edit_dlg').dialog('open').dialog('setTitle', ' ');
			$('#authority_edit_form').form('clear');
			$('#authority_edit_form').form('load', row);
			$("#appId").val("${appId}");
		 var objType = $("#objType").val();
		if (objType == "employee") {
			$("#editName").val(row.nickName);
		} else if (objType == "role") {
			$("#editName").val(row.roleName);
		} else if (objType == "department") {
			$("#editName").val(row.deptName);
	     } else if (objType == "default") {
	       $("#editName").val("默认权限");
		 } 
		}
	}
	
	/* datagrid 数据加模型 开始*/
	function modelDatagrid(id, url, columns, isContain, toolbar) {
	$('#' + id).html("");
		$('#' + id).datagrid({
			fit : true,
			url : url,
			method : 'POST',
			queryParams : {
				"appId" : $("#authorityAppId").val(),
				"isContain" : isContain,
				"name":$("#authoritySearchName").val()
			},
			striped : true,
			nowrap : true,
			pageSize : 10,
			pageNumber : 1,
			pageList : [ 10,20,30,40,50,60,70],
			showFooter : true,
			loadMsg : '数据加载中请稍候……',
			pagination : true,
			toolbar : "#" + toolbar,
			singleSelect : false,
			checkOnSelect : false,
			selectOnCheck : false,
			columns : [ columns ],
			onSelect : function(rowData) {
				$('#datagrid').datagrid("unselectAll");
			},
			onDblClickRow :function(rowIndex,rowData){
              if(isContain==1){
              edit_authority_dlg(rowData);
              }
			}
		});
	}
	/*   datagrid 数据加模型 结束 */

	/* 属于应用库的权限用户  开始 */
	function userGrid() {
		var url = '${pageContext.request.contextPath}/console/datapp/authority/user/shows.action';
		var columns = [ {
			field : 'ck',
			checkbox : true
		}, 
		{
			field : 'aclId',
			title : 'aclId',
			width : 100,
			align : 'center',
			hidden : true
		},
		{
			field : 'empNum',
			title : '员工id',
			width : 100,
			align : 'center',
			hidden : true
		}, {
			field : 'empName',
			title : '账号',
			width : 100,
			align : 'center'
		}, {
			field : 'nickName',
			title : '姓名',
			width : 100,
			align : 'center'
		}, {
			field : 'aclLevel',
			title : '权限级别',
			width : 100,
			align : 'center',
			formatter : function(value, rec, index) {
				if (value == "manager") {
					return "管理员";
				} else if (value == "editor") {
					return "编辑者";
				} else if (value == "author") {
					return "作者";
				} else if (value == "reader") {
					return "读者";
				} else if (value == "noaccess") {
					return "无访问权限";
				}
			}
		}, {
			field : 'createDocPermit',
			title : '创建文档',
			width : 100,
			align : 'center'
		}, {
			field : 'deleteDocPermit',
			title : '删除文档',
			width : 100,
			align : 'center'
		} ];
		modelDatagrid("authority", url, columns, 1, "authorityToolbar");

	}
	/* 属于应用库的权限用户 结束 */

	/* 不属于应用库权限用户 开始 */
	function notBelongUserGrid() {
		var url = '${pageContext.request.contextPath}/console/datapp/authority/user/shows.action';
		var columns = [ {
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
			title : '账号',
			width : 100,
			align : 'center'
		}, {
			field : 'ldapUid',
			title : 'LDAP UID',
			width : 100,
			align : 'center'
		}, {
			field : 'nickName',
			title : '姓名',
			width : 100,
			align : 'center'
		} ];
		modelDatagrid("unAuthority", url, columns, 0, "authorityTypeToolbar");
	}
	/* 不属于应用库权限用户 结束 */

	function roleGrid() {
		var url = '${pageContext.request.contextPath}/console/datapp/authority/role/shows.action';
		var columns = [ {
			field : 'ck',
			checkbox : true
		}, 
		{
			field : 'aclId',
			title : 'aclId',
			width : 100,
			align : 'center',
			hidden : true
		},
		{
			field : 'roleNum',
			title : '角色id',
			width : 100,
			align : 'center',
			hidden : true
		}, {
			field : 'roleName',
			title : '角色名称',
			width : 100,
			align : 'center'
		}, {
			field : 'aclLevel',
			title : '权限级别',
			width : 100,
			align : 'center',
			formatter : function(value, rec, index) {
				if (value == "manager") {
					return "管理员";
				} else if (value == "editor") {
					return "编辑者";
				} else if (value == "author") {
					return "作者";
				} else if (value == "reader") {
					return "读者";
				} else if (value == "noaccess") {
					return "无访问权限";
				}
			}
		}, {
			field : 'createDocPermit',
			title : '创建文档',
			width : 100,
			align : 'center'
		}, {
			field : 'deleteDocPermit',
			title : '删除文档',
			width : 100,
			align : 'center'
		} ];
		modelDatagrid("authority", url, columns, 1, "authorityToolbar");
	}

	function notBelongRoleGrid() {
		var url = '${pageContext.request.contextPath}/console/datapp/authority/role/shows.action';
		var columns = [ {
			field : 'ck',
			checkbox : true
		}, {
			field : 'roleNum',
			title : '角色id',
			width : 100,
			align : 'center',
			hidden : true
		}, {
			field : 'roleName',
			title : '角色名称',
			width : 350,
			align : 'center'
		} ];
		modelDatagrid("unAuthority", url, columns, 0, "authorityTypeToolbar");
	}

	
	function departmentTreeGrid() {
		var url = '${pageContext.request.contextPath}/console/datapp/authority/department/shows.action';
		var columns = [ {
			field : 'ck',
			checkbox : true
		},
		{
			field : 'aclId',
			title : 'aclId',
			width : 100,
			align : 'center',
			hidden : true
		},
		 {
			title : '部门id',
			field : 'deptNum',
			hidden : true,
			width : 100
		},{
			title : '部门名称',
			field : 'deptName',
			width : 150
		}, {
			title : '上级部门',
			field : 'parentDeptNum',
			width : 100
		}, {
			field : 'aclLevel',
			title : '权限级别',
			width : 100,
			align : 'center',
			formatter : function(value, rec, index) {
				if (value == "manager") {
					return "管理员";
				} else if (value == "editor") {
					return "编辑者";
				} else if (value == "author") {
					return "作者";
				} else if (value == "reader") {
					return "读者";
				} else if (value == "noaccess") {
					return "无访问权限";
				}
			}
		}, {
			field : 'createDocPermit',
			title : '创建文档',
			width : 100,
			align : 'center'
		}, {
			field : 'deleteDocPermit',
			title : '删除文档',
			width : 100,
			align : 'center'
		} ];
		modelDatagrid("authority", url, columns, 1, "authorityToolbar");
	}

	function belongDepartmentTreeGrid() {
		var url = '${pageContext.request.contextPath}/console/datapp/authority/department/shows.action';
		var columns = [ {
			field : 'ck',
			checkbox : true
		}, {
			title : '部门id',
			field : 'deptNum',
			hidden : true,
			width : 100
		},  {
			title : '部门名称',
			field : 'deptName',
			width : 300
		} ,{
			title : '上级部门',
			field : 'parentDeptNum',
			hidden : true,
			width : 100
		}];
		modelDatagrid("unAuthority", url, columns, 0, "authorityTypeToolbar");
	}

	function defaultGrid() {
		var url = '${pageContext.request.contextPath}/console/datapp/authority/default.action';
		var columns = [ {
			field : 'ck',
			checkbox : true
		}, {
			field : 'aclId',
			title : 'aclId',
			width : 100,
			align : 'center',
			hidden : true
		},
		{
			field : 'name',
			title : '名称',
			width : 100,
			align : 'center',
			formatter : function(value, rec, index) {
			   return "默认权限";
			}
		}, 
		{
			field : 'aclLevel',
			title : '权限级别',
			width : 100,
			align : 'center',
			formatter : function(value, rec, index) {
				if (value == "manager") {
					return "管理员";
				} else if (value == "editor") {
					return "编辑者";
				} else if (value == "author") {
					return "作者";
				} else if (value == "reader") {
					return "读者";
				} else if (value == "noaccess") {
					return "无访问权限";
				}
			}
		}, {
			field : 'createDocPermit', 
			title : '创建文档',
			width : 100,
			align : 'center'
		}, {
			field : 'deleteDocPermit',
			title : '删除文档',
			width : 100,
			align : 'center'
		} ];
		modelDatagrid("authority", url, columns, 1, "authorityToolbar");

	}

	function objType() {
$("#addDatAcls").removeAttr("disabled");
$("#delDatAcls").removeAttr("disabled");
		var objType = $("#objType").val();
		if (objType == "employee") {
			$("#authorityAppIdType").val("employee");
			notBelongUserGrid();
			userGrid();

		} else if (objType == "role") {
			$("#authorityAppIdType").val("role");
			roleGrid();
			notBelongRoleGrid();
		} else if (objType == "department") {
			$("#authorityAppIdType").val("department");
			belongDepartmentTreeGrid();
			departmentTreeGrid();
	} else if (objType == "default") {
			$("#authorityAppIdType").val("default");
			$("#addDatAcls").attr("disabled", true);
            $("#delDatAcls").attr("disabled", true);
			defaultGrid();
		}
	}

     function unAuthoritySearch(){
     var name=$("#authoritySearchName").val();
    // if(name==""){
   //  alert("查询条件不能为空");
   //  }else {
     var objType = $("#objType").val();
		if (objType == "employee") {
			notBelongUserGrid();
		} else if (objType == "role") {
			notBelongRoleGrid();
		} else if (objType == "department") {
			belongDepartmentTreeGrid();
		}
		//}
     }
     
	function datAclsAjax(url, data) {
		$.ajax({
			url : url,
			type : "post",
			data : data,
			dataType : "json",
			success : function(result) {
				if (result.state == true) {
					$('#authority').datagrid('load');
					$('#unAuthority').datagrid('load');
				} else {
					$.messager.show({ // show error message
						title : '温馨提示',
						msg : result.msg
					});

				}
			}
		});

	}

	function addDatAcls() {
		var url = "${pageContext.request.contextPath}/console/datapp/authority/add.action";
		var appId = $("#authorityAppId").val();
		var type = $("#authorityAppIdType").val();
		var authorityType = $("#authorityType").val();
		var jsonData = {
			appid : "",
			type : "",
			authorityType : "",
			docPermit : [],
			objId : []
		};
		jsonData.docPermit.push("0");
		$('input[name="docPermit"]:checked').each(function() {
			jsonData.docPermit.push($(this).val());
		});
		jsonData.appid = appId;
		jsonData.type = type;
		jsonData.authorityType = authorityType;
		var rows = $('#unAuthority').datagrid('getChecked');
		if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					if (type == "employee") {
						jsonData.objId.push(rows[i].empNum);
					} else if (type == "role") {
						jsonData.objId.push(rows[i].roleNum);
					}else if (type == "department") {
						jsonData.objId.push(rows[i].deptNum);
					}
					
					
				}
				datAclsAjax(url, jsonData);
			
		}else{
			$.messager.show({ // show error message
						title : '温馨提示',
						msg : "请选择要添加的行"
					});
		}
	}

	function delDatAcls() {
		var url = "${pageContext.request.contextPath}/console/datapp/authority/delete.action";
		var appId = $("#authorityAppId").val();
		var type = $("#authorityAppIdType").val();
		var jsonData = {
			appid : "",
			type : "",
			objIds : [],
		};
		jsonData.appid = appId;
		jsonData.type = type;
			var rows = $('#authority').datagrid('getChecked');
			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					if (type == "employee") {
						jsonData.objIds.push(rows[i].empNum);
					} else if (type == "role") {
						jsonData.objIds.push(rows[i].roleNum);
					}else if (type == "department") {
						jsonData.objIds.push(rows[i].deptNum);
					}
				}
				datAclsAjax(url, jsonData);
			}else{
			$.messager.show({ // show error message
						title : '温馨提示',
						msg : "请选择要移除的行"
					});
			}
		
	}
	
	function authorityTypeOnChange(){
	var authorityType=$("#authorityType").val();
	
	  if(authorityType=="noaccess"||authorityType=="reader"){
	  $('input[name="docPermit"]').each(function() {
	       $(this).attr("checked",false);
			$(this).attr("disabled","disabled");
		});
	  }else{
	    $('input[name="docPermit"]').each(function() {
			$(this).removeAttr("disabled");
		});
	  }
	  
	   if(authorityType=="manager"){
	      $('input[name="docPermit"]').each(function() {
	       $(this).attr("checked",true);
		});
	   }else{
	      $('input[name="docPermit"]').each(function() {
	       $(this).attr("checked",false);
	       });
	   }
	  
	  
	}
	
	
	
		 function saveEditAuthority(){
            var values=$("#authority_edit_form").serialize();
            if($("#authority_edit_form").form('validate')){
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/datapp/authority/edit.action",
        		type:"post",
        		data:values,
        		dataType:"json",
        		success:function(result){
        			   if (result.state==false){
        	                $.messager.show({
        	                    title: '温馨提示',
        	                    msg: result.msg
        	                });
        	            } else {
        	                $('#authority_edit_dlg').dialog('close');        // close the dialog
        	                $('#authority').datagrid('load');    // reload the user data
        	            }
        		}
        	});
            }
        }
	
	
	$(function(){
		$("#authoritySearchName").val("");
		$("#objType").val("role");
			$("#authorityAppId").val("${appId}");
			$("#authorityAppIdType").val("role");
			$('#authority_dlg').dialog('open').dialog('setTitle', ' ');
   	        var authorityType=$("#authorityType").val("noaccess");
	       $('input[name="docPermit"]').each(function() {
	            $(this).attr("checked",false);
			    $(this).attr("disabled","disabled");
			});
			roleGrid();
			notBelongRoleGrid();
		
	});
</script>
<input type="hidden" id="authorityAppId">
<input type="hidden" id="authorityAppIdType">

	<div style="width: 40%; float: left; height: 400px;">
	<div id="unAuthority"></div>
	</div>
	<div
		style="width: 8%; float: left; height: 400px;padding-left:8px; padding-right:12px; text-align: center; ">
		<br> <br><br> <br><br> <br><br> <br>
		<table border="0" >
		<tbody>
		<tr style="height:50px">
		<th>
		<button id="addDatAcls" style="font-size: 15px" onclick="addDatAcls();">添加权限>></button>
		</th>
		</tr>
		<tr>
		<th>
		<button id="delDatAcls" style="font-size: 15px" onclick="delDatAcls();">删除权限<<</button>
		</th>
		</tr>
		</tbody>
		</table>
		
		
	</div>
	<div style="width: 50%; float: left; height: 400px;">
		
			<div id="authority"></div>
	</div>

<!-- </div> -->

<div id="authorityToolbar">
	<div>
		
			授权对象类型: <select style="width: 100px;" id="objType"
			onchange="objType()">
				<!-- <option value="default">默认</option> -->
				<option value="role">角色</option>
				<option value="department">部门</option>
				<option value="employee">员工</option>
				<option value="default">默认</option>
				
		</select>
	
	</div>
</div>





<div id="authorityTypeToolbar">
	<div>
		
			权限级别: <select style="width: 100px;" name="authorityType"
			id="authorityType" onchange="authorityTypeOnChange()">
				<option value="noaccess">无访问权限</option>
				<option value="reader">读者</option>
				<option value="author">作者</option>
				<option value="editor">编辑者</option>
				<option value="manager">管理员</option>
		</select>
		 <a href="javascript:void(0)" class="easyui-linkbutton " plain="true">
			<input type="checkbox" name="docPermit" value="delete" /> 创建文档
		</a> <a href="javascript:void(0)" class="easyui-linkbutton " plain="true">
			<input type="checkbox" name="docPermit" value="create" /> 删除文档
		</a>
		<br>
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true">
				名称:</a><input type="text" id="authoritySearchName" style="width: 90px;">
			 <a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="unAuthoritySearch()"> 查询 </a>
		
	</div>
</div>


<div id="authority_edit_dlg" class="easyui-dialog"
	style="width: 400px;height:300px; padding-top:5%;padding-left:3%" closed="true" modal="true"
	buttons="#authority_edit_dlg_btn">
	<form action="" id="authority_edit_form">
	<div class="fitem">
		<label>名称</label> 
		<input type="hidden" name="aclId">
		<input type="hidden" name="appId" id="appId" value="${appId}">
		
		<input 
		style="width: 200px;" name="name" id="editName"  disabled="disabled"/>
		</div>
		<div class="fitem">
		<label>权限级别</label>
		   <select style="width: 200px;" name="aclLevel">
				<option value="noaccess">无访问权限</option>
				<option value="reader">读者</option>
				<option value="author">作者</option>
				<option value="editor">编辑者</option>
				<option value="manager">管理员</option>
		</select>
		</div>
		<div class="fitem">
		<label>创建文档</label>
		   <select style="width: 200px;" name="createDocPermit">
				<option value="on">开启</option>
				<option value="off">禁止</option>
		</select>
		</div>
		<div class="fitem">
		<label>删除文档</label>
		   <select style="width: 200px;" name="deleteDocPermit">
				<option value="on">开启</option>
				<option value="off">禁止</option>
				
		</select>
		</div>
	</form>
	</div>
	<div id="authority_edit_dlg_btn">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok"
		onclick="saveEditAuthority()"
		style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok"
		onclick="javascript:$('#authority_edit_dlg').dialog('close')"
		style="width: 90px">关闭</a>
</div>
	
</body>
</html>
