<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../../resources.jsp"></jsp:include>
<title>流程与表单映射</title>
<style type="text/css">
#fm {
	margin: 0;
	padding: 0px 0px;
}
</style>
<script type="text/javascript">
    //根据应用库的id 获取应用库下的表单
	function getForms() {
		$('#formId').empty();
		$
				.ajax({
					url : "${pageContext.request.contextPath}/console/detform/getforms/getAllFormNames.action",
					type : "post",
					data : {
						"datappid" : $("#appId").val()
					},
					dataType : "json",
					success : function(result) {
						if (result.state == false) {
							$.messager.show({
								title : '温馨提示',
								msg : result.msg
							});
						} else {
							var datas = result.datas;
							$('#formId').combobox({
								valueField : 'id',
								data : datas,
								textField : 'text',
								multiple : false
							});
						}
					}
				});
	}
	
	//根据表单的名称选中表单的下拉框
	function selectFormsByName(formName) {
		$('#formId').empty();
		$
				.ajax({
					url : "${pageContext.request.contextPath}/console/detform/getforms/getAllFormNames.action",
					type : "post",
					data : {
						"datappid" : $("#appId").val()
					},
					dataType : "json",
					success : function(result) {
						if (result.state == false) {
							$.messager.show({
								title : '温馨提示',
								msg : result.msg
							});
						} else {
							var datas = result.datas;
							if(datas.length>0){
							for(i=0;i<datas.length;i++){
							  var text=datas[i].text;
							  if(formName== text){
							    formName=datas[i].id;
							  }
							}
							$('#formId').combobox({
								valueField : 'id',
								data : datas,
								textField : 'text',
								multiple : false
							});
							$('#formId').combobox('select',formName);
						}
						}
					}
				});
	}
    //加载流程与表单的映射数据
	function datagrid() {
		$('#dg')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/bpm/processFormMap/findByPage.action',
							method : 'POST',
							queryParams : {
								"name" : ""
							},
							striped : true,
							nowrap : true,
							pageSize : 20,
							pageNumber : 1,
							pageList : [10,20,30,40,50 ],
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
										field : 'pfmid',
										title : 'pfmid',
										width : 100,
										align : 'center',
										hidden : true
									},
										{
										field : 'appId',
										title : 'appId',
										width : 100,
										align : 'center',
										hidden : true
									},
									{
										field : 'formId',
										title : 'formId',
										width : 100,
										align : 'center',
										hidden : true
									},
									{
										field : 'workflowCode',
										title : '流程编码',
										width : 200,
										align : 'center'
									},
									{
										field : 'appTitle',
										title : '应用库名称',
										width : 200,
										align : 'center'
									},
									{
										field : 'formTitle',
										title : '表单名称',
										width : 200,
										align : 'center'
									},
									{
										field : 'creatorName',
										title : '创建者',
										width : 200,
										align : 'center'
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 200,
										align : 'center',
										formatter : function(value, rec, index) {
											var s = new Date(value)
													.pattern("yyyy-MM-dd hh:mm:ss");
											return s;
										}
									},
									{
										field : 'updateByName',
										title : '更新者',
										width : 200,
										align : 'center'
									},
									{
										field : 'updateTime',
										title : '更新时间',
										width : 200,
										align : 'center',
										formatter : function(value, rec, index) {
											var s = new Date(value)
													.pattern("yyyy-MM-dd hh:mm:ss");
											return s;
										}
									} ] ],
							onSelect : function(rowData) {
								$('#datagrid').datagrid("unselectAll");
							},
							onDblClickRow : function(rowIndex, rowData) {
								edit(rowData);
							}
						});
	}
	
	function edit(row) {
		if (row) {
			$('#config_dlg').dialog('open').dialog('setTitle', ' ');
		  	$('#fm').form('clear');
	        var appName=row.appName;
	         var formName=row.formName;
	         var pfmid=row.pfmid;
	         var workflowCode=row.workflowCode;
	        $("#workflowCode").textbox('setValue',workflowCode);
	       // console.log(appName);
          // $("#appId").find("option[text='"+appName+"']").attr("selected", true);
          /*  $('#appId option:contains(' + appName + ')').each(function(){
              if ($(this).text() == appName) {
                     $(this).attr('selected', true);
                 }
              }); */
               $('#appId').val(row.appId);
          // var formId = $('#formId').combobox('getValue');
           $('#PFMId').val(pfmid);
           selectFormsByName(row.formId);
		}
	}

   //打开新建对话框
	function openDlg() {
		$('#config_dlg').dialog('open').dialog('setTitle', ' ');
		$('#fm').form('clear');
	    $('#formId').empty();
	    $("#workflowCode").textbox('setValue',"");
	    $('#PFMId').val("");
	}
	
      //保存信息
        function save(){
           var workflowCode= $("#workflowCode").textbox('getValue');
           var appId=$('#appId').val();
           var formId = $('#formId').combobox('getValue');
           var PFMId=$('#PFMId').val();
           if(workflowCode==""){
             $.messager.show({ // show error message
			   title : '温馨提示',
			    msg :'流程编码不能为空'
			 });
           }else  if(appId==""){
             $.messager.show({ // show error message
			   title : '温馨提示',
			    msg :'应用库名称不能为空'
			 });
           }else  if(formId==""){
             $.messager.show({ // show error message
			   title : '温馨提示',
			    msg :'表单名称不能为空'
			 });
           }else{
               $.ajax({
					url : "${pageContext.request.contextPath}/console/bpm/processFormMap/createOrUpdate.action",
					type : "post",
					data : {
					  workflowCode:workflowCode,
					  appName:appId,
					  formName:formId,
					  PFMId:PFMId
					  },
					dataType : "json",
					success : function(result) {
						if (result.state == true) {
							$('#dg').datagrid('reload');
							$('#config_dlg').dialog('close')
						 } else {
							$.messager.show({ // show error message
							    title : '温馨提示',
								msg : result.msg
							});
						 }
					 }
				});
           }
        }
        
        //删除流程与表单映射信息
       function destroy() {
		var rows = $('#dg').datagrid('getChecked');
		  if (rows.length > 0) {
			  $.messager.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var jsonData = {
										PFMIds : []
									};
									for (var i = 0; i < rows.length; i++) {
									//console.log(rows[i]);
										jsonData.PFMIds.push(rows[i].pfmid);
									}
									$.ajax({
												url : "${pageContext.request.contextPath}/console/bpm/processFormMap/delete.action",
												type : "post",
												data : jsonData,
												dataType : "json",
												success : function(result) {
													if (result.state == true) {
														$('#dg').datagrid(
																'reload');
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
   
    
	$(function() {
		datagrid();
         //初始化编辑器
	 
	});

</script>
</head>
<body>
<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="datAppId" value="" />
	<input type="hidden" id="_dataGridId" value="dg" />
	<div id="dg" style="width: 100%; height: 100%"></div>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="openDlg()">创建</a>
			 <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
		
	</div>
	
	<div id="config_dlg" class="easyui-dialog"
		style="width: 500px; height: 350px;" closed="true"
		buttons="#config_dlg_buttons" modal="true">
		<form action="#" method="post" id="fm">
		    <input type="hidden" name="PFMId" id="PFMId">
			<div id="scriptTabs" class="easyui-tabs" style="width: 100%; height: 270px">
				<div title="映射配置" style="padding: 30px">
				 
					<div class="fitem">
						<label>流程编码</label>
						 <input class="easyui-textbox" id="workflowCode"
							style="width: 280px;" required="true" name="workflowCode" />
							<span style="color:red"  >*</span>
					</div> 
					<br>
					<div class="fitem">
						<label>应用库名称</label>
						 <sot:combobox id="appId" name="appId"
						cssstyle="-webkit-border-radius: 6px 6px 6px 6px; border-radius: 6px 6px 6px 6px;margin-left: 0px;margin-right: 0px;padding-top: 3px;padding-bottom: 3px;width: 280px;"
						onchange="getForms()"
						data="select app_Title text ,app_Id  value from DAT_APPLICATION "
						staticvalue="|请选择一个应用库"></sot:combobox><span style="color:red"  >*</span>
					</div> 
					<br>
					<div class="fitem">
						<label>表单名称</label>
						 <select id="formId" name="formId"
						class="easyui-combobox" style="width: 280px;">
						<option value="">请选择一个表单</option>
					</select><span style="color:red"  >*</span>
					</div> 
					</div>
				</div>
			</div>
		</form>
	</div>

	<div id="config_dlg_buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#config_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>