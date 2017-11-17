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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link href="<%=basePath%>images/LOGO.ico" rel="shortcut icon"
	type="image/x-icon" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/icon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">



<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/frameset.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/wfAuthorizationRule/index.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/wfAuthorizationRule/processMeta.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/My97DatePicker/WdatePicker.js"></script>
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

#mainTable td {
    padding-top: 20px;
}
.add-on {
    background-color: #eee;
    border: 1px solid #ccc;
    display: inline-block;
    font-size: 14px;
    font-weight: normal;
    height: 20px;
    line-height: 20px;
    min-width: 16px;
    padding: 4px 5px;
    text-align: center;
    text-shadow: 0 1px 0 #fff;
    width: auto;
    border-radius: 4px;
}
.icon-search{
	background-image: url("${pageContext.request.contextPath}/images/portal/search.png");
    background-repeat: no-repeat;
    display: inline-block;
    height: 14px;
    line-height: 14px;
    vertical-align: text-top;
    width: 14px;
}
</style>
</head>
<input type="hidden" id="basePath"
	value="${pageContext.request.contextPath}" />


<div id="datagrid" style="width: 100%; height: 100%"></div>


	<!-- 添加代理授权弹出窗口 -->
    <div id="agentRules" class="easyui-dialog" style="width:730px;height:500px"
    		data-options="title:'代理授权规则',buttons:'#bb',resizable:true,modal:true,closed:true">
    	<iframe name="iframe_config" id="iframe_config"
								src="${pageContext.request.contextPath}/workflow/bpm/AuthorizationRule/config.xsp?"
								id="processCata" allowTransparency="true" scrolling="auto"
								width="100%" height="100%" frameBorder="0" name=""></iframe>
    	
    </div>
    <div id="bb">
    	<a href="#" onclick="saveAuthorizationRule()" class="easyui-linkbutton">保存</a>
    	<a href="#" onclick="closeAutorizationRuleDla()" class="easyui-linkbutton">关闭</a>
    </div>
		<!-- 选择代理授权流程弹出窗口 -->
		<div id="workFlow" class="easyui-dialog"
	    		data-options="title:'选择代理流程',buttons:'#workFlowbb',resizable:true,modal:true,closed:true">
	    						<div class="desktopInfoDiv"
						style="width: 588px; float: right; height: 420px;">
						<div class="desktopListTabDiv">
							<div style="float: left; width: 30%; overflow: auto; height: 400px;">
								<br>
								<ul id="processCata" class="ztree"></ul>
	
							</div>
							<div style="float: left; width: 70%; overflow: auto; height: 400px;">
								<iframe id="iframe_processmeta"
									src="${pageContext.request.contextPath}/workflow/bpm/AuthorizationRule/process.xsp?authorizationRuleId=${wfAuthorizationRule.authorizationRuleId}"
									id="processCata" allowTransparency="true" scrolling="auto"
									width="100%" height="100%" frameBorder="0" name=""></iframe>
	
							</div>
						</div>
	
					</div>
	    </div>
	   
	     <div id="toolbar">
		<a href="javascript:void(0)" iconCls="icon-add"
			class="easyui-linkbutton " plain="true"
			onclick="openAuthorizationRuleDlg('')"> 添加 </a> <a
			href="javascript:void(0)" iconCls="icon-remove"
			class="easyui-linkbutton " plain="true"
			onclick="destroyAuthorizationRule()"> 删除 </a>
			 <a
			href="javascript:void(0)" iconCls="icon-reload" 
			class="easyui-linkbutton " plain="true"
			onclick="startWfAuthorizationRule()"> 启用 </a> 
			
			 <a
			href="javascript:void(0)"  iconCls="icon-undo"  
			class="easyui-linkbutton " plain="true"
			onclick="stopWfAuthorizationRule()">停止</a> 
			
			 <a
			href="javascript:void(0)" class="easyui-linkbutton " plain="true">
			代理授权规则名称:</a> <input type="text" id="name" style="width: 150px;">
		<a href="javascript:void(0)" class="easyui-linkbutton " plain="true"
			onclick="searchByName()"> 查询 </a>
</div>

 <div id="workFlowbb">
	    	<a href="#" onclick="saveSelectedWorkFlow()" class="easyui-linkbutton">保存</a>
	    	<a href="#" onclick="closeworkFlowDla()" class="easyui-linkbutton">关闭</a>
	    </div>
	    <jsp:include page="./selectCompany.jsp"></jsp:include>
	    <jsp:include page="./selectDepartment.jsp"></jsp:include> 
	    <jsp:include page="./advancedDlg.jsp"></jsp:include>
	   
</body>
</html>