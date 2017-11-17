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
		$('#role_dlg').dialog('open').dialog('setTitle', ' ');
		$("#appName").html("");
		 $('#fm').form('clear');
	}

	
	
	
	 function saveRole(){
            var values=$("#fm").serialize();
            if($("#fm").form('validate')){
            $("#dlg_btnsave").linkbutton("disable");
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/role/saveOrUpdate.action",
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
        	                $('#role_dlg').dialog('close');        // close the dialog
        	                $('#dg').datagrid('reload');    // reload the user data
        	            }
        		}
        	});
            }
        }
</script>

<div id="role_dlg" class="easyui-dialog"
	style="width: 500px; height: 400px;" closed="true"
	buttons="#role_dlg_buttons" modal="true">

	<div id="tabs" class="easyui-tabs" fit="true" border="false">
		<div title="角色信息">
			<form id="fm" method="post">
				<br>
				<div class="fitem">
					<label>角色编码</label> 
					<input class="easyui-textbox"
						style="width: 280px;" required="true" name="roleCode"/>
				</div>
				
				<div class="fitem">
					<label>角色名称</label> 
					<input type="hidden" name="roleNum">
					<input class="easyui-textbox"
						style="width: 280px;" required="true" name="roleName"/>
				</div>
				
				<div class="fitem">
					<label>角色类型</label> 
					<input class="easyui-textbox"
						style="width: 280px;" name="roleType"/>
				</div>
				<div class="fitem" id="appName">
					d
				</div>
			</form>
		</div>

	</div>
</div>
<div id="role_dlg_buttons">
	<a id="dlg_btnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveRole()" style="width: 90px">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#role_dlg').dialog('close')"
		style="width: 90px">取消</a>
</div>




