<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <style>
    fieldset {
padding:10px;
margin:10px;
width:270px;
color:#333; 
border:#06c dashed 1px;
} 
legend {
color:#06c;
font-weight:800; 
} 
 </style>
<div id="rule_dlg" class="easyui-dialog"
	style="width: 900px; height: 450px; " closed="true"
	buttons="#rule_dlg_buttons" modal="true">

	<div id="tabs" class="easyui-tabs"  fit="true" border="false">
		<div title="规则定义" style="padding:2%;">
			<form id="rule_fm" method="post">
				<br>
				<div class="fitem">
					<label>规则名称</label> 
					<input type="hidden" name="ruleNum" id="ruleNum">
					<input class="easyui-textbox"
						id="ruleName" style="width: 280px;"data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[3,25]}"name="ruleName"/>
						<label style="margin-left: 16%;">是否可见:</label> 
					<input type="radio" name="visible" value="true">是
					<input type="radio" name="visible" value="false">否
				</div>
				<div style="height:300px;width:100%;">
				    <div style="width:48%;float:left;">
				    <fieldset> 
                         <legend>请选部门</legend> 
				          <jsp:include page="./deptsTree.jsp"></jsp:include>
				     </fieldset>
				    </div>
				   <div style="width:48%;float:left;">
                <fieldset> 
                   <legend>请选择角</legend> 
                        <jsp:include page="./rolesTree.jsp"></jsp:include>
                   </fieldset>
				   
				   </div>
				<div></div>
				</div>
			</form>
		</div>

	</div>
</div>
<div id="rule_dlg_buttons">
	<a id="dlg_btnsave" href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveRule()" style="width: 90px">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#rule_dlg').dialog('close')"
		style="width: 90px">关闭</a>
</div>

<script>

	/*  打开新增规则信息的对话框 */
	function openRuleDlg() {
		$('#rule_dlg').dialog('open').dialog('setTitle', ' ');
		 $('#rule_fm').form('clear');
		 $(':radio[name="visible"]').eq(0).attr("checked",true);
		 $("#ruleNum_value").val("");
		 getAlldeptsData("");
		getAllRolesData("");
	}

	
	
	
	 function saveRule(){
	      var deptTrees = $.fn.zTree.getZTreeObj("deptTrees");
          var deptTreeNodes = deptTrees.getCheckedNodes(true);
            var depts =[];  
           depts.push("0");
          if(deptTreeNodes!=null){
          for(var i=0;i<deptTreeNodes.length;i++){
             if(deptTreeNodes[i].id!=0){
             depts.push(deptTreeNodes[i].id);
             }
          }
          }
          
          var rolesTrees = $.fn.zTree.getZTreeObj("rolesTrees");
          var rolesTreeNodes = rolesTrees.getCheckedNodes(true);
          var roles =[];  
           roles.push("0");
          if(rolesTreeNodes!=null){
          for(var i=0;i<rolesTreeNodes.length;i++){
             if(rolesTreeNodes[i].id!=0){
             roles.push(rolesTreeNodes[i].id);
             }
          }
          }
          
     
            if($("#rule_fm").form('validate')){
             if(depts.length==1&&roles.length==1){
              $.messager.show({
        	      title: '温馨提示',
                  msg: '部门或角色至少选择其中一个'
        	    });
        	  return false;
            }
            $("#dlg_btnsave").linkbutton("disable");
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/detRuleDefinition/createOrUpdate.action",
        		type:"post",
        		data:{
        		'depts':depts,
        		'roles':roles,
        		"ruleNum":$("#ruleNum").val(),
        		"ruleName":$('#ruleName').textbox('getValue'),
        		"visible":$('input[name="visible"]:checked ').val(),
        		"typeId":'${typeId}'
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
        	                $('#rule_dlg').dialog('close');        // close the dialog
        	                $('#datagrid').datagrid('reload');    // reload the user data
        	            }
        		},
        		error:function(){
        		$("#dlg_btnsave").linkbutton("enable");
        		}
        	});
            }
        }
</script>