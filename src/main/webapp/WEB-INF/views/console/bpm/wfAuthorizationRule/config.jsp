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
<title>流程环节配置</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/reset.css" />
<link
	href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/node.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">

<link
	href="${pageContext.request.contextPath}/styles/bootstrap/datetimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/icon.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/json2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/styles/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/styles/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/wfAuthorizationRule/config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/My97DatePicker/lang/zh-cn.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>
<style>
.desktopTabDiv table {
	width: 100%;
	height: 92px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#licensedTo_num").val("${wfAuthorizationRule.licensedTo}");
		$("#licensedTo").val("${wfAuthorizationRule.licensedToName}");
		$("#authorizationRuleId").val("${wfAuthorizationRule.authorizationRuleId}");
		$("#ruleName").val("${wfAuthorizationRule.ruleName}");
		$("#licensedTo").val("${wfAuthorizationRule.licensedToName}");
		$("#selectedWorkflow").val("${workflowName}");
		$("#selectedWorkflowIds").val("${workflowId}");
		$("#sortNum").val("${wfAuthorizationRule.sortNum}");
		var ruleType="${wfAuthorizationRule.ruleType}";
		if('onTime'==ruleType){
		   $("[id^='effectiveTime'").css("display","");
			$("#effectTime").val($("#beforeEffectTime").val());
			$("#invalidTime").val($("#beforeInvalidTime").val());
		}
		var ruleMode="${wfAuthorizationRule.ruleMode}";
		if(ruleMode=='advanced'){
		$("[id^='advancedTr'").css("display","");
		}
	}); 
</script>
</head>
<body>
	<input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />
		<input type="hidden" id="beforeEffectTime" value="${wfAuthorizationRule.effectTimeFormat}" />
		<input type="hidden" id="beforeInvalidTime" value="${wfAuthorizationRule.invalidTimeFormat}" />
		<input type="hidden" id="workflowIds" value="${workflowCataId}" />
		<div style="padding-left: 100px;padding-right: 100px">
			<table align="center" id="mainTable">
		    		<tbody>
		    			<tr>
		    				<td>授权模式：</td>
		    				<td>
		    					<input type="radio" <c:if test="${wfAuthorizationRule.ruleMode=='simple'}">checked="checked"</c:if> <c:if test="${wfAuthorizationRule.ruleMode==null}">checked="checked"</c:if> id="ruleMode" name="ruleMode" value="simple" /> 简单授权
		    					<span style="padding-left:50px"></span>
		    					<input type="radio" id="ruleMode" name="ruleMode" value="advanced"  <c:if test="${wfAuthorizationRule.ruleMode=='advanced'}">checked="checked"</c:if> />  高级授权
		    				</td>
		    			</tr>
		    			<tr>
		    				<td>规则名称：</td>	
		    				<td>
		    					<input type="hidden" name="authorizationRuleId" id="authorizationRuleId"  /> 
		    					<input type="text" id="ruleName" name="ruleName"  size="45px" style="width:312px"/>
		    				</td>	
		    			</tr>
		    			<tr>
		    				<td>优先级序号：</td>	
		    				<td>
		    		    	<input type="text" id="sortNum" name="sortNum"  size="45px" style="width:312px" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		    				</td>	
		    			</tr>
		    			<tr>
		    				<td>授权给：</td>	
		    				<td><sot:userDlg id="licensedTo"
								name="licensedTo" cssstyle="width: 292px;"
								cssclass="form-control" single="true"></sot:userDlg> 
							</td>	
		    			</tr>
		    			<tr>
		    				<td>生效方式：</td>	
		    				<td>
		    					<input type="radio" name="ruleType" value="inTime"  <c:if test="${wfAuthorizationRule.ruleType=='inTime'}">checked="checked"</c:if> <c:if test="${wfAuthorizationRule.ruleType==null}">checked="checked"</c:if> /> 立即生效
		    					<span style="padding-left:50px"></span>
		    					<input type="radio" name="ruleType" value="onTime"  <c:if test="${wfAuthorizationRule.ruleType=='onTime'}">checked="checked"</c:if>/> 按时生效
		    				</td>	
		    			</tr>
		    			<tr id ="effectiveTime" style="display: none;">
		    				<td>启用时间：</td>
		    				<td>
		    				<input type="text" id="effectTime" name="effectTime" style="width: 320px;"  readonly class="Wdate"  onFocus="var endDate=$dp.$('invalidTime');WdatePicker({onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'invalidTime\')}'})">
		    			</tr>
		    			<tr id ="effectiveTime2" style="display: none;">
		    				<td>失效时间：</td>
		    				<td>
		    				<input type="text" id="invalidTime" style="width: 320px;" name="invalidTime" readonly class="Wdate" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'effectTime\')}'})">
		    			</tr>
		    			<tr>
		    				<td>选择授权流程：</td>
		    				<td>
		    				<input type="hidden" id="selectedWorkflowIds" name="selectedWorkflowIds"/>
		    					<input type="text" id="selectedWorkflow" style="width: 245px;" name="selectedWorkflow" readonly="readonly">
		    				<input type="button" value="选择流程" onclick="openWorkflowList()" style="margin-top: -3%;"/></td>
		    			</tr>
		    				<%-- <tr id ="advancedTr1" style="display: none;">
		    				<td>地区：</td>
		    				<td>
		    				<input type="text" id="district" style="width: 320px;" name="district"  value="${condition.district}">
		    			</tr>
		    			<tr id ="advancedTr2" style="display: none;">
		    				<td>公司编码：</td>
		    				<td>
		    			     <input  value="${condition.companyNum}" id="companyNum"   name="companyNum" type="text" style="width:330px;height:30px" class="easyui-searchbox" searcher="openCompany" />
		    			</tr>
		    			<tr id ="advancedTr3" style="display: none;">
		    				<td>公司名称：</td>
		    				<td>
		    			     <input value="${condition.companyName}"  id="companyName"   name="companyName" size="45px"  type="text" style="width:320px" readonly>
		    			</tr>
		    				<tr id ="advancedTr4" style="display: none;">
		    				<td>部门编码：</td>
		    				<td>
		    			     <input value="${condition.deptNum}"   id="deptNum"   name="deptNum"  type="text" style="width:330px;height:30px" class="easyui-searchbox" searcher="openDepartment" />
		    			</tr>
		    			<tr id ="advancedTr5" style="display: none;">
		    				<td>部门名称：</td>
		    				<td>
		    			     <input value="${condition.deptName}"   id="deptName"   name="deptName" size="45px"  type="text" style="width:320px" readonly>
		    			</tr> --%>
		    			<tr id ="advancedTr6" style="display: none;">
		    				<td>按条件授权：</td>
		    				<td>
		    			     <input type="button" value="选择条件" onclick="openAdvanceDlg()" style="margin-top: -3%;"/>
		    			</tr>
		    			<tr id ="advancedTr7" style="display: none;">
		    				<td colspan="2">
		    					<input type="hidden" id="ruleId" name="ruleId"  value="${condition.datRuleId}"  />
		    				
		    				<textarea id="advancedConditions" name="advancedConditions" style="width:420px;height:50px;" readonly>${condition.advancedDisplay}</textarea>
		    				</td>
		    		    </tr>
		    		</tbody>
		    	</table>
		    </div>
		    
   
	<%-- --%>
</body>
</html>