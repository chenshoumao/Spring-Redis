<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>创建表单</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/styles/console/pagetable.css">
	
<%-- 	
       <script src="${pageContext.request.contextPath}/scripts/ace_editor/src-min-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
	 --%>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/scripts/codeMirror/lib/codemirror.css" />
<script src="${pageContext.request.contextPath}/scripts/codeMirror/lib/codemirror.js"></script>
<%-- <script src="${pageContext.request.contextPath}/scripts/codeMirror/addon/selection/selection-pointer.js"></script> --%>
<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/xml/xml.js"></script>
<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/javascript/javascript.js"></script>
<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/css/css.js"></script>
<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/vbscript/vbscript.js"></script>
<script src="${pageContext.request.contextPath}/scripts/codeMirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="${pageContext.request.contextPath}/scripts/console/detformdef_create.js" type="text/javascript"></script>
<style type="text/css" media="screen">
	    body {
	        overflow: hidden;
	    }
	
	    #formContentEditor {
	        width:100%
	    }
	     .CodeMirror {border: 1px solid black; font-size:13px; height:560px;}
	</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'"  >
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<input type="hidden" id="datAppId" value="${appid }" />
		
		 <div id="menubar" class="easyui-panel" style="width:100%;height:30px;" border="false">
			<a href="#" id="btnsave" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
			<a href="#" id="btnclose" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true">关闭</a>
		</div> 
		
		<form id="form1" method="post">
	<div class="easyui-tabs" style="width:100%; height:615px" id="tabpanel">
				
				<div title="表单体" style="padding:10px;height:615px;" id="tab1">
					<div style="width:100%;height:auto;">
						<textarea id="formContentEditor" name="formContentEditor"  ></textarea>
					</div>
				</div>
				
				<div title="表单头" style="padding:10px" id="tab2">
					<textarea id="htmlHead" name="htmlHead" style="width:99.8%; height:550px"></textarea>
				</div>
				
				<div title="引用包和脚本" style="padding:10px" id="tab3">
					<p>引用Java包</p>
					<div><textarea id="importPack" name="importPack" style="width:100%; height:150px"></textarea></div>
					<p>引用Server JS脚本</p>
					<div><textarea id="refScript" name="refScript" style="width:100%; height:150px"></textarea></div>
				</div>
				
				<div title="属性" style="padding:10px" id="tab4">
					<table class="prop_table">
				 		<tr>
				 			<th>表单名称(<span style="color:red">*</span>)</th>
				 			<td><input class="easyui-textbox" type="text" name="formName" id="formName" 
				 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,15]}"></input></td>
				 		</tr>
				 		<tr>
				 			<th>标题</th>
				 			<td><input class="easyui-textbox" type="text" name="formTitle" id="formTitle" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>类型</th>
				 			<td>
				 				<select class="easyui-combobox" name="formType" id="formType" style="width:100px">
				 					<option value="document">文档</option>
				 					<option value="response">答复</option>
				 				</select>
				 			</td>
				 		</tr>
				 		<tr>
				 			<th>是否为独立表单</th>
				 			<td><input type="checkbox" name="aloneForm" id="aloneForm" value="y"/></td>
				 		</tr>
				 		<tr>
				 			<th>引用表单缺省样式</th>
				 			<td>
				 				<label><input type="radio" name="isRefCss" value="on" checked="checked" id="RefCssOn" /> 开启</label>
				 				<label><input type="radio" name="isRefCss" value="off" id="RefCssOff" /> 关闭</label>
				 			</td>
				 		</tr>
				 		<tr>
				 			<th>表单主题样式</th>
				 			<td>
				 				<select name="formTheme" id="formTheme" class="easyui-combobox" style="width:100px">
					 				<option value="bootstrap2" selected="selected">Bootstrap2</option>
					 				<option value="bootstrap3">Bootstrap3</option>
					 				<option value="none">None</option>
					 			</select>
							</td>
				 		</tr>
				 		<tr>
				 			<th>说明</th>
				 			<td><input class="easyui-textbox" type="text" name="description" id="description" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>表单打开前事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="queryOpenEventCls" id="queryOpenEventCls" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>表单打开后事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="postOpenEventCls" id="postOpenEventCls" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>表单保存前事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="querySaveEventCls" id="querySaveEventCls" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>表单保存后事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="querySaveEventAfterCls" id="querySaveEventAfterCls" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>创建时间</th>
				 			<jsp:useBean id="dtnow" class="java.util.Date" />
				 			<td><fmt:formatDate value="${dtnow}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>创建人</th>
				 			<td>${sessionScope._currUserName }</td>
				 		</tr>
				 		<tr>
				 			<th>更新时间</th>
				 			<td><fmt:formatDate value="${dtnow}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>更新人</th>
				 			<td>${sessionScope._currUserName }</td>
				 		</tr>
				 	</table>
				</div>
				
				<%-- <div title="权限预置" style="padding:10px" id="tab5">
					<div style="width:100%;height:480px;">
					<jsp:include page="./preAuthority.jsp"></jsp:include>
					</div>
				</div> --%>
				
			</div> 
		</form>
	</div>
</body>
</html>