<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知会配置</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/seach.css" />
<link
	href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/node.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/ztree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/json2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<style type="text/css">
.desktopListTabDiv  table {
	width: 100%;
	height: 50px;
	margin-top: 2%;
}

.desktopTabDiv table {
	width: 100%;
	height: 50px;
}

fieldset {
	padding: 10px;
	margin: 10px;
	width: 95%;
	color: #333;
	border: #06c dashed 1px;
}

legend {
	color: #06c;
	font-weight: 800;
	display: block;
	width: 33%;
	padding: 0;
	margin-bottom: 0px;
	font-size: 21px;
	line-height: 40px;
	color: #333;
	border: 0;
	border-bottom: none;
}
</style>
<script type="text/javascript">
	function _openUserDlg(id) {
		var url = "${pageContext.request.contextPath}/console/tag/user/index.xsp?id=" + id
				+ "&documentId=&singleSelect=false&showcurrent=true";
		window.open(encodeURI(url));
	}

	/** ztree的参数配置，setting主要是设置一些tree的属性，是本地数据源，还是远程，动画效果，是否含有复选框等等* */
	var dataGlobal = new Array();
	var setting = {
		check : {
			enable : true,
		},
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

			}
		}
	};

	var log, className = "dark", startTime = 0, endTime = 0, perCount = 100, perTime = 100;
	function getUrl(treeId, treeNode) {
		return "${pageContext.request.contextPath}/console/department/getOrgDepartmentTreeById.action?id="
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

	function opneDeptDlg(dept) {
		dataGlobal = new Array();
		$
				.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/console/department/getOrgDepartmentTreeById.action?id=-1',
					dataType : 'json',
					success : function(result) {
						var ztrees = $.fn.zTree.init($("#processCata"),
								setting, result);
						ztrees.expandAll(true);// 全部展开
						var nodes = ztrees.getNodes();
						for (var i = 0; i < nodes.length; i++) { //设置节点展开
							ztrees.expandNode(nodes[i], true, true, true);
						}
					}
				});
		var deptDlg = layer.open({
			title : '选择部门',
			type : 1,
			skin : 'layui-layer-rim', // 加上边框
			area : [ '750px', '600px' ], // 宽高
			content : $("#deptDlg"),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				var deptTrees = $.fn.zTree.getZTreeObj("processCata");
				var deptTreeNodes = deptTrees.getCheckedNodes(true);
				var name = "";
				var ids = "";
				if (deptTreeNodes != null) {
					for (var i = 0; i < deptTreeNodes.length; i++) {
						if (deptTreeNodes[i].id != 0) {
							ids += deptTreeNodes[i].name + "("
									+ deptTreeNodes[i].id + ");";
							name += deptTreeNodes[i].name + ";";
						}
					}
				}
				$("#" + dept + "_num").val(ids);
				$("#" + dept).val(name);
				layer.close(deptDlg);
			},
			btn2 : function(index, layero) {
			}
		});
	}

	function getUnSelectRoleData() {
		var unSelect = document.getElementById("unSelectRole");
		var alreadSelectRole = document.getElementById("alreadSelectRole");
		var opts = "";
		for (var i = 0; i < unSelect.length; i++) {
			var flag = true;
			if (unSelect[i].selected == true) {
				for (var b = 0; b < alreadSelectRole.length; b++) {
					if (unSelect[i].value == alreadSelectRole[b].value) {
						flag = false;
					}
				}
				if (flag) {
					opts += "<option value='" + unSelect[i].value + "'>"
							+ unSelect[i].text + "</option>";
				}
			}
		}
		$("#alreadSelectRole").append(opts);
	}

	function delSelectRoleData() {
		$("#alreadSelectRole").find("option:selected").remove();
	}

	function saveAlreadSelectRoleData(id) {
		var alreadSelectBackLink = document.getElementById("alreadSelectRole");
		var value = "";
		var name = "";
		for (var i = 0; i < alreadSelectBackLink.length; i++) {
			value += alreadSelectBackLink[i].text + "("
					+ alreadSelectBackLink[i].value + ");";
			name += alreadSelectBackLink[i].text + ";";
		}
		$("#" + id).val(name);
		$("#" + id + "_num").val(value);
	}

	function opneRoleDlg(id) {
		$("#alreadSelectRole").html("");
		var roleDlg = layer.open({
			title : '选择角色',
			type : 1,
			skin : 'layui-layer-rim', // 加上边框
			area : [ '750px', '600px' ], // 宽高
			content : $("#roleDlg"),
			btn : [ '保存', '取消' ],
			yes : function(index, layero) {
				saveAlreadSelectRoleData(id);
				layer.close(roleDlg);
			},
			btn2 : function(index, layero) {
			}
		});
	}

	function saveDefaultPassBy() {
		var loadTip = layer.open({
			type : 3
		});
		$.ajax({
			url : "${pageContext.request.contextPath}/console/bpm/defaultPassBy/saveDefaultPassBy.action",
			type : "post",
			data : {
				"peopleRead" : $("#peopleRead_num").val(),
				"deptRead" : $("#deptRead_num").val(),
				"roleRead" : $("#roleRead_num").val(),
				"content" : $("#content").val(),
				"activityId":"${activityId}",
				"title":$("#title").val(),
				"dynamic":$("#dynamic").val()
			},
			dataType : "json",
			success : function(result) {
				layer.close(loadTip);
				if (result.state == false) {
					layer.alert("保存出错:" + result.msg, {
						closeBtn : 0,
						shift : 4
					// 动画类型
					});
				} else {
					layer.confirm('保存成功是否关闭当前窗口？', {
					btn : [ '是', '否' ]
				// 按钮
				}, function() {
					window.close();
				}, function() {

				});
				}
			},
			error : function() {
				layer.close(loadTip);
			}
		});
	}
</script>
</head>
<body>
	<div style="height: 260px; width: 100%;">
		<div style="margin-left: 4%; padding-top: 2%; font-size: 24px;">
			知会配置</div>
		<hr style="width: 90%; margin-left: 3%">
		<table border="0px" style="height: 155px;">
			<tbody>
				<tr>
					<td width="85px" align="right">人员：</td>
					<td width="990px"><input type="text" name="peopleRead"
						id="peopleRead" style="width: 935px;" value="${rights.empRead}" />
						<span class="controls"> <span class="input-prepend">
								<span class="add-on" onclick="_openUserDlg('peopleRead');"><i
									class="icon-search"></i></span>
						</span> <input type="hidden" name="peopleRead_num" id="peopleRead_num"
							value="${rights.empReadId}" />
					</span></td>

				</tr>
				<tr>
					<td width="60px" align="right">部门：</td>
					<td><input type="text" id="deptRead" name="deptRead"
						style="width: 935px;" value="${rights.deptRead}" /> <span
						class="controls"> <span class="input-prepend"> <span
								class="add-on" onclick="opneDeptDlg('deptRead');"><i
									class="icon-search"></i></span>
						</span> <input type="hidden" id="deptRead_num" name="deptRead_num"
							value="${rights.deptReadId}" />
					</span></td>
				</tr>
				<tr>
					<td width="60px" align="right">角色：</td>
					<td><input type="text" id="roleRead" name="roleRead"
						style="width: 935px;" value="${rights.roleRead}" /> <span
						class="controls"> <span class="input-prepend"> <span
								class="add-on" onclick="opneRoleDlg('roleRead');"><i
									class="icon-search"></i></span>
						</span> <input type="hidden" id="roleRead_num" name="roleRead_num"
							value="${rights.roleReadId}" />
					</span></td>
				</tr>
			</tbody>
		</table>
		<div class="item" style="margin-left: 3%;margin-bottom:1%">
			<label class="itemlable">动态：</label>
			<input id="dynamic" name="dynamic"  value="${rights.dynamic}"/>
			<span style="color:red">如:{empNum} 获取表单&lt;input name="empNum" value="empid:60a;empid:60-0a">的值，注:值只能是用户id，多个用分号(;)</span>
		<br>
		</div>
		<div class="item" style="margin-left: 3%;margin-bottom:1%">
			<label class="itemlable">标题：</label>
			<input id="title" name="title" style="width: 74%; height: 20px;" value="${rights.title}" maxlength="900"/>
		<br>
		</div>
		
		<div class="item" style="margin-left: 3%">
			<label class="itemlable">内容：</label>
			<textarea id="content" name="content" style="width: 74%; height: 150px;">${rights.content}</textarea>
		</div>
		<div><p class="flri" style="margin-top: 15px; margin-right: 20%">
			<button id="saveProConfig" onclick="saveDefaultPassBy();">保存</button>
		</p></div>
	</div>


	<div id="roleDlg" style="display: none">
		<input type="hidden" id="roleCurrentLink">
		<div class="persoN">
			<div class="persoNLf">
				<select class="bgG"
					style="width: 300px; height: 450px; font-size: 15px;" multiple=""
					id="unSelectRole" size="8" ondblclick="getUnSelectRoleData();">
					${roles}
				</select>
			</div>
			<div class="persoNMd" style="padding-top: 186px; margin-left: 2%;">
				<button class="topR RT" onclick="getUnSelectRoleData();">&gt;</button>
				<button class="topR RT" onclick="delSelectRoleData();">&lt;</button>
			</div>
			<div class="persoNRg" style="width: 300px;">
				<div style="overflow: auto;">
					<select class="deptInfoDiv"
						style="float: right; height: 450px; width: 300px; font-size: 15px;"
						multiple="" id="alreadSelectRole" size="8"
						ondblclick="delSelectRoleData();">
					</select>
				</div>

			</div>
		</div>
	</div>


	<div id="deptDlg" style="display: none">
		<ul id="processCata" class="ztree"></ul>
	</div>

</body>
</html>