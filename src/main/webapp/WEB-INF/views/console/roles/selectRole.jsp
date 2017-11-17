<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文档详情</title>

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
padding:10px;
margin:10px;
width:95%;
color:#333; 
border:#06c dashed 1px;
} 
legend {
color:#06c;
   font-weight:800; 
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
.persoNLf {
    width: 200px;
    float: left;
}
.persoN {
    clear: both;
    height: 300px;
    margin: 2%;
}
</style>
<script type="text/javascript">

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

	function saveAlreadSelectRoleData() {
		var data = document.getElementById("alreadSelectRole");
	     return data;
	}



</script>

</head>
<body>
	<input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />
	<div id="roleDlg">
		<input type="hidden" id="roleCurrentLink">
		<div class="persoN">
			<div class="persoNLf">
				<select class="bgG"
					style="width: 200px; height: 300px; font-size: 15px;" multiple=""
					id="unSelectRole" size="8" ondblclick="getUnSelectRoleData();">
					<c:forEach var="item" items="${role}" varStatus="status">
					<option value="${item.roleNum}">${item.roleName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="persoNMd" style="padding-top: 90px; margin-left: 2%;">
				<button class="topR RT" onclick="getUnSelectRoleData();">&gt;</button>
				<button class="topR RT" onclick="delSelectRoleData();">&lt;</button>
			</div>
			<div class="persoNRg" style="width: 200px;">
				<div style="overflow: auto;">
					<select class="deptInfoDiv"
						style="float: right; height: 300px; width: 200px; font-size: 15px;"
						multiple="" id="alreadSelectRole" size="8"
						ondblclick="delSelectRoleData();">
					</select>
				</div>
			</div>
		</div>
	</div>



</body>
</html>