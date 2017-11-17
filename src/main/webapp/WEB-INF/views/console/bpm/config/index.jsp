<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BPM全局配置</title>
<jsp:include page="../../resources.jsp"></jsp:include>
<style>
.fitem {
	margin-bottom: 15px;
	text-indent:1em;
}

.fitem label {
	width:150px;
}

fieldset {
	padding: 10px;
	margin: 10px;
	width: 86%;
	color: #333;
	border: #06c dashed 1px;
}

legend {
	color: #06c;
	font-weight: 800;
}
</style>
</head>
<body>
	<form id="form" method="post" action="${pageContext.request.contextPath}/console/bpm/config/save.action">
		<input type="hidden" name="configId" value="${bpmCfg.configId}">
		<fieldset>
			<legend>BPM全局配置</legend>
			<div class="fitem">
				<label>配置名称:</label>
				<input class="easyui-textbox"
					style="width: 300px;" name="configName"
					value="${bpmCfg.configName}">
			</div>
			<div class="fitem">
				<label>BPM服务器地址:</label> <input class="easyui-textbox"
					style="width: 300px;" name="bpmServerHost" value="${bpmCfg.bpmServerHost}">
			</div>
			<div class="fitem">
				<label>BPM服务器连接超时:</label> <input class="easyui-numberbox"
					style="width: 200px;" name="bpmClientTimeout" 
					value="${bpmCfg.bpmClientTimeout}" data-options="min:3000"> 毫秒
			</div>
			<div class="fitem">
				<label>BPM管理员账号:</label> <input class="easyui-textbox"
					style="width: 300px;" name="bpmAdminName" value="${bpmCfg.bpmAdminName}">
			</div>
			<div class="fitem">
				<label>BPM管理员密码:</label> <input class="easyui-textbox"
					style="width: 300px;" type="password" name="bpmAdminPsw"
					value="${bpmCfg.bpmAdminPsw}">
			</div>
			<div class="fitem">
				<label>BPM时区:</label> <input class="easyui-textbox"
					style="width: 300px;" type="text" name="gmtTimeZone"
					value="${bpmCfg.gmtTimeZone}">
			</div>
			<div class="fitem">
				<label>表单平台Host地址:</label> <input class="easyui-textbox"
					style="width: 300px;" type="text" name="bpmformsHost"
					value="${bpmCfg.bpmformsHost}">
			</div>
			<div class="fitem">
				<label>表单平台Web上下文:</label> <input class="easyui-textbox"
					style="width: 300px;" type="text" name="bpmformsWebContext"
					value="${bpmCfg.bpmformsWebContext}">
			</div>
			<div class="fitem">
				<label>HTTP最大连接数:</label> <input class="easyui-numberbox"
					style="width: 200px;" type="text" name="httpMaxConnection"
					value="${bpmCfg.httpMaxConnection}" data-options="min:10">
			</div>
			<div class="fitem">
				<label>路由基础最大连接数:</label> <input class="easyui-numberbox"
					style="width: 200px;" type="text" name="preRouteMaxConnection"
					value="${bpmCfg.preRouteMaxConnection}" data-options="min:10">
			</div>
			<div class="fitem" style="padding-left: 10px">
				<input type="submit" value="保存" />
			</div>
			<div style="color:red">${msg }</div>
		</fieldset>
	</form>
</body>
</html>