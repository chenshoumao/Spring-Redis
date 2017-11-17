<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>流程测试器</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#startProcess").click(function(evt) {
			evt.preventDefault();
			var procAppId=prompt("请输入流程应用库ID：");
			if ($.trim(procAppId=="")) {
				alert("流程应用库ID不能为空！");
				return;
			}
			var bpdId=prompt("请输入流程图ID：");
			if ($.trim(procAppId=="")) {
				alert("流程图ID不能为空！");
				return;
			}
			window.open("startProcess.action?procAppId="+procAppId+"&bpdId="+bpdId);
		});
		
		$("#commitTask").click(function(evt) {
			evt.preventDefault();
			var tkiid=prompt("请输入任务ID：");
			if ($.trim(tkiid=="")) {
				alert("任务ID不能为空！");
				return;
			}
			var nextUser=prompt("请输入下一处理人ID（多个处理人使用逗号分隔）：");
			if ($.trim(nextUser=="")) {
				alert("下一处理人不能为空！");
				return;
			}
			window.open("commitTask.action?tkiid="+tkiid+"&nextUser="+nextUser);
		});
		
		$("#getInstance").click(function(evt) {
			evt.preventDefault();
			var piid=prompt("请输入实例ID：");
			if ($.trim(piid=="")) {
				alert("实例ID不能为空！");
				return;
			}
			window.open("getInstance.action?tkiid="+piid);
		});
		
		$("#getTaskDetails").click(function(evt) {
			evt.preventDefault();
			var tkiid=prompt("请输入任务ID：");
			if ($.trim(tkiid)=="") {
				alert("任务ID不能为空！");
				return;
			}
			window.open("getTaskDetails.action?tkiid="+tkiid);
		});
		
		$("#getTaskData").click(function(evt) {
			evt.preventDefault();
			var tkiid=prompt("请输入任务ID：");
			if ($.trim(tkiid)!="") {
				window.open("getTaskData.action?tkiid="+tkiid);
			}
		});
		
		$("#getGroupDetails").click(function(evt) {
			evt.preventDefault();
			var groupName=prompt("请输入组名：");
			if ($.trim(groupName)!="") {
				window.open("getGroupDetails.action?groupName="+groupName);
			}
		});
		
		$("#getInstExecInfo").click(function(evt) {
			evt.preventDefault();
			var instIds=prompt("请输入实例ID，逗号分隔多个ID：");
			window.open("getInstExecInfo.action?instIds="+instIds);
		});
		
		$("#searchInstance").click(function(evt) {
			evt.preventDefault();
			var bpdName=prompt("请输入流程图名称：");
			window.open("searchInstance.action?bpdName="+bpdName);
		});
		
		$("#createTwRole").click(function(evt) {
			evt.preventDefault();
			var roleName=prompt("请输入TW角色名：");
			if ($.trim(roleName)!="") {
				window.open("createTwRole.action?roleName="+roleName);
			}
		});
		
		$("#viewBpdModel").click(function(evt) {
			evt.preventDefault();
			var procAppId=prompt("请输入流程应用库ID：", "2066.xxx");
			var bpdId=prompt("请输入流程图ID：", "25.xxx");
			var snapshotId=prompt("请输入快照ID：", "2064.xxx");
			window.open("viewBpdModel.action?procAppId="+procAppId+
				"&bpdId="+bpdId+"&snapshotId="+snapshotId);
		});
		
		$("#getInstErrorMsg").click(function(evt) {
			evt.preventDefault();
			var instIds=prompt("请输入流程实例ID（多个ID使用逗号分隔）");
			window.open("getInstanceError.action?instIds="+instIds);
		});
	});
	</script>
</head>
<body>
	<p>ctxPath: ${pageContext.request.contextPath }</p>
	<p>javaPath: ${javaPath }</p>
	<p>userHome: ${userHome }</p>
	<h1 style="color:red">请注意，由于是测试工具，某些数据会硬编码在源代码中！</h1>
	<h2>请选择测试项：</h2>
	<p><a href="allPubProess.action" target="_blank">获取公开的流程</a>
	<p><a href="startProcess.action" target="_blank" id="startProcess">启动流程</a></p>
	<p><a href="commitTask.action" id="commitTask" target="_blank">提交任务</a></p>
	<p><a href="getInstance.action" id="getInstance" target="_blank">获取实例信息</a></p>
	<p><a href="getTaskDetails.action" id="getTaskDetails" target="_blank">获取任务详细信息</a></p>
	<p><a href="getTaskData.action" id="getTaskData" target="_blank">获取任务数据</a></p>
	<p><a href="getGroupDetails.action" id="getGroupDetails" target="_blank">获取组详细信息</a></p>
	<p><a href="getInstExecInfo.action" id="getInstExecInfo" target="_blank">获取实例运行信息</a></p>
	<p><a href="searchInstance.action" id="searchInstance" target="_blank">查找流程实例</a></p>
	<p><a href="currentUser.action" id="currentUser" target="_blank">当前用户信息</a></p>
	<p><a href="createTwRole.action" id="createTwRole" target="_blank">创建Teamwork角色</a></p>
	<p><a href="viewBpdModel.action" id="viewBpdModel" target="_blank">查看流程图可视化模型数据</a></p>
	<p><a href="getInstanceError.action" id="getInstErrorMsg" target="_blank">获取流程实例的错误信息</a></p>
	<h1>其他功能测试页面</h1>
	<p><a href="processtest.xsp" target="_blank">测试流程自动化工具</a></p>
	<p><a href="httpConnectionPooling.xsp" target="_blank">查看HTTP连接池状态</a></p>
</body>
</html>