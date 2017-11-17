<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>流程图</title>
	<jsp:include page="../resources.jsp"></jsp:include>
    <!-- start >>> 引入流程图组件 -->
    <!-- 组件需要jq -->
    
    <script>
        // 根据需要修改path
        var mxBasePath = "${pageContext.request.contextPath}/scripts/graphJs";
    </script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/graphJs/mxClient.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/underscore-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/graphJs/myplugin.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/graphJs/myFlowchart.js"></script>
    
    <!-- end <<< -->
    <link type="text/css"
		href="${pageContext.request.contextPath}/styles/bootstrap3/css/bootstrap.min.css"
		rel="stylesheet" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/styles/bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/bpmportal/scripts/center/createDiagram.js"></script>
    <style>
.modal.modal-wide .modal-dialog {
  width: 70%;
}
.modal-wide .modal-body {
  overflow-y: auto;
}

/* btn 风格是 bootstrap 自带的 button 风格 */
.btn {
    margin-left: 10px;
}
.btn img {
    padding-right: 4px;
}
.btn.active, .btn.active:hover {
    background-color: #a5982e;
}

    </style>
    
</head>
<body style="margin:4px;">
	<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath}" />
    <div>
    <!-- 流程图ID -->
    <div id="diagramId" style="display: none">
    	<input name="diagramId" value="${diagramId}">
    </div>
    <!-- 流程图数据 -->
    <div id="diagramData" style="display: none">${diagramData}</div>
    
    <!-- 流程图别名 -->
    <div><span style="color: red;">*</span>流程图别名:<input name = "diagramAltName" value="${diagramAltName}"><button id="modeldata">保存流程图</button></div> 
    
<!--     <button id="bpmndata">输出BPMN</button> -->
    <span id="help" style="color:blue;padding-left:20px;">鼠标双击节点可修改节点名称；鼠标双击连线可增加或修改连线标题；鼠标点击连线标题后可拖动连线标题到任意位置；</span>
    </div>
    <div id="toolbarDiv"></div>
    
	<div id="graphContainer"
		style="position:relative;overflow:hidden;width:321px;height:241px;cursor:default;">
	</div>
    
    
    <span id="message" style="color:green;"></span>
    
    

<div id="sub" class="modal modal-wide fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">子流程</h4>
      </div>
      <div class="modal-body">
        <div id="graphContainer2" style="margin:auto;"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>