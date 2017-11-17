
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>

<div class="easyui-accordion" data-options="fit:true,border:false">
	<div>
		<ul id="processCata" class="ztree"></ul>
	</div>
	</div>
	<script type="text/javascript">
	/** ztree的参数配置，setting主要是设置一些tree的属性，是本地数据源，还是远程，动画效果，是否含有复选框等等* */
var dataGlobal = new Array();
var setting = {
		async : {
			enable : true,
			url : getUrl
		},
		data : {
			simpleData : { // 简单的数据源，一般开发中都是从数据库里读取，API有介绍，这里只是本地的
				enable : true,
				idKey : "id", // id和pid，这里不用多说了吧，树的目录级别
				pIdKey : "pid",
				rootPId : "0"
			}
		},
		callback : {
			beforeExpand : beforeExpand,
			onAsyncSuccess : onAsyncSuccess,
			onAsyncError : onAsyncError,
			onClick : function(event, treeId, treeNode) {
				var treeObj = $.fn.zTree.getZTreeObj("processCata");
				treeObj.checkNode(treeNode, true, true);
				treeNode.checked = true;
				treeObj.updateNode(treeNode);
				var id = treeNode.id;
			    document.getElementById("userIframeId").src = $("#basePath")
							.val()+ "/console/orgDept/member/deptEmpView.xsp?deptId="
							+ id;
			}
		}
	};

	var log, className = "dark", startTime = 0, endTime = 0, perCount = 100, perTime = 100;
	function getUrl(treeId, treeNode) {
		return $("#basePath").val()+"/console/department/getOrgDepartmentTreeById.action?id="
				+ treeNode.id;
	}
	function beforeExpand(treeId, treeNode) {
		if (!treeNode.isAjaxing) {
			startTime = new Date();
			treeNode.times = 1;
			ajaxGetNodes(treeNode, "refresh");
			return true;
		} else {
			alert("zTree 正在下载数据中，请稍后展开节点。。。");
			return false;
		}
	}
	function onAsyncSuccess(event, treeId, treeNode, msg) {
		if (!msg || msg.length == 0) {
			return;
		}
		var zTree = $.fn.zTree.getZTreeObj("processCata"), totalCount = treeNode.count;
		if (treeNode.children.length < totalCount) {
			setTimeout(function() {
				ajaxGetNodes(treeNode);
			}, perTime);
		} else {
			treeNode.icon = "";
			zTree.updateNode(treeNode);
			zTree.selectNode(treeNode.children[0]);
		}
	}
	function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus,
			errorThrown) {
		var zTree = $.fn.zTree.getZTreeObj("processCata");
		alert("异步获取数据出现异常。");
		//	treeNode.icon = "";
		zTree.updateNode(treeNode);
	}
	function ajaxGetNodes(treeNode, reloadType) {
		var zTree = $.fn.zTree.getZTreeObj("processCata");
		if (reloadType == "refresh") {
			//treeNode.icon = "../../../css/zTreeStyle/img/loading.gif";
			zTree.updateNode(treeNode);
		}
		zTree.reAsyncChildNodes(treeNode, reloadType, true);
	}
	
function getQueryString(key) {
	var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
	var result = window.location.search.substr(1).match(reg);
	return result ? decodeURIComponent(result[2]) : null;
}
	
$(function() {
		dataGlobal = new Array();
	$.ajax({
		type : 'post',
		url : $("#basePath").val()+'/console/department/getOrgDepartmentTreeById.action?id=-1',
		dataType : 'json',
		success : function(result) {
			var ztrees = $.fn.zTree
					.init($("#processCata"), setting,
							result);
			ztrees.expandAll(true);// 全部展开
			var nodes = ztrees.getNodes();
			for (var i = 0; i < nodes.length; i++) { //设置节点展开
				ztrees.expandNode(nodes[i], true,
						true, true);
			}
		}
	});
		});
	</script>
