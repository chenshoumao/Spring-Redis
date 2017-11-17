<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程实例状态图</title>
<jsp:include page="../resources.jsp"></jsp:include>
<link type="text/css"
	href="${pageContext.request.contextPath}/styles/bootstrap3/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/styles/bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/underscore-min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/extprotype.js"></script>
<style>
.modal.modal-wide .modal-dialog {
	width: 70%;
}

.modal-wide .modal-body {
	overflow-y: auto;
}
</style>
</head>
<body style="margin: 4px;">
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<input type="hidden" id="instanceId" value="${instanceId }" />
		<input type="hidden" id="bpdId" value="${bpdId }" />
		<input type="hidden" id="snapshotId" value="${snapshotId }" />
		<input type="hidden" id="procAppId" value="${procAppId }" />
		<div id="diagramData" style="display: none">${diagramData }</div>
		<div id="nodeStatus" style="display: none">${nodeStatus}</div>
	<div>
		<button id="saveDiagram">保存流程图</button>
		<button id="bpmndata">导出BPMNdata</button>
	</div>


	<div id="graphContainer"
		style="position: relative; overflow: hidden; width: 321px; height: 241px; cursor: default;">
	</div>


		<div id="info" class="easyui-dialog" title="环节信息" style="width:650px;height:200px;"
		    data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		    <div id="nodeInfodg" style="width: 100%; height: 100%"></div>
		</div>

	<div id="sub" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">子流程</h4>
				</div>
				<div class="modal-body">
					<div id="graphContainer2" style="margin: auto;" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<!-- 加载graphJS脚本 -->
	<script type="text/javascript">
	//设置MX BasePath
	var mxBasePath=ctxpath+"scripts/graphJs";
	</script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/graphJs/mxClient.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/graphJs/myplugin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/graphJs/myFlowchart.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/bpmportal/scripts/center/editDiagram.js"></script>
</body>
</html>