<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../resources.jsp"></jsp:include>
<script
	src="${pageContext.request.contextPath}/scripts/console/internationalization/show.js"
	type="text/javascript"></script>
</head>
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}">
<input type="hidden" id="type" value="${type}">
<body class="easyui-layout">
	<div id="toolbar">
		<div>
		<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onclick="openDlg()">添加 </a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true" onclick="destroyInternationalization()">
				删除 </a>
		&nbspkey/value值:<input type="text" id="name" style="width: 150px;">
                 <a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
				onclick="searchByName('${deparmentId}')"> 查询 </a>
			

				
		</div>
	</div>
	<div id="datagrid" style="width: 100%; height: 100%"></div>


	<div id="internationalization_dlg" class="easyui-dialog"
		style="width: 500px; height: 300px;" closed="true"
		buttons="#internationalization_dlg_buttons" modal="true">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="资源信息配置">
				<form id="fm" method="post">
				  <input type="hidden"  id="resourceType" name="type" value="${type}"/>
				  <input type="hidden"  name="id" value=""/>
					<div class="fitem">
						<label>key名称:</label> 
						<input class="easyui-textbox"  id="key" style="width: 280px;"
							required="true" name="key"  data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,25]}"/>
					</div><br>
					<div class="fitem">
						<label>值:</label> 
						 <input
							class="easyui-textbox" style="width: 280px;" required="true"
							name="value" />
					</div>
				</form>
			</div>

		</div>
	</div>
	<div id="internationalization_dlg_buttons">
		<a id="dlg_btnsave" href="javascript:void(0)"
			class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveInternationalization()"
			style="width: 90px">保存</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#internationalization_dlg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>