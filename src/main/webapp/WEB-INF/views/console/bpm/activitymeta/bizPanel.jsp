<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	margin-bottom: 15px;
}

.fitem  label {
	width: 80px;
	display: inline-block;
}
</style>
<script type="text/javascript">
	function updateRowData(rowData) {
		$('#dlg').dialog('open').dialog('setTitle', ' ');
		$('#fm').form('clear');
		$('#fm').form('load', rowData);
		$("#activityId").val("${activityId}");
	}

	//保存新增的条件信息
	function saveCfg() {
		var values = $("#fm").serialize();
		$("#dlg_btnsave").linkbutton("disable");
		$
				.ajax({
					url : "${pageContext.request.contextPath}/console/bpm/activityBizPanel/update.action",
					type : "post",
					data : values,
					dataType : "json",
					success : function(result) {
						$("#dlg_btnsave").linkbutton("enable");
						if (result.state == false) {
							$.messager.show({
								title : '温馨提示',
								msg : result.msg
							});
						} else {
							$('#dlg').dialog('close'); // close the dialog
							$('#datagrid').datagrid('load'); // reload the user data
						}
					}
				});
	}
	
	//根据名称查找
    function searchByName(){
          var name = $('#name').val();
          $('#datagrid').datagrid('load',{
		        "name":name,
		        "formId" : "${formId}",
				"activityId" : "${activityId}"
	       });
      }
      
      //按enter回车事件 执行查询
      document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];       
             if(e && e.keyCode==13){ // enter 键
              searchByName();
            }
        }; 
       
       //批量更新
       function  updateList(values){
       var win = $.messager.progress({
             title:'温馨提示',
             msg:'保存中请稍后...'
          });
         	$.ajax({
					url : "${pageContext.request.contextPath}/console/bpm/activityBizPanel/updates.action",
					type : "post",
					data : values,
					dataType : "json",
					success : function(result) {
					$.messager.progress('close');
						if (result.state == false) {
							$.messager.show({
								title : '温馨提示',
								msg : result.msg
							});
						} else {
							$('#datagrid').datagrid('load'); // reload the user data
						}
					}
				});
       }
       
       //设置为编辑
      function edit(){
      	  var rows = $('#datagrid').datagrid('getChecked');
      	    var jsonData = {
      	           bizpanelIds : [],
      	           activityId:"${activityId}",
      	           bizMode:"edit"
			 };
		   if (rows.length > 0) {
			    for (var i = 0; i < rows.length; i++) {
					 jsonData.bizpanelIds.push(rows[i].bizpanelId);
				 }
				  updateList(jsonData);
          }else{
             $.messager.show({ 
				  title : '温馨提示',
				    msg : '请选择要修改的行'
			   });
         }
      }
      
      
       //设置为只读
      function read(){
      	  var rows = $('#datagrid').datagrid('getChecked');
      	  var jsonData = {
      	           bizpanelIds : [],
      	           activityId:"${activityId}",
      	           bizMode:"read"
			 };
		   if (rows.length > 0) {
			    for (var i = 0; i < rows.length; i++) {
					 jsonData.bizpanelIds.push(rows[i].bizpanelId);
				 }
				  updateList(jsonData);
          }else{
             $.messager.show({ 
				  title : '温馨提示',
				    msg : '请选择要修改的行'
			   });
         }
      }
      
       //设置为隐藏
      function undisplay(){
      	  var rows = $('#datagrid').datagrid('getChecked');
      	   var jsonData = {
      	           bizpanelIds : [],
      	           activityId:"${activityId}",
      	           bizMode:"hidden"
			 };
		   if (rows.length > 0) {
			    for (var i = 0; i < rows.length; i++) {
					 jsonData.bizpanelIds.push(rows[i].bizpanelId);
				 }
				   updateList(jsonData);
          }else{
             $.messager.show({ 
				  title : '温馨提示',
				  msg : '请选择要修改的行'
			   });
         }
      }
	$(function() {
		$('#datagrid')
				.datagrid(
						{
							height : '95%',
							fit : true,
							url : "${pageContext.request.contextPath}/console/bpm/activityBizPanel/listAll.action",
							queryParams : {
								"formId" : "${formId}",
								"activityId" : "${activityId}"
							},
							method : 'POST',
							striped : true,
							nowrap : true,
							showFooter : true,
							loadMsg : '数据加载中请稍候……',
							singleSelect : false,
							checkOnSelect : false,
							selectOnCheck : false,
							rownumbers : true,
							columns : [ [ {
												field : 'ck',
												checkbox : true
											}, {
								field : 'bizpanelId',
								title : 'bizpanelId',
								width : 100,
								align : 'center',
								hidden : true
							}, {
								field : 'activityName',
								title : '环节名称',
								width : 200,
								align : 'center',
								formatter : function(value, rec, index) {
								  return "${activityName}";
								}
							}, 
							{
								field : 'name',
								title : '业务控件名称',
								width : 200,
								align : 'center'
							}, {
								field : 'description',
								title : '描述',
								width : 500,
								align : 'center'
							}, {
								field : 'bizMode',
								title : '状态',
								width : 200,
								align : 'center',
								formatter : function(value, rec, index) {
									if (value == "edit") {
										return "编辑";
									} else if (value == "read") {
										return "只读";
									} else if (value == "hidden") {
										return "隐藏";
									} else {
										return "默认";
									}
								}
							},
							{
								field : 'operate',
								title : '操作',
								width : 100,
								align : 'center',
								formatter : function(value, rec, index) {
										return "修改";
								}
							} 
							
							 ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							},
						/* 	onDblClickRow : function(rowIndex, rowData) {
								updateRowData(rowData);
							}, */
							onClickRow : function(rowIndex, rowData) {
								updateRowData(rowData);
							}
						});

	});
</script>
<title>${activityName}</title>
</head>
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}" />
<div id="toolbar">
	<div>
		<a href="javascript:void(0)" iconCls="icon-add"
			class="easyui-linkbutton " plain="true"
			onclick="edit()">设置为编辑 </a> <a
			href="javascript:void(0)" iconCls="icon-remove"
			class="easyui-linkbutton " plain="true"
			onclick="read()">设置为只读 </a>
			 <a
			href="javascript:void(0)" iconCls="icon-reload" 
			class="easyui-linkbutton " plain="true"
			onclick="undisplay()"> 设置为隐藏 </a> 
			 <a
			href="javascript:void(0)" class="easyui-linkbutton " plain="true">
			业务控件名称:</a> <input type="text" id="name" style="width: 150px;">
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="searchByName()"> 查询 </a>
	</div>
</div>
<div id="datagrid" style="width: 100%; height: 100%"></div>


<div id="dlg" class="easyui-dialog"
	style="width: 300px; height: 210px; padding-left: 3%" closed="true"
	buttons="#dlg_buttons" modal="true">
	<form id="fm" method="post">
		<br>
		<div class="fitem">
			<label>业务控件名称:</label> <input type="text" id="name" name="name"
				style="width: 60%;" disabled="disabled"> <input type="hidden" id="bizpanelId"
				name="bizpanelId"> <input type="hidden" id="activityId"
				name="activityId">
		</div>
		<div class="fitem">
			<label>描述:</label> <input type="text" id="description"
				name="description" style="width: 60%;" disabled="disabled">
		</div>
		<div class="fitem" id="appName">
			<label>状态:</label> <select id="bizMode" style="width: 60%;"
				name="bizMode">
				<option value="edit">编辑</option>
				<option value="read">只读</option>
				<option value="hidden">隐藏</option>
			</select>
		</div>
	</form>
</div>
<div id="dlg_buttons">
	<a id="dlg_btnsave" href="javascript:void(0)"
		class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCfg()"
		style="width: 90px">确认</a> <a href="javascript:void(0)"
		class="easyui-linkbutton" iconCls="icon-cancel"
		onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">取消</a>
</div>

</body>
</html>