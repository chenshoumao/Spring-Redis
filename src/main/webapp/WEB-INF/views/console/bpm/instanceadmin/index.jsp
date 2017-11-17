<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${pageContext.request.contextPath}/images/LOGO.ico" rel="shortcut icon"
		type="image/x-icon" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<jsp:include page="../../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/console/bpm/instanceadmin/index.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/console/bpm/instanceadmin/index.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<div id="dlgReason" closed="true" class="easyui-window">
			<p>请填写原因：</p>
			<div><textarea id="taReason"></textarea></div>
		</div>
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath}" />
		<div id="toolbar">
			<div>
				<a id="btnPause" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">暂停流程实例</a>
				<a id="btnResume" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">恢复流程实例</a>
				<a id="btnTerminate" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no'">终止流程实例</a>
				<a id="btnReroute" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重新路由实例</a>
				<a id="btnReassign" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-man'" style="display:none">重新分派任务</a>
				<a id="btnShowSearch" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查找流程实例</a>
			</div>
		</div>
		<table id="grid1" class="easyui-datagrid">
	        <thead>
	            <tr>
	            	<th field="piid" checkbox="true"></th>
	                <th field="bpdName" width="15%">流程名称</th>
	                <th field="instanceId" width="5%">实例ID</th>
	                <th field="executionState" width="10%">实例状态</th>
	                <th field="instName" width="15%">实例名称</th>
	                <th field="currTasks" width="15%">当前活动任务</th>
	                <th field="currOwners" width="15%">任务处理人</th>
	                <th field="snapshotID" width="25%">快照ID</th>
	                <th field="documentId" width="25%">文档ID</th>
	                <th field="datappName" width="15%">应用库名称</th>
	                <th field="createTime" width="15%" formatter="gridDateFmt">创建时间</th>
	                <th field="lastModificationTime" width="15%" formatter="gridDateFmt">更新时间</th>
	            </tr>
	        </thead>
	  	</table>
	</div>
	
	<div id="dlgFind" class="easyui-dialog" closed="true" buttons="#dlgButtonsByFind"  modal="true">
		<form id="searchForm">
			<table id="searchTable">
				<tr>
					<th>流程实例名称：</th>
					<td><input class="easyui-textbox" type="text" id="tbFindInstName" style="width:90%" /></td>
				</tr>
				<tr>
					<th>流程实例ID：</th>
					<td><input class="easyui-textbox" type="text" id="tbFindInstId" style="width:90%" /></td>
				</tr>
				<tr>
					<th>审批文档ID：</th>
					<td><input class="easyui-textbox" type="text" id="tbFindDocId" style="width:90%" /></td>
				</tr>
				<tr>
					<th>创建日期：</th>
					<td>
						<input id="ddFindStartDate" type="text" class="easyui-datebox" />
						 至 
						<input id="ddFindEndDate" type="text" class="easyui-datebox" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlgButtonsByFind">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnreset"
			iconCls="icon-clear" style="width: 90px">重置</a>
		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnsearch"
			iconCls="icon-ok" style="width: 90px">查找</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="dlg_btncancel"
			iconCls="icon-cancel" style="width: 90px">取消</a>
	</div>
	
	<div id="dlgReroute" class="easyui-dialog" closed="true" buttons="#dlgButtonsByReroute" 
		modal="true" width="600" height="300">
		<input type="hidden" id="rerouteInstId" />
		<form id="rerouteForm" >
			<table>
				<tr>
					<th style="width:30%">重新路由的活动环节(<span style="color:red">*</span>)：</th>
					<td style="width:70%"><input class="easyui-combobox" id="cbRerouteActivity" style="width:80%" /></td>
				</tr>
				<tr>
					<th>活动环节处理人(<span style="color:red">*</span>)：</th>
					<td>
						<input type="text" id="tbActivityOwner" readonly="readonly" />
						<input type="hidden" id="tbActivityOwner_num" />
						<a href="#" id="btnSelectRerouteOwner" class="easyui-linkbutton" iconCls="icon-man"></a>
					</td>
				</tr>
				<tr>
					<th>重新路由的原因(<span style="color:red">*</span>)：</th>
					<td>
						<textarea id="taRerouteReason" style="width:80%; height:100px"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlgButtonsByReroute">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnreset_reroute"
			iconCls="icon-clear" style="width: 90px">重置</a>
		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnok_reroute"
			iconCls="icon-ok" style="width: 90px">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="dlg_btncancel_reroute"
			iconCls="icon-cancel" style="width: 90px">取消</a>
	</div>
	
	<div id="dlgReassign" class="easyui-dialog" closed="true" buttons="#dlgButtonsByReassign" 
		modal="true" width="600" height="300">
		<input type="hidden" id="reassignInstId" />
		<form id="reassignForm" >
			<table>
				<tr>
					<th style="width:30%">重新分派的任务(<span style="color:red">*</span>)：</th>
					<td style="width:70%"><input class="easyui-combobox" id="cbTasks" style="width:80%" /></td>
				</tr>
				<tr>
					<th>任务span style="color:red">*</span>)：</th>
					<td>
						<input type="text" id="tbActivityOwner" style="width:70%" readonly="readonly" />
						<input type="hidden" id="tbActivityOwner_num" />
						<a href="#" id="btnSelectReassignOwner" class="easyui-linkbutton" iconCls="icon-man"></a>
					</td>
				</tr>
				<tr>
					<th>重新分派的原因(<span style="color:red">*</span>)：</th>
					<td>
						<textarea id="taReason" style="width:80%; height:100px"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlgButtonsByReassign">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="dlg_btnok_reassign"
			iconCls="icon-ok" style="width: 90px">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="dlg_btncancel_reassign"
			iconCls="icon-cancel" style="width: 90px">取消</a>
	</div>
</body>
</html>