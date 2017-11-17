<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
.fitem {
	margin-bottom: 15px;
}
</style>
<script>
	/*  打开新增部门信息的对话框 */
	function openDlg() {
		$('#department_dlg').dialog('open').dialog('setTitle', ' ');
		 $('#fm').form('clear');
	}

	//获取上级部门树形层级信息
	function showParentOrgDepartment() {
		$('#parentOrgDepartmentTree')
				.tree(
						{
							url : '${pageContext.request.contextPath}/console/department/parentOrgDepartmentTree.action?id=0&type=dept',
							loadMsg : "数据加载中，请稍后...",
							onBeforeExpand : function(node, param) {
								$('#parentOrgDepartmentTree').tree('options').url = "${pageContext.request.contextPath}/console/department/parentOrgDepartmentTree.action?type=dept";
							},
							onClick : function(node) {
							},
							onCheck : function(node, checked) {
							}
						});
		        $('#parentOrgDepartmentTree_dlg').dialog('open')
				.dialog('setTitle', ' ');

	}

	/* 获取选的上级部门 */
	function selectDepartmentTree() {
		if (($('#parentOrgDepartmentTree').tree('getSelected') != null)) {
			var id = $('#parentOrgDepartmentTree').tree('getSelected').id;
			var url = $('#parentOrgDepartmentTree').tree('getSelected').url;
			var name = $('#parentOrgDepartmentTree').tree('getSelected').text;
			var parentOrgDepartmentId = $('#parentOrgDepartmentId').val();
			if (parentOrgDepartmentId!="0"&&parentOrgDepartmentId == id) {
				$.messager.show({ // show error message
					title : '温馨提示',
					msg : "不能选择自己作为上级部门"
				});
			} else {
				$("#parentOrgDepartment").textbox('setValue', name);
				$("#parentOrgDepartmentId").val(id);
				$('#parentOrgDepartmentTree_dlg').dialog('close');
			}
		} else {
			$.messager.show({ // show error message
				title : '温馨提示',
				msg : "请选择要添加的上级部门"
			});
		}
	}
	
	
	 function saveDepartment(){
            var values=$("#fm").serialize();
            if($("#fm").form('validate')){
              $("#dlg_btnsave").linkbutton("disable");
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/department/add.action",
        		type:"post",
        		data:values,
        		dataType:"json",
        		success:function(result){
        		$("#dlg_btnsave").linkbutton("enable");
        			   if (result.state==false){
        	                $.messager.show({
        	                    title: '温馨提示',
        	                    msg: result.msg
        	                });
        	            } else {
        	                $('#department_dlg').dialog('close');        // close the dialog
        	                $('#dg').treegrid('reload');    // reload the user data
        	            }
        		},
        		error:function(){
        		$("#dlg_btnsave").linkbutton("enable");
        		}
        	});
            }
        }
</script>

<div id="department_dlg" class="easyui-dialog"
	style="width: 500px; height: 300px;" closed="true"
	buttons="#department_dlg_buttons" modal="true">

	<div id="tabs" class="easyui-tabs" fit="true" border="false">
		<div title="新建部门信息">
			<form id="fm" method="post">
				<br>
				<input  type="hidden" name="deptNum"/>
				<div class="fitem">
					<label>部门名</label> 
					
					<input class="easyui-textbox"
						style="width: 280px;" required="true" name="deptName"/>
				</div>
				<div class="fitem">
					<label>上级部门</label>
					 <input id="parentOrgDepartmentId"name="parentDeptNum" type="hidden" value="0" /> 
					 <input class="easyui-textbox" id="parentOrgDepartment"
						name="parentOrgDepartment" type="text" style="width: 280px;"
						data-options="
			prompt: '请选择上级部门',
			icons:[{
				iconCls:'icon-search',
				handler: function(e){
					showParentOrgDepartment();
				}
			}]">
				</div>

				<div class="fitem">
					<label>部门领导人</label> 
				<input id="deptLeader"name="deptLeader" type="hidden" value="" /> 
					 <input class="easyui-textbox" id="deptLeaderName"
						name="deptLeaderName" type="text" style="width: 280px;"
						data-options="
			prompt: '',
			icons:[{
				iconCls:'icon-search',
				handler: function(e){
					opendeptLeaderDlg();
				}
			}]">
				</div>
			</form>
		</div>

	</div>
</div>
<div id="department_dlg_buttons">
	<a id="dlg_btnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveDepartment()" style="width: 90px">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#department_dlg').dialog('close')"
		style="width: 90px">取消</a>
</div>


<!-- 上级部门树形菜单开始 -->
<div id="parentOrgDepartmentTree_dlg" class="easyui-dialog"
	style="width: 450px; height: 350px; padding: 10px 20px" closed="true"
	buttons="#parentOrgDepartmentTree_dlg_btn">
	<div id="parentOrgDepartmentTree"></div>
</div>

<div id="parentOrgDepartmentTree_dlg_btn">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="selectDepartmentTree()" style="width: 90px">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#parentOrgDepartmentTree_dlg').dialog('close')"
		style="width: 90px">取消</a>
</div>
<!-- 上级部门树形菜单结束 -->

<jsp:include page="./addLeader.jsp"></jsp:include>