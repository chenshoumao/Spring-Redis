<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑子表单</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/styles/console/pagetable.css">
	<script src="${pageContext.request.contextPath}/scripts/console/detsubformdef_modify.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/scripts/codeMirror/lib/codemirror.css">
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/lib/codemirror.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/addon/selection/selection-pointer.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/xml/xml.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/javascript/javascript.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/css/css.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/vbscript/vbscript.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/htmlmixed/htmlmixed.js"></script>
	<style type="text/css" media="screen">
	    body {
	        overflow: hidden;
	    }
	
	    #formContentEditor {
	        width:100%;
	       
	    }
	     .CodeMirror {border: 1px solid black; font-size:13px; height:400px;}
	</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<div id="menubar" class="easyui-panel" style="width:100%;height:30px;" border="false">
			<a href="#" id="btnsave" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
			<a href="#" id="btnclose" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true">关闭</a>
		</div>
		<form id="form1" method="post">
			<input type="hidden" id="datAppId" value="${subformDef.datApplication.appId }" />
			<input type="hidden" id="subformId" value="${subformDef.subformId }" />
			<div class="easyui-tabs" style="width:100%; height:auto" id="tabpanel">
				<div title="表单体" style="padding:10px" id="tab1">
					<div style="width:100%;height:400px">
							<textarea id="formContentEditor" name="formContentEditor"></textarea>
					</div>
					<div style="display:none" id="hidFormContent"><c:out value="${subformDef.subformContent }" escapeXml="true"/></div>
				</div>
				<div title="表单头" style="padding:10px" id="tab2">
					<textarea id="htmlHead" name="htmlHead" style="width:100%; height:400px">${subformDef.htmlHead }</textarea>
				</div>
				<div title="引用包和脚本" style="padding:10px" id="tab3">
					<p>引用Java包</p>
					<div><textarea id="importPack" name="importPack" style="width:100%; height:150px">${subformDef.importPack }</textarea></div>
					<p>引用Server JS脚本</p>
					<div><textarea id="refScript" name="refScript" style="width:100%; height:150px">${subformDef.refScript }</textarea></div>
				</div>
				<div title="属性" style="padding:10px" id="tab4">
					<table class="prop_table">
				 		<tr>
				 			<th>表单名称(<span style="color:red">*</span>)</th>
				 			<td><input class="easyui-textbox" type="text" name="subformName" id="subformName" 
				 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,25]}"
				 				value="${subformDef.subformName}"></input></td>
				 		</tr>
				 		<tr>
				 			<th>说明</th>
				 			<td><input class="easyui-textbox" type="text" name="description" id="description" 
				 				value="${subformDef.description }" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>创建时间</th>
				 			<td><fmt:formatDate value="${subformDef.createTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>创建人</th>
				 			<td>${subformDef.creatorName }</td>
				 		</tr>
				 		<tr>
				 			<th>更新时间</th>
				 			<td><fmt:formatDate value="${subformDef.updateTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>更新人</th>
				 			<td>${subformDef.updateByName }</td>
				 		</tr>
				 	</table>
				</div>
			</div>
		</form>
	</div>
</body>
</html>