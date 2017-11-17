<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript">
	//关闭选择高级授权对话框
	function closedAdvanceDlg() {
		$("#advanceDlg").dialog('close');
	}
	//打开选择高级授权对话框
	function openAdvanceDlg(processId,ruleId) {
		$("#advanceDlg").dialog('open');
		$('#iframe_advanceDlg').attr(
			"src","${pageContext.request.contextPath}/console/bpm/processFormMap/advanceIndex.xsp?processId="
			  + processId+"&ruleId="+ruleId);

	}
    //保存选中高级授权条件
	function saveAdvanceData() {
		var data = iframe_advanceDlg.window.getData();
		var rows = data.rows;
		var names = "";
		var values="";
		for (i = 0; i < rows.length; i++) {
			var obj = rows[i];
			if (obj.leftValue != "") {
				names += obj.leftName + obj.valueOperator + obj.rightValue;
				if (i != (rows.length - 1)) {
					names +="  "+obj.conditionOperatorName+"  ";
				}
			}
		}
		iframe_config.window.$("#advancedConditions").val(names);
		$("#advanceDlg").dialog('close');
	}
</script>
<div id="advanceDlg" class="easyui-dialog" title=""
	style="width: 450px; height: 400px; padding: 0px 0px" closed="true"
	buttons="#advanceDlgButton">
	<iframe id="iframe_advanceDlg" name="iframe_advanceDlg" src=""
		allowTransparency="true" scrolling="auto" width="100%" height="100%"
		frameBorder="0" name=""></iframe>

</div>
<div id="advanceDlgButton" style="display: none">
	<a id="advanceDlgBtnsave" href="javascript:void(0)"
		class="easyui-linkbutton c6" iconCls="icon-ok"
		onclick="saveAdvanceData()" style="width: 90px">确认</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:closedAdvanceDlg()"
		style="width: 90px">取消</a>
</div>