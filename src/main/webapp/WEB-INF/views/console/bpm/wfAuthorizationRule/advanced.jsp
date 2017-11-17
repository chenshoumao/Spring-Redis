<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/icon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">



<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/frameset.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/My97DatePicker/WdatePicker.js"></script>
<style>
.fitem {
	margin-bottom: 10px;
}

.fitem  label{
	    width: 70px;
    display: inline-block;
}
</style>
<script type="text/javascript">
   //获取选择的条件数据
	function getData(){
		var data = $('#datagrid').datagrid('getData');
		 return data;
	}
	
	/*  打开新增条件信息的对话框 */
	function openDlg() {
		$('#dlg').dialog('open').dialog('setTitle', ' ');
		$("#conditionId").val("");
		$("#rightValue").val("");
	}
	
	function updateRowData(rowData){
	$('#dlg').dialog('open').dialog('setTitle', ' ');
	$("#conditionId").val(rowData.conditionId);
	 $("#rightValue").val(rowData.rightValue);
	 $("#leftValue").val(rowData.leftValue);
	 $("#operator").val(rowData.valueOperator);
	 $("#type").val(rowData.conditionOperator);
	 $("#rightValueType").val(rowData.rightValueType);
	}
	
	function delDatRuleCondition() {
		var rows = $('#datagrid').datagrid('getChecked');
		if (rows.length > 0) {
			$.messager.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var jsonData = {
										conditionId : []
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.conditionId.push(rows[i].conditionId);
									}
									$.ajax({
												url : "${pageContext.request.contextPath}/console/datRule/condition/delDatRuleCondition.action",
												type : "post",
												data : jsonData,
												dataType : "json",
												success : function(result) {
													if (result.state == true) {
														$('#datagrid').datagrid('load');
													} else {
														$.messager.show({ // show error message
															title : '温馨提示',
															msg : result.msg
														});
													}
												}
											});
								}
							});
		}
	}
	
	//保存新增的条件信息
	function saveCfg(){
	var rightValue=$("#rightValue").val();
	if(rightValue==""){
	 $.messager.show({
        	 title: '温馨提示',
        	  msg: '字段值不能为空'
        });
	}else{
            $("#dlg_btnsave").linkbutton("disable");
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/datRule/condition/saveOrUpdate.xsp",
        		type:"post",
        		data:{
        		ruleId:$("#ruleId").val(),
        		ruleStatus:'on',
        		conditionId:$("#conditionId").val(),
        		leftValue: $("#leftValue").val(),
        		leftName:$("#leftValue").find("option:selected").text(),
        		rightValue:$("#rightValue").val(),
        		valueOperator: $("#operator").val(),
        		rightValueType: $("#rightValueType").val(),
        		conditionOperator: $("#type").val(),
        		conditionOperatorName:$("#type").find("option:selected").text()
        		},
        		dataType:"json",
        		success:function(result){
        		$("#dlg_btnsave").linkbutton("enable");
        			   if (result.state==false){
        	                $.messager.show({
        	                    title: '温馨提示',
        	                    msg: result.msg
        	                });
        	            } else {
        	                $('#dlg').dialog('close');        // close the dialog
        	                $('#datagrid').datagrid('load');    // reload the user data
        	            }
        		}
        	});
        	}
            }
            
$(function(){
	$('#datagrid').datagrid(
			{
				height : '95%',
				fit : true,
				url : "${pageContext.request.contextPath}/console/datRule/getRuleConditions.action?ruleId=${ruleId}",
				method : 'POST',
				striped : true,
				nowrap : true,
				showFooter : true,
				loadMsg : '数据加载中请稍候……',
				toolbar : "#toolbar",
				singleSelect : false,
				checkOnSelect : false,
				selectOnCheck : false,
				columns : [ [ {
					field : 'ck',
					checkbox : true
				}, {
					field : 'conditionId',
					title : 'conditionId',
					width : 100,
					align : 'center',
					hidden : true
				}, {
					field : 'leftName',
					title : '字段名称',
					width : 150,
					align : 'center'
				}, {
					field : 'leftValue',
					title : 'leftValue',
					width : 100,
					align : 'center',
					hidden : true
				}
				, {
					field : 'valueOperator',
					title : '运算符',
					width : 50,
					align : 'center'
				}, {
					field : 'rightValue',
					title : '字段值',
					width : 130,
					align : 'center'
				}, {
					field : 'conditionOperatorName',
					title : '操作类型',
					width : 70,
					align : 'center'
				} ,
				 {
					field : 'conditionOperator',
					title : 'conditionOperator',
					width : 100,
					align : 'center',
					hidden:true
				} ,
				 {
					field : 'rightValueType',
					title : 'rightValueType',
					width : 100,
					align : 'center',
					hidden:true
				} 
				] ],
				onSelect : function(rowData) {
					$('#datagrid').datagrid("unselectAll");
				},
				onDblClickRow : function(rowIndex, rowData) {
					updateRowData(rowData);
				}
			});
	
});
</script>
</head>
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}" />

<div id="datagrid" style="width: 100%; height: 100%">
</div>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="openDlg()">创建</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="delDatRuleCondition()">删除</a>
	</div>

<div id="dlg" class="easyui-dialog"
	style="width: 300px; height: 250px;padding-left:3%" closed="true"
	buttons="#dlg_buttons" modal="true">
			<form id="fm" method="post">
				<br>
				<div class="fitem">
					<label>字段名称:</label> 
					<select style="width: 113px;" id="leftValue">
						<c:forEach var="item" items="${detFormFields}" varStatus="status">
							<option value="${item.fieldName}">${item.fieldDescr}</option>
							</c:forEach>
					</select>
				</div>
				
				<div class="fitem" >
					<label>运算符:</label> 
					<select style="width: 113px;" id="operator">
					<option value="==">==</option>
					<option value=">">></option>
					<option value="<"><</option>
					<option value="<="><=</option>
					<option value=">=">>=</option>
					</select>
				</div>
				
				<div class="fitem">
					<label>字段值:</label> 
					<input type="text" id="rightValue">
					<input type="hidden" id="ruleId" value="${ruleId}">
					<input type="hidden" id="conditionId" value="">
					
				</div>
				<div class="fitem">
					<label>字段值类型:</label> 
					<select style="width: 113px;" id="rightValueType">
						<option value="string">字符串</option>
				        <option value="int">整数</option>
					</select>
				</div>
				<div class="fitem" id="appName">
				<label>操作类型:</label> 
				<select style="width: 113px;" id="type">
					<option value="&&">与</option>
			         <option value="||">或</option>
					</select>
				</div>
			</form>
		</div>
<div id="dlg_buttons">
	<a id="dlg_btnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveCfg()" style="width: 90px">确认</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#dlg').dialog('close')"
		style="width: 90px">取消</a>
</div>

</body>
</html>