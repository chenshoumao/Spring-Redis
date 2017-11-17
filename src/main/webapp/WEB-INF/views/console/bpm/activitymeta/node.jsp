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
<title>流程环节配置</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/reset.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/seach.css" />


<link
	href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/node.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/default/easyui.css"> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/treeicon/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/scripts/jquery/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/json2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/console/bpm/activitymeta/node.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>


<script type="text/javascript">
	var datas = ${metasJson};
</script>

</head>
<body>
	<input type="hidden" id="basePath"
		value="${pageContext.request.contextPath}" />
	<div id="myTabContent" class="tab-content">
		<!-- 流程环节配置-->
		<div class="tab-pane fade in active" id="">
			<div class="content">
				<!-- 流程环节配置 -->
				<jsp:include page="./snapshot.jsp"></jsp:include>
				<!-- 流程环节列表 -->
				<jsp:include page="./metaList.jsp"></jsp:include>
				<!-- 节点配置 -->
				<jsp:include page="./metaDetail.jsp"></jsp:include>
			</div>
		</div>
		<p class="flri" style="margin-top: 15px; margin-right: 20%">
			<button id="saveProConfig">保存</button>
		</p>
	</div>

	<div id="selectBackLink" style="display: none">
		<div class="persoN">
			<input type="hidden" id="currentLink" >
			<input type="hidden" id="roleCurrentLink_id" >
			
			<div class="persoNLf">
				<select class="bgG"
					style="width: 300px; height: 450px; font-size: 15px;" multiple=""
					 id="unSelectBackLink" size="8"
					ondblclick="getUnSelectBackLinkData()">
		           </select>
				</div>
			<div class="persoNMd" style="padding-top: 186px;margin-left: 2%;">
				<button class="topR RT" onclick="getUnSelectBackLinkData();">&gt;</button>
				<button class="topR RT" onclick="delSelectBackLinkData();">&lt;</button>
			</div>
			<div class="persoNRg" style="width: 300px;">
				<div style="overflow: auto;">
					<select class="deptInfoDiv"
						style="float: right; height: 450px;width: 300px; font-size: 15px;" multiple=""
						name="empight" id="alreadSelectBackLink" size="8"
						ondblclick="delSelectBackLinkData()">
					</select>
				</div>
			
			</div>
		</div>
	</div>
	
	
	<div id="roleDlg" style="display: none">
	<input type="hidden" id="roleCurrentLink" >
		<div class="persoN">
			<div class="persoNLf">
				<select class="bgG"
					style="width: 300px; height: 450px; font-size: 15px;" multiple=""
					 id="unSelectRole" size="8"
					ondblclick="getUnSelectRoleData();">
					${roles}
		           </select>
				</div>
			<div class="persoNMd" style="padding-top: 186px;margin-left: 2%;">
				<button class="topR RT" onclick="getUnSelectRoleData();">&gt;</button>
				<button class="topR RT" onclick="delSelectRoleData();">&lt;</button>
			</div>
			<div class="persoNRg" style="width: 300px;">
				<div style="overflow: auto;">
					<select class="deptInfoDiv"
						style="float: right; height: 450px;width: 300px; font-size: 15px;" multiple=""
						 id="alreadSelectRole" size="8"
						ondblclick="delSelectRoleData();">
					</select>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>