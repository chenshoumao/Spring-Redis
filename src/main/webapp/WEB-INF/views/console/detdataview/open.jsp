<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${detView.viewTitle }</title>
	<jsp:include page="../resources.jsp"></jsp:include>
	<c:out value="${detView.viewHead }" escapeXml="false" />
	<script type="text/javascript">
	$(function() {
		//var viewData=${viewData};
		//$("#gridview_${detView.viewName }").datagrid("loadData", viewData);
		var ctxPath=$("#ctxPath").val();
	    var nsViewPath=ctxPath+"/console/detview";  //命名空间路径
	    var datAppId=$("#datAppId").val();
		var viewId=$("#viewId").val();
		$("#gridview_${detView.viewName }").datagrid({
			url:nsViewPath+"/getviewdata/"+datAppId+"/"+viewId+".action?r1="+Math.random(),
	        singleSelect: true,
			rownumbers:true,
			pagination:true,
			pageSize:${viewPageSize},
			pageList:[${detView.pageSize}],
			method:"get",
			fitColumns:"true",
			fit:"true"
		});
	});
	
	//打开视图文档链接
	function rowOpenFmt(val,row) {
		var datAppId=$("#datAppId").val();
		var viewId=$("#viewId").val();
	    var ctxPath=$("#ctxPath").val();
	    var html="<a href='"+ctxPath+"/console/datdoc/edit/"+datAppId+"/"+
	    	row.DOCUMENT_ID+".xsp' target='_blank'>打开</a>";
	    return html;
	}
	
	//编辑视图文档链接
	function rowEditFmt(val,row) {
		var datAppId=$("#datAppId").val();
		var viewId=$("#viewId").val();
	    var ctxPath=$("#ctxPath").val();
	    var html="<a href='"+ctxPath+"/console/datdoc/edit/"+datAppId+
	    	"/"+row.DOCUMENT_ID+".xsp?mode=edit' target='_blank'>编辑</a>";
	    return html;
	}
	
	//删除视图文档链接
	function rowRemoveFmt(val,row) {
		var datAppId=$("#datAppId").val();
		var viewId=$("#viewId").val();
	    var ctxPath=$("#ctxPath").val();
	    var html="<a href='"+ctxPath+"/console/datdoc/delete/"+datAppId+
	    	"/"+row.DOCUMENT_ID+".action'>删除</a>";
	    return html;
	}
	
		function viewDocument(val,row) {
		var datAppId=$("#datAppId").val();
		var viewId=$("#viewId").val();
	    var ctxPath=$("#ctxPath").val();
	    var html="<a href='"+ctxPath+"/console/datdoc/view/"
	    	+row.DOCUMENT_ID+".xsp' target='_blank'>查看文档</a>";
	    return html;
	}
	
	</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<input type="hidden" id="ctxPath" value="${pageContext.request.contextPath }" />
		<input type="hidden" id="datAppId" value="${appId }" />
		<input type="hidden" id="viewId" value="${detView.viewId }" />
		<table id="gridview_${detView.viewName }" class="easyui-datagrid">
			<thead>
	            <tr>
	            <c:forEach items="${viewColumns}" var="column">
	            	<th field="${column.columnName}" sortable="${column.isSort }" 
	            		width="${column.columnWidth }" ${column.extAttrs }>${column.columnTitle }</th>
	            </c:forEach>
	            <c:if test="${fn:length(viewColumns)>0}">
	            	<th field="c1" width="30" formatter="rowOpenFmt"></th>
	                <th field="c2" width="30" formatter="rowEditFmt"></th>
	                <th field="c3" width="30" formatter="rowRemoveFmt"></th>
	                <th field="c4" width="30" formatter="viewDocument"></th>
	            </c:if>
	            </tr>
	        </thead>
		</table>
	</div>
</body>
</html>