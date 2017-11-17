<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div id="processMetaDlg" class="easyui-dialog"
	style="width: 900px; height: 500px;" closed="true"
	buttons="#processMetaDlg_buttons" modal="true">
	<div  style="width:20%;float:left;height:400px;">
		<jsp:include page="./processCata.jsp" />
	</div>
	<div style="width:80%;float:left;height:420px;">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<iframe  id="iframe_processmeta"src="${pageContext.request.contextPath}/console/bpm/processmeta/snapshot.xsp"  id="processCata"
		      allowTransparency="true" scrolling="auto" width="100%" height="98%"
				frameBorder="0" name=""></iframe>
		</div>
</div>
	
	
	
	</div>
	<div id="processMetaDlg_buttons">
	<a id="processMetaDlgdlg_btnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveCheckedMeta()" style="width: 90px">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#processMetaDlg').dialog('close')"
		style="width: 90px">取消</a>
</div>