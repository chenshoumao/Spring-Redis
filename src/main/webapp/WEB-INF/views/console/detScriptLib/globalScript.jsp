<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
 	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/ueditor_ori/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/ueditor_ori/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/scripts/ueditor_ori/lang/zh-cn/zh-cn.js"></script><title>Insert title here</title>
 	<script src="${pageContext.request.contextPath}/scripts/console/zipFileImport.js" type="text/javascript"></script>
 
<title>Insert title here</title>
<style type="text/css">
#fm {
	margin: 0;
	padding: 0px 0px;
}
</style>
<script type="text/javascript">
/*  var bodyEditor = UE.getEditor('scriptCode', {
			toolbars: [ ['fullscreen']],
         enterTag:'',
          textarea:'scriptCode',
           //关闭字数统计
         wordCount:false,
         //关闭elementPath
         elementPathEnabled:false,
		   initialContent : " /* js代码在此次编写  "
		});  
		*/
	function datagrid() {
		$('#dg')
				.datagrid(
						{
							height : '100%',
							fit : true,
							url : '${pageContext.request.contextPath}/console/detScriptLib/global/shows.action',
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
										field : 'scriptId',
										title : '脚本id',
										width : 100,
										align : 'center',
										hidden : true
									},
									{
										field : 'scriptName',
										title : '名称',
										width : 200,
										align : 'center'
									},
									{
										field : 'creator',
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
										field : 'updateBy',
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
								editScriptLib(rowData);
							}
						});
	}
	
	function editScriptLib(row) {
		if (row) {
			$('#global_script_dlg').dialog('open').dialog('setTitle', ' ');
		  	$('#fm').form('clear');
		  	var createTime = new Date(row.createTime).pattern("yyyy-MM-dd hh:mm:ss");
		    var updateTime = new Date(row.updateTime).pattern("yyyy-MM-dd hh:mm:ss");
		    row.createTime=createTime;
		    row.updateTime=updateTime;
		  	$('#fm').form('load', row);
		  //	var ue = UE.getEditor('scriptCode');
		 /*    bodyEditor.setEnabled();
		  	 bodyEditor.execCommand('source')
		  	bodyEditor.ready(function(){
		 bodyEditor.setContent(row.scriptCode);
            }); */
		  	
		//  $("#scriptCode").val(row.scriptCode);
	/* 	UE.getEditor('scriptCode').destroy();
		alert(row.scriptCode);
		   var bodyEditor = UE.getEditor('scriptCode', {
			toolbars: [ ['fullscreen']],
         enterTag:'',
          textarea:'scriptCode',
		   initialContent : row.scriptCode
		});   */
		 //判断ueditor 编辑器是否创建成功
     //   ue.addListener("ready", function () {
        // editor准备好之后才可以使用
       // ue.setContent(row.scriptCode);

      //  });
		}
	}


	function openDlg() {
		$('#global_script_dlg').dialog('open').dialog('setTitle', ' ');
		$('#fm').form('clear');
	/* 	bodyEditor.setEnabled();
		bodyEditor.execCommand('source')
		 bodyEditor.setContent("23423"); */
		  var date=new Date().pattern("yyyy-MM-dd hh:mm:ss");
            $("#updateTime").textbox('setValue',date);
            $("#createTime").textbox('setValue',date);
            $("#creator").textbox('setValue',"${_currUserName}");
            $("#updateBy").textbox('setValue',"${_currUserName}");
	       var data = $('#appId').combobox('getData');
                  if(data.length!=0){
                   $('#appId').combobox('select',data[0].id);
                    }
	}
      //保存脚本库信息
        function save(){
            var values=$("#fm").serialize();
            if($("#fm").form('validate')){
            $.ajax({
        		url: '${pageContext.request.contextPath}/console/detScriptLib/global/saveOrUpdate.action',
        		type:"post",
        		data:values,
        		dataType:"json",
        		success:function(result){
        			   if (!result.state){
        	                $.messager.show({
        	                    title: 'Error',
        	                    msg: result.msg
        	                });
        	            } else {
        	                $('#global_script_dlg').dialog('close');        // close the dialog
        	                $('#dg').datagrid('reload');    // reload the user data
        	            }
        		}
        	});
            }else{
            $("#scriptTabs").tabs("select", 1);
            }
        }
        
        //删除脚本库信息
       function destroyScriptLib() {
		var rows = $('#dg').datagrid('getChecked');
		  if (rows.length > 0) {
			  $.messager.confirm(
							'温馨提示',
							'你真的要删除么?',
							function(r) {
								if (r) {
									var jsonData = {
										scriptIds : []
									};
									for (var i = 0; i < rows.length; i++) {
										jsonData.scriptIds.push(rows[i].scriptId);
									}
									$.ajax({
												url : "${pageContext.request.contextPath}/console/detScriptLib/global/delete.action",
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
<jsp:include page="./export.jsp"></jsp:include>
</head>
<body>
<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
	<input type="hidden" id="datAppId" value="" />
	<input type="hidden" id="_dataGridId" value="dg" />
	<div id="dg" style="width: 100%; height: 100%"></div>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="openDlg()">创建</a> <!-- <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="view()">查看</a> --> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyScriptLib()">删除</a>
		<a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-print" plain="true" onclick="exportScript()">导出</a>
			<a href="javascript:void(0)"   id="zipFileImport"  class="easyui-linkbutton"  iconCls="icon-mini-add" plain="true">导入</a>
	</div>
	
	<div id="global_script_dlg" class="easyui-dialog"
		style="width: 700px; height: 500px;" closed="true"
		buttons="#global_script_dlg_buttons" modal="true">
		<form action="#" method="post" id="fm">
		    <input type="hidden" name="scriptId" id="scriptId">
			<div id="scriptTabs" class="easyui-tabs" style="width: 100%; height: 430px">
				<div title="代码">
			<!-- 		<textarea name="scriptCode" id="scriptCode" style="height: 90%; width: 99%"></textarea>
				 -->
				<textarea  id="scriptCode" name="scriptCode"  style="height: 90%; width: 99%">
                      </textarea>
				</div>
				<div title="属性" style="padding: 30px">
				 
					<div class="fitem">
						<label>脚本名称</label>
						 <input class="easyui-textbox" id="scriptName"
							style="width: 280px;" required="true" name="scriptName" data-options="required:true, validType:{isCharFirst:[], isEngName:[]}"/>
							<span style="color:red"  >*</span>
					</div> 
					<br>
					<div class="fitem">
						<label>创建者</label> <input class="easyui-textbox"
							disabled="true" style="width: 280px;" required="true" name="creator" id="creator" />
							
					</div>
					<br>
					<div class="fitem">
						<label>创建时间</label> <input class="easyui-textbox"
							disabled="true" style="width: 280px;" required="true" id="createTime" name="createTime" />
					</div>
					<br>
					<div class="fitem">
						<label>更新者</label> <input class="easyui-textbox"
							disabled="true" style="width: 280px;" required="true" name="updateBy" id="updateBy" />
					</div>
					<br>
					<div class="fitem">
						<label>更新时间</label> 
						<input class="easyui-textbox"
							style="width: 280px;" required="true" name="updateTime" 
							 id="updateTime" disabled="true" />
					</div>
				</div>
			</div>
		</form>
	</div>

	<div id="global_script_dlg_buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#global_script_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>