<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
	function authority_dlg() {
		var selRows = $('#grid1').datagrid('getChecked');
	
		if (selRows.length == 1) {
			$('#authority_dlg').dialog('open').dialog('setTitle', ' ');
		$('#persionframeId').attr("src","${pageContext.request.contextPath}/console/datapp/authority/index.action?appId="+selRows[0].appId);  
		}else{
			$.messager.show({ // show error message
						title : '温馨提示',
						msg : "请选择一个应用库进行授权"
					});
		}
	}
</script>
<div id="authority_dlg" class="easyui-dialog"
	style="width: 1100px;" closed="true" modal="true"
	buttons="#authority_dlg_btn">
	<iframe id="persionframeId" src="" 
		   allowTransparency="true" scrolling="auto" width="100%" height="400px"
				frameBorder="0" name=""></iframe>
	</div>
	<div id="authority_dlg_btn">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok"
		onclick="javascript:$('#authority_dlg').dialog('close')"
		style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-cancel"
		onclick="javascript:$('#authority_dlg').dialog('close')"
		style="width: 90px">关闭</a>
</div> 

</html>