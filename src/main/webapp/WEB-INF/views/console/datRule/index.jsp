<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/formCtrlsTag.tld" prefix="sot"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=basePath%>images/LOGO.ico" rel="shortcut icon"
	type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/console/pagetable.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/frameset.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/datRule/index.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/My97DatePicker/lang/zh-cn.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/json2.js"></script>


<style type="text/css">
.fitem label {
	display: inline-block;
	width: 120px;
}

fieldset {
	padding: 20px;
	margin: 10px;
	width: 270px;
	color: #333;
	border: #06c dashed 1px;
}

legend {
	color: #06c;
	font-weight: 800;
}

.prop_table th {
	padding: 5px 10px;
	width: 10%;
}
</style>
</head>
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}" />
<div id="toolbar">
	<div>
		<a href="javascript:void(0)" iconCls="icon-add"
			class="easyui-linkbutton " plain="true" onclick="openDatRuleDlg('')">
			</a>添加  <a href="javascript:void(0)" iconCls="icon-remove"
			class="easyui-linkbutton " plain="true"
			onclick="destroyAuthorizationRule()"> 删除 </a> <a
			href="javascript:void(0)" class="easyui-linkbutton " plain="true">
			规则名称:<input type="text" id="name" style="width: 150px;">
		</a> <a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="searchByName()"> 查询 </a>
	</div>
</div>

<div id="datagrid" style="width: 100%; height: 100%"></div>
<div id="openDatRuleDlg" class="easyui-dialog"
	data-options="modal: true,closed:true,buttons:[{
				text:'保存',
				handler:saveDatRule
			},{
				text:'关闭',
				handler:closedDatRuleDlg
			}]"
	style="width: 900px; height: 440px;">
	<div id="tt" class="easyui-tabs" style="width: 884px; height: 364px;">
		<div title="属性"
			style="padding: 0px; width: 100%; height: 100%; padding: 3%">
			<table class="prop_table">
				<tr>
					<th>规则名称(<span style="color: red">*</span>)
					</th>
					<td>
					<input type="hidden" name="ruleId" id="ruleId" value=""/>
					<input type="text" name="ruleName"
						id="ruleName" style="width: 300px"
						data-options="required:true, validType:{isCharFirst:[], isEngName:[], length:[1,15]}"></input></td>
				</tr>
				<tr>
					<th>规则类型</th>
					<td><select  name="ruleType"
						id="ruleType" style="width: 300px">
							<option value="PARAMS">参数匹配</option>
							<option value="COND">条件过滤</option>
					</select></td>
				</tr>
				<tr>
					<th>是否激活</th>
					<td><select name="isActivate"
						id="isActivate" style="width: 300px">
							<option value="on">激活</option>
							<option value="off">停用</option>
					</select></td>
				</tr>

				<tr>
					<th>开始时间</th>
					<td><input type="text" id="effectTime" name="effectTime"
						style="width: 300px;" readonly
						value="${wfAuthorizationRule.effectTimeFormat}" class="Wdate"
						onFocus="var endDate=$dp.$('invalidTime');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'invalidTime\')}'})">
					</td>
				</tr>
				<tr>
					<th>结束时间</th>
					<td><input type="text" id="invalidTime" style="width: 300px;"
						name="invalidTime"
						value="${wfAuthorizationRule.invalidTimeFormat}" readonly
						class="Wdate"
						onFocus="WdatePicker({minDate:'#F{$dp.$D(\'effectTime\')}'})">
					</td>
				</tr>
				<tr>
					<th>返回类型</th>
					<td><input  type="text"
						name="retrunType" id="retrunType"
						style="width: 300px"></input></td>
				</tr>
			</table>
		</div>
		<div title="规则配置"
			style="overflow: auto; padding: 0px; width: 100%; height: 100%">
			<!-- 		tab2 -->
	

			<div id="dg"></div>

			<!-- 		tab2 -->
		</div>
		<div title="手写规则" style="padding: 0px; width: 100%; height: 100%">
			<textarea style="width: 99%; height: 95%" id="ruleProcess"  name="ruleProcess" ></textarea>
		</div>
	</div>
</div>


</body>
</html>