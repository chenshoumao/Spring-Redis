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
	<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/styles/console/pagetable.css" />
	<script src="${pageContext.request.contextPath}/scripts/console/detformdef_modify.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/scripts/codeMirror/lib/codemirror.css" />
	<script src="${pageContext.request.contextPath}/scripts/codeMirror/lib/codemirror.js"></script>
<%-- <script src="${pageContext.request.contextPath}/scripts/codeMirror/addon/selection/mark-selection.js"></script> --%>
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
	     .CodeMirror {border: 1px solid black; font-size:13px; height:550px;}
	</style>

</head>
<body class="easyui-layout">
	<div data-options="region:'center'" >
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<div id="menubar" class="easyui-panel" style="width:100%;height:30px;" border="false">
			<a href="#" id="btnsave" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
			<a href="#" id="btnclose" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true">关闭</a>
		</div>
		<form id="form1" method="post">
			<input type="hidden" id="datAppId" value="${formDef.datApplication.appId }" />
			<input type="hidden" id="formId" value="${formDef.formId}" />
			<!--  -->
			<div class="easyui-tabs" id="tabpanel" style="width:100%; height:615px;" >
				<div title="表单体" style="padding:10px;height:615px" id="tab1" >
					<div style="width:100%;height:auto;">
						<textarea id="formContentEditor" name="formContentEditor"></textarea> 
					</div>
					<div style="display:none" id="hidFormContent"><c:out value="${formDef.formContent }" escapeXml="true"/></div>
				</div>
				<div title="表单头" style="padding:10px" id="tab2">
					<textarea id="htmlHead" name="htmlHead" style="width:99.8%; height:550px">${formDef.htmlHead }</textarea>
				</div>
				<div title="引用包和脚本" style="padding:10px" id="tab3">
					<p>引用Java包</p>
					<div><textarea id="importPack" name="importPack" style="width:100%; height:150px">${formDef.importPack }</textarea></div>
					<p>引用Server JS脚本</p>
					<div><textarea id="refScript" name="refScript" style="width:100%; height:150px">${formDef.refScript }</textarea></div>
				</div>
				<div title="属性" style="padding:10px" id="tab4">
					<table class="prop_table">
				 		<tr>
				 			<th>表单名称(<span style="color:red">*</span>)</th>
				 			<td><input class="easyui-textbox" type="text" name="formName" id="formName" 
				 				style="width:300px" data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,15]}"
				 				value="${formDef.formName}"></input></td>
				 		</tr>
				 		<tr>
				 			<th>标题</th>
				 			<td><input class="easyui-textbox" type="text" name="formTitle" id="formTitle"
				 				value="${formDef.formTitle }" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>类型</th>
				 			<td>
				 				<select class="easyui-combobox" name="formType" id="formType" style="width:100px">
				 					<option value="document">文档</option>
				 					<option value="response" <c:if test='${formDef.formType=="response" }'> selected="selected"</c:if>>答复
				 				</select>
				 			</td>
				 		</tr>
				 			<tr>
				 			<th>是否为独立表单</th>
				 			<td>
				 			<input type="checkbox" name="aloneForm"  <c:if test='${formDef.aloneForm=="y" }'> checked="checked"</c:if>  id="aloneForm" value="y"/></td>
				 		</tr>
				 		<tr>
				 			<th>引用表单缺省样式</th>
				 			<td>
				 				<label><input type="radio" name="isRefCss" id="RefCssOn" value="on" <c:if test='${formDef.isRefCss!="off" }'> checked="checked"</c:if> /> 开启</label>
				 				<label><input type="radio" name="isRefCss" id="RefCssOff" value="off" <c:if test='${formDef.isRefCss=="off" }'> checked="checked"</c:if> /> 关闭</label>
				 			</td>
				 		</tr>
				 		<tr>
				 			<th>表单主题样式</th>
				 			<td>
				 				<select name="formTheme" id="formTheme" class="easyui-combobox" style="width:100px" <c:if test='${formDef.isRefCss=="off" }'>disabled="disabled"</c:if>>
					 				<option value="bootstrap2" <c:if test='${formDef.formTheme=="bootstrap2" }'>selected="selected"</c:if>>Bootstrap2</option>
					 				<option value="bootstrap3" <c:if test='${formDef.formTheme=="bootstrap3" }'>selected="selected"</c:if>>Bootstrap3</option>
					 				<option value="none" <c:if test='${formDef.formTheme=="none" }'>selected="selected"</c:if>>None</option>
					 			</select>
							</td>
				 		</tr>
				 		<tr>
				 			<th>说明</th>
				 			<td><input class="easyui-textbox" type="text" name="description" id="description" 
				 				value="${formDef.description }" style="width:300px"></input></td>
				 		</tr>
				 		<tr>
				 			<th>表单打开前事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="queryOpenEventCls" 
				 				id="queryOpenEventCls" style="width:300px" value="${formDef.queryOpenEventCls }" /></td>
				 		</tr>
				 		<tr>
				 			<th>表单打开后事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="postOpenEventCls" 
				 				id="postOpenEventCls" style="width:300px" value="${formDef.postOpenEventCls}" /></td>
				 		</tr>
				 		<tr>
				 			<th>表单保存前事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="querySaveEventCls" 
				 				id="querySaveEventCls" style="width:300px" value="${formDef.querySaveEventCls }" /></td>
				 		</tr>
				 		<tr>
				 			<th>表单保存后事件类</th>
				 			<td><input class="easyui-textbox" type="text" name="querySaveEventAfterCls" 
				 				id="querySaveEventAfterCls" style="width:300px" value="${formDef.querySaveEventAfterCls}" /></td>
				 		</tr>
				 		<tr>
				 			<th>创建时间</th>
				 			<td><fmt:formatDate value="${formDef.createTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>创建人</th>
				 			<td>${formDef.creatorName }</td>
				 		</tr>
				 		<tr>
				 			<th>更新时间</th>
				 			<td><fmt:formatDate value="${formDef.updateTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				 		</tr>
				 		<tr>
				 			<th>更新人</th>
				 			<td>${formDef.updateByName }</td>
				 		</tr>
				 	</table>
				</div>
			<div title="权限预置" style="padding:10px" id="tab5">
					<div style="width:100%;height:480px;">
					<jsp:include page="./preAuthority.jsp"></jsp:include>
					</div>
				</div>
				<div title="表单字段" style="height:400px" id="tab6">
					<div class="easyui-layout" data-options="fit:true">
						<div data-options="region:'center',border:false">
							<table id="fieldGrid" class="easyui-datagrid">
						        <thead>
						            <tr>
						            	<th field="fieldId" hidden="true"></th>
						                <th field="fieldName" width="8%">字段名称</th>
						                <th field="fieldDescr" width="15%">字段描述</th>
						                <th field="fieldType" width="8%">字段类型</th>
						                <th field="fieldLength" width="8%">字段长度</th>
						                <th field="multiValue" width="8%">是否多值</th>
						                <th field="multiSeparator" width="8%">多值分隔符</th>
						                <th field="output" width="8%">是否输出</th>
						                <th field="isBizField" width="8%">是否业务字段</th>
						                 <th field="bizpanelName" width="20%">字段管理者</th>
						                   <th field="bizpanelId" hidden="true"  width="10%">字段管理者Id</th>
						                <th field="col1" widht="10%" formatter="gridDeleteLinkFmt">删除</th>
						            </tr>
						        </thead>
					   		</table>
					   		<div id="toolbar">
						        <a href="javascript:void(0)" class="easyui-linkbutton" id="btnnew" iconCls="icon-add" plain="true">新建</a>
						    </div>
						</div>
					</div>
				</div>
				<div title="业务区段" style="padding:10px" id="tab6">
					<iframe id="iframe_detFormBizPanel" name="iframe_detFormBizPanel" 
					src="${pageContext.request.contextPath}/console/detFormBizPanel/index.xsp?datAppId=${formDef.datApplication.appId}&formId=${formDef.formId}"
		                  allowTransparency="true" scrolling="auto" width="100%" height="100%"
		                       frameBorder="0" name=""></iframe>
				</div>
			</div>
		</form>
		<div id="dlgField" class="easyui-dialog" style="width: 600px; height: 420px"
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
			 			<th>字段描述</th>
			 			<td><input class="easyui-textbox" type="text" name="fieldDescr" id="fieldDescr" style="width:300px" /></td>
			 		</tr>
			 		<tr>
			 			<th>字段类型</th>
			 			<td>
			 				<select name="fieldType" id="fieldType" class="easyui-combobox" style="width:150px">
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
			 				data-options="min:0,max:4000" style="width:150px" /></td>
			 		</tr>
			 		<tr>
			 			<th>多值域</th>
			 			<td><input type="checkbox" name="multiValue" id="multiValue" value="yes"></input></td>
			 		</tr>
			 		<tr>
			 			<th>多值分隔符</th>
			 			<td><input class="easyui-textbox" type="text" name="multiSeparator" id="multiSeparator" style="width:150px" /></td>
			 		</tr>
			 		<tr>
			 			<th>是否输出</th>
			 			<td><input type="checkbox" name="output" id="output" value="yes" title="指定该字段是否要输出到独立表中" /></td>
			 		</tr>
			 		<tr>
			 			<th>是否业务字段</th>
			 			<td><input type="checkbox" name="isBizField" id="isBizField" value="yes" title="指定该字段是否受业务区段控制" /></td>
			 		</tr>
			 		<tr>
			 			<th>所属业务区段</th>
			 			<td>
			 			<sot:combobox id="bizpanelId" 
                                 name="bizpanelId"  
                                  staticvalue=" | "
                                 data="select BIZ_PANEL_ID value,description text from DET_FORM_BIZ_PANEL where FORM_ID='${formDef.formId}'" 
                                 cssstyle="width: 148px; height: 20px;"
                           ></sot:combobox>
			 			</td>
			 		</tr>
			 	</table>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnsave"
				iconCls="icon-ok" style="width: 90px">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="dlg_btncancel"
				iconCls="icon-cancel" style="width: 90px">取消</a>
		</div>
	</div>
<!-- 	<script type="text/javascript"> -->
// 	//初始化编辑器
//     var bodyEditor = UE.getEditor('bodyEditor',{
//         toolbars: [
//             ['fullscreen']
//         ],
//         enterTag:'',
//         textarea:'bodyContent',
//         initialContent:"${formDef.formContent}"
//     });
//     UE.getEditor('bodyEditor').addOutputRule(function(root){
// 		// 这里是在解决一个ueditor的bug(对我来说是个bug), 每次编辑框获取焦点的时候都会自动插入<p><br/></p>
// 		// 只处理第一个空的段落，后面的段落可能是人为添加
// 	  	var firstPNode = root.getNodesByTagName("p")[0];
// 	  	firstPNode && /^\s*(<br\/>\s*)?$/.test(firstPNode.innerHTML()) && firstPNode.parentNode.removeChild(firstPNode);
// 	});
<!-- 	</script> -->

 
</body>
</html>