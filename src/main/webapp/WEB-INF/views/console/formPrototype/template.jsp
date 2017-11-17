<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gzsolartech.smartforms.constant.FormFieldType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑表单</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/styles/console/pagetable.css">
   
    <script type="text/javascript">
    
     function saveTemlpate(){
            if($("#form1").form('validate')){
          var title=$('#formTitle').textbox('getValue');
          var name=$('#formName').textbox('getValue');
            $.ajax({
        		url:"${pageContext.request.contextPath}/console/detform/template/prototype/create.action",
        		type:"post",
        		data:{
        		'prototypeId':$("#prototypeId").val(),
        		'title':title,
        		'name':name,
        		'appId':"${datappid}"
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
        	            try{
                	        window.parent.$("#grid1").datagrid("load", {r2:Math.random()});
                      }catch(e){}
                           window.parent.$("#dlgFormProtype").window("close");
        	            }
        		}
        	}); 
        	
            }
        }
        
   $(function(){
     //点击“关闭”
	$("#btnclose").click(function() {
       // window.parent.$("#dlgFormDef").window("close");
		window.parent.$("#dlgFormProtype").window("close");
    });
  
   });
   
    </script>

</head>
<body class="easyui-layout">

	<div data-options="region:'center'">
		<div id="menubar" class="easyui-panel" style="width:100%;height:30px;" border="false">
			<a href="#"  onclick="saveTemlpate()" id="btnsave" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
			<a href="#"  id="btnclose" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true">关闭</a>
		</div>
		<form id="form1" method="post">
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
			<input type="hidden" id="datAppId" value="${datappid}" />
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
				 			<th>原型表单:</th>
				 			<td>
				 			<sot:combobox  
				 			id="prototypeId" data="select TITLE text ,PROTOTYPE_ID value from DET_FORM_PROTOTYPE " 
				 			cssstyle="width: 298px;height: 22px;"></sot:combobox>
				 			</td>
				 		</tr>
				 	</table>					
		</form>
	</div>

</body>
</html>