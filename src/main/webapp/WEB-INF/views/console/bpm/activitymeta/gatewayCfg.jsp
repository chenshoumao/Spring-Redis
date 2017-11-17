<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网关环节列表</title>
	<link href="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/css/bootstrap.min.css" 
		rel="stylesheet" />
	<jsp:include page="../../resources.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/styles/console/bpm/activitymeta/gateway.css" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/styles/bootstrap/2.2.2/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/layer/layer.js"></script>
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/scripts/console/bpm/activitymeta/gatewaycfg.js"></script>
</head>
<body>
	<div id="baseContainer">
		<input type="hidden" id="saveResult" value="${success }" />
		<input type="hidden" id="saveResultMsg" value="${resultMsg }" />
		<div id="centerPanel">
			<div id="panel01">网关环节列表</div>
			<div id="gatewayList">
				<br/><br/>
				<table>
				<c:forEach var="item" items="${gatewayMetas}" varStatus="status">
					<tr>
						<td <c:if test="${status.index==0}">class="selected"</c:if>>${item.activityName }</td>
					</tr>
				</c:forEach>
				</table>
			</div>
			<div id="gatewayDetails">
				<div class="easyui-tabs" style="width:100%; height:500px;">
					<div title="路由条件配置" style="padding:20px">
						<form id="form1" method="post"
							action="${pageContext.request.contextPath}/console/bpm/activitymeta/saveGatewayCfg.action">
							<input type="hidden" id="snapshotUid" name="snapshotUid" value="${snapshotUid }" />
							<input type="hidden" id="bpdId" name="bpdId" value="${bpdId }" />
							<input type="hidden" id="procAppId" name="procAppId" value="${procAppId }" />
							<input type="hidden" id="params" name="params" />
							<input type="hidden" id="metasSize" value="${fn:length(gatewayMetas)}" />
							<c:forEach var="item" items="${gatewayMetas}" varStatus="status">
							<input type="hidden" id="activityId_${status.index }"
								name="activityId_${status.index }" value="${item.activityId}" />
							<table class="conditionTable" <c:if test="${status.index!=0}">style="display:none"</c:if>>
								<tr>
									<th>网关类型：</th>
									<td>
										<input type="hidden" id="activityName_${status.index }" value="${item.activityName }" />
										<input type="text" id="activityType_${status.index}" 
											readonly="readonly" class="form-control" style="width: 90%"
										<c:choose>
										<c:when test="${item.activityType=='gatewayAnd'}">value="并行网关"</c:when>
										<c:when test="${item.activityType=='gatewayOr'}">value="包容网关"</c:when>
										<c:when test="${item.activityType=='gateway'}">value="排它网关"</c:when>
										<c:otherwise>value="${item.activityType }"</c:otherwise>
										</c:choose>
										/></td>
									<th>网关环节序号：</th>
									<td><input type="text" id="sortNum_${status.index }" name="sortNum_${status.index }" 
										style="width:90%" class="form-control" value="${item.sortNum }"
										onkeyup="this.value=this.value.replace(/\D/g,'')" 
										onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
								</tr>
								<tr>
									<th>路由变量名称：</th>
									<td colspan="3" style="width:550px">
										<ul>
										<c:forEach var="sno" begin="0" end="20">
										<li>
											<c:set var="optValue" value="result_${sno}"></c:set>
											<c:set var="optChecked" value="false"></c:set>
											<c:set var="tmpRouteVarName" value="result_${sno }"></c:set>
											<%-- 遍历变量名称列表，判断路由条件变量名称复选框是否要选中 --%>
											<c:forEach var="itemRouteVarName" items="${routeVarNames[item.activityId]}">
												<c:if test="${itemRouteVarName==tmpRouteVarName}">
													<c:set var="optChecked" value="true"></c:set>
												</c:if>
											</c:forEach>
											<label><input type="checkbox" name="routeVarName_${status.index }" 
												class="form-control" value="${optValue }"
												<c:if test="${optChecked }"> checked="checked" </c:if> 
												/> ${optValue } </label>
										</li>
										</c:forEach>
										<li class="clear"></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th style="vertical-align: top; padding-top:20px">路由条件：</th>
									<td colspan="3" style="width:550px">
										<div class="conditionGridToolbar">
											<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" 
												plain="true" onclick="openConditionWnd(${status.index })">新建</a>
											<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" 
												plain="true" onclick="deleteConditionRow(${status.index })">删除</a>
										</div>
										<table id="conditionGrid_${status.index }" class="conditionGrid">
									        <thead>
									            <tr>
									            	<th>路由变量</th>
									                <th>字段名称</th>
									                <th>比较运<br/>算符</th>
									                <th>字段值</th>
									                <th>字段值<br/>类型</th>
									                <th>条件组<br/>合运算</th>
									                <th>优先级</th>
									                <th>条件分组</th>
									            </tr>
									        </thead>
									        <tbody>
									        	<c:forEach items="${gatewayConditions[item.activityId]}" var="mapItem">
									        	<tr onclick="selectConditionRow(${status.index }, this)"
									        		ondblclick="openConditionWnd(${status.index }, this)">
									        		<td>${mapItem.routeVarName }</td>
									        		<td>${mapItem.leftValue }</td>
									        		<td>${mapItem.valueOperator}</td>
									        		<td>${mapItem.rightValue }</td>
									        		<td>${mapItem.rightValueType}</td>
									        		<td>${mapItem.conditionOperator}</td>
									        		<td>${mapItem.sortNum}</td>
									        		<td>${mapItem.conditionGroupName}</td>
									        	</tr>
									        	</c:forEach>
									        </tbody>
									    </table>
									    <div id="dlgCondition_${status.index }" class="dlgCondition">
								    		<input type="hidden" id="_ruleId_${status.index }"  />
											<input type="hidden" id="_conditionId_${status.index }"  />
											<div class="fitem">
												<label>路由变量:</label>
												<select style="width: 180px;" id="selRouteVarName_${status.index }"
													class="form-control">
												</select>
											</div>
											<div class="fitem">
												<label>字段名称:</label> 
												<select style="width: 180px;" id="leftValue_${status.index }"
													class="form-control">
													<c:forEach var="fldItem" items="${formFields}" varStatus="fldStatus">
														<option value="${fldItem.fieldName}">${fldItem.fieldName}</option>
													</c:forEach>
												</select>
											</div>
											<div class="fitem" >
												<label>值比较运算符:</label> 
												<select style="width: 113px;" id="compareOptr_${status.index }"
													class="form-control">
													<option value="==">==</option>
													<option value=">">&gt;</option>
													<option value="<">&lt;</option>
													<option value="<=">&lt;=</option>
													<option value=">=">&gt;=</option>
												</select>
											</div>
											<div class="fitem">
												<label>字段值：</label> 
												<input type="text" id="rightValue_${status.index }" />
											</div>
											<div class="fitem">
												<label>字段值类型：</label> 
												<select style="width: 113px;" id="rightValueType_${status.index }" 
													class="form-control">
													<option value="text">字符串</option>
											        <option value="int">整数</option>
												</select>
											</div>
											<div class="fitem">
												<label>条件组合运算符：</label> 
												<select style="width: 113px;" id="conditionOptr_${status.index }"
													 class="form-control">
													<option value="&&">与</option>
											        <option value="||">或</option>
												</select>
											</div>
											<div class="fitem">
												<label>优先级序号：</label> 
												<input type="text" id="priority_${status.index }" class="form-control"
													onkeyup="this.value=this.value.replace(/\D/g,'')" 
													onafterpaste="this.value=this.value.replace(/\D/g,'')" />
											</div>
											<div class="fitem">
												<label>条件分组名称：</label> 
												<input type="text" id="condGrpName_${status.index }" class="form-control" maxlength="10" />
											</div>
									    </div>
									</td>
								</tr>
								<tr>
									<th>条件组合预览：</th>
									<td colspan="3">
									<c:forEach var="condText" items="${conditionTexts}">
										<c:if test='${fn:startsWith(condText.key, item.activityId)}'>
										<div>${conditionTexts[condText.key] }</div>
										</c:if>
									</c:forEach>
									</td>
								</tr>
							</table>
							</c:forEach>
						</form>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div id="bottombar">
				<input type="button" id="btnSave" value="保存" /> 
			</div>
		</div>
	</div>
</body>
</html>