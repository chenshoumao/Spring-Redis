<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script>
	//导出zip包数据
      function exportScript(){
	   var selRows = $('#dg').datagrid('getChecked');  
		if (selRows.length>0) {
			 var formIds=[];
			  $(selRows).each(function(index, item) {
				 formIds[index]=item.scriptId;
			 });
			  var form=$("<form>");//定义一个form表单
			  form.attr("style","display:none");
			  form.attr("target","");
			  form.attr("method","post");
			  form.attr("action","${pageContext.request.contextPath}/console/detScriptLib/export.action");
			  var input1=$("<input>");
			  input1.attr("type","hidden");
			  input1.attr("name","scriptId");
			  input1.attr("value",JSON.stringify(formIds));
			  $("body").append(form);//将表单放置在web中
			  form.append(input1);
			  form.submit();//表单提交 
		}else{
			 $.messager.show({
                 title: '温馨提示',
                 msg: '请选择要导出的脚本库'
             });
		}
		
}

</script>