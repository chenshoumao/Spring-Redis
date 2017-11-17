<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gzsolartech.smartforms.constant.FormFieldType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑表单</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/styles/console/pagetable.css">
   
    <script type="text/javascript">
      var fields = {total:0,rows:[]};
      var types = [
            {type:'checkbox',name:'复选框'},
             {type:'textfield',name:'文本框'},
             {type:'datefield',name:'日期控件'},
             {type:'deptDlg',name:'选择部门控件'},
             {type:'numberfield',name:'数字框'},
             {type:'password',name:'密码框'},
             {type:'radio',name:'单选框'},
             {type:'submit',name:'保存按钮'},
        /*      {type:'table',name:'动态表格'}, */
             {type:'textarea',name:'多行文本框'},
              {type:'userDlg',name:'选人对话框框'},
              {type:'combobox',name:'下拉框'}
        ];
        $(function(){
            $('#fieldsDataGrid').datagrid({
                iconCls:'icon-edit',
                width:"100%",
                height:250,
                striped : true,
				nowrap : true,
                singleSelect:true,
                columns:[[
                    {field:'id',title:'id',width:100,editor:'text'},
                    {field:'name',title:'name',width:150,editor:'text'},
                    {field:'title',title:'标题',width:150,editor:'text' },
                     {field:'value',title:'value',width:150,editor:'text' },
                    { field: 'type', title: '类别', width: 200, 
                    editor:{
                         type:'combobox',
                         options:{
                              valueField:'type',
                              textField:'name',
                              data:types,
                              required:true
                              }
                         }
                      },
                    {field:'cssclass',title:'cssClass',width:150,editor:'text'},
                    {field:'cssstyle',title:'cssStyle',width:350,editor:'text'},
                     {field:'order',title:'排序',width:100,editor:'text'},
                 {field:'action',title:'操作',width:100,align:'center',
                        formatter:function(value,row,index){
                            if (row.editing){
                                var s = '<a href="#" onclick="saverow('+index+')">保存</a> ';
                                var c = '<a href="#" onclick="cancelrow('+index+')">取消</a>';
                                return s+c;
                            } else {
                                var e = '<a href="#" onclick="editrow('+index+')">编辑</a> ';
                                var d = '<a href="#" onclick="deleterow('+index+')">删除</a>';
                                return e+d;
                            }
                        }
                    }
                ]],
                toolbar:[{
                    text:'增加字段',
                    iconCls:'icon-add',
                    handler:addrow
                }
                ],
                onBeforeEdit:function(index,row){
                    row.editing = true;
                    $('#fieldsDataGrid').datagrid('refreshRow', index);
                    editcount++;
                },
                onAfterEdit:function(index,row){
                    row.editing = false;
                    $('#fieldsDataGrid').datagrid('refreshRow', index);
                    editcount--;
                },
                onCancelEdit:function(index,row){
                    row.editing = false;
                    $('#fieldsDataGrid').datagrid('refreshRow', index);
                    editcount--;
                }
            }).datagrid('loadData',fields).datagrid('acceptChanges');
        });
        var editcount = 0;
        function editrow(index){
            $('#fieldsDataGrid').datagrid('beginEdit', index);
        }
        function deleterow(index){
            $.messager.confirm('确认','是否真的删除?',function(r){
                if (r){
                    $('#fieldsDataGrid').datagrid('deleteRow', index);
                }
            });
        }
        function saverow(index){
            $('#fieldsDataGrid').datagrid('endEdit', index);
        }
        function cancelrow(index){
            $('#fieldsDataGrid').datagrid('cancelEdit', index);
        }
        function addrow(){
            if (editcount > 0){
                $.messager.alert('警告','当前还有'+editcount+'记录正在编辑，不能增加记录。');
                return;
            }
            
             $("#fieldsDataGrid").datagrid('appendRow',{  
            id:'',
                  name:'',
                  title:'',
                  type:'textfield',
                  cssclass:'form-control',
                  cssstyle:'',
                  order:''
        });  
            //appendRow
              /* $("#fieldsDataGrid").datagrid('insertRow', {
                index: 0,
                 row: {
                  id:'',
                  name:'',
                  title:'',
                  type:'textfield',
                  cssclass:'',
                  cssstyle:'',
                  order:''
            } }); */
         //  $('#fieldsDataGrid').datagrid('beginEdit', 0);
         var length = $('#fieldsDataGrid').datagrid("getRows").length;  
        if(length > 0){  
            editIndex = length - 1;  
        }else{  
            editIndex = 0;  
        }         
        //$obj.datagrid("selectRow", editIndex);  
        $('#fieldsDataGrid').datagrid("beginEdit", editIndex);  
        }
        
        function saveall(){
            $('#fieldsDataGrid').datagrid('acceptChanges');
        }
        function cancelall(){
            $('#fieldsDataGrid').datagrid('rejectChanges');
        }
    
     function saveTemlpate(){
            if($("#form1").form('validate')){
            var rows = $("#fieldsDataGrid").datagrid("getRows"); 
           var   rowsField=JSON.stringify(rows);
          // $("#dlg_btnsave").linkbutton("disable");
          var title=$('#formTitle').textbox('getValue');
          var name=$('#formName').textbox('getValue');
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/detform/template/createform.action",
        		type:"post",
        		data:{
        		'rows':rowsField,
        		'title':title,
        		'name':name,
        		'appId':"${appId}",
        	   'layout':$("#layout").val()
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
        	            $.messager.show({
        	                    title: '温馨提示',
        	                    msg: '保存成功'
        	                });
        	            }
        		}
        	}); 
        	
            }
        }
    </script>

</head>
<body class="easyui-layout">

	<div data-options="region:'center'">
		<div id="menubar" class="easyui-panel" style="width:100%;height:30px;" border="false">
			<a href="#"  onclick="saveTemlpate()"id="btnsave" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
			<a href="#" id="btnclose" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true">关闭</a>
		</div>
		<form id="form1" method="post">
		
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
			<input type="hidden" id="datAppId" value="${formDef.datApplication.appId }" />
				<table class="prop_table">
				 		<tr>
				 			<th>表单名称:</th>
				 			<td><input class="easyui-textbox" type="text" name="formName" id="formName" 
				 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,25]}"></input>
				 				<span style="color:red">*</span>
				 				</td>
				 		</tr>
				 		<tr>
				 			<th>标题:</th>
				 			<td><input class="easyui-textbox" data-options="required:true" type="text" name="formTitle" id="formTitle" style="width:300px"></input><span style="color:red"> *</span></td>
				 		</tr>
				 	<tr>
				 			<th>布局列:</th>
				 			<td>
				 			<select id="layout" name="layout" style="width: 300px; ">
				 			   <option value="1">1</option>
				 			   <option value="2">2</option>
				 			   <option value="3">3</option>
				 			   <option value="4">4</option>
				 			   <option value="5">5</option>
				 			   <option value="6">6</option>
				 			   <option value="7">7</option>
				 			   <option value="8">8</option>
				 			   <option value="9">9</option>
				 			   <option value="10">10</option>
				 			</select>
				 			</td>
				 		</tr>
				 	</table>
				<table id="fieldsDataGrid" style="width:100%"></table>
						  
					
		</form>
		
		
		
		
	</div>

<%-- <div id="dlgField" class="easyui-dialog" style="width: 550px; height: 350px"
			closed="true" buttons="#dlg-buttons"  modal="true">
			<form id="form2" name="form2" method="post">
				<input type="hidden" id="fieldId" name="fieldId" />
			 	<table class="prop_table">
			 		<tr>
			 			<th>字段名称(<span style="color:red">*</span>)</th>
			 			<td><input class="easyui-textbox" type="text" name="fieldName" id="fieldName" 
			 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,25]}"></input></td>
			 		</tr>
			 		<tr>
			 			<th>字段类型</th>
			 			<td>
			 				<select name="fieldType" id="fieldType" class="easyui-combobox" style="width:200px">
							    <option value="<%=FormFieldType.TEXT %>" selected="true">文本</option>
							    <option value="<%=FormFieldType.INT %>">整数</option>
							    <option value="<%=FormFieldType.DATE %>">日期</option>
							    <option value="<%=FormFieldType.DOUBLE %>">浮点数</option>
							</select>
			 			</td>
			 		</tr>
			 		<tr id="fieldLenRow">
			 			<th>字段长度</th>
			 			<td><input name="fieldLength" id="fieldLength" class="easyui-numberspinner"
			 				data-options="min:0,max:4000" /></td>
			 		</tr>
			 		<tr>
			 			<th>多值域</th>
			 			<td><input type="checkbox" name="multiValue" id="multiValue" value="yes"></input></td>
			 		</tr>
			 		<tr>
			 			<th>多值分隔符</th>
			 			<td><input class="easyui-textbox" type="text" name="multiSeparator" id="multiSeparator" style="width:300px" /></td>
			 		</tr>
			 	</table>
			</form>
			<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnsave"
				iconCls="icon-ok" style="width: 90px">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="dlg_btncancel"
				iconCls="icon-cancel" style="width: 90px">取消</a>
		</div>
		</div> --%>
</body>
</html>