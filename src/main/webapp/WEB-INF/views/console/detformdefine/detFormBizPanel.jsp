<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
<style>
.fitem {
	margin-bottom: 20px;
}

.fitem  label{
	    width: 88px;
    display: inline-block;
}
#fm {
    margin: 0;
    padding: 10px 10px;
}
input[type="reset"]::-moz-focus-inner, 
input[type="button"]::-moz-focus-inner, 
input[type="submit"]::-moz-focus-inner, 
input[type="file"] > input[type="button"]::-moz-focus-inner{ 
border:none;padding:0; 
} 
</style>
<script type="text/javascript">
   //获取选择的条件数据
	function getData(){
		var data = $('#datagrid').datagrid('getData');
		 return data;
	}
	
	/*  打开新增信息的对话框 */
	function openDlg() {
		$('#dlg').dialog('open').dialog('setTitle', ' ')
		.window('resize',{top:100 ,left:250});
			$('#fm').form('clear');
		$("#appId").val("${datAppId}");
		$("#formId").val("${formId}");
		
	}
	//更新行的数据
	function updateRowData(rowData){
	$('#dlg').dialog('open').dialog('setTitle', ' ')
	.window('resize',{top:100 ,left:250});
        $('#fm').form('clear');
        $('#fm').form('load', rowData);
	}
	//删除行的数据
	function delRowData() {
		var rows = $('#datagrid').datagrid('getChecked');
		if (rows.length > 0) {
			$.messager.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var jsonData = {
										bizpanelId : []
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.bizpanelId.push(rows[i].bizpanelId);
									}
									$.ajax({
												url : "${pageContext.request.contextPath}/console/detFormBizPanel/delete.action",
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
	if($("#fm").form('validate')){
            $("#dlg_btnsave").linkbutton("disable");
              var values=$("#fm").serialize();
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/detFormBizPanel/saveOrUpdate.xsp",
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
        	                $('#dlg').dialog('close');        // close the dialog
        	                $('#datagrid').datagrid('load');    // reload the user data
        	            }
        		}
        	});
        	}
            }
            
    //打开选择角色对话框
function openRoleDlg(){
    $("#roleDlg").window("open").window("setTitle", "请选择角色")
    .window('resize',{top: 50,left:150});
    iframe_roleDlg.window.$("#alreadSelectRole").empty();
    var roleName=$("#roleName").textbox('getValue');
	 var roleNum=$("#roleNum").val();
	 var roleNames=roleName.split(";");
	  var roleNums=roleNum.split(";");
	  var opts="";
	  for(var i=0;i<roleNames.length;i++){
	     if(roleNums[i]!=""){
	     opts += "<option value='" +roleNums[i] + "'>"
							+ roleNames[i]+ "</option>";
		  }
         }
         if(opts!=""){
	       iframe_roleDlg.window.$("#alreadSelectRole").append(opts);
	 }
}
           
   //保存已选中的角色信息
function saveAlreadSelectRole(){
	var alreadSelectBackLink=iframe_roleDlg.window.saveAlreadSelectRoleData();
	var value = "";
	var name = "";
	for (var i = 0; i < alreadSelectBackLink.length; i++) {
		value += alreadSelectBackLink[i].value + ";";
		name += alreadSelectBackLink[i].text + ";";
	}
	$("#roleName").textbox('setValue',name);
	$("#roleNum").val(value);
	$("#roleDlg").window("close")
	
}
            
$(function(){
	$('#datagrid').datagrid(
			{
				height : '95%',
				fit : true,
				url : "${pageContext.request.contextPath}/console/detFormBizPanel/listAll.action?formId=${formId}",
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
					field : 'appId',
					title : 'appId',
					width : 100,
					align : 'center',
					hidden : true
				}, {
					field : 'bizpanelId',
					title : 'bizpanelId',
					width : 100,
					align : 'center',
					hidden : true
				},{
					field : 'formId',
					title : 'formId',
					width : 100,
					align : 'center',
					hidden : true
				},{
					field : 'name',
					title : '业务控制块名称',
					width : 250,
					align : 'center'
				}, {
					field : 'description',
					title : '业务控制块描述',
					width : 400,
					align : 'center'
				},
				{
					field : 'bizFieldOwnerName',
					title : '业务字段管理者',
					width : 400,
					align : 'center'
				},
				{
					field : 'bizFieldOwnerId',
					title : 'bizFieldOwnerId',
					width : 100,
					align : 'center',
					hidden : true
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
			iconCls="icon-remove" plain="true" onclick="delRowData()">删除</a>
	</div>

<div id="dlg" class="easyui-dialog"
	style="width: 350px; height: 250px;padding-left:3%" closed="true"
	buttons="#dlg_buttons" modal="true">
			<form id="fm" method="post">
				<br><br>
				<div class="fitem">
					<label>业务控制块名称:</label> 
					<input class="easyui-textbox" type="text" name="name" id="name" 
				 				style="width:155px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,100]}"></input>
					<input type="hidden" id="bizpanelId" value="" name="bizpanelId">
					<input type="hidden" id="formId" value="" name="formId">
					<input type="hidden" id="appId" value="" name="appId">
			
				</div>
				<div class="fitem">
					<label>业务控制块描述:</label> 
				<input type="text" id="description" name="description" class="easyui-textbox" type="text" 
				 				style="width:155px"  data-options="required:true">
				</div>
		         <div class="fitem">
			 			<label>业务字段管理者</label>
			 			<input   id="roleName"  name="bizFieldOwnerName"  type="text" style="width:155px;" 
			 				class="easyui-searchbox" searcher="openRoleDlg" title="指定该字段的管理者"  />
			 			<input id="roleNum" name="bizFieldOwnerId" type="hidden"/>
			 		</div>
			</form>
		</div>
<div id="dlg_buttons">
<div style="margin-right:4%">
	<a id="dlg_btnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveCfg()">确认</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#dlg').dialog('close')"
		>取消</a>
		</div>
</div>


    <div id="roleDlg" class="easyui-dialog" style="width: 560px; height: 400px"
		     closed="true" buttons="#roleDlgButtons"  modal="true">
				 <iframe id="iframe_roleDlg" name="iframe_roleDlg" src="${pageContext.request.contextPath}/console/role/selectRoleView.xsp"
		                allowTransparency="true" scrolling="auto" width="100%" 
		                height="100%"frameBorder="0" name=""></iframe> 
	   </div>
			<!-- style="width: 90px"  -->
		<div id="roleDlgButtons" >
		<div style="margin-right:2%">
			<a href="javascript:void(0)" class="easyui-linkbutton" 
				iconCls="icon-ok" onclick="saveAlreadSelectRole()">确认</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" 
				iconCls="icon-cancel"  onclick="javascript:$('#roleDlg').dialog('close')">取消</a>
		</div>
		</div>
</body>
</html>