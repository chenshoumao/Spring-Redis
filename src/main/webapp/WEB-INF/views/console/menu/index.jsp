<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../resources.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">

function showIcons() {
	var dialog = modalDialog({
		title : '浏览小图标',
		url :  '<%=basePath%>styles/treeicon/icons.jsp',
		buttons : [ {
			text : '确定',
			handler : function() {
				var value=dialog.find('iframe').get(0).contentWindow.selectIcon(dialog, $('#itemIcon'));
				$("#itemIcon").textbox('setValue',value);
				dialog.dialog('destroy');
			}
		} ]
	});
}

//TODO   初始化加载开始
$(function(){
	$('#dg').treegrid({
		parentField : 'parentItemId',
		title : '',
		url : '<%=basePath %>console/menu/item/shows.action',
		 height: "100%",
	method : 'POST',
		striped : true,
		nowrap : true,
		 fit:true,
		 singleSelect: false,
		    checkOnSelect: false, 
		    selectOnCheck: false,
		 idField:'itemId',  
		    treeField:'itemName',
			loadMsg : '数据加载中请稍后……',
			toolbar : "#toolbar",
		    columns:[[  
{
	field : 'ck',
	checkbox : true
},
		        {title:'菜单项名称',field:'itemName',width:180},  
		        {
					field : 'itemId',
					title : '菜单项id',
						hidden:true,
					width : 100
				},
	
				{
					field : 'parentItemId',
					title : '上级菜单id',
					hidden:true,
					width : 100
					
				},
				{
					field : 'itemType',
					title : '菜单级别',
					width : 100,
						formatter : function(value, rec, index) {
						if(value=="1"){
						return "菜单";
						}else if(value=="2"){
						return "前端"
						}else{
						return value;
						}
						
					return s;
					}
					
				},
				{
					field : 'parentItemName',
					title : '上级菜单',
					hidden:true,
					width : 100
				},
			
				{
					field : 'itemUrl',
					title : '菜单项链接',
					width : 200
				},
				{
					field : 'itemTarget',
					title : '菜单项链接目标',
					width : 100
				},
				{
					field : 'sortNum',
					title : '排序',
					width : 100
				},
			
		
				{
					field : 'itemIcon',
					title : '菜单项图标',
					hidden:true,
					width : 200
				},
				{
					field : 'createTime',
					title : '创建时间',
					width : 150,
					formatter : function(value, rec, index) {
						//var s = new Date(value).toLocaleString().replace(/年|月/g, "-").replace(/日/g," ");
					var s =new Date(value).pattern("yyyy-MM-dd hh:mm:ss");
					return s;
					}
				},
				{
					field : 'creator',
					title : '创建者',
					width : 100
				},
				{
					field : 'updateTime',
					title : '最后更新时间',
					width : 150,
					formatter : function(value, rec, index) {
						//var s = new Date(value).toLocaleString().replace(/年|月/g, "-").replace(/日/g," ");
						var s =new Date(value).pattern("yyyy-MM-dd hh:mm:ss");
						return s;
					}
				}, {
					field : 'updateBy',
					title : '更新者',
					width : 100
				}, {
					field : 'description',
					title : '描述',
					hidden:true,
					width : 300
				} 
		    ]]  ,
		  onSelect: function (rowData) {
		    	$('#dg').datagrid("unselectAll");
		     },  
	         onDblClickRow : function(rowData) {
	               var parentItemName="";
	    	       if(rowData.parentItemId=="0"){
        	          parentItemName="第一级菜单";
			        }else{
					  var parentNode=$(this).treegrid('getParent', rowData.itemId);
					  parentItemName=parentNode.itemName;
		             }
		       editMenuItem(rowData,parentItemName);
	}
	});
	
	
});
//TODO 初始化加载结束



        var url;
        function newMenuItem(){
            $('#dlg').dialog('open').dialog('setTitle','创建菜单项 ');
            $('#fm').form('clear');
            url = '<%=basePath%>console/menu/item/saveOrUpdate.action';
            $('#itemStatus').combobox('setValue', '1');
            $('#itemTarget').combobox('setValue', 'self');
            var date=new Date().pattern("yyyy-MM-dd");
            $("#update_time").textbox('setValue',date);
            $("#create_time").textbox('setValue',date);
            //$('#ftitle').html("修改菜单项");
            var date=new Date().pattern("yyyy-MM-dd hh:mm:ss");
            $("#itemType").combobox("setValue","1");
            $("#update_time").textbox('setValue',date);
            $("#create_time").textbox('setValue',date);
            $("#update_by").textbox('setValue',"${_currUserName}");
            $("#create_by").textbox('setValue',"${_currUserName}");
            $("#sortNum").textbox('setValue',"0");
            
        }
        function editMenuItem(row,parentItemName){
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','修改菜单项');
                 $('#fm').form('clear');
                $('#fm').form('load',row);
                var create_time =new Date(row.createTime).pattern("yyyy-MM-dd hh:mm:ss");
  	             var update_time=new Date().pattern("yyyy-MM-dd hh:mm:ss");
  	            $("#update_time").textbox('setValue',update_time);
  	            $("#create_time").textbox('setValue',create_time);
  	            $("#create_by").textbox('setValue',row.creator);
                $("#update_by").textbox('setValue',"${_currUserName}");
                  $("#parentItemName").textbox('setValue',parentItemName);
                url = '<%=basePath%>console/menu/item/saveOrUpdate.action';
            }
        }
        
        function saveMenuItem(){
            var values=$("#fm").serialize();
            if($("#fm").form('validate')){
            $.ajax({
        		url:url,
        		type:"post",
        		data:values,
        		dataType:"json",
        		success:function(result){
        			   if (result.errorMsg){
        	                $.messager.show({
        	                    title: 'Error',
        	                    msg: result.errorMsg
        	                });
        	            } else {
        	                $('#dlg').dialog('close');        // close the dialog
        	                $('#dg').treegrid('reload');    // reload the user data
        	            }
        		}
        	});
            }
        }
        function destroyMenuItem(){
        	var rows = $('#dg').datagrid('getChecked');
            if (rows.length>0){
                $.messager.confirm('温馨提示','你真的要删除么?',function(r){
                    if (r){
                    	for(var i=0; i<rows.length; i++){
                    		var row=rows[i];
                     $.post('<%=basePath%>console/menu/item/delMenuItem.action',{id:row.itemId},function(result){
                            if (result.success){
                                $('#dg').treegrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json'); 
                    }
                    }
                });
            }
        }
        
        //打卡上级菜单项的树形菜单的dialog 界面
        function  showParentMenuItem(){
         	$('#parentMenuItemTreee').tree({   
                url: '<%=basePath %>console/menu/item/menuItemTree.action?id=0',   
                loadMsg: "数据加载中，请稍后...",  	
                onBeforeExpand:function(node,param){  
                    $('#parentMenuItemTreee').tree('options').url = "<%=basePath %>console/menu/item/menuItemTree.action";
                },               
               onClick:function(node){
                   },
                   onCheck : function(node,checked){
                   }
           });
      	  $('#parentMenuItem').dialog('open').dialog('setTitle',' ');
        	
      }
        function getTreeNode(){
             if(($('#parentMenuItemTreee').tree('getSelected')!=null)){
        	var id=$('#parentMenuItemTreee').tree('getSelected').id;
        	var url=$('#parentMenuItemTreee').tree('getSelected').url;
        	var name=$('#parentMenuItemTreee').tree('getSelected').text;
            	   var itemId=$('#itemId').val();
               if(itemId==id){
            	   $.messager.show({    // show error message
                       title: '温馨提示',
                       msg: "不能选择自己作为上级菜单项"
                   });
               }else{
            	   $("#parentItemName").textbox('setValue',name);
            	   $("#parentItemId").val(id);
        	       $('#parentMenuItem').dialog('close');
               }
             }else{
            	 $.messager.show({    // show error message
                     title: '温馨提示',
                     msg: "请选择要添加的菜单项"
                 });
             }
        }
        
    
    
</script>
</head>
<body>
	<div id="dg" style="width: 100%; height: 100%"></div>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="newMenuItem()">创建菜单项</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyMenuItem()">删除菜单项</a>
		<!-- 	<a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-man" plain="true" onclick="editBean()">权限</a> -->
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 570px; height: 478px;" closed="true"
		buttons="#dlg-buttons" modal="true">
		<!-- 	<div class="ftitle" id="ftitle"></div> -->
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="菜单信息">
				<form id="fm" method="post" novalidate>
					<div class="fitem">
						<input type="hidden" name="itemId" id="itemId" /> <label>菜单项名称:</label>
						<input name="itemName" class="easyui-textbox" required="true"
							style="width: 280px;" validtype="length[1,15]"
							invalidMessage="有效长度1-15">
					</div>
					<div class="fitem">
						<label>上级菜单:</label> <input id="parentItemId" name="parentItemId"
							type="hidden" value="0" /> <input class="easyui-textbox"
							id="parentItemName" name="parentItemName" type="text"
							style="width: 280px;"
							data-options="
			prompt: '第一级菜单',
			icons:[{
				iconCls:'icon-search',
				handler: function(e){
					showParentMenuItem();
				}
			}]">
					</div>
					<div class="fitem">
						<label>菜单项链接:</label> <input name="itemUrl" class="easyui-textbox"
							style="width: 280px;">
					</div>
					<div class="fitem">
				<label>菜单项级别:</label> 
			<!-- 	<select  name="itemType" id="itemType" class="easyui-combobox" style="width: 280px;">
				<option value="1" selected = "selected">后台</option>
				<option value="2">前端</option>
				</select> -->
				<sot:combobox id="itemType"  name="itemType" cssstyle="width: 280px;" cssclass="easyui-combobox" bindingResource="menuLevel" ></sot:combobox>
			
			</div> 
					<div class="fitem">
						<label>链接目标:</label> <select class="easyui-combobox"
							name="itemTarget" id="itemTarget" style="width: 280px;">
							<option value="self">选项卡</option>
							<option value="_blank">新窗口</option>
						</select>

					</div>
					<div class="fitem">
						<label>菜单项图标:</label> <input class="easyui-textbox"
							name="itemIcon" id="itemIcon" type="text" style="width: 280px;"
							data-options="
			prompt: ' ',
		   icons:[{
				 iconCls:'icon-search',
				handler: function(e){
				showIcons();
				}
			}]">
					</div>
					
						<div class="fitem">
						<label>排序:</label>
						<input name="sortNum" id="sortNum" value="0" min="0" max="100" class="easyui-numberbox" type="text"  style="width: 280px;"/>
					</div>
					<div class="fitem">
						<label>描述:</label>
						<textarea name="description"
							style="width: 280px; height: 50px; border: 1px solid #95B8E7; border-radius: 5px 5px 5px 5px;"></textarea>
					</div>
				</form>
			</div>
			<div title="附加信息" style="margin: 0; padding: 10px 30px;">
				<div class="fitem">
					<label>创建者:</label> <input id="create_by" class="easyui-textbox"
						style="width: 280px;" value="creator" disabled="true">
				</div>
				<div class="fitem">
					<label>更新者:</label> <input id="update_by" class="easyui-textbox"
						style="width: 280px;" value="username" disabled="true">
				</div>
				<div class="fitem">
					<label>创建时间:</label> <input id="create_time" class="easyui-textbox"
						style="width: 280px;" disabled="true">
				</div>
				<div class="fitem">
					<label>最后更新时间:</label> <input id="update_time"
						class="easyui-textbox" style="width: 280px;" disabled="true">
				</div>


			</div>
		</div>

	</div>


	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveMenuItem()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>

	<div id="parentMenuItem" class="easyui-dialog"
		style="width: 450px; height: 350px; padding: 10px 20px" closed="true"
		buttons="#parentMenuItemButtons">
		<div id="parentMenuItemTreee"></div>
	</div>

	<div id="parentMenuItemButtons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="getTreeNode()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#parentMenuItem').dialog('close')"
			style="width: 90px">取消</a>
	</div>







</body>
</html>