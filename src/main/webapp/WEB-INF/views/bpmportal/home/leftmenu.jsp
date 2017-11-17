<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="easyui-accordion" data-options="fit:true,border:false">
	<div id="leftmenuTree"></div>
			<script type="text/javascript">
		   $('#leftmenuTree').tree({   //${menu.menuId}
            url: '${pageContext.request.contextPath}/bpmportal/home/selectBpmHomeMeun.xsp?parentItemId=0&itemType=2',   //&menuId=${menu.menuId}
            onBeforeExpand:function(node,param){  //${menu.menuId}
                $('#leftmenuTree').tree('options').url = "${pageContext.request.contextPath}/bpmportal/home/selectBpmHomeMeun.xsp?parentItemId="+ node.id +"&itemType=2";//+ "&menuId=${menu.menuId}"
									},
									onClick : function(node) {
										var id = node.id;
										var href = node.url;
										//modify by sujialin @20160615
										//判断一下签名前面有没有斜杠，防止用户误输入
										if (href!==null && href!="") {
											href=href.startWith("/")? href : "/"+href;
										}
										var isLeaf = node.isLeaf;
										var title = node.text
										var target = node.attributes.target;
										var parentNode = $('#leftmenuTree').tree('getParent', node.target);  //${menu.menuId}
										if(href!==null&&href!=""){
										if (target == "_blank") {
											window.open("${pageContext.request.contextPath}"+href);
										} else {
											if (parentNode == null) {
												addTab(title, "${pageContext.request.contextPath}"+href);
											} else {
												addTab(parentNode.text + "-"+ title,  "${pageContext.request.contextPath}"+href);
											}
										}
									}
									}

								});
			</script>
		<%-- </div>
	</c:forEach> --%>
</div>